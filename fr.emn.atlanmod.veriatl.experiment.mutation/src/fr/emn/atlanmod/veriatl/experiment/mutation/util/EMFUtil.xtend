/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.mutation.util

import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.emf.ecore.EClass
import org.eclipse.emf.ecore.EAttribute
import java.util.ArrayList

/**
 * @author zcheng
 * 
 */
class EMFUtil {
	def static EObject copy(EObject eObject) {
		val EcoreUtil.Copier copier = new EcoreUtil.Copier();
		val EObject result = copier.copy(eObject);
		copier.copyReferences();
		return result;
	}

	def static getEPackage(URI uri) {
		val rs = new ResourceSetImpl

		val res = rs.getResource(uri, true)
		for (content : res.contents) {
			if (content instanceof EPackage) {
				return content
			}
		}
	}

	def static ArrayList<String> findBoolAttrs(EPackage p, String name) {
		var res = new ArrayList<String>

		val clazz = p.getEClassifier(name) as EClass
		for (EAttribute attr : clazz.EAllAttributes) {
			if (attr.EType.name.toLowerCase == "boolean" || attr.EType.name.toLowerCase == "eboolean") {
				res.add(attr.name)
			}
		}	

		return res
	}

}
