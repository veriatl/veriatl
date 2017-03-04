package fr.emn.atlanmod.atl2boogie.xtend.atl

import fr.emn.atlanmod.atl2boogie.xtend.lib.atl
import fr.emn.atlanmod.atl2boogie.xtend.ocl.ocl2boogie
import fr.emn.atlanmod.atl2boogie.xtend.core.driver
import org.eclipse.emf.ecore.EObject
import org.eclipse.m2m.atl.common.ATL.*
import org.eclipse.m2m.atl.common.OCL.*
import org.eclipse.m2m.atl.common.ATL.MatchedRule



//TODO the user should specify whether they want requires `free` or not. That is another option for VeriATL
class matcher2boogie {
	public static int modDepth = 0;
	
	def static calDepth(Module mod){
		for(ModuleElement e : mod.elements){
			if(e instanceof MatchedRule){
				val r = e as MatchedRule
				if(r.outPattern.elements.size > modDepth){
					modDepth = r.outPattern.elements.size
				}
			}
		}
	}
	
	// dispatcher
	def static dispatch genModule_matches(EObject o) '''
	// We don't understand «o.eClass.name»
	'''
	
	// module
	def static dispatch genModule_matches(Module mod) '''		
	// Eval: «calDepth(mod)»
	// calculate module depth : «modDepth»
	
	procedure init_tar_model();
	  modifies $tarHeap;
	  free ensures  (forall $o: ref :: $o == null || !read($tarHeap, $o, alloc));
	
	«FOR e : mod.elements»
		«genModuleElement_match(e)»	
	«ENDFOR»
	'''
	def static dispatch genModule_matches(OclModel ocl) '''		
	'''
	
	// dispatcher
	def static dispatch genModuleElement_match(ModuleElement element) '''
	'''
	
	// rule
	def static dispatch genModuleElement_match(Rule r) '''
	'''
	
	// matched rule
	def static dispatch genModuleElement_match(MatchedRule r) '''
	«{driver.ExecEnv.add(r);""}»
	«{driver.constants.add(r.name);""}»
	procedure «r.name»_matchAll() returns ();
	  // detect rule conflict
	  «(0..r.outPattern.elements.size-1).map(i | genMatchingPreAt(r, i)).join("\n")»
	  modifies «atl.genTrgHeap», «atl.genLinkHeap»;
	  // rule matching outcome
	  «(0..r.outPattern.elements.size-1).map(i | genMatchingPostOutcomeAt(r, i)).join("\n")»
	  // frame condition
	  «genMatchingPostFrame(r)»
	  «genMatchingPostFrameExtra(r)»
	  free ensures $HeapSucc(old(«atl.genTrgHeap»), «atl.genTrgHeap»);
	  free ensures $HeapSucc(old(«atl.genLinkHeap»), «atl.genLinkHeap»);
	  free ensures surj_tar_model(«atl.genSrcHeap», «atl.genTrgHeap»);
	  
	function printGuard_«r.name»(«atl.genHeapInGuardFun»: HeapType, «r.inPattern.elements.map(e | atl.genInPattern(e, "", ": ref")).join(',')»): bool
	  { 
	  	«if (r.inPattern.filter == null) "true" else ocl2boogie.genOclExpression(r.inPattern.filter, atl.genHeapInGuardFun)»
	  }  
	  
	'''
	
	
	
	// generate the nth precondition of matching phase of a matched rule
	def static genMatchingPreAt(MatchedRule r, int id) '''
	  free requires (forall «r.inPattern.elements.map(e | atl.genInPattern(e, "", ": ref")).join(',')» ::
	    «r.inPattern.elements.map(e | atl.genInPatternAllocation(e, atl.genSrcHeap.toString)).join(' && ')» ==>
	      printGuard_«r.name»(«atl.genSrcHeap», «r.inPattern.elements.map(e | atl.genInPattern(e, "", "")).join(',')») ==> 
	        ( «atl.genOutPattern(r.inPattern.elements, id)»==null || !read(«atl.genTrgHeap», «atl.genOutPattern(r.inPattern.elements, id)», alloc))
	  );
	'''
	
	// generate the nth outcome postcondition of matching phase of a matched rule
	def static genMatchingPostOutcomeAt(MatchedRule r, int id) '''
  	  free ensures (forall «r.inPattern.elements.map(e | atl.genInPattern(e, "", ": ref")).join(',')» ::
  	  	    «r.inPattern.elements.map(e | atl.genInPatternAllocation(e, atl.genSrcHeap.toString)).join(' && ')» ==>
  	  	      printGuard_«r.name»(«atl.genSrcHeap», «r.inPattern.elements.map(e | atl.genInPattern(e, "", "")).join(',')») ==> 
  	  	        (   «atl.genOutPattern(r.inPattern.elements, id)»!=null 
  	  	          && read(«atl.genTrgHeap», «atl.genOutPattern(r.inPattern.elements, id)», alloc)
  	  	          && dtype(«atl.genOutPattern(r.inPattern.elements, id)») <: «atl.genOutPatternType(r.outPattern.elements, id)»)
  	  );
	'''
	// generate the frame postcondition of matching phase of a matched rule
	def static genMatchingPostFrame(MatchedRule r) '''
  	  free ensures (forall<alpha> «atl.genFrameBVElem()»: ref, «atl.genFrameBVField()»: Field alpha ::
  	  	(«atl.genFrameBVElem()» == null 
  	  	|| read(«atl.genTrgHeap()», «atl.genFrameBVElem()», «atl.genFrameBVField()») == read(old(«atl.genTrgHeap()»), «atl.genFrameBVElem()», «atl.genFrameBVField()») 
  	  	|| «(0..r.outPattern.elements.size-1).map(i | genMatchingPostFrameAt(r, i)).join(" || ")» )
  	  );
	'''
	
	def static genMatchingPostFrameExtra(MatchedRule rule) '''
	«FOR i : (rule.outPattern.elements.size..<modDepth)»
	free ensures (forall<alpha> __$i: Seq ref ::
	  !read(old(«atl.genTrgHeap()»), «atl.getLinkFunction(i)»(__$i), alloc) ==> !read(«atl.genTrgHeap()», «atl.getLinkFunction(i)»(__$i), alloc)
	);
	«ENDFOR»
	'''
	
	// generate the nth frame postcondition of matching phase of a matched rule
	def static genMatchingPostFrameAt(MatchedRule r, int id) ''' ( dtype(«atl.genFrameBVElem()») <: «atl.genOutPatternType(r.outPattern.elements, id)» && «atl.genFrameBVField()»==alloc && Seq#Length(«atl.getLinkFunction(id)»_inverse(«atl.genFrameBVElem()»))==«r.inPattern.elements.size»
	&& «(0..r.inPattern.elements.size-1).map(i | genMatchingPostFrameInPatternAt(r,id,i)).join(' && ')»
	&& printGuard_«r.name»(«atl.genSrcHeap», «r.inPattern.elements.map(e | atl.genInPatternByIndex(r.inPattern.elements.indexOf(e), "", "", id)).join(',')») )
	'''
	
	def static genMatchingPostFrameInPatternAt(MatchedRule r, int id, int i) '''dtype(Seq#Index(«atl.getLinkFunction(id)»_inverse(«atl.genFrameBVElem()»), «i»)) <: «atl.genInPatternType(r.inPattern.elements, i)»'''
	
	
}