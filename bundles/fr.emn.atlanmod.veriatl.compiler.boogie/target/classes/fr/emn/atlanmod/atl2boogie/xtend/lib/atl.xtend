package fr.emn.atlanmod.atl2boogie.xtend.lib

import fr.emn.atlanmod.atl2boogie.xtend.core.driver
import java.util.ArrayList
import java.util.HashSet
import java.util.List
import org.eclipse.emf.common.util.EList
import org.eclipse.m2m.atl.common.ATL.InPatternElement
import org.eclipse.m2m.atl.common.ATL.MatchedRule
import org.eclipse.m2m.atl.common.ATL.OutPatternElement
import org.eclipse.m2m.atl.common.ATL.SimpleInPatternElement
import org.eclipse.m2m.atl.common.ATL.SimpleOutPatternElement
import org.eclipse.m2m.atl.common.OCL.OclModelElement

class atl {
	
	public static var HashSet<String> srcHeaps = new HashSet<String>
	public static var HashSet<String> trgHeaps = new HashSet<String>
	
	def static genHeapInGuardFun() ''' __$hp '''
	
	def static genHeapInLambda(String id) '''__$hp_«id» '''
	
	def static genSrcHeap() ''' $srcHeap '''

	def static genTrgHeap() ''' $tarHeap '''
	
	def static genLinkHeap() ''' $linkHeap '''
	
	def static genFrameBVElem() '''__$o'''
	
	def static genFrameBVField() '''__$f'''
	
	def static genBV() '''__$j'''
	
	def static getLinkFunction(int id) '''getTarsBySrcs«if (id==0) "" else id»'''
	
	def static getLinkFunctionInverse(String o, int id) '''getTarsBySrcs«if (id==0) "" else id»_inverse(«o»)'''
	
	def static arrayType() '''class._System.array'''
	
	def static arrayLen() '''_System.array.Length'''
	
	//dispatch
	def static dispatch genInPattern(InPatternElement in, String prefix, String surfix) '''
	'''
	
	//SimpleInPatternElement
	def static dispatch genInPattern(SimpleInPatternElement in, String prefix, String surfix) ''' «prefix+in.varName+surfix» '''
	

	def static genInPatternByIndex(int i, String prefix, String surfix, int id) '''Seq#Index(«getLinkFunction(id)»_inverse(«genFrameBVElem()»), «i»)'''
	
	def static genInPatternTypingByIndex(InPatternElement e, int i, String prefix, String surfix, int id) '''dtype(Seq#Index(«getLinkFunction(id)»_inverse(«genFrameBVElem()»), «i»)) <: «genInPatternType(e)»'''
	
	//dispatch
	def static dispatch genInPatternAllocation(InPatternElement in, String hp) '''
	'''
	
	//SimpleInPatternElement
	def static dispatch genInPatternAllocation(SimpleInPatternElement in, String hp) ''' «in.varName»!=null && read(«hp», «in.varName», alloc) && dtype(«in.varName») <: «genInPatternType(in)»'''
	
	def static genInPatternType(InPatternElement in) '''«var tp = in.type as OclModelElement»«tp.model.name»$«in.type.name» '''
	
	def static genOutPattern(EList<InPatternElement> ins, int id) ''' «getLinkFunction(id)»(«(0..ins.size-1).map[i | if (i==ins.size-1) "Seq#Singleton(" else "Seq#Build("].reduce[res, s | res+s]»«ins.map(e | atl.genInPattern(e, "", "")).join('),')» )) '''
	
	def static genOutPatternType(EList<OutPatternElement> outs, int id) '''«var out = outs.get(id) as OutPatternElement»«var tp = out.type as OclModelElement»«tp.model.name»$«tp.name»'''
	
	def static genOutElementType(OutPatternElement out) '''«var tp = out.type as OclModelElement»«tp.model.name»$«tp.name»'''
	
	def static genInPatternType(EList<InPatternElement> ins, int id) '''«var in = ins.get(id) as InPatternElement»«var tp = in.type as OclModelElement»«tp.model.name»$«tp.name»'''
	
	def static genOutPatternAllocation(SimpleOutPatternElement out, String hp) ''' «out.varName»!=null && read(«hp», «out.varName», alloc) && dtype(«out.varName»)==«genOutElementType(out)»'''
	
	// find the pos of first out element with the given identifier "s"
	def static findOutPos(String s) {
		for(MatchedRule r : driver.ExecEnv){
			var i = 0;
			for(OutPatternElement out : r.outPattern.elements){
				if(out.varName == s){
					return i
				}
				i++
			}
		}
		return 0
	}
	
	def static findOutType(String s) {
		for(MatchedRule r : driver.ExecEnv){
			var i = 0;
			for(OutPatternElement out : r.outPattern.elements){
				if(out.varName == s){
					return out.type
				}
				i++
			}
		}
		return null
	}
	
	
	
	def static findRuleBySrcsTypes(List<String> srcs){
		val res = new ArrayList<String>;
		
		for(MatchedRule r : driver.ExecEnv){
			if(r.inPattern.elements.size == srcs.size){
				var match = true
				
				for(var i = 0 ; i < r.inPattern.elements.size; i++){
					//TODO, bugs here, 0. not work, 1. should check subtype
					if(atl.genInPatternType(r.inPattern.elements.get(i)) != srcs.get(i)){
						match = false
					}
				}
				
				if(match){
					res.add(atl.genOutElementType(r.outPattern.elements.get(0)).toString)
				}
				
			}
		}
		
		return res
	}
	
	
}