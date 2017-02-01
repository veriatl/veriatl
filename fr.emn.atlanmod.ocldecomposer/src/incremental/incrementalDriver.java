package incremental;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.io.FileUtils;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.m2m.atl.common.ATL.MatchedRule;
import org.eclipse.m2m.atl.common.OCL.OclExpression;
import org.eclipse.m2m.atl.emftvm.ExecEnv;

import Ocl.Ocl2Boogie;
import Ocl.Printer;
import Ocl.TypeInference;
import contract.ContractLoader;
import contract.Elimination;
import contract.Introduction;

import datastructure.ContextEntry;
import datastructure.IncrementalResult;
import datastructure.Node;
import datastructure.NodeHelper;
import datastructure.ProveOption;
import datastructure.TriBoolean;
import metamodel.EMFLoader;
import runtime.VerificationResult;
import runtime.executioner;
import transformation.GenBy;
import transformation.Trace;
import transformation.TransformationLoader;

public class incrementalDriver {

	static HashMap<String, HashMap<String, HashMap<String, String>>> CacheSubs;
	static HashMap<String, HashMap<String, String>> CachePosts;

	public static void main(String[] args) throws Exception {

		init();
		IncrementalResult hsm2fsmRes = verify_loc("HSM2FSM");
		incrementalDriver.inc_verify_sub("HSM2FSM", "MF6", "T2TB", hsm2fsmRes);
		incrementalDriver.inc_verify_sub("HSM2FSM", "AF2", "RS2RS", hsm2fsmRes);
	}

	public static void init() {
		CacheSubs = new HashMap<String, HashMap<String, HashMap<String, String>>>();
		CachePosts = new HashMap<String, HashMap<String, String>>();
	}

	public static void verify_org(String srcProj) throws Exception {
		long start = System.currentTimeMillis();
		
		IncrementalResult src = load(genConf(srcProj));
		executioner.init(srcProj);

		for (String post : src.getLeafs4Posts().keySet()) {

			VerificationResult postV = executioner.verify(post, "original");	
			putInCachePosts(srcProj, post, postV.getResult());

		}

		long end = System.currentTimeMillis();
		
		System.out.println(String.format("%s: %s", srcProj, end-start));
		
	}
	
	
	public static IncrementalResult verify_loc(String srcProj) throws Exception {
		long start = System.currentTimeMillis();
		
		IncrementalResult src = load(genConf(srcProj));
		executioner.init(srcProj);

		for (String post : src.getLeafs4Posts().keySet()) {

			VerificationResult postV = executioner.verify(post, "original");
			
			
			putInCachePosts(srcProj, post, postV.getResult());

			if (postV.getResult().equals("true")) {

				for (Node subgoal : src.getLeafs4Posts().get(post)) {
					putInCacheSubs(srcProj, post, subgoal.getId(), "true");
				}

			} else {

				for (Node subgoal : src.getLeafs4Posts().get(post)) {
					VerificationResult r = executioner.verify(post, subgoal.getId());
					putInCacheSubs(srcProj, post, subgoal.getId(), r.getResult());

				}

			}

		}

		long end = System.currentTimeMillis();
		
		System.out.println(String.format("%s: %s", srcProj, end-start));
		return src;
	}

	
	
	public static IncrementalResult inc_verify_sub(String srcProj, String tarProj, String opRule, IncrementalResult src)
			throws Exception {

		long start = System.currentTimeMillis();
		int totalChk = 0;
		int totalReused = 0;
		
		
		IncrementalResult tar = load(genConf(tarProj));

		
		
		
		executioner.init(tarProj);
		for (String post : tar.getLeafs4Posts().keySet()) {

			Set<String> r1 = src.getRules4Posts().get(post);
			Set<String> r2 = tar.getRules4Posts().get(post);
			if (r1.containsAll(r2) && r2.containsAll(r1) && !r2.contains(opRule)) {
				String res = findInCachePosts(srcProj, post);
				putInCachePosts(tarProj, post, res);
				
				totalChk += src.getLeafs4Posts().get(post).size();
				totalReused +=src.getLeafs4Posts().get(post).size();
			}else{
				VerificationResult postV = executioner.verify(post, "original");

				if (!postV.getResult().equals("true")) {
					totalChk += src.getLeafs4Posts().get(post).size();
					
					for (Node subgoal : tar.getLeafs4Posts().get(post)) {
						Node cache = findSubgoalInCache(subgoal, src.getLeafs4Posts().get(post));
						if (cache != null && !subgoal.getInvolvedRuls().contains(opRule)) {

							String res = findInCacheSubs(srcProj, post, cache.getId());
							putInCacheSubs(tarProj, post, subgoal.getId(), res);

							totalReused += 1;
							
							String id = String.format("%s-%s-%s", tarProj, post, subgoal.getId());
							System.out.println(new VerificationResult(id, "Cached:" + res, 0));
						} else {
							VerificationResult res = executioner.verify(post, subgoal.getId());
							putInCacheSubs(tarProj, post, subgoal.getId(), res.getResult());
							System.out.println(res);
						}
					}
				}
			}
			
			
			
			
		}

		long end = System.currentTimeMillis();
		
		System.out.println(String.format("%s: %s: %s/%s", tarProj, end-start, totalReused, totalChk));
		
		return tar;
	}

	public static void inc_verify_post_cache(String srcProj, String tarProj, String opRule, IncrementalResult src, boolean useCache)
			throws Exception {

		long start = System.currentTimeMillis();
		int total = 6;
		int reuse = 0;
		
		IncrementalResult tar = load(genConf(tarProj));

		executioner.init(tarProj);

		for (String post : tar.getLeafs4Posts().keySet()) {
			
			Set<String> r1 = src.getRules4Posts().get(post);
			Set<String> r2 = tar.getRules4Posts().get(post);
			if (r1.containsAll(r2) && r2.containsAll(r1) && !r2.contains(opRule)) {
				String res = findInCachePosts(srcProj, post);
				putInCachePosts(tarProj, post, res);
				
				reuse++;
			} else {

				// get leaf res
				for (Node subgoal : tar.getLeafs4Posts().get(post)) {
					Node cache = findSubgoalInCache(subgoal, src.getLeafs4Posts().get(post));
					if (cache != null && !subgoal.getInvolvedRuls().contains(opRule)) {

						if(useCache){
							String res = CacheSubs.get(srcProj).get(post).get(cache.getId());

							if (res.equals("true")) {
								subgoal.setResult(TriBoolean.TRUE);
							} else if (res.equals("false")) {
								subgoal.setResult(TriBoolean.FALSE);
							}
						}else{
							subgoal.setResult(TriBoolean.UNKNOWN);
						}
						

					} else {
						subgoal.setResult(TriBoolean.UNKNOWN);
					}
				}

				// populate tree
				ArrayList<Node> tarTree = tar.getTrees4Posts().get(post);
				ArrayList<Node> tarResultTree = new ArrayList<Node>();

				for (Node leaf : NodeHelper.findLeafs(tarTree)) {
					tarResultTree.add(leaf);
					tarTree.remove(leaf);
				}

				while (tarTree.size() != 0) {
					for (Node leaf : NodeHelper.findLeafs(tarTree)) {
						ArrayList<Node> childrenOfLeaf = NodeHelper.findChildren(leaf, tarResultTree);
						leaf.setResult(TriBoolean.compute(childrenOfLeaf));
						tarResultTree.add(leaf);
						tarTree.remove(leaf);
					}
				}

				//[Z.C.] If prove tree want to be printed
				//String gvFile = NodeHelper.printTree(tarProj, post, tarResultTree);
				//executioner.execDot(gvFile);
				//NodeHelper.clean(gvFile, "gv");
				
				// find node
				Node simPost = NodeHelper.findSimplifiedPost(tarResultTree);
				String fnRes;
				if(simPost!=null){
					// verify node
					String simPostBpl = constructTask(tarProj, post, simPost, tar.getRules4Posts().get(post), tar.getEnv(),
							tar.getTarmm(), tar.getInfers4Posts());
					
					// update result and repopulate verification result tree
					VerificationResult simPostV = executioner.verify(post, simPostBpl);
					simPost.setResult(simPostV.getTriBooleanResult());
					fnRes = NodeHelper.repopulate(simPost, tarResultTree).toString().toLowerCase();					
				}else{
					//assert result of root is not unknown.
					Node root = NodeHelper.findRoot(tarResultTree);
					fnRes = root.getResult().toString().toLowerCase();
					reuse++;
				}
				
				if (fnRes.equals("true")) {
					for (Node n : tar.getLeafs4Posts().get(post)) {
						putInCacheSubs(tarProj, post, n.getId(), "true");
					}
				}

				putInCachePosts(tarProj, post, fnRes);
				
				String res = String.format("%s: %s", post, fnRes);
				System.out.println(res);
			}
		}
		long end = System.currentTimeMillis();
		
		System.out.println(String.format("%s: %s: %s/%s", tarProj, end-start, reuse, total));

	}




	private static void putInCachePosts(String tarProj, String post, String res) {
		if (CachePosts.containsKey(tarProj)) {
			HashMap<String, String> c1 = CachePosts.get(tarProj);
			c1.put(post, res);
		} else {
			HashMap<String, String> c1 = new HashMap<String, String>();
			c1.put(post, res);
			CachePosts.put(tarProj, c1);
		}
	}

	private static void putInCacheSubs(String tarProj, String post, String sub, String res) {
		if (CacheSubs.containsKey(tarProj)) {
			HashMap<String, HashMap<String, String>> p1 = CacheSubs.get(tarProj);
			if (p1.containsKey(post)) {
				HashMap<String, String> s1 = p1.get(post);
				s1.put(sub, res);
			} else {
				HashMap<String, String> s1 = new HashMap<String, String>();
				s1.put(sub, res);
				p1.put(post, s1);
			}
		} else {
			HashMap<String, HashMap<String, String>> p1 = new HashMap<String, HashMap<String, String>>();
			HashMap<String, String> s1 = new HashMap<String, String>();
			s1.put(sub, res);
			p1.put(post, s1);
			CacheSubs.put(tarProj, p1);
		}
	}

	private static String constructTask(String tarProj, String post, Node simPost, Set<String> rules, ExecEnv env,
			EPackage tarmm, Map<String, Map<String, String>> infers) throws Exception {
		PrintStream original = new PrintStream(System.out);
		String folderName = String.format("%s/Sub-goals/%s", tarProj, post);
		String fileName = String.format("%ssimplified.bpl", folderName);
		PrintStream out = new PrintStream(new FileOutputStream(fileName));
		System.setOut(out);
		Ocl2Boogie.init(tarmm);

		System.out.println("implementation driver(){\n");

		for (EObject r : simPost.getBVs()) {
			System.out.println(String.format("var %s: ref;\n", Ocl2Boogie.print(r)));
			TypeInference.lookup.putAll(infers.get(post));

		}

		System.out.println("call init_tar_model();\n");

		ArrayList<String> order = Trace.ruleOrdered(env);
		ArrayList<String> list = new ArrayList<String>();

		for (String r : order) {
			if (rules.contains(r)) {
				list.add(r);
			}
		}

		for (String r : list) {
			System.out.println(String.format("call %s_matchAll();", r));
		}
		for (String r : list) {
			System.out.println(String.format("call %s_applyAll();", r));
		}

		System.out.println();

		for (EObject entry : simPost.getAssumptions()) {
			System.out.println(String.format("assume %s;\n", Ocl2Boogie.print(entry)));

		}

		for (EObject entry : simPost.getInfers()) {
			System.out.println(String.format("assume %s;\n", Ocl2Boogie.print(entry)));

		}

		printPost(simPost.getContent());
		printDriverFooter();
		out.close();

		System.setOut(original);

		return "simplified";
	}

	// TODO this only suitable for our case study, make it more customized
	private static String[] genConf(String proj) {
		List<String> args = new ArrayList<String>();
		args.add(String.format("%s/Source/EMFTVM/", proj));
		args.add(String.format("HSM2FSM"));
		args.add(String.format("%s/Source/SRCMM/HSM.ecore", proj));
		args.add(String.format("%s/Source/TARMM/FSM.ecore", proj));
		args.add(String.format("HSM"));
		args.add(String.format("FSM"));
		args.add(String.format("%s/Source/ContractSRC/HSM2FSMContract.atl", proj));
		args.add(String.format("%s/Source/ATLSRC/HSM2FSM.atl", proj));
		args.add(String.format("%s/Sub-goals/", proj));
		args.add(String.format("%s/Sub-goals/", proj));
		return args.toArray(new String[0]);
	}

	private static boolean compareExpressionLists(List<EObject> l1, List<EObject> l2) {
		
		List<String> s1 = new ArrayList<String>();
		List<String> s2 = new ArrayList<String>();

		for (EObject o1 : l1) {
			s1.add(Printer.print(o1));
		}

		for (EObject o2 : l2) {
			s2.add(Printer.print(o2));
		}

		return s1.containsAll(s2) && s2.containsAll(s1);
	}

	private static Node findSubgoalInCache(Node n, List<Node> nodes) {
		
		for (Node curr : nodes) {
			boolean rule = n.getInvolvedRuls().containsAll(curr.getInvolvedRuls())
					&& curr.getInvolvedRuls().containsAll(n.getInvolvedRuls());
			boolean conclusion = Printer.print(n.getContent())
					.equals(Printer.print(curr.getContent()));
			boolean assumption = compareExpressionLists(n.getAssumptions(), curr.getAssumptions());

			boolean infer = compareExpressionLists(n.getInfers(), curr.getInfers());

			if (rule && conclusion && assumption && infer) {
				return curr;
			}

		}

		return null;
	}

	private static String findInCacheSubs(String srcProj, String post, String id) {
		return CacheSubs.get(srcProj).get(post).get(id);
	}

	private static String findInCachePosts(String srcProj, String post) {
		return CachePosts.get(srcProj).get(post);
	}

	public static IncrementalResult load(String[] args) throws Exception {
		PrintStream original = new PrintStream(System.out);
		ExecEnv env = Trace.moduleLoader(args[0], args[1], args[2], args[3], args[4], args[5]);
		EPackage tarmm = EMFLoader.loadEcore(args[3]);
		EPackage srcmm = EMFLoader.loadEcore(args[2]);
		Map<String, ArrayList<String>> trace = Trace.getTrace(tarmm, env);

		String contractPath = args[6];
		String transformationSrcPath = args[7];
		String subGoalsPath = args[8];
		String genByPath = args[9];

		List<OclExpression> postconditions = ContractLoader.init(contractPath);
		List<MatchedRule> rules = TransformationLoader.init(transformationSrcPath);

		Map<String, List<Node>> leafs4Posts = new HashMap<String, List<Node>>();
		Map<String, ArrayList<Node>> tree4Posts = new HashMap<String, ArrayList<Node>>();
		Map<String, Set<String>> rules4Posts = new HashMap<String, Set<String>>();
		Map<String, Map<String, String>> infers4Posts = new HashMap<String, Map<String, String>>();

		for (OclExpression post : postconditions) {

			ArrayList<Node> tree = new ArrayList<Node>();
			Introduction.init(env, trace, tree, tarmm);

			HashMap<EObject, ContextEntry> emptyTrace = new HashMap<EObject, ContextEntry>();
			Node root = new Node(0, post, null, emptyTrace, null, null);
			tree.add(root);

			// intro
			ArrayList<Node> oldLeafs;
			ArrayList<Node> newLeafs;

			do {
				oldLeafs = NodeHelper.findLeafs(tree);

				for (Node n : oldLeafs) {
					// TODO, default prove option
					Introduction.introduction(n, n.getContent(), n.getContext(), n.getLevel(), ProveOption.EACH);
				}

				newLeafs = NodeHelper.findLeafs(tree);
			} while (!oldLeafs.containsAll(newLeafs));

			// elimin
			Elimination.init(env, trace, tree, tarmm);
			while (!Elimination.terminated(NodeHelper.findLeafs(tree))) {
				ArrayList<Node> leafs = NodeHelper.findLeafs(tree);

				for (Node n : leafs) {
					HashMap<EObject, ContextEntry> ctx = n.getContext();
					for (EObject ocl : ctx.keySet()) {
						if (ctx.get(ocl).isEliminated()) {
							continue;
						} else {
							ctx.get(ocl).setEliminated(true);
							Elimination.elimin(n, ocl);
							break;
						}
					}
				}

			}

			// print tree
			Collections.sort(tree);
			Ocl2Boogie.init(tarmm);
			PrintStream out;

			String goalName = post.getCommentsBefore().get(0).replace("--", "") + "/";
			String folderName = String.format("%s%s", subGoalsPath, goalName);
			File file = new File(folderName);
			FileUtils.forceMkdir(file);

			int i = 0;
			Set<String> relatedRules = new HashSet<String>(); // get all related
																// rules for a
																// post

			for (Node n : NodeHelper.findLeafs(tree)) {
				// gen sub-goals
				String fileName = String.format("%scase%02d.bpl", folderName, i);
				out = new PrintStream(new FileOutputStream(fileName));
				System.setOut(out);
				System.out.println(n.toBoogie(env));
				out.close();

				//
				String id = String.format("case%02d", i);
				n.setId(id);
				if (leafs4Posts.get(goalName) == null) {
					List<Node> nodes = new ArrayList<Node>();
					nodes.add(n);
					leafs4Posts.put(goalName, nodes);
				} else {
					leafs4Posts.get(goalName).add(n);
				}

				relatedRules.addAll(n.getInvolvedRuls());

				i++;
			}

			tree4Posts.put(goalName, tree);
			rules4Posts.put(goalName, relatedRules);

			Map<String, String> infers = new HashMap<String, String>(TypeInference.lookup);
			infers4Posts.put(goalName, infers);

			printDriver(env, post, folderName);

		}

		GenBy.init(rules, srcmm);
		GenBy.print(genByPath);

		System.setOut(original);
		return new IncrementalResult(leafs4Posts, tree4Posts, rules4Posts, env, tarmm, infers4Posts);
	}

	private static void printDriver(ExecEnv env, OclExpression post, String folderName) throws Exception {
		PrintStream original = new PrintStream(System.out);

		String fileName = String.format("%soriginal.bpl", folderName);
		PrintStream out = new PrintStream(new FileOutputStream(fileName));
		System.setOut(out);

		printDriverHeader();
		for (org.eclipse.m2m.atl.emftvm.Rule r : env.getRules()) {
			System.out.println(String.format("call %s_matchAll();", r.getName()));
		}
		for (org.eclipse.m2m.atl.emftvm.Rule r : env.getRules()) {
			System.out.println(String.format("call %s_applyAll();", r.getName()));
		}
		System.out.println();
		printPost(post);
		printDriverFooter();
		out.close();

		System.setOut(original);
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
