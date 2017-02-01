package Ocl;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.m2m.atl.common.OCL.*;


import keywords.Keyword;
import metamodel.EMFHelper;

public class Ocl2Boogie {

	private static EPackage tarMM;
	
	public static void init(EPackage mm){
		tarMM = mm;
	}
	
	
	public static String print(EObject expr){
		String rtn = "";
		
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
	
	//TODO case analysis on src
	static String _print(IteratorExp expr) {
		String rtn = Keyword.EMPTY_STRING;
		Iterator bv = expr.getIterators().get(0);
		OclExpression loopBody = expr.getBody();
		OclExpression loopSrc = expr.getSource();

		
		
		if (expr.getName().toLowerCase().equals("forall")) {
			if(loopSrc instanceof NavigationOrAttributeCallExp){
				String srcTp = TypeInference.infer(loopSrc, tarMM).replace(Keyword.TYPE_COL, "");	// srcTp must be a col, 
				String heap = getHeapName(tarMM, srcTp);
				rtn = String.format("(forall %s: ref :: Seq#Contains(Seq#FromArray(%s, %s), $Box(%s)) ==> %s)", bv.getVarName(), heap, print(loopSrc), bv.getVarName(), print(loopBody));	
			}else{
				rtn = String.format("(forall %s: ref :: Seq#Contains(%s, %s) ==> %s)", bv.getVarName(), print(loopSrc), bv.getVarName(), print(loopBody));	
			}
			
		}else if (expr.getName().toLowerCase().equals("exists")) {	
			if(loopSrc instanceof NavigationOrAttributeCallExp){
				String srcTp = TypeInference.infer(loopSrc, tarMM).replace(Keyword.TYPE_COL, "");	// srcTp must be a col, 
				String heap = getHeapName(tarMM, srcTp);
				rtn = String.format("(exists %s: ref :: Seq#Contains(Seq#FromArray(%s, %s), $Box(%s)) && %s)", bv.getVarName(), heap, print(loopSrc), bv.getVarName(), print(loopBody));	
			}else{
				rtn = String.format("(exists %s: ref :: Seq#Contains(%s, %s) && %s)", bv.getVarName(), print(loopSrc), bv.getVarName(), print(loopBody));	
			}
			
		}	

		
		return rtn;
	}
	
	
	static String _print(OperatorCallExp expr){
		String rtn = Keyword.EMPTY_STRING;
		if(expr.getOperationName().equals("implies")){
			OclExpression lhs = expr.getSource();
			OclExpression rhs = expr.getArguments().get(0);
			
			rtn = String.format("%s ==> %s", print(lhs), print(rhs));
			
		}else if(expr.getOperationName().equals("and")){
			OclExpression lhs = expr.getSource();
			OclExpression rhs = expr.getArguments().get(0);
			
			rtn = String.format("%s && %s", print(lhs), print(rhs));
				
		}else if(expr.getOperationName().equals("or")){
			OclExpression lhs = expr.getSource();
			rtn = print(lhs);		
			if(expr.getArguments().size() > 0){
				for(OclExpression rhs: expr.getArguments()){
					rtn += String.format(" || %s", print(rhs));	
				}
			}else{
				rtn += " || false";
			}
	
		}else if(expr.getOperationName().equals("not")){
			OclExpression src = expr.getSource();

			rtn = String.format("!(%s)", print(src));	
			
		}else if(expr.getOperationName().equals("<>")){
			OclExpression lhs = expr.getSource();
			OclExpression rhs = expr.getArguments().get(0);
			
			rtn = String.format("%s != %s", print(lhs), print(rhs));	
			
		}else if(expr.getOperationName().equals("=")){
			OclExpression lhs = expr.getSource();
			OclExpression rhs = expr.getArguments().get(0);
			
			rtn = String.format("%s == %s", print(lhs), print(rhs));	
			
		}
		
		return rtn;
		
		
	}
	
	public static String _print(OperationCallExp expr){
		String rtn = Keyword.EMPTY_STRING;
		if(expr.getOperationName().equals("allInstances")){
			OclExpression src = expr.getSource();
			String srcTp = TypeInference.infer(src, tarMM);
			String heap = getHeapName(tarMM, srcTp);
			rtn =  String.format("Fun#LIB#AllInstanceFrom(%s, %s)", heap, print(src));
		}else if(expr.getOperationName().equals("includes")){
			OclExpression col = expr.getSource();
			OclExpression src = expr.getArguments().get(0);
			rtn = String.format("Seq#Contains(%s, %s)", print(col), print(src));
		}else if(expr.getOperationName().equals("excludes")){
			OclExpression col = expr.getSource();
			OclExpression src = expr.getArguments().get(0);
			rtn = String.format("!Seq#Contains(%s, %s)", print(col), print(src));
		}else if(expr.getOperationName().startsWith("genBy")){
			OclExpression src = expr.getSource();
			OclExpression rl = expr.getArguments().get(0);
			String op = expr.getOperationName();
			rtn = String.format("%s(%s, %s, %s, %s)", op, print(src), print(rl), Keyword.SRCHEAP, Keyword.TARHEAP);
		}else if(expr.getOperationName().equals("oclIsUndefined")){
			OclExpression src = expr.getSource();
			String srcTp = TypeInference.infer(expr.getSource(), tarMM);
			String heap = getHeapName(tarMM, srcTp);
			rtn = String.format("%s == null || !read(%s, %s, alloc)", print(src), heap, print(src));
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
		String rtn = Keyword.EMPTY_STRING;
		if(expr.getModel()!=null){
			rtn = String.format("%s$%s", expr.getModel().getName(),expr.getName());
		}else{
			rtn = String.format("%s", expr.getName());
		}
			
		return rtn;
	}

	
	public static String _print(VariableExp expr){		
		String rtn = Keyword.EMPTY_STRING;
		if(expr.getReferredVariable()!=null){
			rtn = String.format("%s", expr.getReferredVariable().getVarName());	
		}else{
			rtn = String.format("%s", "VariableExp_Unknown");
		}
		return rtn;
	}
	
	public static String _print(NavigationOrAttributeCallExp expr){	
		String srcTp = TypeInference.infer(expr.getSource(), tarMM);
		String heap = getHeapName(tarMM, srcTp);
		//String op = String.format("%s.%s", srcTp, expr.getName());
		String op = EMFHelper.getAbstractStrcturalFeature(tarMM, srcTp, expr.getName());
		String rtn = String.format("read(%s, %s, %s)", heap, print(expr.getSource()), op);	
		return rtn;
	}
	
	public static String _print(StringExp expr){
		return "_"+expr.getStringSymbol();
	}
	
	
	public static String _print(Iterator expr){
		return expr.getVarName();
	}
	
	
	public static String _print(BooleanExp expr){
		return Boolean.toString(expr.isBooleanSymbol());
	}
	
	
	public static String getHeapName(EPackage mm, String tp){
		
		boolean isTar = EMFHelper.getClassifiersNames(mm).contains(tp);
		
		if(isTar){
			return Keyword.TARHEAP;
		}else{
			return Keyword.SRCHEAP;
		}
		
	}
	
}
