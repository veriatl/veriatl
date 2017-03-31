package fr.emn.atlanmod.veriatl.experiment.mutation.generator

import org.eclipse.emf.ecore.EObject
import org.eclipse.m2m.atl.common.OCL.BooleanExp
import org.eclipse.m2m.atl.common.OCL.NavigationOrAttributeCallExp
import org.eclipse.m2m.atl.common.OCL.OclModelElement
import org.eclipse.m2m.atl.common.OCL.OperationCallExp
import org.eclipse.m2m.atl.common.OCL.OperatorCallExp
import org.eclipse.m2m.atl.common.OCL.VariableExp

class OCL {

	

	// dispatcher
	def static dispatch String gen(EObject e) '''
	// We dont understand «e.eClass.name»'''
	

	
	// print string/seq/set
	def static dispatch CharSequence gen(OperatorCallExp e) '''
	«val src = gen(e.source)»
	«val op = e.operationName»
	«val args = e.arguments.map(arg|gen(arg)).join(op)»
	«if (op=="and") String.format("%s and %s", src, args)
	 else if (op=="=") String.format("%s = %s", src, args)
	 else String.format("We don't understand operator: %s", op)»'''

	
	def static dispatch String gen(NavigationOrAttributeCallExp e) '''«gen(e.source)».«e.name»'''
	

	def static dispatch String gen(VariableExp e) '''«e.referredVariable.varName»'''
	
	def static dispatch String gen(BooleanExp e) '''«e.booleanSymbol»'''

	def static dispatch String gen(OclModelElement e) '''«if (e.model===null) Mutation.src else e.model.name»!«e.name»'''

	def static dispatch String gen(OperationCallExp e) '''
	«val src = gen(e.source)»
	«val op = e.operationName»
	«val args = e.arguments.map(arg|gen(arg)).join(" ")»
	«if (op=="oclIsTypeOf") String.format("%s.%s(%s)", src, op, args)
	 else if (op=="oclIsKindOf") String.format("%s.%s(%s)", src, op, args)
	 else "dont understand"»'''
	
}
