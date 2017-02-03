package ocl;

import java.util.HashMap;
import java.util.Map;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.m2m.atl.common.OCL.*;

import keywords.Keyword;
import metamodel.EMFLoader;

public class TypeInference {

	public static Map<String, String> lookup = new HashMap<String, String>();

	
	public static void init(Map<String, String> map){
		lookup.clear();
		lookup.putAll(map);
	}
	
	
	
	public static String infer(EObject expr, EPackage mm){
		String rtn = Keyword.TYPE_UNKNOWN;
		
		if(lookup.containsKey(Printer.print(expr))){
			return lookup.get(Printer.print(expr));
		}
		
		if(expr instanceof OperationCallExp){
			OperationCallExp todo = (OperationCallExp) expr;
			rtn = _infer(todo,mm);
		}else if(expr instanceof OclModelElement){
			OclModelElement todo = (OclModelElement) expr;
			rtn = _infer(todo,mm);
		}else if(expr instanceof NavigationOrAttributeCallExp){
			NavigationOrAttributeCallExp todo = (NavigationOrAttributeCallExp) expr;
			rtn = _infer(todo,mm);
		}else if(expr instanceof VariableExp){
			VariableExp todo = (VariableExp) expr;
			rtn = _infer(todo,mm);
		}
		
		if(!rtn.equals(Keyword.TYPE_UNKNOWN)){
			lookup.put(Printer.print(expr), rtn);
		}
		
		return rtn;
	}
	
	public static String _infer(OperationCallExp expr, EPackage mm){
		String rtn = Keyword.TYPE_UNKNOWN;
		if(expr.getOperationName().equals("allInstances")){
			rtn =  Keyword.TYPE_COL + infer(expr.getSource(),mm);
		}
		
		return rtn;
	}
	
	
	//TODO BUG: because EcoreUtil.copy doing a shallow copy, cross references are not copied, so expr.getModel can be null.
	//When that happens, we replace expr.getModel with target metamodel by default, regardless its potential to be a source
	//model classifer.
	public static String _infer(OclModelElement expr, EPackage mm){
		String rtn = Keyword.TYPE_UNKNOWN;
		if(expr.getModel()!=null){
			rtn = String.format("%s$%s", expr.getModel().getName(),expr.getName());
		}else{
			rtn = String.format("%s$%s", mm.getName(), expr.getName());
		}
		
		return rtn;
	}
	
	public static String _infer(NavigationOrAttributeCallExp expr, EPackage mm){
		String rtn = Keyword.TYPE_UNKNOWN;
		String srcType = infer(expr.getSource(),mm);
		String navType =  EMFLoader.getStructuralFeatureType(srcType, expr.getName(),mm);
		rtn = navType;
		
		return rtn;
		
	}
	
	public static String _infer(VariableExp expr, EPackage mm){
		if(lookup.containsKey(Printer.print(expr))){
			return lookup.get(Printer.print(expr));
		}else{
			return Keyword.TYPE_UNKNOWN;
		}
		
	}
	
	public static boolean isPrimitive(String tp){
		if(tp.equals("EInt") || tp.equals("EBoolean") || tp.equals("EString")){
			return true;
		}else{
			return false;
		}
	}
	
	public static String getElemType(String tp){
		if(tp.startsWith(Keyword.TYPE_COL)){
			return tp.replace(Keyword.TYPE_COL, "");
		}else{
			return Keyword.TYPE_UNKNOWN;
		}
	}
	
	
	
}
