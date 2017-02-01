package Ocl;

import java.util.HashMap;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.m2m.atl.common.OCL.*;


import datastructure.ContextEntry;
import datastructure.Node;
import datastructure.ProveOption;
import datastructure.Tactic;
import keywords.Keyword;

public class Printer {

	static String indent(int depth) {
		String rtn = "";
		for (int i = 0; i < depth; i++) {
			rtn += "\t";
		}
		return rtn;
	}
	
	public static String print(EObject expr){
		String rtn = Keyword.TYPE_UNKNOWN;
		
		if(expr == null){
			return rtn;
		}
		
		if(expr instanceof IteratorExp){
			IteratorExp todo = (IteratorExp) expr;
			rtn = _print(todo);
		}else if(expr instanceof OperatorCallExp){
			OperatorCallExp todo = (OperatorCallExp) expr;
			rtn = _print(todo);
		}else if(expr instanceof OperationCallExp){
			OperationCallExp todo = (OperationCallExp)expr;
			rtn = _print(todo);
		}else if (expr instanceof OclModelElement){
			OclModelElement todo = (OclModelElement)expr;
			rtn = _print(todo);
		}else if (expr instanceof VariableExp){
			VariableExp todo = (VariableExp)expr;
			rtn = _print(todo);
		}else if (expr instanceof NavigationOrAttributeCallExp){
			NavigationOrAttributeCallExp todo = (NavigationOrAttributeCallExp)expr;
			rtn = _print(todo);
		}else if (expr instanceof Iterator){
			Iterator todo = (Iterator)expr;
			rtn = _print(todo);
		}else if (expr instanceof StringExp){
			StringExp todo = (StringExp) expr;
			rtn = _print(todo);
		}else if(expr instanceof BooleanExp){
			BooleanExp todo = (BooleanExp) expr;
			rtn = _print(todo);
		}
		
		return rtn;
	}
	
	static String _print(IteratorExp expr) {
		String rtn = Keyword.TYPE_UNKNOWN;
		Iterator bv = expr.getIterators().get(0);
		OclExpression loopBody = expr.getBody();
		OclExpression loopSrc = expr.getSource();



		
		if (expr.getName().toLowerCase().equals("forall")) {		
			rtn = String.format("%s->forall(%s|%s)", print(loopSrc), bv.getVarName(), print(loopBody));	
		}else if (expr.getName().toLowerCase().equals("exists")) {	
			rtn = String.format("%s->exists(%s|%s)", print(loopSrc), bv.getVarName(), print(loopBody));	
		}	

		
		return rtn;
	}
	
	static String _print(OperatorCallExp expr){
		String rtn = Keyword.TYPE_UNKNOWN;
		if(expr.getOperationName().equals("implies")){
			OclExpression lhs = expr.getSource();
			OclExpression rhs = expr.getArguments().get(0);
			
			rtn = String.format("%s implies %s", print(lhs), print(rhs));
			
		}else if(expr.getOperationName().equals("and")){
			OclExpression lhs = expr.getSource();
			OclExpression rhs = expr.getArguments().get(0);
			
			rtn = String.format("%s and %s", print(lhs), print(rhs));
				
		}else if(expr.getOperationName().equals("or")){
			OclExpression lhs = expr.getSource();
			rtn = print(lhs);		
			if(expr.getArguments().size() > 0){
				for(OclExpression rhs: expr.getArguments()){
					rtn += String.format(" or %s", print(rhs));	
				}
			}else{
				rtn += " or false";
			}
	
		}else if(expr.getOperationName().equals("not")){
			OclExpression src = expr.getSource();

			rtn = String.format("not %s", print(src));	
			
		}else if(expr.getOperationName().equals("<>")){
			OclExpression lhs = expr.getSource();
			OclExpression rhs = expr.getArguments().get(0);
			
			rtn = String.format("%s <> %s", print(lhs), print(rhs));	
			
		}else if(expr.getOperationName().equals("=")){
			OclExpression lhs = expr.getSource();
			OclExpression rhs = expr.getArguments().get(0);
			
			rtn = String.format("%s = %s", print(lhs), print(rhs));	
			
		}
		
		return rtn;
		
		
	}
	
	public static String _print(OperationCallExp expr){
		String rtn = Keyword.TYPE_UNKNOWN;
		if(expr.getOperationName().equals("allInstances")){
			OclExpression src = expr.getSource();
			rtn =  String.format("%s->allInstances()", print(src));
		}else if(expr.getOperationName().equals("includes")){
			OclExpression col = expr.getSource();
			OclExpression src = expr.getArguments().get(0);
			rtn = String.format("%s in %s", print(src), print(col));
		}else if(expr.getOperationName().equals("excludes")){
			OclExpression col = expr.getSource();
			OclExpression src = expr.getArguments().get(0);
			rtn = String.format("%s not_in %s", print(src), print(col));
		}else if(expr.getOperationName().equals("genBy")){
			OclExpression src = expr.getSource();
			OclExpression rl = expr.getArguments().get(0);
			rtn = String.format("%s genBy %s", print(src), print(rl));
		}else if(expr.getOperationName().equals("oclIsUndefined")){
			OclExpression src = expr.getSource();
			rtn = String.format("%s.oclIsUndefined()", print(src));
		}else{
			OclExpression src = expr.getSource();
			rtn = String.format("%s applied on %s with args:", expr.getOperationName(), print(src));
			for(OclExpression arg : expr.getArguments()){
				rtn += print(arg);
			}
		}
		return rtn;
	}
	
	public static String _print(OclModelElement expr){	
		String rtn = Keyword.TYPE_UNKNOWN;
		if(expr.getModel()!=null){
			rtn = String.format("%s$%s", expr.getModel().getName(),expr.getName());
		}else{
			rtn = String.format("%s", expr.getName());
		}
			
		return rtn;
	}

	
	public static String _print(VariableExp expr){		
		String rtn = Keyword.TYPE_UNKNOWN;
		if(expr.getReferredVariable()!=null){
			rtn = String.format("%s", expr.getReferredVariable().getVarName());	
		}else{
			rtn = String.format("%s", "VariableExp_Unknown");
		}
		return rtn;
	}
	
	public static String _print(NavigationOrAttributeCallExp expr){		
		String rtn = String.format("%s.%s", print(expr.getSource()), expr.getName());	
		return rtn;
	}
	
	public static String _print(StringExp expr){
		return expr.getStringSymbol();
	}
	
	
	public static String _print(Iterator expr){
		return expr.getVarName();
	}
	
	
	public static String _print(BooleanExp expr){
		return Boolean.toString(expr.isBooleanSymbol());
	}
	
	
	
//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//
//	}

}
