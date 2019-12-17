package fr.emn.atlanmod.veriatl.debug.decomposer.datastructure;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.eclipse.emf.ecore.EPackage;
import org.eclipse.m2m.atl.emftvm.ExecEnv;



public class IncrementalResult {

	Map<String, List<Node>> leafs4Posts;
	Map<String, ArrayList<Node>> trees4Posts;
	Map<String, Set<String>> rules4Posts;
	ExecEnv env;
	EPackage tarmm;
	Map<String, Map<String, String>> infers4Posts;
	
	
	public IncrementalResult(Map<String, List<Node>> leafs, Map<String, ArrayList<Node>> tree, Map<String, Set<String>> rules, ExecEnv e, EPackage mm, Map<String, Map<String, String>> i){
		leafs4Posts = leafs;
		trees4Posts = tree;
		rules4Posts = rules;
		env = e;
		tarmm = mm;
		infers4Posts = i;
	}
	
	public Map<String, List<Node>> getLeafs4Posts() {
		return leafs4Posts;
	}

	public void setLeafs4Posts(Map<String, List<Node>> leafs4Posts) {
		this.leafs4Posts = leafs4Posts;
	}

	public Map<String, ArrayList<Node>> getTrees4Posts() {
		return trees4Posts;
	}

	public void setTrees4Posts(Map<String, ArrayList<Node>> trees4Posts) {
		this.trees4Posts = trees4Posts;
	}

	public Map<String, Set<String>> getRules4Posts() {
		return rules4Posts;
	}

	public void setRules4Posts(Map<String, Set<String>> rules4Posts) {
		this.rules4Posts = rules4Posts;
	}

	public ExecEnv getEnv() {
		return env;
	}

	public void setEnv(ExecEnv env) {
		this.env = env;
	}

	public EPackage getTarmm() {
		return tarmm;
	}

	public void setTarmm(EPackage tarmm) {
		this.tarmm = tarmm;
	}

	public Map<String, Map<String, String>> getInfers4Posts() {
		return infers4Posts;
	}

	public void setInfers4Posts(Map<String, Map<String, String>> infers4Posts) {
		this.infers4Posts = infers4Posts;
	}
	
}
