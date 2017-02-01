package metamodel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EClassifier;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.EStructuralFeature;

import keywords.Keyword;

public class EMFHelper {
	
	
	public static ArrayList<String> getClassifiersNames(EPackage mm)  {
		
		ArrayList<String> rtn = new ArrayList<String>();
		
		for (EClassifier cl : mm.getEClassifiers()) {

			if (cl instanceof EClass) {
				EClass clazz = (EClass) cl;
				String qualifiedClazz =  mm.getName() + Keyword.METAMODELSPLIT + clazz.getName();
				rtn.add(qualifiedClazz);
			}
		}
		return rtn;

	}
	
	
	public static Map<String, String> readParantInfo(EPackage mm)  {

		Map<String, String> info = new HashMap<String, String>();

		String mmPrefix = mm.getName() + Keyword.METAMODELSPLIT;

		for (EClassifier cl : mm.getEClassifiers()) {

			if (cl instanceof EClass) {
				EClass clazz = (EClass) cl;

				for (EClass sp : clazz.getESuperTypes()) {

					info.put(mmPrefix + cl.getName(), 
							 mmPrefix + sp.getName());
				}
			}

		}

		return info;
	}

	public static boolean isSubtype(String sub, String sup, EPackage tarmm)  {
		Map<String, String> inheirtence = readParantInfo(tarmm);

		if (!inheirtence.containsKey(sub)) {
			return false;
		} else {
			return inheirtence.get(sub).equals(sup);
		}

	}

	public static String getStructuralFeatureType(String tp, String attr, EPackage mm)  {
		
		String rtn = "unknown";
		
		for (EClassifier cl : mm.getEClassifiers()) {

			if (cl instanceof EClass) {
				EClass clazz = (EClass) cl;
				String qualifiedClazz =  mm.getName() + Keyword.METAMODELSPLIT + clazz.getName();
				if (qualifiedClazz.equals(tp)) {
					EStructuralFeature sf = clazz.getEStructuralFeature(attr);
					rtn = sf.getEType().getName();
					
					if(sf.getUpperBound()==-1){
						rtn = Keyword.TYPE_COL+rtn;
					}
					
				}
			}
		}
		return rtn;

	}
	
	public static String getAbstractStrcturalFeature(EPackage mm, String tp, String sf){
		String rtn = "unknown";
		for (EClassifier cl : mm.getEClassifiers()) {

			if (cl instanceof EClass) {
				EClass clazz = (EClass) cl;
				
				String qualifiedClazz =  mm.getName() + Keyword.METAMODELSPLIT + clazz.getName();
				if(qualifiedClazz.equals(tp)){
					if(clazz.getESuperTypes()!=null && clazz.getESuperTypes().size()!=0){
						for(EClass parent : clazz.getESuperTypes()){
							String qualifiedParent =  mm.getName() + Keyword.METAMODELSPLIT + parent.getName();
							
							if(parent.getEStructuralFeature(sf) != null){
								rtn = String.format("%s.%s", qualifiedParent, sf);
							}else if(clazz.getEStructuralFeature(sf) != null){
								rtn = String.format("%s.%s", qualifiedClazz, sf);
							}
								
							break;
						}
					}else{
						rtn = String.format("%s.%s", qualifiedClazz, sf);
					}	
				}
				
			}
		}
		return rtn;
		
	}
	
	
	public static String getModel(String tp){
		String mm = tp.substring(0, tp.indexOf(Keyword.METAMODELSPLIT));
		return mm;
	}
	
	public static String getClassifier(String tp){
		String cl = tp.substring(tp.indexOf(Keyword.METAMODELSPLIT)+1, tp.length());
		return cl;
	}
	
	
	
}
