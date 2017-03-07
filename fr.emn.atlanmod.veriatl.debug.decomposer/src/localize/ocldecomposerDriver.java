package localize;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.resource.URIConverter;
import org.eclipse.emf.ecore.resource.impl.ExtensibleURIConverterImpl;
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
import fr.emn.atlanmod.atl2boogie.xtend.ocl.ocl2boogie;
import fr.emn.atlanmod.atl2boogie.xtend.util.CompilerConstants;
import transformation.GenBy;
import transformation.Trace;
import transformation.TransformationLoader;

public class ocldecomposerDriver {
	
	//TODO should get rid of this, if we not interested in print full driver with full post.
	static  public HashMap<String, String> postStrings = new HashMap<String, String>();
	
	// Notice: Termination of this strategy depends on what rules are selected, e.g. if inclusion elimin 1 and 2 are both presented, of course it will loop forever
	// it also depends on whether a fix-point can be reached at each stage.
	
	// the limitation of this strategy is that it doesn't handle well if eliminate triggers new introduction, which is we trying to avoid because of mutual recursive call.
	
	// the most difficulty part is type inference, and deep copy of objects.
	@SuppressWarnings("unchecked")
	public static void decompose(URI atl, URI emftvm, String moduleName, URI src, URI trg, URI contract, URI outputPath) throws Exception {


		

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
			
			// make string representation of hypotheses and conclusion of each node
			for(Node n : tree){
				n.Stringlize();
			}

			// print Boogie file for each leafs of the generated Proof tree
			String goalName = post.getCommentsBefore().get(0).replace("--", "");
			URI output = outputPath.appendSegment(goalName);
			//System.out.println(String.format("Debug: ocldecomposerDriver.java ln 120, goalName: %s start", goalName));
			int i = 0;
			for(Node n : NodeHelper.findAllLeafs(tree)){
				String cse = String.format("case%04d",i);
				n.setName(String.format("case%04d", i));
				driver.generateBoogieFile(output, cse, CompilerConstants.BOOGIE_EXT, n.toBoogie(env));		
				i++;
			}
			
			//This is the Boogie program with the full transformation trace, less efficient to verify, only used in normal verification mode
			String org = printDriver(env, post);
			driver.generateBoogieFile(output, CompilerConstants.FULL, CompilerConstants.BOOGIE_EXT, org);	
			
			
			
			//System.out.println(String.format("Debug: ocldecomposerDriver.java ln 120, goalName: %s end", goalName));
			
			// serialize proof tree
			writeTree(outputPath.trimSegments(1), goalName, new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(new Date()), tree);
		}
		
		//String org = prtingFullDriver(env);
		//driver.generateBoogieFile(outputPath, CompilerConstants.FULL, CompilerConstants.BOOGIE_EXT, org);
		
		// Print Genby predicate
		GenBy.init(rules,driver.srcmm);
		String genby = GenBy.print();
		
		driver.generateBoogieFile(outputPath, CompilerConstants.GENBY, CompilerConstants.BOOGIE_EXT, genby);
		

	}

	
	/**
	 * write proof tree to a URI
	 * TODO don't append
	 * @param outputPath basdURI
	 * @param tree
	 * @param append
	 */
	public static void writeTree(URI outputPath, String post, String cacheName, ArrayList<Node> tree) {
		String cache = String.format("%s", cacheName);
		
		URI cachePath = outputPath.appendSegment("Caches")
				.appendSegment(post).appendSegment(cache).appendFileExtension("cache");
		
		URIConverter uriConverter = new ExtensibleURIConverterImpl();

		try {
			OutputStream outputStream = uriConverter.createOutputStream(cachePath);
			ObjectOutputStream out = new ObjectOutputStream(outputStream);
			out.writeObject(tree);
	        out.flush();
	        out.close();
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
		
	}
	
	
	







	/**
	 * @param env
	 * @return
	 */
	private static String prtingFullDriver(ExecEnv env) {
		String res="";
		res += printDriverHeader();
		

		
		for(org.eclipse.m2m.atl.emftvm.Rule r : env.getRules()){
			res += String.format("call %s_matchAll();\n", r.getName());
		}
		for(org.eclipse.m2m.atl.emftvm.Rule r : env.getRules()){
			res += String.format("call %s_applyAll();\n", r.getName());
		}

		for(String postName : postStrings.keySet()){
			res += String.format("// %s \n", postName);
			res += postStrings.get(postName);
		}
		
		
		res += printDriverFooter();
		return res;
	}

	private static String prtingFastDriver(ExecEnv env, OclExpression post, ArrayList<Node> leafs, String goal)  {		
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
		res += String.format("//%s \n", goal);
		res += String.format("// rule size -> %d\n", involvedRules.size());
		res += printPost(post);
		res += printDriverFooter();
		
		postStrings.put(goal, printPost(post));
		
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
