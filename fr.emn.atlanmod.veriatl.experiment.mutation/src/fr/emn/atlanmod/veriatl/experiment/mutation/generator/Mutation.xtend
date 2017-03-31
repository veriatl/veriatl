package fr.emn.atlanmod.veriatl.experiment.mutation.generator

import org.eclipse.m2m.atl.common.ATL.Binding
import org.eclipse.m2m.atl.common.ATL.MatchedRule
import org.eclipse.m2m.atl.common.ATL.Module
import org.eclipse.m2m.atl.common.ATL.ModuleElement
import org.eclipse.m2m.atl.common.ATL.SimpleInPatternElement
import org.eclipse.m2m.atl.common.ATL.SimpleOutPatternElement
import org.eclipse.m2m.atl.common.OCL.OclExpression
import org.eclipse.m2m.atl.common.OCL.OclModelElement

class Mutation {
	
	public static String src = ""
	public static String trg = ""
	
	def static String SetGuard(Module m, MatchedRule src, MatchedRule mutant) '''
	«header(m)»

	«FOR e : m.elements»
		«IF e !== src»«rule(e)»«ELSE»«rule(mutant)»«ENDIF»
	«ENDFOR»
	'''
	
	def static String Del(Module m, MatchedRule src) '''
	«header(m)»

	«FOR e : m.elements»
		«IF e !== src»«rule(e)»«ENDIF»
	«ENDFOR»
	'''
	
	def static String Bind(Module m, MatchedRule src, MatchedRule mutant) '''
	«header(m)»
	
	«FOR e : m.elements»
		«IF e !== src»«rule(e)»«ELSE»«rule(mutant)»«ENDIF»
	«ENDFOR»
	'''
	
	
	
	def static String Add(Module m, MatchedRule src, MatchedRule mutant) '''
	«header(m)»
	«rule(mutant)»
	«FOR e : m.elements»
		«rule(e)»
	«ENDFOR»
	'''
	
	def static header(Module m)'''
	-- @atlcompiler emftvm
	
	module «m.name»;
	create «m.outModels.get(0).name»: «m.outModels.get(0).metamodel.name» from «m.inModels.get(0).name»: «m.inModels.get(0).metamodel.name»;
		
	'''
	
	
	// dispatcher
	def static dispatch rule(ModuleElement e) '''
	We dont understand «e.eClass.name»
	'''
	
	def static dispatch rule(MatchedRule e) '''
	rule «e.name»{
		from
		  «e.inPattern.elements.map(in | inPattern(in as SimpleInPatternElement)).join(',')»
		  («filter(e.inPattern.filter)»)
		to
		  «e.outPattern.elements.map(in | outPattern(in as SimpleOutPatternElement)).join(',')»
	}
	
	'''
	
	def static filter(OclExpression expr) '''
	«OCL.gen(expr)»'''
	
	def static inPattern(SimpleInPatternElement in) '''
	«var tp = in.type as OclModelElement»
	«in.varName» : «src»!«tp.name»
	'''

	def static outPattern(SimpleOutPatternElement out) '''
	«var tp = out.type as OclModelElement»
	«out.varName» : «trg»!«tp.name»
	«if (out.bindings.size > 0) String.format("(%s)",out.bindings.map(b | bind(b)).join(',\n')) else ""»
	'''
	
	def static bind(Binding b) '''
	 «b.propertyName» <- «OCL.gen(b.value)»'''
	
	
	
}