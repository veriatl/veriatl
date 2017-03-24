/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.mutation.util

import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.util.EcoreUtil
import fr.emn.atlanmod.veriatl.experiment.mutation.core.StandAlone

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
}