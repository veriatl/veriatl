/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.mutation.datastructure

import org.eclipse.m2m.atl.common.ATL.MatchedRule
import java.util.ArrayList
import fr.emn.atlanmod.veriatl.experiment.mutation.util.EMFUtil
import fr.emn.atlanmod.veriatl.experiment.mutation.util.OCLUtil
import org.eclipse.m2m.atl.common.OCL.*

/**
 * @author zcheng
 * 
 */
class Add extends Mutator {
	new (MatchedRule r){
		super(r)
	}
	
	
	
	def public MatchedRule apply(){
		var clone = EMFUtil.copy(this.appliedOn) as MatchedRule
		
		// clear bindings for clone
		for(out : clone.outPattern.elements){
			out.bindings.clear();
		}
		
		// clear guard for clone
		var bool = OCLUtil.make.createBooleanExp;
		bool.booleanSymbol = false
		clone.inPattern.filter = bool
		
		// rename rule
		clone.name = clone.name + "_mutated"
		
		return clone
	}
}
