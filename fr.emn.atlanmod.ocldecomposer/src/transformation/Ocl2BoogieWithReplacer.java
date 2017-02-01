package transformation;

import java.util.Map;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.m2m.atl.common.OCL.*;

import Ocl.TypeInference;
import keywords.Keyword;
import metamodel.EMFHelper;

public class Ocl2BoogieWithReplacer {

	private static EPackage tarMM;
	private static  Map<String, String> replaceMap;
	
	public static void init(EPackage mm, Map<String, String> replacer){
		tarMM = mm;
		replaceMap = replacer;
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
	
	
	static String _print(IteratorExp expr) {
		String rtn = Keyword.EMPTY_STRING;
		Iterator bv = expr.getIterators().get(0);
		OclExpression loopBody = expr.getBody();
		OclExpression loopSrc = expr.getSource();

		if (expr.getName().toLowerCase().equals("forall")) {		
			rtn = String.format("(forall %s: ref :: %s ==> %s)", bv.getVarName(), print(loopSrc), print(loopBody));	
		}else if (expr.getName().toLowerCase().equals("exists")) {	
			rtn = String.format("(exists %s: ref :: %s && %s))", bv.getVarName(), print(loopSrc), print(loopBody));	
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
		}else if(expr.getOperationName().equals("genBy")){
			OclExpression src = expr.getSource();
			OclExpression rl = expr.getArguments().get(0);
			rtn = String.format("genBy(%s, %s, %s, %s)", print(src), print(rl), Keyword.SRCHEAP, Keyword.TARHEAP);
		}else if(expr.getOperationName().equals("oclIsUndefined")){
			OclExpression src = expr.getSource();
			String srcTp = TypeInference.infer(expr.getSource(), tarMM);
			String heap = getHeapName(tarMM, srcTp);
			rtn = String.format("%s == null || !read(%s, %s, alloc)", print(src), heap, print(src));
		}else if(expr.getOperationName().equals("oclIsTypeOf")){
			OclExpression src = expr.getSource();
			OclExpression tp = expr.getArguments().get(0);
			rtn = String.format("dtype(%s) <: %s", print(src), print(tp));
		}else{
			OclExpression src = expr.getSource();
			rtn = String.format("%s applied on %s with args:", expr.getOperationName(), print(src));
			for(OclExpression arg : expr.getArguments()){
				rtn += print(arg);
			}
		}
		return String.format("(%s)", rtn);
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
		
		String var = replaceMap.get(expr.getReferredVariable().getVarName());
		
		if(expr.getReferredVariable()!=null){
			rtn = String.format("%s", var);	
		}else{
			rtn = String.format("%s", "VariableExp_Unknown");
		}
		return rtn;
	}
	
	public static String _print(NavigationOrAttributeCallExp expr){	
		String srcTp = TypeInference.infer(expr.getSource(), tarMM);
		String heap = getHeapName(tarMM, srcTp);
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
		
		boolean isSrc = EMFHelper.getClassifiersNames(mm).contains(tp);
		
		if(isSrc){
			return "$s";
		}else{
			return "$t";
		}
		
	}
	
}
