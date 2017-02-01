package fr.emn.atlanmod.atl2boogie.xtend.atl

import fr.emn.atlanmod.atl2boogie.xtend.lib.atl
import fr.emn.atlanmod.atl2boogie.xtend.lib.emf

import fr.emn.atlanmod.atl2boogie.xtend.ocl.*
import fr.emn.atlanmod.atl2boogie.xtend.core.driver
import org.eclipse.emf.ecore.EObject
import org.eclipse.m2m.atl.common.ATL.*
import org.eclipse.m2m.atl.common.OCL.*
import org.eclipse.m2m.atl.common.ATL.MatchedRule
import org.eclipse.emf.common.util.EList
import org.eclipse.m2m.atl.common.ATL.Binding
import org.eclipse.m2m.atl.common.ATL.OutPatternElement
import java.util.List

// genMatchingPostOutcomeAt and genApplyingPreOutcomeAt
class applyer2boogie {
	// dispatcher
	def static dispatch genModule_applys(EObject o) '''
	// We don't understand «o.eClass.name»
	'''
	
	// module
	def static dispatch genModule_applys(Module mod) '''		
	«FOR e : mod.elements»
		«genModuleElement_apply(e)»	
	«ENDFOR»
	'''
	def static dispatch genModule_applys(OclModel ocl) '''		
	'''
	
	// dispatcher
	def static dispatch genModuleElement_apply(ModuleElement element) '''
	'''
	
	// rule
	def static dispatch genModuleElement_apply(Rule r) '''
	'''
	
	// matched rule
	def static dispatch genModuleElement_apply(MatchedRule r) '''
	procedure «r.name»_applyAll() returns ();
	  requires surj_tar_model(«atl.genSrcHeap», «atl.genTrgHeap»);
	  «(0..r.outPattern.elements.size-1).map(i | genApplyingPreOutcomeAt(r, i)).join("\n")»
	  modifies «atl.genTrgHeap»;
	  // Rule Outcome
	  «(0..r.outPattern.elements.size-1).map(i | genApplyingPostOutcomeAt(r, i)).join("\n")»
	  // Frame property
	  ensures (forall<alpha> «atl.genFrameBVElem()»: ref, «atl.genFrameBVField()»: Field alpha :: 
		  ( «(0..r.outPattern.elements.size-1).map(i | if(r.outPattern.elements.get(i).bindings.size>0) genApplyingPostFrameAt(r, i) else "false").join(" || ")» 
		    // not ideal frame cond, since using dtype to constraint $o is not very precise
		    «IF (hasMultiValBindings(r))»|| (dtype(__$o) == class._System.array && __$f == alloc)«ENDIF»
		    || __$o == null
	        || (read(«atl.genTrgHeap», «atl.genFrameBVElem()», «atl.genFrameBVField()») == read(old(«atl.genTrgHeap»), «atl.genFrameBVElem()», «atl.genFrameBVField()»))
	 	  )
	  );
	  free ensures $HeapSucc(old(«atl.genTrgHeap»), «atl.genTrgHeap»);
	  free ensures surj_tar_model(«atl.genSrcHeap», «atl.genTrgHeap»);
	  
	'''
	
	def static hasMultiValBindings(MatchedRule r) {
		for(OutPatternElement e : r.outPattern.elements){
			val tp = atl.genOutElementType(e).toString.split("\\$")
			val mm = tp.get(0)
			val cl = tp.get(1)
			for(Binding bind : e.bindings){
				val sf = emf.getFeatureNameInMetamodel(driver.fMapTrg, driver.trgmm, mm, cl, bind.propertyName)
				if(driver.fMapTrg.get(sf).startsWith("refs")){
					return true
				}
			}
		}
		
		return false;
	}
	
	def static genApplyingPostOutcomeAt(MatchedRule r, int outid) '''
«val out = r.outPattern.elements.get(outid)»
«if (out.bindings.size > 0) (0..out.bindings.size-1).map(bid | genApplyingPostOutcomeBindingAt_control(r,outid,out,bid)).join("\n") »'''

// if multple bindings with the same lhs, always apply the last one, this is the semantics of EMFTVM.
	def static genApplyingPostOutcomeBindingAt_control(MatchedRule r, int outid, OutPatternElement out, int bid) '''
«if (out.bindings.exists(b | b.propertyName == out.bindings.get(bid).propertyName && out.bindings.indexOf(b)>bid)) "" else genApplyingPostOutcomeBindingAt(r,outid,out,bid)»'''
	
	def static genApplyingPostOutcomeBindingAt(MatchedRule r, int outid, OutPatternElement out, int bid) '''
ensures (forall «r.inPattern.elements.map(e | atl.genInPattern(e, "", ": ref")).join(',')» ::
  «r.inPattern.elements.map(e | atl.genInPatternAllocation(e, atl.genSrcHeap.toString)).join(' && ')» ==>
    printGuard_«r.name»(«atl.genSrcHeap», «r.inPattern.elements.map(e | atl.genInPattern(e, "", "")).join(',')») ==> 
      «resolve(r,outid,out,bid)»
); '''

	
	def static resolve(MatchedRule rule, int outid, OutPatternElement out, int bid) '''
«val bind = out.bindings.get(bid)»
«val infer = TypeInference.infer(bind.value)»
//«infer.kind» : «infer.type»
«if (infer.kind==("primitive"))  resolve_primitive(rule, outid, out, bid)
  else if (infer.kind==("trgRef")) {if (bind.value instanceof VariableExp) resolve_trgRef(rule, outid, out, bid) else throw new Exception("the rhs of binding is not VariableExp")}
  else if (infer.kind==("srcRef")) resolve_srcRef(rule, outid, out, bid)
  else if (infer.kind==("srcRefs")) resolve_srcRefs(rule, outid, out, bid)
  else if (infer.kind==("trgRefs")) resolve_trgRefs(rule, outid, out, bid)	// kind of assuming 'collect' is the only cause of this case, thus, the rhs of binding is Seq ref, not Seq Boxtype
  else resolve_general(rule, outid, out, bid)
»'''
	
	//TODO it has the possibility of «ocl2boogie.genOclExpression(bind.value, atl.genTrgHeap)»
	def static resolve_primitive(MatchedRule rule, int outid, OutPatternElement out, int bid) '''
«val bind = out.bindings.get(bid)»
«val tp = atl.genOutElementType(out).toString.split("\\$")»
«val mm = tp.get(0)»
«val cl = tp.get(1)»
«val sf = emf.getFeatureNameInMetamodel(driver.fMapTrg, driver.trgmm, mm, cl, bind.propertyName)»
read(«atl.genTrgHeap()», «atl.genOutPattern(rule.inPattern.elements,outid)», «sf») == «ocl2boogie.genOclExpression(bind.value, atl.genSrcHeap)»
	'''

	def static resolve_general(MatchedRule rule, int outid, OutPatternElement out, int bid) '''
«val bind = out.bindings.get(bid)»
«val tp = atl.genOutElementType(out).toString.split("\\$")»
«val mm = tp.get(0)»
«val cl = tp.get(1)»
«val sf = emf.getFeatureNameInMetamodel(driver.fMapTrg, driver.trgmm, mm, cl, bind.propertyName)»
read(«atl.genTrgHeap()», «atl.genOutPattern(rule.inPattern.elements,outid)», «sf») == «ocl2boogie.genOclExpression(bind.value, atl.genSrcHeap)»
	'''
	
// if the rule that srcRef matched generated multi target elements, the first tar elem will always be returned. this is the semantics of EMFTVM & ASM.
	def static resolve_srcRef(MatchedRule rule, int outid, OutPatternElement out, int bid) '''
«val bind = out.bindings.get(bid)»
«val tp = atl.genOutElementType(out).toString.split("\\$")»
«val mm = tp.get(0)»
«val cl = tp.get(1)»
«val sf = emf.getFeatureNameInMetamodel(driver.fMapTrg, driver.trgmm, mm, cl, bind.propertyName)»
read(«atl.genTrgHeap()», «atl.genOutPattern(rule.inPattern.elements,outid)», «sf») == getTarsBySrcs(Seq#Singleton(«ocl2boogie.genOclExpression(bind.value, atl.genSrcHeap)»))
	'''	



// currently, we require when the rhs of a binding is a target element, its type must be variableExpr, so we can locate it within the scope of current rule.
// we also assume each rule does not have multiple outpatternElem with the same identifier (i.e. well formed atl rule)
	def static resolve_trgRef(MatchedRule rule, int outid, OutPatternElement out, int bid) '''
«val bind = out.bindings.get(bid)»
«val rhs = bind.value as VariableExp»
«val rhsName = rhs.referredVariable.varName»
«val trgId = rule.outPattern.elements.findTrgElemId(rhsName)»
«val tp = atl.genOutElementType(out).toString.split("\\$")»
«val mm = tp.get(0)»
«val cl = tp.get(1)»
«val sf = emf.getFeatureNameInMetamodel(driver.fMapTrg, driver.trgmm, mm, cl, bind.propertyName)»
read(«atl.genTrgHeap()», «atl.genOutPattern(rule.inPattern.elements,outid)», «sf») == «atl.genOutPattern(rule.inPattern.elements,trgId)»
	'''
	def static findTrgElemId(List<OutPatternElement> l, String n){
 		for(OutPatternElement e : l){
 			if(e.varName == n){
 				return l.indexOf(e)
 			}
 		}
 		return -1
	}
	
	def static resolve_srcRefs(MatchedRule rule, int outid, OutPatternElement out, int bid) '''
«val bind = out.bindings.get(bid)»
«val tp = atl.genOutElementType(out).toString.split("\\$")»
«val mm = tp.get(0)»
«val cl = tp.get(1)»
«val sf = emf.getFeatureNameInMetamodel(driver.fMapTrg, driver.trgmm, mm, cl, bind.propertyName)»
«IF bind.value instanceof NavigationOrAttributeCallExp
»dtype(read(«atl.genTrgHeap()», «atl.genOutPattern(rule.inPattern.elements,outid)», «sf»)) ==  «atl.arrayType()»
&& read(«atl.genTrgHeap()», «atl.genOutPattern(rule.inPattern.elements,outid)», «sf») != null
&& read(«atl.genTrgHeap()», read(«atl.genTrgHeap()», «atl.genOutPattern(rule.inPattern.elements,outid)», «sf»), alloc)
&& («atl.arrayLen()»(read(«atl.genTrgHeap()», «atl.genOutPattern(rule.inPattern.elements,outid)», «sf»))) == («atl.arrayLen()»(«ocl2boogie.genOclExpression(bind.value, atl.genSrcHeap)»))
&& ( forall «atl.genBV()»: int :: 0<=«atl.genBV()» && «atl.genBV()»<«atl.arrayLen()»(«ocl2boogie.genOclExpression(bind.value, atl.genSrcHeap)») ==>
       $Unbox(read(«atl.genTrgHeap()», read(«atl.genTrgHeap()», «atl.genOutPattern(rule.inPattern.elements,outid)», «sf»), IndexField(«atl.genBV()»))): ref == 
         getTarsBySrcs(Seq#Singleton( $Unbox(read(«atl.genSrcHeap()», «ocl2boogie.genOclExpression(bind.value, atl.genSrcHeap)», IndexField(«atl.genBV()»))): ref) ))
«ELSE
»dtype(read(«atl.genTrgHeap()», «atl.genOutPattern(rule.inPattern.elements,outid)», «sf»)) ==  «atl.arrayType()»
&& read(«atl.genTrgHeap()», «atl.genOutPattern(rule.inPattern.elements,outid)», «sf») != null
&& read(«atl.genTrgHeap()», read(«atl.genTrgHeap()», «atl.genOutPattern(rule.inPattern.elements,outid)», «sf»), alloc)
&& («atl.arrayLen()»(read(«atl.genTrgHeap()», «atl.genOutPattern(rule.inPattern.elements,outid)», «sf»))) == (Seq#Length(«ocl2boogie.genOclExpression(bind.value, atl.genSrcHeap)»))
&& ( forall «atl.genBV()»: int :: 0<=«atl.genBV()» && «atl.genBV()»<Seq#Length(«ocl2boogie.genOclExpression(bind.value, atl.genSrcHeap)») ==>
       $Unbox(read(«atl.genTrgHeap()», read(«atl.genTrgHeap()», «atl.genOutPattern(rule.inPattern.elements,outid)», «sf»), IndexField(«atl.genBV()»))): ref == 
         getTarsBySrcs( Seq#Singleton( Seq#Index(«ocl2boogie.genOclExpression(bind.value, atl.genSrcHeap)», «atl.genBV()») ) ) )
«ENDIF»
	'''
	
	def static resolve_trgRefs(MatchedRule rule, int outid, OutPatternElement out, int bid) '''
«val bind = out.bindings.get(bid)»
«val tp = atl.genOutElementType(out).toString.split("\\$")»
«val mm = tp.get(0)»
«val cl = tp.get(1)»
«val sf = emf.getFeatureNameInMetamodel(driver.fMapTrg, driver.trgmm, mm, cl, bind.propertyName)»
dtype(read(«atl.genTrgHeap()», «atl.genOutPattern(rule.inPattern.elements,outid)», «sf»)) ==  «atl.arrayType()»
&& read(«atl.genTrgHeap()», «atl.genOutPattern(rule.inPattern.elements,outid)», «sf») != null
&& read(«atl.genTrgHeap()», read(«atl.genTrgHeap()», «atl.genOutPattern(rule.inPattern.elements,outid)», «sf»), alloc)
&& («atl.arrayLen()»(read(«atl.genTrgHeap()», «atl.genOutPattern(rule.inPattern.elements,outid)», «sf»))) == (Seq#Length(«ocl2boogie.genOclExpression(bind.value, atl.genSrcHeap)»))
&& ( forall «atl.genBV()»: int :: 0<=«atl.genBV()» && «atl.genBV()»<Seq#Length(«ocl2boogie.genOclExpression(bind.value, atl.genSrcHeap)») ==>
       $Unbox(read(«atl.genTrgHeap()», read(«atl.genTrgHeap()», «atl.genOutPattern(rule.inPattern.elements,outid)», «sf»), IndexField(«atl.genBV()»))): ref == 
         getTarsBySrcs( Seq#Singleton( Seq#Index(«ocl2boogie.genOclExpression(bind.value, atl.genSrcHeap)», «atl.genBV()») ) ) )
	'''
	
	// notice the val declaration for finial constant, otherwise cannot be used in static lambda expression
	def static genApplyingPostFrameAt(MatchedRule r, int i) ''' 
«val outs = r.outPattern.elements»«val out = r.outPattern.elements.get(i)»«val ins = r.inPattern.elements»
(dtype(«atl.genFrameBVElem()») <: «atl.genOutPatternType(outs, i)» «if (out.bindings.size>0) " && "+ "("+ (0..out.bindings.size-1).map(bindid | genApplyingPostFrameBindingAt(out, out.bindings.get(bindid))).join(" || ") +")" else ""» 
 && (Seq#Length(«atl.getLinkFunctionInverse(atl.genFrameBVElem().toString, i)») == «ins.size» 
 && «r.inPattern.elements.map(e | atl.genInPatternTypingByIndex(e, r.inPattern.elements.indexOf(e), "", "", i)).join(' && ')»
 && printGuard_«r.name»(«atl.genSrcHeap», «r.inPattern.elements.map(e | atl.genInPatternByIndex(r.inPattern.elements.indexOf(e), "", "", i)).join(',')») ) ) 

'''
	
	
	def static genApplyingPostFrameBindingAt(OutPatternElement out, Binding bind) ''' 
«val tp = out.type as OclModelElement»
«atl.genFrameBVField()» == «emf.getFeatureNameInMetamodel(driver.fMapTrg, driver.trgmm,tp.model.name, tp.name, bind.propertyName)» ''' 
	

	
	// generate the nth outcome postcondition of matching phase of a matched rule
	def static genApplyingPreOutcomeAt(MatchedRule r, int id) '''
  	  requires (forall «r.inPattern.elements.map(e | atl.genInPattern(e, "", ": ref")).join(',')» ::
  	  	    «r.inPattern.elements.map(e | atl.genInPatternAllocation(e, atl.genSrcHeap.toString)).join(' && ')» ==>
  	  	      printGuard_«r.name»(«atl.genSrcHeap», «r.inPattern.elements.map(e | atl.genInPattern(e, "", "")).join(',')») ==> 
  	  	        (   «atl.genOutPattern(r.inPattern.elements, id)»!=null 
  	  	          && read(«atl.genTrgHeap», «atl.genOutPattern(r.inPattern.elements, id)», alloc)
  	  	          && dtype(«atl.genOutPattern(r.inPattern.elements, id)») <: «atl.genOutPatternType(r.outPattern.elements, id)»)
  	  );
	'''
	
}