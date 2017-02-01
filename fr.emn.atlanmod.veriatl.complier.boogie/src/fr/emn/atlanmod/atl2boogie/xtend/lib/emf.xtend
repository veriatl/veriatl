package fr.emn.atlanmod.atl2boogie.xtend.lib

import java.util.HashMap
import org.eclipse.emf.ecore.EClass
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.m2m.atl.common.ATL.OutPatternElement
import org.eclipse.m2m.atl.common.OCL.OclModelElement
import fr.emn.atlanmod.atl2boogie.xtend.core.driver
import org.eclipse.emf.common.util.EList
import java.util.List

class emf {
	def static getsfInfo(Resource resource) {
		var r = new HashMap<String, String>
		for (content : resource.contents) {
			if(content instanceof EPackage){
				for(c : content.getEClassifiers){
					if(c instanceof EClass){
						for(sf : c.getEStructuralFeatures()){
							var nm = String.format("%s$%s.%s", content.name, c.name, sf.name)
							if(sf.getEType.getName == "EInt"){
								r.put(nm, "int")
							}else if(sf.getEType.getName == "EString"){
								r.put(nm, "string")
							}else if(sf.getEType.getName == "EBoolean"){
								r.put(nm, "bool")	
							}else{
								val mm = (content as EPackage).name
								val cl = sf.getEType.getName
								val tp = String.format("%s$%s",mm,cl)
								if(sf.getUpperBound == -1 || sf.getUpperBound > 1){
									r.put(nm, "refs:"+tp)
								}else{
									r.put(nm, "ref:"+tp)
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
		if(s == "int" || s == "string" || s=="bool")
			true
		else
			false
	}
	
	def static findEClassByName(EPackage mm, String cl){
		for(c : mm.getEClassifiers){
			if(c instanceof EClass && c.name==cl){
				return c as EClass
			}
		}
	}
	
	
	def static getFeatureNameInMetamodel(HashMap<String, String> map, EPackage pac, String mm, String cl, String p) {
		var sf = String.format("%s$%s.%s", mm, cl, p)
		if(map.keySet.contains(sf)){
			return sf
		}else{
			val clazz = findEClassByName(pac, cl)
			for(EClass sup : clazz.getEAllSuperTypes()){
				sf = String.format("%s$%s.%s", mm, sup.name, p)
				if(map.keySet.contains(sf)){
					return sf
				}
			}
		}
		return "unknown type"
	}
	

	//TODO
	def static unifyTypes(EPackage pac, List<String> types){
		if(types.size == 0){
			return "unknown000"
		}else if (types.size == 1){
			return types.get(0)
		}else{
			return "unknown234"
		}
	}
	
	def static getEPackage(Resource resource) {
		for (content : resource.contents) {
			if(content instanceof EPackage){
				return content
			}
		}
	}
	

}