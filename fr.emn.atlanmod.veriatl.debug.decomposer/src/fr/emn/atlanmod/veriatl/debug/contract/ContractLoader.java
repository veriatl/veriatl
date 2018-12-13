package fr.emn.atlanmod.veriatl.debug.contract;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.m2m.atl.common.ATL.Helper;
import org.eclipse.m2m.atl.common.ATL.Module;
import org.eclipse.m2m.atl.common.ATL.ModuleElement;
import org.eclipse.m2m.atl.common.OCL.OclExpression;
import org.eclipse.m2m.atl.common.OCL.Operation;

public class ContractLoader {

	

	
	//TODO find better way to process posts
	public static List<OclExpression> init(Resource m) throws Exception{

		
		ArrayList<OclExpression> rtn = new ArrayList<OclExpression>();
		
		for(EObject o : m.getContents()){
			if(o instanceof Module){
				Module mod = (Module) o;
				
				for(ModuleElement elem : mod.getElements()){
					if(elem instanceof Helper){
						Helper h = (Helper) elem;		
						
						if(h.getDefinition().getFeature() instanceof Operation){
							if(((Operation)h.getDefinition().getFeature()).getName().startsWith("post_")){
								
								Operation contract = (Operation) h.getDefinition().getFeature();
								rtn.add(contract.getBody());	
							}							
						}
						
					}
				}
			}
		}
		
		return rtn;
	}
	


}
