package fr.emn.atlanmod.atl2boogie.xtend.atl

import fr.emn.atlanmod.atl2boogie.xtend.lib.atl
import fr.emn.atlanmod.atl2boogie.xtend.ocl.TypeInference
import fr.emn.atlanmod.atl2boogie.xtend.ocl.ocl2boogie
import org.eclipse.emf.ecore.EObject
import org.eclipse.m2m.atl.common.ATL.Helper
import org.eclipse.m2m.atl.common.ATL.Module
import org.eclipse.m2m.atl.common.ATL.ModuleElement
import org.eclipse.m2m.atl.common.OCL.OclFeature
import org.eclipse.m2m.atl.common.OCL.Operation

class contract2boogie {

	// dispatcher
	def static dispatch genHelpers(EObject o) ''' '''
	
	// module
	def static dispatch genHelpers(Module mod) '''		
	procedure driver();
	  modifies $tarHeap, $linkHeap;
	  free requires valid_src_model($srcHeap);
	  «FOR e : mod.elements»«genPrecondition(e)»«ENDFOR»
	«{clean; null}»
	'''
	
	def static dispatch genPrecondition(ModuleElement h) '''	'''
	
	def static dispatch genPrecondition(Helper h) '''		
	«if (h.commentsBefore.toString().contains("--@pre"))
	{ "//" + (h.definition.feature as Operation).name + "\n"  + 
	  "free requires "+ genOCLFeature(h.definition.feature)+";"}»
	'''
	
	def static dispatch genOCLFeature(OclFeature f) '''	'''
	
	def static dispatch genOCLFeature(Operation f) '''
	«{clean; null}»
	«ocl2boogie.genOclExpression(f.body, atl.genSrcHeap)»
	'''
	
	/**
	 * 
	 */
	def static clean(){
		TypeInference.clean();
		ocl2boogie.clean();
	}
	
	
}