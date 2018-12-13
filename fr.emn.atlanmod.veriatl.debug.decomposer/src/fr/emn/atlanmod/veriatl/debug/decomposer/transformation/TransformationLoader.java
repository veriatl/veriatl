package fr.emn.atlanmod.veriatl.debug.decomposer.transformation;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.m2m.atl.common.ATL.MatchedRule;
import org.eclipse.m2m.atl.common.ATL.Module;
import org.eclipse.m2m.atl.common.ATL.ModuleElement;

public class TransformationLoader {
public static String atlEcore = "src/metamodel/ATL.ecore";

	
	public static List<MatchedRule> init(Resource m) throws Exception{

		
		ArrayList<MatchedRule> rtn = new ArrayList<MatchedRule>();
		
		for(EObject o : m.getContents()){
			if(o instanceof Module){
				Module mod = (Module) o;
				for(ModuleElement elem : mod.getElements()){
					if(elem instanceof MatchedRule){
						MatchedRule r = (MatchedRule) elem;		
						rtn.add(r);
						
					}
				}
			}
		}	
		
		return rtn;
	}
}
