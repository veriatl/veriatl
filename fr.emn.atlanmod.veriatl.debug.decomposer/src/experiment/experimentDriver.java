package experiment;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.m2m.atl.common.OCL.OclExpression;
import org.eclipse.m2m.atl.emftvm.ExecEnv;

import contract.ContractLoader;
import contract.Elimination;
import contract.Introduction;
import datastructure.ContextEntry;
import datastructure.Node;
import datastructure.NodeHelper;
import datastructure.ProveOption;
import fr.emn.atlanmod.atl2boogie.xtend.core.driver;
import fr.emn.atlanmod.atl2boogie.xtend.lib.URIs;
import fr.emn.atlanmod.atl2boogie.xtend.util.CompilerConstants;
import transformation.Trace;

public class experimentDriver {
	

	

	@SuppressWarnings("unchecked")
	public static void decompose(URI atl, URI emftvm, String moduleName, URI src, URI trg, URI contract, URI outputPath) throws Exception {
		long start = System.currentTimeMillis();

		

		// initialization
		driver.doEMFSetup();
		driver.doVeriATLSetup(atl, src, trg, contract);
		ExecEnv env = Trace.moduleLoader(emftvm.trimFileExtension().trimSegments(1), moduleName, src, trg, driver.srcmm.getName(), driver.trgmm.getName());
		Map<String, ArrayList<String>> trace = Trace.getTrace(driver.trgmm, env);
		List<OclExpression> postconditions = ContractLoader.init(driver.contract_resource);//
//		List<MatchedRule> rules = TransformationLoader.init(driver.atl_resource);
		
		
		
		
		// clean sub-goals previously generated
		URIs.delete(outputPath);
		
		
		// proof strategy starts
		for (OclExpression post : postconditions) {
			
			
			ArrayList<Node> tree = new ArrayList<Node>();
			Introduction.init(env, trace, tree, driver.trgmm);
			
			LinkedHashMap<EObject, ContextEntry> emptyCtx = new LinkedHashMap<EObject, ContextEntry>();
			Node root = new Node(0, post, null, emptyCtx, null, null);
			tree.add(root);
			
			
			//intro
			ArrayList<Node> oldLeafs;
			ArrayList<Node> newLeafs;
			
			do{
				oldLeafs = NodeHelper.findAllLeafs(tree);
				
				for(Node n : oldLeafs){
					//TODO, default prove option
					Introduction.introduction(n, n.getContent(), n.getContext(), n.getLevel(), ProveOption.EACH);	
				}
				
				newLeafs = NodeHelper.findAllLeafs(tree);
			}while(!oldLeafs.containsAll(newLeafs));
			

			//elimin
			Elimination.init(env, trace, tree, driver.trgmm);
			while(!Elimination.terminated(NodeHelper.findAllLeafs(tree))){
				ArrayList<Node> leafs = NodeHelper.findAllLeafs(tree);
				
				for(Node n : leafs){
					HashMap<EObject, ContextEntry> ctx = n.getContext();
					for(EObject ocl : ctx.keySet()){
						if(ctx.get(ocl).isEliminated()){
							continue;
						}else{
							ctx.get(ocl).setEliminated(true);
							Elimination.elimin(n, ocl);	
							break;
						}
					}
				}

			}
						
			Collections.sort(tree);

			
			
			String goalName = post.getCommentsBefore().get(0).replace("--", "");	
			

			
			
//			// generate sub-goals
//			int i = 0;
//			URI output = outputPath.appendSegment(experimentDriver.SINGLE).appendSegment(goalName);
//			for(Node n : NodeHelper.findLeafs(tree)){
//				String cse = String.format("case%04d",i);
//				n.setName(String.format("case%04d", i));
//				driver.generateBoogieFile(output, cse, CompilerConstants.BOOGIE_EXT, n.toBoogie(env));		
//				i++;
//			}
			
			// Print single postcondition in its consice presentation.
			
			
			String org = BoogiePrinter.prtingFastDriver(env, post, NodeHelper.findAllLeafs(tree), goalName);
			URI output = outputPath.appendSegment(VCGenerator.SINGLE);
			driver.generateBoogieFile(output, String.format("%s-%d", goalName, VCGenerator.postsTrace.get(goalName).size()), CompilerConstants.BOOGIE_EXT, org);	
			
			
		}
		
		VCGenerator.incrementalByTimeNoSlicingCombined(outputPath);
		VCGenerator.incrementalByTimeNoSlicingSeparated(outputPath);
		
		long end = System.currentTimeMillis();
		System.out.println(end-start);
		
		
	}

	
	

}
