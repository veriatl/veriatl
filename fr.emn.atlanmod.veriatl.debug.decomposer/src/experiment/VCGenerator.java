package experiment;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

import org.eclipse.emf.common.util.URI;

import fr.emn.atlanmod.atl2boogie.xtend.core.driver;
import fr.emn.atlanmod.atl2boogie.xtend.util.CompilerConstants;

public class VCGenerator {

	public static final String SINGLE = "single";
	public static final String PLUSONE = "plusone";
	public static final String INCCombine = "incCombine";
	public static final String INCSep = "incSep";
	public static final String INC = "incremental";

	public static HashSet<String> done = new HashSet<String>();
	public static HashMap<String, String> postsStrings = new HashMap<String, String>();
	public static HashMap<String, HashSet<String>> postsTrace = new HashMap<String, HashSet<String>>();
	public static HashMap<String, Integer> postsTime = PreloadData.initPostTime();
	public static ArrayList<String> posts = new ArrayList<String>();
	
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
	 * 
	 * */
	public static void combinePlusOne(URI outputPath) {
		for(String post : posts) {
			HashSet<String> postTrace = postsTrace.get(post);
			String postString = postsStrings.get(post);
			
			for(String anotherPost : posts.subList(posts.indexOf(post)+1, posts.size())) {
				
				String fileName = String.format("%s-%s", post, anotherPost);
				URI output = outputPath.appendSegment(VCGenerator.PLUSONE);
				
				HashSet<String> anotherPostTrace = postsTrace.get(anotherPost);
				String anotherPostString = postsStrings.get(anotherPost);
				
				HashSet<String> involvedRules = new HashSet<String>();
				involvedRules.addAll(postTrace);
				involvedRules.addAll(anotherPostTrace);
				
				String res="";
				res += BoogiePrinter.printDriverHeader();
				
				for(String r : involvedRules){
					res += String.format("call %s_matchAll();\n", r);
				}
				for(String r : involvedRules){
					res += String.format("call %s_applyAll();\n", r);
				}
				
				res += "\n";
				
				Set<String> intersection = new HashSet<String>(postTrace); // use the copy constructor
				intersection.retainAll(anotherPostTrace);
				
				// print intersections
				res += "//";
				res += "//";
				for(String s : intersection) {
					res += String.format("%s,", s);
				}
				res += "\n";
				
				// print postconditions
				res += postString;
				res += "\n";
				res += anotherPostString;
				res += "\n";
				
				res += BoogiePrinter.printDriverFooter();
				
				
				fileName = String.format("%s-%03d_%03d_%03d", fileName, postTrace.size(), anotherPostTrace.size(), intersection.size());
				
				driver.generateBoogieFile(output, fileName, CompilerConstants.BOOGIE_EXT, res);
			}
		}
	}
	
	/**
	 * 
	 * */
	public static void singleMutation(URI outputPath) {
		ArrayList<String> subs = new ArrayList<String>(posts);
		Collections.sort(subs, new Comparator<String>(){
		    public int compare(String s1, String s2){
		        return postsTime.get(s1) - postsTime.get(s2);
		    }
		});
		
		for (String post : subs) {
			URI output = outputPath.appendSegment("Mutation");
			ArrayList<String> todo = new ArrayList<String>();
			todo.add(post);
			String content = genMutation(todo);
			String file = String.format("%03d.%s", subs.indexOf(post), post);
			driver.generateBoogieFile(output, file, CompilerConstants.BOOGIE_EXT, content);
		}
		
		for (String post : subs) {
			URI output = outputPath.appendSegment("singleMutation");
			ArrayList<String> todo = new ArrayList<String>();
			todo.add(post);
			String content = genMutationSingle(todo);
			String file = String.format("%03d.%s", subs.indexOf(post), post);
			driver.generateBoogieFile(output, file, CompilerConstants.BOOGIE_EXT, content);
		}

	}

	/**
	 * 
	 * */
	public static void couple(URI outputPath, int min, int max){
		ArrayList<String> nRuleTrace = new ArrayList<String>();
		
		// find initial post with trace of size `n`
		for(String post : posts) {
			HashSet<String> postTrace = postsTrace.get(post);
			if(postTrace.size() >= min && postTrace.size() < max) {
				//if(!Arrays.asList(excludes).contains(post)){
					nRuleTrace.add(post);
				//}
					
			}
			
		}

		// sort posts by verification time
		ArrayList<String> subs = new ArrayList<String>(posts);
		Collections.sort(subs, new Comparator<String>(){
		    public int compare(String s1, String s2){
		        return postsTime.get(s1) - postsTime.get(s2);
		    }
		});
		
		
		for(String post : nRuleTrace) {
			URI output = outputPath.appendSegment("couple");
			HashSet<String> postTrace = postsTrace.get(post);
			
			for(String rest : subs){
				HashSet<String> restTrace = postsTrace.get(rest);
				if(!rest.equals(post) 
						//&& !Arrays.asList(excludes).contains(rest)
						&& !done.contains(String.format("%s-%s", post, rest))
				) {
					Set<String> intersection = new HashSet<String>(postTrace);
					intersection.retainAll(restTrace);
					
					// determine trace relationships of two postconditions
					String nature = "";
					if(intersection.size() == 0){
						nature = "disjoint";
					}else {
						nature = String.format("sharing$%s", intersection.size());
					}
					
					
					ArrayList<String> incCase = new ArrayList<String>();
					incCase.add(post);
					incCase.add(rest);
					String content = genContent(incCase);
					String fileName = String.format("%s-%03d-%s-%s", post, subs.indexOf(rest), rest, nature);
					driver.generateBoogieFile(output, fileName, CompilerConstants.BOOGIE_EXT, content);
					
					done.add(String.format("%s-%s", post,rest));
					done.add(String.format("%s-%s", rest, post));
					
				}
				
			}	
			
		}
	}
	
	/**
	 * 
	 * */
	public static void big_and_disjoint(URI outputPath, int min, int max){
		ArrayList<String> nRuleTrace = new ArrayList<String>();
		
		// find initial post with trace of size `n`
		for(String post : posts) {
			HashSet<String> postTrace = postsTrace.get(post);
			if(postTrace.size() >= min && postTrace.size() < max) {
				if(!Arrays.asList(PreloadData.excludes).contains(post)){
					nRuleTrace.add(post);
				}
					
			}
			
		}
		
		HashMap<String, HashSet<String>> disjoint = new HashMap<String, HashSet<String>>();
		
		// initialize subsumes
		for(String post : nRuleTrace) {
			disjoint.put(post, new HashSet<String>());			
		}
		
		// find disjoints
		for(String post : nRuleTrace) {
			HashSet<String> postTrace = postsTrace.get(post);
			
			for(String rest : posts){
				HashSet<String> restTrace = postsTrace.get(rest);
				Set<String> intersection = new HashSet<String>(restTrace); 
				intersection.retainAll(postTrace);
				
				if(intersection.size() == 0 && !Arrays.asList(PreloadData.excludes).contains(rest)){
					disjoint.get(post).add(rest);
				}			
			}
	
		}
		
		
		for(String post : nRuleTrace) {
			URI output = outputPath.appendSegment("big_disjoint_"+Integer.toString(min));
			
			
			ArrayList<String> subs = new ArrayList<String>(disjoint.get(post));
			Collections.sort(subs, new Comparator<String>(){
			    public int compare(String s1, String s2){
			        return postsTime.get(s1) - postsTime.get(s2);
			    }

			});
			
			for(String sub : subs){
				if(!done.contains(String.format("%s-%s", post,sub))) {
					ArrayList<String> incCase = new ArrayList<String>();
					incCase.add(post);
					incCase.add(sub);
					String content = genContent(incCase);
					String fileName = String.format("%s-%03d-%s", post, subs.indexOf(sub), sub);
					driver.generateBoogieFile(output, fileName, CompilerConstants.BOOGIE_EXT, content);
					
					done.add(String.format("%s-%s", post,sub));
					done.add(String.format("%s-%s", sub, post));
				}
				
			}	
			
		}
	}
		
	/**
	 * find an initial post (Post_i) with trace size `n`, then find any other posts (Post_s1 .. Post_sx) whose trace that are subsumed by the initial post
	 * Finally, incrementally build VCs = Post_i && Post_s1 && ... && Post_sx, where Post_s1 to Post_sx are ordered by their verification time.
	 * 
	 * Aim: 
	 * 	- if subsumes, is it always worthwhile to combine posts; 
	 *  - when we have to chop into two sets of post, because combined posts is too difficult to solve.
	 * */
	public static void subsumed(URI outputPath, int n ) {
		
		ArrayList<String> nRuleTrace = new ArrayList<String>();
		
		// find initial post with trace of size `n`
		for(String post : posts) {
			HashSet<String> postTrace = postsTrace.get(post);
			if(postTrace.size() == n) {
				nRuleTrace.add(post);
			}
			
		}
		
		HashMap<String, HashSet<String>> subsumes = new HashMap<String, HashSet<String>>();
		
		// initialize subsumes
		for(String post : nRuleTrace) {
			subsumes.put(post, new HashSet<String>());			
		}
		
		// find subsumes
		for(String post : nRuleTrace) {
			HashSet<String> postTrace = postsTrace.get(post);
			
			for(String rest : posts){
				HashSet<String> restTrace = postsTrace.get(rest);
				Set<String> intersection = new HashSet<String>(restTrace); 
				intersection.retainAll(postTrace);
				
				if(intersection.size() == restTrace.size() && !post.equals(rest)){
					subsumes.get(post).add(rest);
				}			
			}
	
		}
		
		
		for(String post : nRuleTrace) {
			URI output = outputPath.appendSegment("subsumes").appendSegment(n+"-"+post);
			ArrayList<String> incCase = new ArrayList<String>();
			incCase.add(post);
			
			ArrayList<String> subs = new ArrayList<String>(subsumes.get(post));
			Collections.sort(subs, new Comparator<String>(){
			    public int compare(String s1, String s2){
			        return postsTime.get(s1) - postsTime.get(s2);
			    }

			});
			
			for(String sub : subs){
				incCase.add(sub);
				String content = genContent(incCase);
				String fileName = String.format("%03d", incCase.size());
				driver.generateBoogieFile(output, fileName, CompilerConstants.BOOGIE_EXT, content);
			}	
			
		}
	
	}
	
	/**
	 * 
	 * */
	public static void inc(URI outputPath, int n ) {
		
		ArrayList<String> nRuleTrace = new ArrayList<String>();
		
		for(String post : posts) {
			HashSet<String> postTrace = postsTrace.get(post);
			if(postTrace.size() <= n) {
				nRuleTrace.add(post);
			}
			
		}
		
		ArrayList<String> incCase = new ArrayList<String>();
		URI output = outputPath.appendSegment(VCGenerator.INC);
		
		ArrayList<String> subs = new ArrayList<String>(nRuleTrace);
		Collections.sort(subs, new Comparator<String>(){
		    public int compare(String s1, String s2){
		        return postsTime.get(s1) - postsTime.get(s2);
		    }

		});
		
		for(String post : subs) {
			incCase.add(post);
			String content = genContent(incCase);
			String fileName = String.format("%03d", incCase.size());
			driver.generateBoogieFile(output, fileName, CompilerConstants.BOOGIE_EXT, content);
		}
		
	}
	
	/**
	 * 
	 * */
	public static String genMutationSingle(ArrayList<String> incCase) {
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
		for(String post : incCase) {
			//res += postsStrings.get(post).replace("assert ", "assert !(").replace(";", ");");
			res += postsStrings.get(post).replaceFirst("==>", "<==>");
			res += "\n";
		}
		
		res += BoogiePrinter.printDriverFooter();
		
		return res;
	}
	
	/**
	 * 
	 * */
	public static String genMutation(ArrayList<String> incCase) {
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
		for(String post : incCase) {
			res += String.format("// %s : %s\n", post, postsTime.get(post));
			res += postsStrings.get(post);
			res += "\n";
		}
		
		// print postconditions
		for(String post : incCase) {
			//res += postsStrings.get(post).replace("assert ", "assert !(").replace(";", ");");
			res += postsStrings.get(post).replaceFirst("==>", "<==>");
			res += "\n";
		}
		
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
}
