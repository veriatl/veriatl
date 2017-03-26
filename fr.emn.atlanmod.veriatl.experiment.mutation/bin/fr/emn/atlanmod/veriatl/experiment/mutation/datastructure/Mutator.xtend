/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.mutation.datastructure

import org.eclipse.m2m.atl.common.ATL.MatchedRule

/**
 * @author zcheng
 * 
 */
abstract class Mutator {
	
	private MatchedRule appliedOn;
	
	new(MatchedRule r){
		appliedOn = r	
	}
	
	def MatchedRule getAppliedOn(){
		return this.appliedOn
	}
}
