package ocl;

import java.util.HashSet;
import java.util.Set;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.m2m.atl.common.OCL.*;

import fr.emn.atlanmod.atl2boogie.xtend.core.driver;
import fr.emn.atlanmod.atl2boogie.xtend.lib.atl;
import fr.emn.atlanmod.atl2boogie.xtend.lib.emf;
import fr.emn.atlanmod.atl2boogie.xtend.ocl.TypeInference;
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
	
	/**
	 * traverse input for bound var/navigation expressions
	 * */
	public static HashSet<String> traverse(EObject e){
		HashSet<String> rtn = new HashSet<String>();
		
		if(e instanceof IteratorExp){
			IteratorExp iter = (IteratorExp) e;
			for(Iterator it : iter.getIterators()){
				rtn.add(ocl2boogie.genOclExpression(it, atl.genTrgHeap()).toString());
			}
			rtn.addAll(traverse(iter.getBody()));	
		}else if(e instanceof OperationCallExp || e instanceof OperatorCallExp){
			OperationCallExp call = (OperationCallExp) e;
			OclExpression src = call.getSource();
			rtn.addAll(traverse(src));
			for(OclExpression arg : call.getArguments()){
				rtn.addAll(traverse(arg));
			}
			
		}else if(e instanceof VariableExp){
			rtn.add(ocl2boogie.genOclExpression(e, atl.genTrgHeap()).toString());
		}else if(e instanceof NavigationOrAttributeCallExp){
			NavigationOrAttributeCallExp nav = (NavigationOrAttributeCallExp) e;
			OclExpression src = nav.getSource();
			
			String feature = nav.getName();	
			String srcType = TypeInference.infer(src).getType();

			String mm = srcType.split("\\$")[0];
			String cl = srcType.split("\\$")[1];
			
			String n = emf.getFeatureNameInMetamodel(driver.fMapTrg, driver.trgmm, mm, cl, feature);
			
			if(!emf.isPrimitive(driver.fMapTrg.get(n))){
				rtn.add(ocl2boogie.genOclExpression(e, atl.genTrgHeap()).toString());
			}		
		}
			
		return rtn;
	}
	
	
	
	
}
