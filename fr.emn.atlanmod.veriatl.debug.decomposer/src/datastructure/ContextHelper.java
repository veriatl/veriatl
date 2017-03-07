package datastructure;

import java.util.LinkedHashMap;

import org.eclipse.emf.ecore.EObject;

public class ContextHelper {
	public static LinkedHashMap<EObject, ContextEntry> cloneContext(LinkedHashMap<EObject, ContextEntry> src){
		LinkedHashMap<EObject, ContextEntry> rtn = new LinkedHashMap<EObject, ContextEntry>();
		
		for(EObject ocl : src.keySet()){
			ContextEntry oldEntry = src.get(ocl);
			ContextEntry newEntry = new ContextEntry(oldEntry.getNature(), oldEntry.isEliminated());
			rtn.put(ocl, newEntry);
		}
		
		return rtn;
	}
}
