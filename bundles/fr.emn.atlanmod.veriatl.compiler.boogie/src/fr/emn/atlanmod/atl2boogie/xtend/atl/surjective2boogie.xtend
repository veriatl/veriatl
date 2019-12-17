package fr.emn.atlanmod.atl2boogie.xtend.atl

import fr.emn.atlanmod.atl2boogie.xtend.lib.atl
import java.util.ArrayList
import java.util.HashMap
import java.util.HashSet
import java.util.Set
import org.eclipse.emf.ecore.EObject
import org.eclipse.m2m.atl.common.ATL.MatchedRule
import org.eclipse.m2m.atl.common.ATL.Module
import org.eclipse.m2m.atl.common.ATL.ModuleElement
import org.eclipse.m2m.atl.common.ATL.OutPatternElement
import org.eclipse.m2m.atl.common.ATL.Rule
import org.eclipse.m2m.atl.common.OCL.OclModel
import org.eclipse.m2m.atl.common.OCL.OclModelElement

class surjective2boogie {
	public static Set<String> isPrintedOutPatternElement = new HashSet<String>()
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
	def static dispatch genModule_surjective(EObject o) '''
	// We don't understand «o.eClass.name»
	'''
	
	// module
	//TODO the inner loop here is a little bit ugly, I.E. «FOR j : (i+1..<modDepth)» 
	//TODO this axiom is inconsistent: axiom (forall «atl.genFrameBVElem»: ref, «atl.genHeapInGuardFun»: HeapType :: («atl.genFrameBVElem» == null || !read(«atl.genHeapInGuardFun», «atl.genFrameBVElem», alloc)) ==> «atl.getLinkFunction(i)»_inverse(«atl.genFrameBVElem») == Seq#Empty());
	//     consider rewrite as postcondition of every rules.
	def static dispatch genModule_surjective(Module mod) '''
	// Eval: «calDepth(mod)»
	// calculate module depth : «modDepth»
	
	// gen functions: getTarsBySrcs and its inverse
	«FOR i : (0..modDepth-1)»
	function «atl.getLinkFunction(i)»(Seq ref): ref;
	function «atl.getLinkFunction(i)»_inverse(ref): Seq ref;
	axiom (forall __refs: Seq ref :: { «atl.getLinkFunction(i)»(__refs) } «atl.getLinkFunction(i)»_inverse(«atl.getLinkFunction(i)»(__refs)) == __refs);
	«FOR j : (i+1..<modDepth)» 
	axiom (forall __refs: Seq ref, «atl.genHeapInGuardFun»: HeapType :: 
	  (   («atl.getLinkFunction(i)»(__refs)!=null && read(«atl.genHeapInGuardFun»,«atl.getLinkFunction(i)»(__refs),alloc)) 
	   && («atl.getLinkFunction(j)»(__refs)!=null && read(«atl.genHeapInGuardFun»,«atl.getLinkFunction(j)»(__refs),alloc)) )
	     ==> «atl.getLinkFunction(i)»(__refs) != «atl.getLinkFunction(j)»(__refs));
	«ENDFOR»
	«FOR j : (i+1..<modDepth)» 
	axiom (forall __refs1, __refs2: Seq ref, «atl.genHeapInGuardFun»: HeapType :: 
	  ( (__refs1 != __refs2) 
	    && («atl.getLinkFunction(i)»(__refs1)!=null && read(«atl.genHeapInGuardFun» ,«atl.getLinkFunction(i)»(__refs1), alloc))
	    && («atl.getLinkFunction(j)»(__refs2)!=null && read(«atl.genHeapInGuardFun» ,«atl.getLinkFunction(j)»(__refs2), alloc)) ) 
	      ==> «atl.getLinkFunction(i)»(__refs1) != «atl.getLinkFunction(j)»(__refs2));
	«ENDFOR»
	axiom «atl.getLinkFunction(i)»( Seq#Singleton(null) ) == null;
	
	«ENDFOR»
	
	function surj_tar_model($s: HeapType, $t: HeapType): bool{		
	«(0..mod.elements.size-1).map(i | genModuleElement_surjective(mod, mod.elements.get(i))).join("&&")»
	}
	'''
	def static dispatch genModule_surjective(OclModel ocl) '''		
	'''
	
	// dispatcher
	def static dispatch genModuleElement_surjective(Module mod, ModuleElement element) '''
	'''
	
	// rule
	def static dispatch genModuleElement_surjective(Module mod, Rule r) '''
	'''
	
	// matched rule «gen_surjective_core(out, rule)»
	def static dispatch genModuleElement_surjective(Module mod, MatchedRule r) '''
	«var i = 0»
	
	«FOR out : r.outPattern.elements SEPARATOR "&&"»
	«IF !(isPrintedOutPatternElement.contains(out.type.name))»
	(forall «out.varName»: ref :: 
	  «out.varName»!=null && read($t, «out.varName», alloc) && dtype(«out.varName») == «(out.type as OclModelElement).model.name»$«out.type.name» ==>
	    «val rules = findRulesGenType(mod, out)»
	    «val keys = rules.keySet»
	    «(0..keys.size-1).map(id | gen_surjective_core(out, keys.get(id), rules.get(keys.get(id)))).join("||")»
	)
	«{isPrintedOutPatternElement.add(out.type.name);""}»
	«ELSE»
	true 
	«ENDIF»
	«{i++;""}»
	«ENDFOR»
	'''
	
	def static gen_surjective_core(OutPatternElement element, MatchedRule rule, ArrayList<Integer> ids) '''
	«(0..ids.size-1).map(id | gen_surjective_sub_core(element, rule, ids.get(id))).join("||")»
	'''
	
	def static gen_surjective_sub_core(OutPatternElement element, MatchedRule rule, int idx) '''
	
	(exists «rule.inPattern.elements.map(e | atl.genInPattern(e, "", ": ref")).join(',')» ::
	  «rule.inPattern.elements.map(e | atl.genInPatternAllocation(e, "$s")).join(' && ')» &&
	   printGuard_«rule.name»($s, «rule.inPattern.elements.map(e | atl.genInPattern(e, "", "")).join(',')») && 
	  	«atl.genOutPattern(rule.inPattern.elements, idx)» == «element.varName» )
	'''
	
	def static findRulesGenType(Module mod, OutPatternElement elem) {
		val tp = elem.type.name
		var rtn = new HashMap<MatchedRule, ArrayList<Integer>>
		for(ModuleElement e : mod.elements){
			if(e instanceof MatchedRule){
				val r = e as MatchedRule
				
				var id = 0	
				for(OutPatternElement out : r.outPattern.elements){
					if(out.type.name == tp){
						if(rtn.get(r)===null){
							var a = new ArrayList<Integer>()
							a.add(id)
							rtn.put(r, a)
						}else{
							rtn.get(r).add(id)
						}
						// break not supported by xtend
					}
					id++
				}
			}
		}
		return rtn
	}

}