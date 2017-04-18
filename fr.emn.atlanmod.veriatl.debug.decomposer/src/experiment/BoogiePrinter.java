package experiment;

import java.util.ArrayList;
import java.util.HashSet;

import org.eclipse.m2m.atl.common.OCL.OclExpression;
import org.eclipse.m2m.atl.emftvm.ExecEnv;

import datastructure.Node;
import fr.emn.atlanmod.atl2boogie.xtend.lib.atl;
import fr.emn.atlanmod.atl2boogie.xtend.ocl.ocl2boogie;

public class BoogiePrinter {


	
	



	
	public static String prtingFullDriver(ExecEnv env) {
		String res="";
		res += printDriverHeader();
		
		for(org.eclipse.m2m.atl.emftvm.Rule r : env.getRules()){
			res += String.format("call %s_matchAll();\n", r.getName());
		}
		for(org.eclipse.m2m.atl.emftvm.Rule r : env.getRules()){
			res += String.format("call %s_applyAll();\n", r.getName());
		}

		for(String postName : VCGenerator.postsStrings.keySet()){
			res += String.format("// %s \n", postName);
			res += VCGenerator.postsStrings.get(postName);
		}
		
		
		res += printDriverFooter();
		return res;
	}

	
	
	public static String prtingFastDriver(ExecEnv env, OclExpression post, ArrayList<Node> leafs, String goal)  {		
		String res="";
		String postString = printPost(post);
		res += printDriverHeader();
		
		HashSet<String> involvedRules = new HashSet<String>();
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
		res += String.format("assert %s;\n", postString);
		res += printDriverFooter();
		
		
		// prepare meta-data for VCGeneration
		VCGenerator.postsStrings.put(goal, postString);
		VCGenerator.postsTrace.put(goal, involvedRules);
		VCGenerator.posts.add(goal);
		
		return res;
	}
	




	public static String printPost(OclExpression post) {
		return ocl2boogie.genOclExpression(post, atl.genTrgHeap()).toString();		
	}

	public static String printDriverHeader() {
		String res = "";
		res += "implementation driver(){\n";
		res += "call init_tar_model();\n";	
		return res;
	}
	
	public static String printDriverFooter() {
		String res = "}\n";
		return res;
	}
}
