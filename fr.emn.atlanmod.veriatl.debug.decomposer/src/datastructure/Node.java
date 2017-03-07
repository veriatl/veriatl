package datastructure;

import java.io.Serializable;
import java.util.ArrayList;

import java.util.HashSet;
import java.util.LinkedHashMap;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.m2m.atl.common.OCL.*;
import org.eclipse.m2m.atl.emftvm.ExecEnv;

import fr.emn.atlanmod.atl2boogie.xtend.lib.atl;
import fr.emn.atlanmod.atl2boogie.xtend.ocl.ocl2boogie;
import keywords.Keyword;

import transformation.Trace;



public class Node implements Comparable, Serializable {

	private static final long serialVersionUID = 6537298493984410475L;
	
	
	String id;
	String name;
	int level;
	transient OclExpression content;
	Node parent;
	Node backUpParent;
	transient LinkedHashMap<EObject, ContextEntry> context;
	transient ProveOption rel2Parent;
	transient Tactic ruleApplied;
	TriBoolean res;
	long time;
	
	// for serialization;
	HashSet<String> hypotheses;
	String conclusion;
	HashSet<String> traces;
	boolean checked;
	HashSet<String> bvs;
	
	public Node(int lv, OclExpression ct, Node pt, LinkedHashMap<EObject, ContextEntry> ctx, ProveOption rel, Tactic rule){
		this.level = lv;
		this.content = ct;
		this.parent = pt;
		this.context = ctx;
		this.rel2Parent = rel;
		this.ruleApplied = rule;
		this.res = TriBoolean.UNKNOWN;
		this.id = Integer.toHexString(this.hashCode());
		this.name = "";
		
		hypotheses = new HashSet<String>();
		traces = new HashSet<String>();
		bvs = new HashSet<String>();
		conclusion = "";
		checked = false;
	}

	
	public TriBoolean getResult() {
		return this.res;
	}

	public void setResult(TriBoolean r) {
		this.res = r;
	}
	
	
	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public Node getParent() {
		return parent;
	}

	public void setParent(Node parent) {
		this.parent = parent;
	}

	public ProveOption getRel2Parent() {
		return rel2Parent;
	}

	public void setRel2Parent(ProveOption rel2Parent) {
		this.rel2Parent = rel2Parent;
	}

	public Tactic getRuleApplied() {
		return ruleApplied;
	}

	public void setRuleApplied(Tactic ruleApplied) {
		this.ruleApplied = ruleApplied;
	}
	
	public OclExpression getContent() {
		return content;
	}

	public void setContent(OclExpression content) {
		this.content = content;
	}

	public LinkedHashMap<EObject, ContextEntry> getContext() {
		return context;
	}

	public void setContext(LinkedHashMap<EObject, ContextEntry> context) {
		this.context = context;
	}
	
	@Override
	public int compareTo(Object other) {
		
		if(other instanceof Node){
			return this.level - ((Node)other).level;
		}else{
			return 0;
		}
		
		
	}
	
	public ArrayList<EObject> getAssumptions(){
		ArrayList<EObject> rtn = new ArrayList<EObject>();
		for(EObject e : this.context.keySet()){
			if(this.context.get(e).getNature().equals(ContextNature.ASSUME)){
				rtn.add(e);
			}
		}
		return rtn;
		
	}
	
	public ArrayList<EObject> getInfers(){
		ArrayList<EObject> rtn = new ArrayList<EObject>();
		for(EObject e : this.context.keySet()){
			if(this.context.get(e).getNature().equals(ContextNature.INFER)){
				rtn.add(e);
			}
		}
		return rtn;
		
	}
	
	
	public ArrayList<EObject> getBVs(){
		ArrayList<EObject> rtn = new ArrayList<EObject>();
		for(EObject e : this.context.keySet()){
			if(this.context.get(e).getNature().equals(ContextNature.BV)){
				rtn.add(e);
			}
		}
		return rtn;	
	}
	
	public ArrayList<String> getInvolvedRuls(){
		ArrayList<String> rtn = new ArrayList<String>();
		for(EObject e : this.context.keySet()){
			if(this.context.get(e).getNature().equals(ContextNature.ASSUME)){
				if(e instanceof OperationCallExp){
					OperationCallExp call = ((OperationCallExp) e);
					if(call.getOperationName().equals("genBy")){
						if(call.getArguments().get(0) instanceof StringExp){
							StringExp s = (StringExp) call.getArguments().get(0);
							rtn.add(s.getStringSymbol());
						}			
					}
				}
			}else if(this.context.get(e).getNature().equals(ContextNature.INFER)){
				if(e instanceof OperatorCallExp){
					OperatorCallExp not = ((OperatorCallExp) e);
					if(not.getOperationName().equals("not")){
						if(not.getSource() instanceof OperatorCallExp){
							OperatorCallExp or = (OperatorCallExp) not.getSource() ;
							if(or.getOperationName().equals("or")){
								if(or.getSource() instanceof OperationCallExp){
									OperationCallExp call = ((OperationCallExp) or.getSource());
									if(call.getOperationName().equals("genBy")){
										if(call.getArguments().get(0) instanceof StringExp){
											StringExp s = (StringExp) call.getArguments().get(0);
											rtn.add(s.getStringSymbol());
										}			
									}
								}
								
								for(OclExpression arg :or.getArguments()){
									if(arg instanceof OperationCallExp){
										OperationCallExp call = ((OperationCallExp) arg);
										if(call.getOperationName().equals("genBy")){
											if(call.getArguments().get(0) instanceof StringExp){
												StringExp s = (StringExp) call.getArguments().get(0);
												rtn.add(s.getStringSymbol());
											}			
										}
									}
								}
							}
						}		
					}
				}else if(e instanceof IteratorExp){
					IteratorExp forall = (IteratorExp) e;
					
					if(forall.getIterators().size()>0){
						Iterator it = forall.getIterators().get(0);
						OclExpression body = forall.getBody();
						if(it.getVarName().startsWith("____bv") && body instanceof OperatorCallExp){
							OperatorCallExp or = (OperatorCallExp) body ;
							if(or.getOperationName().equals("or")){
								if(or.getSource() instanceof OperationCallExp){
									OperationCallExp call = ((OperationCallExp) or.getSource());
									if(call.getOperationName().equals("genBy")){
										if(call.getArguments().get(0) instanceof StringExp){
											StringExp s = (StringExp) call.getArguments().get(0);
											rtn.add(s.getStringSymbol());
										}			
									}
								}
								
								for(OclExpression arg :or.getArguments()){
									if(arg instanceof OperationCallExp){
										OperationCallExp call = ((OperationCallExp) arg);
										if(call.getOperationName().equals("genBy")){
											if(call.getArguments().get(0) instanceof StringExp){
												StringExp s = (StringExp) call.getArguments().get(0);
												rtn.add(s.getStringSymbol());
											}			
										}
									}
								}
							}
						}
					}
					
					
				}
			}
		}
		return rtn;
		
	}
	
	
	

	public String toBoogie(){
		String rtn = Keyword.EMPTY_STRING;
		
		rtn += "implementation driver(){\n";
		
		for(String r : this.boundVars()){
			rtn += String.format("var %s: ref;\n", r);
		}
		
		rtn += "call init_tar_model();\n";
	
		
		for(String r : traces){
			rtn += String.format("call %s_matchAll();\n", r);
		}
		
		for(String r : traces){
			rtn += String.format("call %s_applyAll();\n", r);
		}
		
		
		for(String entry : this.hypotheses){
			String assume = String.format("assume %s;\n",  entry);
			rtn += assume ;
		}
		
		
		String ast = String.format("assert %s;\n",  this.conclusion);
		rtn += ast;
		
		rtn+="}\n";
		
		return rtn;
	}
	
	public String toBoogie(ExecEnv env){
		String rtn = Keyword.EMPTY_STRING;
		
		rtn += "implementation driver(){\n";
		
		for(EObject r : this.getBVs()){
			rtn += String.format("var %s: ref;\n", ocl2boogie.genOclExpression(r, atl.genTrgHeap()));
		}
		
		rtn += "call init_tar_model();\n";
		
		ArrayList<String> order = Trace.ruleOrdered(env);
		ArrayList<String> list = new ArrayList<String>();
		
		
		for(String r : order){
			if(this.getInvolvedRuls().contains(r)){
				list.add(r);
			}	
		}
		
		// to serialize traces of this node
		this.traces.addAll(list);
		
		for(String r : list){
			rtn += String.format("call %s_matchAll();\n", r);
		}
		
		for(String r : list){
			rtn += String.format("call %s_applyAll();\n", r);
		}
		
		
		for(String entry : this.hypotheses){
			String assume = String.format("assume %s;\n",  entry);
			rtn += assume ;
		}
		
		
		String ast = String.format("assert %s;\n",  this.conclusion);
		rtn += ast;
		
		rtn+="}\n";
		
		return rtn;
	}


	public Node getBackUpParent() {
		return backUpParent;
	}


	public void setBackUpParent(Node backUpParent) {
		this.backUpParent = backUpParent;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	public boolean isChecked() {
		return this.checked;
	}
	
	public void Check(boolean v) {
		this.checked = v;
	}
	
	//TODO order the hypotheses
	public void Stringlize(){
		
		for(EObject bv : this.getBVs()) {
			String v = ocl2boogie.genOclExpression(bv, atl.genTrgHeap()).toString();
			this.bvs.add(v);
		}
		
		for(EObject entry : this.getAssumptions()){
			String assume = ocl2boogie.genOclExpression(entry, atl.genTrgHeap()).toString();
			this.hypotheses.add(assume);
		}
		
		for(EObject entry : this.getInfers()){
			String assume = ocl2boogie.genOclExpression(entry, atl.genTrgHeap()).toString();
			this.hypotheses.add(assume);
		}
		
		String conclusion = ocl2boogie.genOclExpression(this.content, atl.genTrgHeap()).toString();
		this.conclusion = conclusion;
	}


	public HashSet<String> getHypotheses() {
		return hypotheses;
	}


	public void setHypotheses(HashSet<String> hypotheses) {
		this.hypotheses = hypotheses;
	}


	public HashSet<String> boundVars() {
		return bvs;
	}


	public void setBoundVars(HashSet<String> bvs) {
		this.bvs = bvs;
	}
	
	public String getConclusion() {
		return conclusion;
	}


	public void setConclusion(String conclusion) {
		this.conclusion = conclusion;
	}


	public HashSet<String> getTraces() {
		return traces;
	}


	public void setTraces(HashSet<String> traces) {
		this.traces = traces;
	}

	public long getTime() {
		return this.time;
	}
	
	public void setTime(long v) {
		this.time = v;
	}
	
}
