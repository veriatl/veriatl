package fr.emn.atlanmod.veriatl.experiment.mutation.generator

import org.eclipse.emf.ecore.EObject
import org.eclipse.m2m.atl.common.ATL.*

class ATL {
	// dispatcher
	def static dispatch String gen(EObject e, MatchedRule src, MatchedRule trg) '''
	// We dont understand «e.eClass.name»'''
	
	def static dispatch String gen(Module m, MatchedRule src, MatchedRule trg) '''
	module «m.name»
	create «m.outModels.get(0).name»: «m.outModels.get(0).metamodel.name» from «m.inModels.get(0).name»: «m.inModels.get(0).metamodel.name»;
	
	«FOR e : m.elements»
		«IF e == src»
			«IF trg !== null»
				«gen(trg)»
			«ENDIF»

			
		«ENDIF»	
	«ENDFOR»
	'''
	
	// dispatcher
	def static dispatch gen(ModuleElement e) '''
	We dont understand «e.eClass.name»
	'''
	
	def static dispatch String gen(MatchedRule e) '''
	rule «e.name»{
		from
		
		to
	}
	'''
	
}