package datastructure;

import java.util.HashMap;

import org.eclipse.emf.ecore.EObject;

public class ContextHelper {
	public static HashMap<EObject, ContextEntry> cloneContext(HashMap<EObject, ContextEntry> src){
		HashMap<EObject, ContextEntry> rtn = new HashMap<EObject, ContextEntry>();
		
		for(EObject ocl : src.keySet()){
			ContextEntry oldEntry = src.get(ocl);
			ContextEntry newEntry = new ContextEntry(oldEntry.getNature(), oldEntry.isEliminated());
			rtn.put(ocl, newEntry);
		}
		
		return rtn;
	}
}
