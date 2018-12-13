package fr.emn.atlanmod.veriatl.debug.decomposer.ocl;

import java.util.Set;

import org.eclipse.emf.ecore.EObject;

import fr.emn.atlanmod.atl2boogie.xtend.lib.atl;
import fr.emn.atlanmod.atl2boogie.xtend.ocl.ocl2boogie;

public class OclHelper {

	
	public static boolean Equal(EObject e1, EObject e2){
		
		CharSequence expr1 = ocl2boogie.genOclExpression(e1, atl.genTrgHeap());
		CharSequence expr2 = ocl2boogie.genOclExpression(e2, atl.genTrgHeap());
		
		return expr1.equals(expr2);
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
