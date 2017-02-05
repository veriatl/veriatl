package fr.emn.atlanmod.atl2boogie.xtend.emf

import org.eclipse.emf.ecore.*
import fr.emn.atlanmod.atl2boogie.xtend.core.driver
import org.eclipse.emf.ecore.EClassifier

class mm2boogie {
	
	def static gen_Metamodel(EPackage p) '''
	«{driver.constants.add(p.name);""}»
	// print classifier const
	«FOR e : p.EClassifiers»
		«gen_topClassifiers(e)»	
	«ENDFOR»
	
	«FOR e : p.EClassifiers»
		«gen_Classifiers(e)»	
	«ENDFOR»
	
	// print classifier table
	«FOR cl : p.EClassifiers»
		«if (cl instanceof EClass) String.format("axiom classifierTable[_%s, _%s] == %s$%s;", p.name, cl.name, p.name, cl.name) »
		«{driver.constants.add(cl.name);""}»
	«ENDFOR»
	
	// if src mm print valid src
	«IF p.name == driver.srcmm.name»
		«gen_validSrc(p)»
	«ENDIF»
	'''
	def static dispatch gen_topClassifiers(EClassifier cl) ''''''
	
	def static dispatch gen_topClassifiers(EClass cl) '''
	«val mmName = cl.EPackage.name»
	«IF cl.ESuperTypes.size == 0
	»const unique «mmName»$«cl.name»: ClassName extends complete;
	«FOR sf : cl.EStructuralFeatures»
		«gen_StructuralFeatures(cl, sf)»	
	«ENDFOR»
	   «if (cl.abstract) String.format("axiom (forall r: ref :: dtype(r)!= %s$%s);", mmName, cl.name)»
	«ENDIF»
	'''
	
	def static dispatch gen_Classifiers(EClassifier cl) ''''''
	
	def static dispatch gen_Classifiers(EClass cl) '''
	«val mmName = cl.EPackage.name»
	«IF cl.ESuperTypes.size != 0
	»const unique «mmName»$«cl.name»: ClassName extends «(0..<cl.ESuperTypes.size).map(i | mmName + "$" + cl.ESuperTypes.get(i).name).join(",")» complete;
	«FOR sf : cl.EStructuralFeatures»
		«gen_StructuralFeatures(cl, sf)»	
	«ENDFOR»
	   «if (cl.abstract) String.format("axiom (forall r: ref :: dtype(r)!= %s$%s);", mmName, cl.name)»
	«ENDIF»
	'''
	
	def static dispatch gen_StructuralFeatures(EClassifier cl, EStructuralFeature sf) '''''' 
	
	def static dispatch gen_StructuralFeatures(EClassifier cl, EAttribute sf) '''
	const unique «cl.EPackage.name»$«cl.name».«sf.name»: Field «
	IF sf.EType.name == 'EString'»String«
	ELSEIF sf.EType.name == 'EInt'»int«
	ELSEIF sf.EType.name == 'EBoolean'»bool«
	ELSE»«sf.EType.name»«ENDIF»;
	'''
	
	def static dispatch gen_StructuralFeatures(EClassifier cl, EReference sf) '''
	const unique «cl.EPackage.name»$«cl.name».«sf.name»: Field ref;
	'''
	
	def static gen_validSrc(EPackage p) '''
	function valid_src_model($h: HeapType): bool{
		«(0..<p.EClassifiers.size).map(i | gen_constraints_class(p.EClassifiers.get(i)) ).join("&&")»
	} 
	'''
	def static dispatch gen_constraints_class(EClassifier cl) '''true'''
	
	def static dispatch gen_constraints_class(EClass cl) '''
	«val bv = "__"+cl.name.toLowerCase»
	«val mmName = cl.EPackage.name»
	(forall «bv» : ref ::
	  («bv»!=null && read($h, «bv», alloc) && dtype(«bv») <: «mmName»$«cl.name» ==> «IF cl.EStructuralFeatures.size == 0»true«ENDIF»
	    «FOR sf : cl.EStructuralFeatures SEPARATOR "&&"»
	    «IF sf.eClass.name == "EReference" && (sf as EReference).many»
	    (read($h, «bv», «mmName»$«cl.name».«sf.name»)==null || (read($h, read($h, «bv», «mmName»$«cl.name».«sf.name»), alloc) && dtype(read($h, «bv», «mmName»$«cl.name».«sf.name»)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, «bv», «mmName»$«cl.name».«sf.name»)) ==> 
	         ($Unbox(read($h, read($h, «bv», «mmName»$«cl.name».«sf.name»), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, «bv», «mmName»$«cl.name».«sf.name»), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, «bv», «mmName»$«cl.name».«sf.name»), IndexField(__i))): ref)<:«mmName»$«(sf as EReference).EReferenceType.name») ) ) )
	    «ELSEIF sf.eClass.name == "EReference" && !(sf as EReference).many»
	    (read($h, «bv», «mmName»$«cl.name».«sf.name»)!=null && read($h, read($h, «bv», «mmName»$«cl.name».«sf.name») ,alloc) ==>
	       dtype(read($h, «bv», «mmName»$«cl.name».«sf.name»)) <: «mmName»$«(sf as EReference).EReferenceType.name» ) 
	    «ELSE» true «ENDIF»
	    «ENDFOR»  
	  )
	)
	'''
	
	
}