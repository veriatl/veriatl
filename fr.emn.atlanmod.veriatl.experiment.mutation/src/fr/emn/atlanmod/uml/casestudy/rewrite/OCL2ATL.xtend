package fr.emn.atlanmod.uml.casestudy.rewrite

import java.util.HashSet
import org.eclipse.emf.ecore.EObject
import org.eclipse.ocl.pivot.ExpressionInOCL
import org.eclipse.ocl.pivot.Model
import org.eclipse.ocl.pivot.NullLiteralExp
import org.eclipse.ocl.pivot.Package

class OCL2ATL {
	
	static private HashSet<String> wdSet = new HashSet<String>
	
	
	
	static public String model = "UML"
	static public String modelReplacer = "UMLs"
	static public boolean postMode = false;
	
	// dispatcher
	def static dispatch String rewrite(EObject o) '''
		// We don't understand «o.eClass.name»
	'''
	
	def static dispatch String rewrite(Model m) '''
	«FOR pac : m.ownedPackages»
		«rewrite(pac)»	
	«ENDFOR»
	'''
	
	/**
	 * ps: we don't generate helper if the invariant body is {@code null} or it has been filter out by the projector {@code OCLProjector}
	 */
	def static dispatch String rewrite(Package p) '''	
	«{postMode = false;null}»
	«FOR clazz : p.ownedClasses»
		«FOR inv : clazz.ownedInvariants»
			«IF (OCLProjector.proj((inv.ownedSpecification as ExpressionInOCL).ownedBody)
				&& !((inv.ownedSpecification as ExpressionInOCL).ownedBody instanceof NullLiteralExp)
			)»«
			val wdExprs = OCLWDGenerator.wd((inv.ownedSpecification as ExpressionInOCL).ownedBody)
			»
			--@pre
			helper context «model»!«clazz.name» def: pre_«inv.name»(): Boolean = --«inv.name»
			  «model»!«clazz.name».allInstances()->forAll(«OCL.genIteratorName(clazz.name)» |  «OCL.bvMap.put(OCL.genIteratorName(clazz.name), null)»
			  	«FOR e: wdExprs»
				  	«IF OCL.printAtHere(e, OCL.genIteratorName(clazz.name)) && !wdSet.contains(OCL.gen(e))»«
				  		{wdSet.add(OCL.gen(e));null}»«
				  		IF !OCL.isPrimtive(e)»«
				  			IF !OCL.isCollection(e)»
				  			«e.type.toString().replace("::", "!")».allInstances()->includes(«OCL.gen(e)») implies 
				  			«ELSE»
				  			«OCL.gen(e)»->size()>0 implies 
				  			«ENDIF»«
				  		ENDIF»«
				  	ENDIF»«
			  	ENDFOR»
			    «OCL.gen((inv.ownedSpecification as ExpressionInOCL).ownedBody)»
			); «{wdSet.clear(); OCL.bvMap.clear()}»
			
			«ENDIF»
		«ENDFOR»
	«ENDFOR»
	
	
	«{postMode = true;null}»
	«FOR clazz : p.ownedClasses»
		«FOR inv : clazz.ownedInvariants»
			«IF (OCLProjector.proj((inv.ownedSpecification as ExpressionInOCL).ownedBody)
				&& !((inv.ownedSpecification as ExpressionInOCL).ownedBody instanceof NullLiteralExp)
			)»«
			val wdExprs = OCLWDGenerator.wd((inv.ownedSpecification as ExpressionInOCL).ownedBody)
			»
			--@post
			helper context «if (postMode) modelReplacer else model»!«clazz.name» def: post_«inv.name»(): Boolean = --«clazz.name»_«inv.name»
			  «if (postMode) modelReplacer else model»!«clazz.name».allInstances()->forAll(«OCL.genIteratorName(clazz.name)» |  «OCL.bvMap.put(OCL.genIteratorName(clazz.name), null)»
			  	«FOR e: wdExprs»
				  	«IF OCL.printAtHere(e, OCL.genIteratorName(clazz.name)) && !wdSet.contains(OCL.gen(e))»«
				  		{wdSet.add(OCL.gen(e));null}»«
				  		IF !OCL.isPrimtive(e)»«
				  			IF !OCL.isCollection(e)»
				  			«if (postMode) e.type.toString().replace("::", "!").replace(model+"!", modelReplacer+"!") else e.type.toString().replace("::", "!")».allInstances()->includes(«OCL.gen(e)») implies 
				  			«ELSE»
				  			«OCL.gen(e)»->size()>0 implies 
				  			«ENDIF»«
				  		ENDIF»«
				  	ENDIF»«
			  	ENDFOR»
			    «OCL.gen((inv.ownedSpecification as ExpressionInOCL).ownedBody)»
			); «{wdSet.clear(); OCL.bvMap.clear()}»
			
			«ENDIF»
		«ENDFOR»
	«ENDFOR»
	'''
	

	
	

	

	
}