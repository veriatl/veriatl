package Ocl;

import java.util.HashMap;
import java.util.Set;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.m2m.atl.common.OCL.*;

import datastructure.ContextEntry;

public class OclHelper {

	
	public static boolean Equal(EObject e1, EObject e2){
		return Printer.print(e1).equals(Printer.print(e2));
	}
	
	
	public static boolean isMember(Set<EObject> entries, EObject e){

		for(EObject ocl : entries){
			if(Equal(ocl, e)){
				return true;
			}
		}
		return false;
	}
	
	public static EObject getMember(Set<EObject> entries, EObject e){

		for(EObject ocl : entries){
			if(Equal(ocl, e)){
				return ocl;
			}
		}
		return null;
	}
}
