package localize;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.m2m.atl.common.ATL.MatchedRule;
import org.eclipse.m2m.atl.common.ATL.Rule;
import org.eclipse.m2m.atl.common.OCL.OclExpression;
import org.eclipse.m2m.atl.emftvm.ExecEnv;

import contract.ContractLoader;
import contract.Elimination;
import contract.Introduction;
import datastructure.ContextEntry;
import datastructure.Node;
import datastructure.NodeHelper;
import datastructure.ProveOption;
import file.fileHelper;
import metamodel.EMFLoader;
import ocl.Ocl2Boogie;
import transformation.GenBy;
import transformation.Trace;
import transformation.TransformationLoader;

public class ocldecomposerDriver {
	
	
	
	// Notice: Termination of this strategy depends on what rules are selected, e.g. if inclusion elimin 1 and 2 are both presented, of course it will loop forever
	// it also depends on whether a fixpoint can be reached at each stage.
	
	// the limitation of this strategy is that it doesn't handle well if eliminate triggers new introduction, which is we trying to avoid because of mutual recursive call.
	
	// the most difficulty part is type inference, and deep copy of objects.
	public static void main(String[] args) throws Exception {
		long start = System.currentTimeMillis();
		PrintStream original = System.out;
		
		if(args.length < 1){
	    	throw new Exception("no option provided to continue VeriATL, using \"help\" to see available options");
	    }
		
		Map<String, String> dirs = fileHelper.loadDirPlus();
		String projPath = args[0];
		String emftvm = projPath+dirs.get("emftvm")+"/";
		String moduleName = fileHelper.getFirstFileNamebyExt(emftvm, "emftvm");
		String srcmmPath = fileHelper.getFirstFilePathbyExt(projPath+dirs.get("srcmm"), "ecore");
		String tarmmPath = fileHelper.getFirstFilePathbyExt(projPath+dirs.get("tarmm"), "ecore");
		String srcmmName = fileHelper.getFirstFileNamebyExt(projPath+dirs.get("srcmm"), "ecore");
		String tarmmName = fileHelper.getFirstFileNamebyExt(projPath+dirs.get("tarmm"), "ecore");
		
		
		String contractPath = fileHelper.getFirstFilePathbyExt(projPath+dirs.get("contract_src"), "atl");
		String transformationSrcPath = fileHelper.getFirstFilePathbyExt(projPath+dirs.get("atl_src"), "atl");
		String subGoalsPath = projPath+dirs.get("subgoal")+"/";
		String genByPath = projPath+dirs.get("subgoal")+"/";
		
		ExecEnv env = Trace.moduleLoader(emftvm, moduleName, srcmmPath, tarmmPath, srcmmName, tarmmName);
		
		EPackage srcmm = EMFLoader.loadEcore(srcmmPath);
		EPackage tarmm = EMFLoader.loadEcore(tarmmPath);
		Map<String, ArrayList<String>> trace = Trace.getTrace(tarmm, env);
		
		List<OclExpression> postconditions = ContractLoader.init(contractPath);
		List<MatchedRule> rules = TransformationLoader.init(transformationSrcPath);
		
		if(new File(subGoalsPath).exists()){
			FileUtils.cleanDirectory(new File(subGoalsPath));
		}
		
		for (OclExpression post : postconditions) {
			
			ArrayList<Node> tree = new ArrayList<Node>();
			Introduction.init(env, trace, tree, tarmm);
			
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
			Elimination.init(env, trace, tree, tarmm);
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
						
			// print tree test
			Collections.sort(tree);
			Ocl2Boogie.init(tarmm);
			PrintStream out;

			String goalName = post.getCommentsBefore().get(0).replace("--", "")+"/";
			String folderName = String.format("%s%s", subGoalsPath,goalName);
			File file = new File(folderName); 
			FileUtils.forceMkdir(file);
			
			int i = 0;
			for(Node n : NodeHelper.findLeafs(tree)){
				String fileName = String.format("%scase%02d.bpl", folderName,i);
				out =  new PrintStream(new FileOutputStream(fileName));
				System.setOut(out);
				System.out.println(n.toBoogie(env));
			
				n.setName(String.format("case%02d", i));
				i++;
			}
			
			printDriver(env, post, folderName);
			NodeHelper.printTreeBasic(projPath, goalName, tree);
		}
		
		
		
		GenBy.init(rules,srcmm);
		GenBy.print(genByPath);

		
		System.setOut(original);
		long end = System.currentTimeMillis();
		System.out.println(end-start);
		
		
	}

	private static void printDriver(ExecEnv env, OclExpression post, String folderName) throws Exception {
		String fileName = String.format("%soriginal.bpl", folderName);
		PrintStream out =  new PrintStream(new FileOutputStream(fileName));
		System.setOut(out);
		
		printDriverHeader();
		for(org.eclipse.m2m.atl.emftvm.Rule r : env.getRules()){
			System.out.println(String.format("call %s_matchAll();", r.getName()));
		}
		for(org.eclipse.m2m.atl.emftvm.Rule r : env.getRules()){
			System.out.println(String.format("call %s_applyAll();", r.getName()));
		}
		System.out.println();
		printPost(post);
		printDriverFooter();
	}



	private static void printPost(OclExpression post) {
		System.out.println(String.format("assert %s;", Ocl2Boogie.print(post)));
		
	}

	private static void printDriverHeader() {
		System.out.println("implementation driver(){");
		System.out.println("call init_tar_model(); ");
		
	}
	
	private static void printDriverFooter() {
		System.out.println("}");
	}
	
	
	
}
