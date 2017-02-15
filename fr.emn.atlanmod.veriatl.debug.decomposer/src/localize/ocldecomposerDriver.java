package localize;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.m2m.atl.common.ATL.MatchedRule;
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
import fr.emn.atlanmod.atl2boogie.xtend.lib.atl;
import fr.emn.atlanmod.atl2boogie.xtend.ocl.TypeInference;
import fr.emn.atlanmod.atl2boogie.xtend.ocl.ocl2boogie;
import fr.emn.atlanmod.atl2boogie.xtend.util.CompilerConstants;
import transformation.GenBy;
import transformation.Trace;
import transformation.TransformationLoader;

public class ocldecomposerDriver {
	
	
	
	// Notice: Termination of this strategy depends on what rules are selected, e.g. if inclusion elimin 1 and 2 are both presented, of course it will loop forever
	// it also depends on whether a fix-point can be reached at each stage.
	
	// the limitation of this strategy is that it doesn't handle well if eliminate triggers new introduction, which is we trying to avoid because of mutual recursive call.
	
	// the most difficulty part is type inference, and deep copy of objects.
	@SuppressWarnings("unchecked")
	public static void decompose(URI atl, URI emftvm, String moduleName, URI src, URI trg, URI contract, URI outputPath) throws Exception {
		long start = System.currentTimeMillis();

		

		// initialization
		driver.doEMFSetup();
		driver.doVeriATLSetup(atl, src, trg, contract);
		ExecEnv env = Trace.moduleLoader(emftvm.trimFileExtension().trimSegments(1), moduleName, src, trg, driver.srcmm.getName(), driver.trgmm.getName());
		Map<String, ArrayList<String>> trace = Trace.getTrace(driver.trgmm, env);
		List<OclExpression> postconditions = ContractLoader.init(driver.contract_resource);
		List<MatchedRule> rules = TransformationLoader.init(driver.atl_resource);
		

		
		
		// clean sub-goals previously generated
		URIs.delete(outputPath);
		
		
		// proof strategy starts
		for (OclExpression post : postconditions) {
			
			ArrayList<Node> tree = new ArrayList<Node>();
			Introduction.init(env, trace, tree, driver.trgmm);
			
			HashMap<EObject, ContextEntry> emptyTrace = new HashMap<EObject, ContextEntry>();
			Node root = new Node(0, post, null, emptyTrace, null, null);
			tree.add(root);
			
			
			//intro
			ArrayList<Node> oldLeafs;
			ArrayList<Node> newLeafs;
			
			do{
				oldLeafs = NodeHelper.findLeafs(tree);
				
				for(Node n : oldLeafs){
					//TODO, default prove option
					Introduction.introduction(n, n.getContent(), n.getContext(), n.getLevel(), ProveOption.EACH);	
				}
				
				newLeafs = NodeHelper.findLeafs(tree);
			}while(!oldLeafs.containsAll(newLeafs));
			

			//elimin
			Elimination.init(env, trace, tree, driver.trgmm);
			while(!Elimination.terminated(NodeHelper.findLeafs(tree))){
				ArrayList<Node> leafs = NodeHelper.findLeafs(tree);
				
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
			
			// print Boogie file for each leafs of the generated Proof tree
			String goalName = post.getCommentsBefore().get(0).replace("--", "");
			URI output = outputPath.appendSegment(goalName);
			System.out.println(String.format("Debug: ocldecomposerDriver.java ln 120, goalName: %s", goalName));
			int i = 0;
			for(Node n : NodeHelper.findLeafs(tree)){
				String cse = String.format("case%04d",i);
				n.setName(String.format("case%04d", i));
				driver.generateBoogieFile(output, cse, CompilerConstants.BOOGIE_EXT, n.toBoogie(env));		
				i++;
			}
			
			//TODO This is the Boogie program with the full transformation trace, less efficient to verify
			//String org = printDriver(env, post);
			
			String org = prtingFastDriver(env, post, NodeHelper.findLeafs(tree));
			driver.generateBoogieFile(output, CompilerConstants.ORG, CompilerConstants.BOOGIE_EXT, org);	
			
			
			NodeHelper.printTreeBasic(outputPath.trimSegments(1), goalName, tree);
		}
		
		
		// Print Genby predicate
		GenBy.init(rules,driver.srcmm);
		String genby = GenBy.print();
		
		driver.generateBoogieFile(outputPath, CompilerConstants.GENBY, CompilerConstants.BOOGIE_EXT, genby);
		

		long end = System.currentTimeMillis();
		System.out.println(end-start);
		
		
	}

	private static String prtingFastDriver(ExecEnv env, OclExpression post, ArrayList<Node> leafs)  {		
		String res="";
		res += printDriverHeader();
		
		Set<String> involvedRules = new HashSet<String>();
		for(Node n : leafs){
			involvedRules.addAll(n.getInvolvedRuls());	
		}
		
		for(String r : involvedRules){
			res += String.format("call %s_matchAll();\n", r);
		}
		for(String r : involvedRules){
			res += String.format("call %s_applyAll();\n", r);
		}
		res += "\n";
		res += printPost(post);
		res += printDriverFooter();
		return res;
	}
	
	
	private static String printDriver(ExecEnv env, OclExpression post)  {		
		String res="";
		res += printDriverHeader();
		for(org.eclipse.m2m.atl.emftvm.Rule r : env.getRules()){
			res += String.format("call %s_matchAll();\n", r.getName());
		}
		for(org.eclipse.m2m.atl.emftvm.Rule r : env.getRules()){
			res += String.format("call %s_applyAll();\n", r.getName());
		}
		res += "\n";
		res += printPost(post);
		res += printDriverFooter();
		return res;
	}



	private static String printPost(OclExpression post) {
		return String.format("assert %s;\n", ocl2boogie.genOclExpression(post, atl.genTrgHeap()));		
	}

	private static String printDriverHeader() {
		String res = "";
		res += "implementation driver(){\n";
		res += "call init_tar_model();\n";	
		return res;
	}
	
	private static String printDriverFooter() {
		String res = "}\n";
		return res;
	}
	
	
	public static void clean(){
		
	}
}
