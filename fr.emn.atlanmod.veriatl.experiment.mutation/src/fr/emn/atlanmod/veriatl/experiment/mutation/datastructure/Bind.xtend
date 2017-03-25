/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.mutation.datastructure

import fr.emn.atlanmod.veriatl.experiment.mutation.util.EMFUtil
import java.util.ArrayList
import org.eclipse.m2m.atl.common.ATL.Binding
import org.eclipse.m2m.atl.common.ATL.MatchedRule
import org.eclipse.m2m.atl.common.ATL.SimpleOutPatternElement

/**
 * @author zcheng
 * 
 */
class Bind extends Mutator {
	new (MatchedRule r){
		super(r)
	}
	
	def ArrayList<MatchedRule> apply(){
		var res = new ArrayList<MatchedRule>
		
		val trgs = appliedOn.outPattern.elements
		
		for(trg : trgs){
			val sTrg = trg as SimpleOutPatternElement
			val trgId = trgs.indexOf(trg)
			for(Binding b : sTrg.bindings){
				var clone = EMFUtil.copy(this.appliedOn) as MatchedRule
				clone.name = clone.name + "_mutated"
				
				val bid = sTrg.bindings.indexOf(b)
				clone.outPattern.elements.get(trgId).bindings.remove(bid)
				
				res.add(clone)
			}
		}
		
		
		return res
	}
	

	
}
