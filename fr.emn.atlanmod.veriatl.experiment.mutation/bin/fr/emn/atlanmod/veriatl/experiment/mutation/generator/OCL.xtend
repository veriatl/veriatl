package fr.emn.atlanmod.veriatl.experiment.mutation.generator

import java.util.HashMap
import java.util.HashSet
import org.eclipse.emf.ecore.EObject
import org.eclipse.m2m.atl.common.OCL.*


class OCL {

	

	// dispatcher
	def static dispatch String gen(EObject e) '''
	// We dont understand «e.eClass.name»'''
	
	

	
	def static dispatch String gen(NavigationOrAttributeCallExp e) '''«gen(e.source)».«e.name»'''
	

	def static dispatch String gen(VariableExp e) '''«e.referredVariable.varName»'''
	
	def static dispatch String gen(BooleanExp e) '''«e.booleanSymbol»'''

	def static dispatch String gen(OclModelElement e) '''«e.model.name»!«e.name»'''

	def static dispatch String gen(OperationCallExp e) '''
	«val src = gen(e.source)»
	«val op = e.operationName»
	«val args = e.arguments.map(arg|gen(arg)).join(" ")»
	«if (op=="oclIsTypeOf") String.format("%s.%s(%s)", src, op, args)
	 else if (op=="oclIsKindOf") String.format("%s.%s(%s)", src, op, args)
	 else "dont understand"»'''
	
}
