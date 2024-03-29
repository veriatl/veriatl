package fr.emn.atlanmod.veriatl.debug.decomposer.metamodel;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.m2m.atl.common.OCL.Iterator;
import org.eclipse.m2m.atl.common.OCL.NavigationOrAttributeCallExp;
import org.eclipse.m2m.atl.common.OCL.OclExpression;
import org.eclipse.m2m.atl.common.OCL.OclModel;
import org.eclipse.m2m.atl.common.OCL.OclModelElement;
import org.eclipse.m2m.atl.common.OCL.OclType;
import org.eclipse.m2m.atl.common.OCL.OperationCallExp;
import org.eclipse.m2m.atl.common.OCL.VariableDeclaration;
import org.eclipse.m2m.atl.common.OCL.VariableExp;

public class EMFCopier {

	
	public static <T extends EObject> T deepCopy(T e){
		
		T rtn = EcoreUtil.copy(e);
		
		if(e instanceof OclModelElement){
			_deepCopy((OclModelElement) rtn, (OclModelElement) e);
		}else if(e instanceof Iterator){
			_deepCopy((Iterator)rtn, (Iterator)e);
		}else if(e instanceof VariableExp){
			_deepCopy((VariableExp)rtn, (VariableExp)e);
		}else if(e instanceof NavigationOrAttributeCallExp){
			_deepCopy((NavigationOrAttributeCallExp)rtn, (NavigationOrAttributeCallExp)e);
		}else if(e instanceof OperationCallExp){
			_deepCopy((OperationCallExp)rtn, (OperationCallExp)e);
		}
		
		
		return rtn;
		
	}
	
	
	private static void _deepCopy(OclModelElement copy, OclModelElement src){
		OclModel m = deepCopy(src.getModel());
		copy.setModel(m);
	}
	
	private static void _deepCopy(Iterator copy, Iterator src){
		OclType tp = deepCopy(src.getType());		
		copy.setType(tp);
	}
	
	private static void _deepCopy(VariableExp copy, VariableExp src){
		VariableDeclaration var = deepCopy(src.getReferredVariable());
		copy.setReferredVariable(var);
	}
	
	private static void _deepCopy(NavigationOrAttributeCallExp copy, NavigationOrAttributeCallExp src){
		OclExpression s = deepCopy(src.getSource());	
		copy.setSource(s);
	}

	private static void _deepCopy(OperationCallExp copy, OperationCallExp src){
		OclExpression s = deepCopy(src.getSource());	
		copy.setSource(s);
	}

	/* Template
	private static void _deepCopy(? copy, ? src){
			
		
	}
	
	*/
	
}
