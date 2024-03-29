package fr.emn.atlanmod.atl2boogie.xtend.lib

import java.util.ArrayList
import java.util.HashMap
import java.util.List
import org.eclipse.emf.ecore.EClass
import org.eclipse.emf.ecore.EClassifier
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource

class emf {
	def static getsfInfo(Resource resource) {
		var r = new HashMap<String, String>
		for (content : resource.contents) {
			if (content instanceof EPackage) {
				for (c : content.getEClassifiers) {
					if (c instanceof EClass) {
						for (sf : c.getEStructuralFeatures()) {
							var nm = String.format("%s$%s.%s", content.name, c.name, sf.name)
							val sfTp = sf.getEType.getName
							if (sfTp == "EInt" || sfTp == "Integer") {
								r.put(nm, "int")
							} else if (sfTp == "EString" || sfTp == "String") {
								r.put(nm, "string")
							} else if (sfTp == "EBoolean" || sfTp == "Boolean") {
								r.put(nm, "bool")
							} else {
								val mm = (content as EPackage).name
								val cl = sf.getEType.getName
								val tp = String.format("%s$%s", mm, cl)
								if (sf.getUpperBound == -1 || sf.getUpperBound > 1) {
									r.put(nm, "refs:" + tp)
								} else {
									r.put(nm, "ref:" + tp)
								}

							}
						}
					}
				}
			}
		}
		return r
	}

	def static isPrimitive(String s) {
		if (s == "int" || s == "string" || s == "bool")
			true
		else
			false
	}

	def static findEClassByName(EPackage mm, String cl) {
		for (c : mm.getEClassifiers) {
			if (c instanceof EClass && c.name == cl) {
				return c as EClass
			}
		}
	}

	def static getFeatureNameInMetamodel(HashMap<String, String> map, EPackage pac, String mm, String cl, String p) {
		var sf = String.format("%s$%s.%s", mm, cl, p)
		if (map.keySet.contains(sf)) {
			return sf
		} else {
			val clazz = findEClassByName(pac, cl)

			for (EClass sup : clazz.getEAllSuperTypes()) {
				sf = String.format("%s$%s.%s", mm, sup.name, p)
				if (map.keySet.contains(sf)) {
					return sf
				}
			}
		}
		return "unknown type"
	}

	// TODO
	def static unifyTypes(EPackage pac, List<String> types) {
		if (types.size == 0) {
			return "unknown000"
		} else if (types.size == 1) {
			return types.get(0)
		} else {
			return "unknown234"
		}
	}

	def static getEPackage(Resource resource) {
		for (content : resource.contents) {
			if (content instanceof EPackage) {
				return content
			}
		}
	}

	/**
	 * Return a list of EClasses in `order`. The order is defined as: if `A` extends `B`, then B must in the returned list before A.
	 * This is to cooperate with Boogie VC generation for constants.
	 */
	def static ArrayList<EClass> getOrderedClassifiers(EPackage p) {
		var int i = 0;
		var int eclassSize = 0;
		
		var ArrayList<EClass> rtn = new ArrayList<EClass>();

		// add eclasses whose super type is none.
		for (EClassifier e : p.EClassifiers) {
			if (e instanceof EClass) {
				if (e.ESuperTypes.size == 0) {
					rtn.add(e)
					i++
				}
				eclassSize++
			}
		}

		// Keep adding eclasses whose super type is already in return list.
		while (i != eclassSize) {
			for (EClassifier e : p.EClassifiers) {
				if (e instanceof EClass) {
					if (!rtn.contains(e) && rtn.containsAll(e.ESuperTypes)) {
						rtn.add(e)
						i++
					}
				}
			}
		}

		return rtn
	}



	/** 
	 * return a list of EClasses, which are descendants of the given classifier `clName`.
	 * */
	def static ArrayList<EClass> getAllSubClasses(EPackage p, String clName){
		var ArrayList<EClass> rtn = new ArrayList<EClass>();
		
		val EClass cl =  p.getEClassifier(clName) as EClass
		
		var int oldSize = -1
		rtn.add(cl)
		
		while(oldSize != rtn.size){
			oldSize = rtn.size()
			var ArrayList<EClass> temp = new ArrayList<EClass>();
			
			for(EClass trg : rtn){
				for (EClassifier e : p.EClassifiers) {
					if (e instanceof EClass) {
						if (!rtn.contains(e) && e.ESuperTypes.contains(trg)) {
							temp.add(e)
						}
					}
				}
			}	
			
			rtn.addAll(temp)
			
		}
		
		
		return rtn
	}
}
