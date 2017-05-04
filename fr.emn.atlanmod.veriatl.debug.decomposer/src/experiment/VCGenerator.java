package experiment;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.ThreadLocalRandom;
import java.util.stream.Collectors;

import org.eclipse.emf.common.util.URI;

import fr.emn.atlanmod.atl2boogie.xtend.core.driver;
import fr.emn.atlanmod.atl2boogie.xtend.util.CompilerConstants;

public class VCGenerator {

	// meta-data for VC generation, used to indicate which folder to save generated VCs
	public static final String SINGLE = "single";
	public static final String PLUSONE = "plusone";
	public static final String INCCombine = "incCombine";
	public static final String INCSep = "incSep";
	public static final String INC = "incremental";
	public static final String HEURISTIC = "heuristic";

	
	// a map that records the post and the string representation of its ocl expression
	public static HashMap<String, String> postsStrings = new HashMap<String, String>();
	// a map that records each post and what rules are involved for it (i.e. trace)
	public static HashMap<String, HashSet<String>> postsTrace = new HashMap<String, HashSet<String>>();
	// a map that records each post and its verification time (for prioritizing VC generation )
	public static HashMap<String, Integer> postsTime = PreloadData.initPostTime();
	// a list that records what posts should be considered
	public static ArrayList<String> posts = new ArrayList<String>();
	// a map that records each post and how many sub-goals it has
	public static HashMap<String, Integer> postsSubs = new HashMap<String, Integer>();
	
	// a set that records what posts are already processed
	public static HashSet<String> done = new HashSet<String>();
	
	
	
	/**
	 * Build verification tasks: call smartScheduling by default arguments.
	 * 
	 * @argument max_trace_per_group default set to 10 (based on our experience of verifying MTs)
	 * @argument max_subs_per_group default set to 200 (should be determined by the user)
	 * */
	public static void heuristicScheduling(URI outputDir){
		heuristicScheduling(outputDir, 10, 200);
	}
	
	
	/**
	 * Build verification tasks: giving a set of posts, heuristic scheduling tries to merge these posts into groups, without breaking predefined criteria.
	 * The criteria are given by the parameters.
	 * 
	 * @param max_trace_per_group
	 * @param max_subs_per_group
	 * */
	public static void heuristicScheduling(URI outputDir, int max_trace_per_group, int max_subs_per_group){
		ArrayList<ArrayList<String>> groups = new ArrayList<ArrayList<String>>();
		String conf = String.format("%s_%s", max_trace_per_group, max_subs_per_group);
		
		URI boogiePath = outputDir.appendSegment(HEURISTIC).appendSegment(conf);
		
		
		Collections.sort(posts, new Comparator<String>(){
		    public int compare(String p1, String p2){
		        return postsTrace.get(p1).size() - postsTrace.get(p2).size();
		    }
		});
		
		for (String post : posts)
		{
			ArrayList<ArrayList<String>> candidateGroups = new ArrayList<ArrayList<String>>();

			// selecting candidate groups for a given post
			for (ArrayList<String> group : groups)
			{
				// trail by adding post to group
				ArrayList<String> groupWillBe = new ArrayList<String>(group);
				groupWillBe.add(post);
				int traceWillBe = traces(groupWillBe).size();
				int subWillBe = subs(groupWillBe);

				if (traceWillBe < max_trace_per_group && subWillBe < max_subs_per_group)
				{
					candidateGroups.add(group);
				}
			}

			// add post to a new group if no candidate groups suite it.
			if (candidateGroups.size() == 0)
			{
				ArrayList<String> group = new ArrayList<String>();
				group.add(post);
				groups.add(group);
			}
			// in case multiple groups suite a post, selecting the `most suitable` one
			else
			{
				ArrayList<String> bestGroup = rank(candidateGroups, post);
				bestGroup.add(post);
			}

		
		}
		
		// OUTPUT post-groups mapping for data analysis
		String mapping ="";
		for (ArrayList<String> group : groups)
		{	
			for (String post : group)
			{
				mapping += String.format("%s:%03d\n", post, groups.indexOf(group));	
			}
		}
		driver.generateBoogieFile(outputDir, conf, "txt", mapping);	
		
		// OUTPUT boogie files for groups
		for (ArrayList<String> group : groups)
		{	
			if(group.size() != 1){
				String content = genContentConj(group);
				String fileName = String.format("%03d-%d", groups.indexOf(group), group.size());
				driver.generateBoogieFile(boogiePath, fileName, CompilerConstants.BOOGIE_EXT, content);
			}
		}	
		
	}
	
	/**
	 * return the traces for a group
	 * */
	private static HashSet<String> traces(ArrayList<String> group){
		HashSet<String> traces = new HashSet<String>();
		
		for(String post: group){
			traces.addAll(postsTrace.get(post));
		}
		
		return traces;
	}
	
	/**
	 * return the overall number of sub-goals for a group
	 * */
	private static int subs(ArrayList<String> group){
		int subs = 0;
		
		for(String post: group){
			subs += postsSubs.get(post);
		}
		
		return subs;
	}
	
	/**
	 * return a group (among {@param groups}) whose {@code traces} are effected the least
	 * */
	private static ArrayList<String> rank(ArrayList<ArrayList<String>> groups, String post){		
		ArrayList<ArrayList<String>> candidates = new ArrayList<ArrayList<String>> (groups);
		
		// sort (ascending) groups by the effect of post on the traces of each group
		Collections.sort(candidates, new Comparator<ArrayList<String>>(){
		    public int compare(ArrayList<String> g1, ArrayList<String> g2){
		    	ArrayList<String> g1WillBe = new ArrayList<String>(g1);
		    	g1WillBe.add(post);
				
				ArrayList<String> g2WillBe = new ArrayList<String>(g2);
				g2WillBe.add(post);
		    	
		    	return traces(g1).size() - traces(g2).size();
		    }
		});
		

		// return the best candidate
		return candidates.get(0);
	}
	
	
	/**
	 * Build verification tasks: incrementally *combine* with the next shortest verification time post.
	 * Naming convention of tasks: 05.bpl means there should be 5 posts in this verification task.
	 * */
	public static void incrementalByTimeNoSlicingCombined(URI outputPath){
		URI output = outputPath.appendSegment(VCGenerator.INCCombine);
		
		// get a copy of posts list, ordered by their verification time (see PreloadData.initPostTime)
		ArrayList<String> postsCopy = new ArrayList<String>(posts);
		Collections.sort(postsCopy, new Comparator<String>(){
		    public int compare(String p1, String p2){
		        return postsTime.get(p1) - postsTime.get(p2);
		    }
		});
		
		// start to incrementally build verification tasks
		ArrayList<String> incCase = new ArrayList<String>();
		for(String post : postsCopy) {
			incCase.add(post);
			String content = genContent(incCase);
			String fileName = String.format("%03d", incCase.size());
			driver.generateBoogieFile(output, fileName, CompilerConstants.BOOGIE_EXT, content);
		}
	}
	
	
	/**
	 * Build verification tasks: incrementally build the next shortest verification time post, but store each post separately.
	 * Naming convention of tasks: 01/x.bpl means there should be 5 posts in this folder.
	 * */
	public static void incrementalByTimeNoSlicingSeparated(URI outputPath){
		URI newOutput = outputPath.appendSegment(VCGenerator.INCSep);
		
		// get a copy of posts list, ordered by their verification time (see PreloadData.initPostTime)
		ArrayList<String> postsCopy = new ArrayList<String>(posts);
		Collections.sort(postsCopy, new Comparator<String>(){
		    public int compare(String p1, String p2){
		        return postsTime.get(p1) - postsTime.get(p2);
		    }
		});
		
		// start to incrementally build verification tasks
		ArrayList<String> incCase = new ArrayList<String>();
		for(String post : postsCopy) {
			incCase.add(post);
			ArrayList<String> contents = genContents(incCase);
			for(String content : contents){
				URI output = newOutput.appendSegment(String.format("%03d", incCase.size()));
				String fileName = String.format("%03d", contents.indexOf(content));
				driver.generateBoogieFile(output, fileName, CompilerConstants.BOOGIE_EXT, content);
			}
			
		}
	}
	

	
	/**
	 * Generate VC for group of postconditions, by separate assertions
	 * In Boogie, it is equivalent to genContentSep, since wp(assert E; assert F, Q) = wp(assert E /\ F;, Q)
	 * */
	private static String genContentSep(ArrayList<String> groups) {
		HashSet<String> involvedRules = traces(groups);	
		
		String res="";
		res += BoogiePrinter.printDriverHeader();
		
		for(String r : involvedRules){
			res += String.format("call %s_matchAll();\n", r);
		}
		for(String r : involvedRules){
			res += String.format("call %s_applyAll();\n", r);
		}
		
		res += "\n";
		res += "\n";
			
		for(String post : groups){
			res += String.format("assert %s;\n", postsStrings.get(post));
		}		
		
		res += BoogiePrinter.printDriverFooter();
		
		return res;
	}
	
	/**
	 * Generate VC for group of postconditions, by conjunction
	 * In Boogie, it is equivalent to genContentSep, since wp(assert E; assert F, Q) = wp(assert E /\ F;, Q)
	 * */
	private static String genContentConj(ArrayList<String> group) {
		HashSet<String> involvedRules = traces(group);	
		
		String res="";
		res += BoogiePrinter.printDriverHeader();
		
		for(String r : involvedRules){
			res += String.format("call %s_matchAll();\n", r);
		}
		for(String r : involvedRules){
			res += String.format("call %s_applyAll();\n", r);
		}
		
		res += "\n";
		res += "\n";
		
		ArrayList<String> posts = group.stream().map(elem -> postsStrings.get(elem)).collect(Collectors.toCollection(ArrayList::new));
		res += String.format("assert %s;\n", String.join(" \n&& ", posts));
			
		
		res += BoogiePrinter.printDriverFooter();
		
		return res;
	}
	
	/**
	 * incrementally build verification tasks (combine each of them in a single verification task)
	 * */
	private static String genContent(ArrayList<String> incCase) {
		HashSet<String> involvedRules = new HashSet<String>();
		
		for(String post : incCase) {
			involvedRules.addAll(postsTrace.get(post));
		}
		
		
		String res="";
		res += BoogiePrinter.printDriverHeader();
		
		for(String r : involvedRules){
			res += String.format("call %s_matchAll();\n", r);
		}
		for(String r : involvedRules){
			res += String.format("call %s_applyAll();\n", r);
		}
		
		res += "\n";
		

		res += "\n";
		
		
		// print postconditions
		ArrayList<String> posts = incCase.stream().map(elem -> postsStrings.get(elem)).collect(Collectors.toCollection(ArrayList::new));
		res += String.format("assert %s;\n", String.join(" \n&& ", posts));
		
		res += BoogiePrinter.printDriverFooter();
		
		return res;
	}

	
	/**
	 * incrementally build verification tasks (separate each of them in individual verification tasks)
	 * */
	private static ArrayList<String> genContents(ArrayList<String> incCase) {
		ArrayList<String> results = new ArrayList<String>();
		
		HashSet<String> involvedRules = new HashSet<String>();
		
		for(String post : incCase) {
			involvedRules.addAll(postsTrace.get(post));
		}
		
		
		String res="";
		res += BoogiePrinter.printDriverHeader();
		
		for(String r : involvedRules){
			res += String.format("call %s_matchAll();\n", r);
		}
		for(String r : involvedRules){
			res += String.format("call %s_applyAll();\n", r);
		}
		
		res += "\n";
		

		res += "\n";
		
		// print postcondition
		
		for(String post : incCase){
			String vc = res;
			vc += String.format("assert %s;\n", postsStrings.get(post));
			vc += BoogiePrinter.printDriverFooter();
			results.add(vc);
		}
		
		return results;
	}
	
//	/**
//	 * randomly grouping the given postconditions {@code n} times.
//	 * */
//	public static void random(URI outputPath, int n) {
//		
//		ArrayList<ArrayList<ArrayList<String>>> set_groups = new ArrayList<ArrayList<ArrayList<String>>>();
//		
//		
//		for(int i = 0; i < n; i++) {
//			ArrayList<String> copy = new ArrayList<String>(posts);			
//			Collections.shuffle(copy);
//			int chunks = ThreadLocalRandom.current().nextInt(1, 51);
//			ArrayList<ArrayList<String>> candidiate = partition(copy, chunks);
//			add(set_groups, candidiate);
//		}
//		
//		Collections.shuffle(set_groups);
//		
//		for(int i = 0; i < n && i < set_groups.size(); i++) {
//			ArrayList<ArrayList<String>> groups = set_groups.get(i);
//			
//			String mapping ="";
//			for (ArrayList<String> group : groups)
//			{	
//				for (String post : group)
//				{
//					mapping += String.format("%s:%03d\n", post, groups.indexOf(group));	
//				}
//			}
//			driver.generateBoogieFile(outputPath, String.format("random_%s", i), "txt", mapping);	
//			
//			// OUTPUT boogie files for groups
//			for (ArrayList<String> group : groups)
//			{	
//				if(group.size() != 1){
//					URI boogiePath = outputPath.appendSegment(String.format("random_%s", i));
//					String content = genContentSep(group);
//					String fileName = String.format("%03d-%d", groups.indexOf(group), group.size());
//					driver.generateBoogieFile(boogiePath, fileName, CompilerConstants.BOOGIE_EXT, content);
//				}
//			}	
//			
//		}
//		
//	}
//	
//	
//	
//	private static void add(ArrayList<ArrayList<ArrayList<String>>> set_groups, ArrayList<ArrayList<String>> candidate){
//		
//		boolean isContained = false;
//		
//		for(ArrayList<ArrayList<String>> groups : set_groups){
//			if(subsetOf(candidate, groups)){
//				isContained = true;
//				break;
//			}
//		}
//		
//		if(!isContained){
//			set_groups.add(candidate);
//		}
//		
//	}
//	
//	/**
//	 * test if every group in g1 is also in g2 
//	 * */
//	private static boolean subsetOf(ArrayList<ArrayList<String>> g1, ArrayList<ArrayList<String>> g2){
//		boolean res = false;
//		for(ArrayList<String> e1 : g1){
//			for(ArrayList<String> e2 : g2){
//				if(e1.containsAll(e2) && e2.containsAll(e1)){
//					res = true;
//					break;
//				}
//			}
//		}
//		
//		return res;
//	}
	
}
