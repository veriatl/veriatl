package datastructure;

import java.util.ArrayList;
import java.util.HashMap;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.m2m.atl.common.OCL.*;
import org.eclipse.m2m.atl.emftvm.ExecEnv;

import Ocl.Ocl2Boogie;
import Ocl.Printer;
import keywords.Keyword;
import transformation.Trace;



public class Node implements Comparable {

	String id;
	String name;
	int level;
	OclExpression content;
	Node parent;
	Node backUpParent;
	HashMap<EObject, ContextEntry> context;
	ProveOption rel2Parent;
	Tactic ruleApplied;
	TriBoolean res;
	
	public Node(int lv, OclExpression ct, Node pt, HashMap<EObject, ContextEntry> ctx, ProveOption rel, Tactic rule){
		this.level = lv;
		this.content = ct;
		this.parent = pt;
		this.context = ctx;
		this.rel2Parent = rel;
		this.ruleApplied = rule;
		this.res = TriBoolean.UNKNOWN;
		this.id = Integer.toHexString(this.hashCode());
		this.name = "";
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

	public HashMap<EObject, ContextEntry> getContext() {
		return context;
	}

	public void setContext(HashMap<EObject, ContextEntry> context) {
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
				}
			}
		}
		return rtn;
		
	}
	
	
	
	@Override
	public String toString() {
		String ctx = "";
		
		for(EObject entry : this.context.keySet()){
			ctx += String.format("%s \t *%s*\n",  Printer.print(entry), this.context.get(entry));
		}
		
		String h = "";
		if(parent != null){
			h =Integer.toHexString(parent.hashCode());
		}
		
		return String.format("Lv: %d\n Node: %s, Parent: %s\nctx: [%s], \n===\nGoal: %s, \napplied %s\nResult: %s\n", 
				level, id, h, ctx, Printer.print(content), ruleApplied, this.res.toString());
	}
	
	public String toBoogie(ExecEnv env){
		String rtn = Keyword.EMPTY_STRING;
		
		rtn += "implementation driver(){\n";
		
		for(EObject r : this.getBVs()){
			rtn += String.format("var %s: ref;\n", Ocl2Boogie.print(r));
		}
		
		rtn += "call init_tar_model();\n";
		
		ArrayList<String> order = Trace.ruleOrdered(env);
		ArrayList<String> list = new ArrayList<String>();
		
		
		for(String r : order){
			if(this.getInvolvedRuls().contains(r)){
				list.add(r);
			}	
		}
		
		for(String r : list){
			rtn += String.format("call %s_matchAll();\n", r);
		}
		
		for(String r : list){
			rtn += String.format("call %s_applyAll();\n", r);
		}
		
		
		for(EObject entry : this.getAssumptions()){
			rtn += String.format("assume %s;\n",  Ocl2Boogie.print(entry));
		}
		
		for(EObject entry : this.getInfers()){
			rtn += String.format("assume %s;\n",  Ocl2Boogie.print(entry));
		}
		
		
		rtn += String.format("assert %s;\n",  Ocl2Boogie.print(this.getContent()));
		
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



}
