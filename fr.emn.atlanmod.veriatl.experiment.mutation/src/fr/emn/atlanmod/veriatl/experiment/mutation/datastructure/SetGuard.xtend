/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.mutation.datastructure

import org.eclipse.m2m.atl.common.ATL.MatchedRule
import org.eclipse.emf.ecore.EPackage
import fr.emn.atlanmod.veriatl.experiment.mutation.util.EMFUtil
import fr.emn.atlanmod.veriatl.experiment.mutation.util.OCLUtil
import org.eclipse.m2m.atl.common.OCL.VariableExp
import java.util.ArrayList

/**
 * @author zcheng
 * 
 */
class SetGuard extends Mutator {
	new (MatchedRule r){
		super(r)
	}
	
	def ArrayList<MatchedRule> apply(EPackage mm){
		var res = new ArrayList<MatchedRule>
		
		val firstElem = appliedOn.inPattern.elements.get(0)
		val firstElemClassName = firstElem.type.name
		val firstElemName = firstElem.varName
		
		val attrs = EMFUtil.findBoolAttrs(mm, firstElemClassName)
		
		for(attr : attrs){
			// create exp to be added on mutant
			var src = OCLUtil.make.createVariableExp
			var ref = OCLUtil.make.createVariableDeclaration
			ref.varName = firstElemName
			src.referredVariable = ref
			var nav = OCLUtil.make.createNavigationOrAttributeCallExp
			nav.source = src
			nav.name = attr
			
			val fal = OCLUtil.make.createBooleanExp
			fal.booleanSymbol = false
			
			var eq = OCLUtil.make.createOperatorCallExp
			eq.operationName = "="
			eq.source = nav
			eq.arguments.add(fal)
			
			// mutant creation
			var clone = EMFUtil.copy(this.appliedOn) as MatchedRule

			// and guard with eq for clone
			var and = OCLUtil.make.createOperatorCallExp
			and.operationName = "and"
			and.source = clone.inPattern.filter
			and.arguments.add(eq)
			clone.inPattern.filter = and
			
			// rename rule
			clone.name = clone.name + "_mutated"
			res.add(clone)
		}
		return res
	}
	

	
}
