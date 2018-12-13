package fr.emn.atlanmod.veriatl.debug.decomposer.metamodel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EClassifier;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl;
import org.eclipse.m2m.atl.emftvm.EmftvmFactory;
import org.eclipse.m2m.atl.emftvm.Metamodel;

import fr.emn.atlanmod.veriatl.debug.decomposer.keywords.Keyword;

public class EMFLoader {

	public static EPackage loadEcore(String metamodelPath) throws Exception {
		// Load metamodels
		ResourceSet rs = new ResourceSetImpl();
		rs.getResourceFactoryRegistry().getExtensionToFactoryMap().put("ecore", new EcoreResourceFactoryImpl());

		Metamodel metaModel = EmftvmFactory.eINSTANCE.createMetamodel();
		metaModel.setResource(rs.getResource(URI.createFileURI(metamodelPath), true));

		Resource r = rs.getResource(URI.createFileURI(metamodelPath), true);
		EObject eObject = r.getContents().get(0);
		if (eObject instanceof EPackage) {
			EPackage p = (EPackage) eObject;
			return p;
		}

		throw new Exception("reading metamodel fails hard! abort...");

	}

	public static Map<String, HashSet<String>> readParantsInfo(EPackage mm) {

		Map<String, HashSet<String>> info = new HashMap<String, HashSet<String>>();

		String mmPrefix = mm.getName() + Keyword.METAMODELSPLIT;

		for (EClassifier cl : mm.getEClassifiers()) {

			if (cl instanceof EClass) {
				EClass clazz = (EClass) cl;
				String clName = mmPrefix + cl.getName();
				info.put(clName, new HashSet<String>());
				
				
				for (EClass sp : clazz.getEAllSuperTypes()) {
					String spName = mmPrefix + sp.getName();
					info.get(clName).add(spName);
				}
			}

		}

		return info;
	}

	public static boolean isSubtype(String sub, String sup, EPackage tarmm, Map<String, HashSet<String>> inheirtence) {

		if (!inheirtence.containsKey(sub)) {
			return false;
		} else {
			return inheirtence.get(sub).contains(sup);
		}

	}

	public static ArrayList<String> getClassifiersNames(EPackage mm) {

		ArrayList<String> rtn = new ArrayList<String>();

		for (EClassifier cl : mm.getEClassifiers()) {

			if (cl instanceof EClass) {
				EClass clazz = (EClass) cl;
				String qualifiedClazz = mm.getName() + Keyword.METAMODELSPLIT + clazz.getName();
				rtn.add(qualifiedClazz);
			}
		}
		return rtn;

	}

	public static String getAbstractStrcturalFeature(EPackage mm, String tp, String sf) {
		String rtn = "unknown";
		for (EClassifier cl : mm.getEClassifiers()) {

			if (cl instanceof EClass) {
				EClass clazz = (EClass) cl;

				String qualifiedClazz = mm.getName() + Keyword.METAMODELSPLIT + clazz.getName();
				if (qualifiedClazz.equals(tp)) {
					if (clazz.getESuperTypes() != null && clazz.getESuperTypes().size() != 0) {
						for (EClass parent : clazz.getESuperTypes()) {
							String qualifiedParent = mm.getName() + Keyword.METAMODELSPLIT + parent.getName();

							if (parent.getEStructuralFeature(sf) != null) {
								rtn = String.format("%s.%s", qualifiedParent, sf);
							} else if (clazz.getEStructuralFeature(sf) != null) {
								rtn = String.format("%s.%s", qualifiedClazz, sf);
							}

							break;
						}
					} else {
						rtn = String.format("%s.%s", qualifiedClazz, sf);
					}
				}

			}
		}
		return rtn;

	}

	public static String getModel(String tp) {
		String mm = tp.substring(0, tp.indexOf(Keyword.METAMODELSPLIT));
		return mm;
	}

	public static String getClassifier(String tp) {
		String cl = tp.substring(tp.indexOf(Keyword.METAMODELSPLIT) + 1, tp.length());
		return cl;
	}
}
