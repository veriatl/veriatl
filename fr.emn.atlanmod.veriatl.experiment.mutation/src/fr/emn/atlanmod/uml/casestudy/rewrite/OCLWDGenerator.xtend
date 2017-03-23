/**
 * 
 */
package fr.emn.atlanmod.uml.casestudy.rewrite

import java.util.HashSet
import org.eclipse.emf.ecore.EObject
import org.eclipse.ocl.pivot.BooleanLiteralExp
import org.eclipse.ocl.pivot.CollectionLiteralExp
import org.eclipse.ocl.pivot.EnumLiteralExp
import org.eclipse.ocl.pivot.IfExp
import org.eclipse.ocl.pivot.IntegerLiteralExp
import org.eclipse.ocl.pivot.IteratorExp
import org.eclipse.ocl.pivot.IteratorVariable
import org.eclipse.ocl.pivot.LetExp
import org.eclipse.ocl.pivot.NullLiteralExp
import org.eclipse.ocl.pivot.Operation
import org.eclipse.ocl.pivot.OperationCallExp
import org.eclipse.ocl.pivot.OppositePropertyCallExp
import org.eclipse.ocl.pivot.PropertyCallExp
import org.eclipse.ocl.pivot.Type
import org.eclipse.ocl.pivot.TypeExp
import org.eclipse.ocl.pivot.UnlimitedNaturalLiteralExp
import org.eclipse.ocl.pivot.VariableExp

/**
 * @author zcheng
 *
 */
class OCLWDGenerator {
		// dispatcher
	def static dispatch HashSet<PropertyCallExp> wd(EObject e) {
		return new HashSet
	}

	def static dispatch HashSet<PropertyCallExp> wd(OperationCallExp e) {

		var r = new HashSet
		val src = wd(e.ownedSource)
		val args = e.ownedArguments.map(arg|wd(arg))
		var args_res = new HashSet
		
		if(args!=null && args.size>0){
			for(HashSet<PropertyCallExp> arg : args){
				args_res.addAll(arg)
			}
		}

		r.addAll(src)
		r.addAll(args_res)

		return r
	}

	def static dispatch HashSet<PropertyCallExp> wd(PropertyCallExp e) {
		var HashSet<PropertyCallExp> r = new HashSet
		r.add(e)
		r.addAll(wd(e.ownedSource))
		return r
	}

	// TODO
	def static dispatch HashSet<PropertyCallExp> wd(OppositePropertyCallExp e) {
		var HashSet<PropertyCallExp> r = new HashSet
		// r.add(e)
		r.addAll(wd(e.ownedSource))
		return r
	}

	def static dispatch HashSet<PropertyCallExp> wd(VariableExp e) {
		return new HashSet
	}

	def static dispatch HashSet<PropertyCallExp> wd(IteratorVariable e) {
		return new HashSet
	}


	def static dispatch HashSet<PropertyCallExp> wd(Operation e) {
		return new HashSet
	}

	def static dispatch HashSet<PropertyCallExp> wd(Type e) {
		return new HashSet
	}

	def static dispatch HashSet<PropertyCallExp> wd(IntegerLiteralExp e) {
		return new HashSet
	}

	def static dispatch HashSet<PropertyCallExp> wd(BooleanLiteralExp e) {
		return new HashSet
	}

	def static dispatch HashSet<PropertyCallExp> wd(EnumLiteralExp e) {
		return new HashSet
	}

	def static dispatch HashSet<PropertyCallExp> wd(NullLiteralExp e) {
		return new HashSet
	}

	def static dispatch HashSet<PropertyCallExp> wd(TypeExp e) {
		return new HashSet
	}

	def static dispatch HashSet<PropertyCallExp> wd(CollectionLiteralExp e) {
		return new HashSet
	}

	def static dispatch HashSet<PropertyCallExp> wd(UnlimitedNaturalLiteralExp e) {
		return new HashSet
	}

	def static dispatch HashSet<PropertyCallExp> wd(LetExp e) {
		return new HashSet
	}

	def static dispatch HashSet<PropertyCallExp> wd(IteratorExp e) {
		
		val src = wd(e.ownedSource)
		val body = wd(e.ownedBody)

		var r = src
		r.addAll(body)

		return r 
	}

	def static dispatch HashSet<PropertyCallExp> wd(IfExp e) {
		
		var r = wd(e.ownedCondition)
		r.addAll(wd(e.ownedThen))
		r.addAll(wd(e.ownedElse))
		
		return r
	}
	

	
	
}