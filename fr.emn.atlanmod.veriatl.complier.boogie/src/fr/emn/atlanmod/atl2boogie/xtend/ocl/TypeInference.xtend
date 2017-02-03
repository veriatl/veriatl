package fr.emn.atlanmod.atl2boogie.xtend.ocl

import fr.emn.atlanmod.atl2boogie.xtend.core.driver
import fr.emn.atlanmod.atl2boogie.xtend.lib.atl
import fr.emn.atlanmod.atl2boogie.xtend.lib.emf
import fr.emn.atlanmod.atl2boogie.xtend.lib.myOclType
import java.util.ArrayList
import java.util.HashMap
import java.util.Map
import org.eclipse.m2m.atl.common.OCL.IteratorExp
import org.eclipse.m2m.atl.common.OCL.NavigationOrAttributeCallExp
import org.eclipse.m2m.atl.common.OCL.OclExpression
import org.eclipse.m2m.atl.common.OCL.OclModelElement
import org.eclipse.m2m.atl.common.OCL.OperationCallExp
import org.eclipse.m2m.atl.common.OCL.OperatorCallExp
import org.eclipse.m2m.atl.common.OCL.StringExp
import org.eclipse.m2m.atl.common.OCL.TupleExp
import org.eclipse.m2m.atl.common.OCL.TuplePart
import org.eclipse.m2m.atl.common.OCL.VariableExp
import org.eclipse.emf.ecore.EObject

class TypeInference {

	public static Map<String, myOclType> lookup = new HashMap<String, myOclType>();


	def static init(Map<String, myOclType> map) {
		lookup.clear();
		lookup.putAll(map);
	}

	def static dispatch myOclType infer(EObject expr) {
		return new myOclType
	}
	

	def static dispatch myOclType infer(VariableExp expr) {
		val v = expr.referredVariable.type
		val mm = v as OclModelElement
		var tp = ""
		var mmName = ""
		if(lookup.containsKey(expr.referredVariable.varName)){
			return lookup.get(expr.referredVariable.varName)
		}
		else if (expr.referredVariable == null) {
			return new myOclType
		} else {
			if (v == null) {
				if (ocl2boogie.iteratorTyping.keySet.contains(expr.referredVariable.varName)) {
					val tempTp = ocl2boogie.iteratorTyping.get(expr.referredVariable.varName).split("\\$")
					mmName = tempTp.get(0)
					val clName = tempTp.get(1)
					tp = String.format("%s$%s", mmName, clName);
				} else {
					return new myOclType
				}

			} else {
				mmName = mm.model.name
				val clName = mm.name
				tp = String.format("%s$%s", mmName, clName);
			}
		}

		if (mmName.equals(driver.srcmm.name)) {
			return new myOclType("srcRef", tp)
		} else if (mmName.equals(driver.trgmm.name)) {
			return new myOclType("trgRef", tp)
		} else {
			return new myOclType
		}
	}

	def static dispatch myOclType infer(NavigationOrAttributeCallExp expr) {
		val o = expr.source
		val f = expr.name

		val oType = infer(o)

		if (oType.kind == "srcRef") {
			val tp = oType.getType.split("\\$")
			val mm = tp.get(0)
			val cl = tp.get(1)
			val sf = emf.getFeatureNameInMetamodel(driver.fMapSrc, driver.srcmm, mm, cl, f)
			val sfType = driver.fMapSrc.get(sf)

			if (emf.isPrimitive(sfType)) {
				return new myOclType("primitive", sfType)
			} else if (sfType.startsWith("ref:")) {
				val ftp = sfType.substring("ref:".length, sfType.length)
				return new myOclType("srcRef", ftp)
			} else if (sfType.startsWith("refs:")) {
				val ftp = sfType.substring("refs:".length, sfType.length)
				return new myOclType("srcRefs", ftp)
			} else {
				return new myOclType
			}
		//} else if (oType.kind == "trgRef" || oType.kind == "temp") {
		  } else if (oType.kind == "trgRef") {
			val tp = oType.getType.split("\\$")
			val mm = tp.get(0)
			val cl = tp.get(1)
			val sf = emf.getFeatureNameInMetamodel(driver.fMapTrg, driver.trgmm, mm, cl, f)
			val sfType = driver.fMapTrg.get(sf)

			if (emf.isPrimitive(sfType)) {
				return new myOclType("primitive", sfType)
			} else if (sfType.startsWith("ref:")) {
				val ftp = sfType.substring("ref:".length, sfType.length)
				return new myOclType("trgRef", ftp)
			} else if (sfType.startsWith("refs:")) {
				val ftp = sfType.substring("refs:".length, sfType.length)
				return new myOclType("trgRefs", ftp)
			} else {
				return new myOclType
			}

		} else {
			// Justification: if oType is srcRefs/trgRefs, then any operation on it would be OperationCallExpr
			// So, we should never end up here
			return new myOclType
		}

	}

	def static dispatch myOclType infer(OperatorCallExp expr) {
		val op = expr.operationName
		if (op == "+") {
			val tp = infer(expr.source).type
			val k = infer(expr.source).kind

			if (k == "srcRef") {
				return new myOclType("srcRef", tp)
			} else if (k == "trgRef") {
				return new myOclType("trgRef", tp)
			} else if (k == "primitive") { // most likely goes in here
				return new myOclType("primitive", tp)
			} else {
				return new myOclType
			}

		} else {
			return new myOclType
		}
	}

	def static dispatch myOclType infer(OperationCallExp expr) {
		val op = expr.operationName
		val args = expr.arguments
		if (op == "allInstances") {
			val tp = infer(expr.source).type
			val k = infer(expr.source).kind
			if (k == "srcRef") {
				return new myOclType("srcRefs", tp)
			} else if (k == "trgRef") {
				return new myOclType("trgRefs", tp)
			} else {
				return new myOclType("srcRefs", tp) 
			}
		} else if (op == "resolveTemp") {
			val arg = args.get(0)
			val arg1 = args.get(1)

			if (arg1 instanceof StringExp) {
				val s = (arg1 as StringExp).stringSymbol
				val t = atl.findOutType(s)

				if (t != null && t instanceof OclModelElement) {
					val mm = (t as OclModelElement).model.name
					val tp = String.format("%s$%s", mm, t.name)
					return new myOclType("trgRef", tp) 
					//return new myOclType("temp", tp) 
				} else {
					return new myOclType
				}

			} else {
				return new myOclType
			}

		} else if (op == "flatten") {
			val src = infer(expr.source)
			val srcType = src.type
			val srcKind = src.kind
			if (srcKind == "srcRefs") {
				return new myOclType("srcRefs", srcType)
			} else if (srcKind == "trgRefs") {
				return new myOclType("trgRefs", srcType)
			} else {
				return new myOclType // should not go in here
			}
		} else {
			return new myOclType
		}

	}

	def static dispatch myOclType infer(OclModelElement expr) {
		val mm = expr.model.name
		val cl = expr.name
		val tp = String.format("%s$%s", mm, cl)

		if (mm.equals(driver.srcmm.name)) {
			return new myOclType("srcRef", tp)
		} else if (mm.equals(driver.trgmm.name)) {
			return new myOclType("trgRef", tp)
		} else {
			return new myOclType
		}

	}

	def static dispatch myOclType infer(IteratorExp expr) {
		val src = infer(expr.source)
		val srcType = src.type
		val srcKind = src.kind
		val op = expr.name
		
		expr.iterators.map(it | ocl2boogie.iteratorTyping.put(it.varName,TypeInference.infer(expr.source).type))	// require unique iterator identifiers within each quantifiers
		
		if(op == "forAll" || op == "exists" || op == "one"){
			return new myOclType("primitive", "bool")
		}else if(op == "select" || op=="reject"){
			if (srcKind == "srcRefs") {
				return new myOclType("srcRefs", srcType)
			} else if (srcKind == "trgRefs") {
				return new myOclType("trgRefs", srcType)
			} else {
				return new myOclType 
			}
		}else if(op == "collect"){
			val body = infer(expr.body)
			val tp = body.type
			val kd = body.kind
			if (kd == "srcRefs" || kd == "srcRef") {	// collect refs of refs might yield undesire result, solve by constraint the user always follow collect with flatten.
				return new myOclType("srcRefs", tp)
			} else if (kd == "trgRefs" || kd == "trgRef") {
				return new myOclType("trgRefs", tp)
			} else {
				return new myOclType(kd, tp) 
			}
		}else{
			return new myOclType
		}

		

	}

	
	def static dispatch myOclType infer(TupleExp e){
		// get src type tuples expr.
		var r = new ArrayList<String>
		for(TuplePart p : e.tuplePart){
			if(p.initExpression instanceof VariableExp){
				val v = (p.initExpression as VariableExp)
				val t = v.referredVariable.type
				if(t == null){
					if (ocl2boogie.iteratorTyping.keySet.contains(v.referredVariable.varName)) {
						val tempTp = ocl2boogie.iteratorTyping.get(v.referredVariable.varName).split("\\$")
						val mmName = tempTp.get(0)
						val clName = tempTp.get(1)
						val tp = String.format("%s$%s", mmName, clName)
						r.add(tp)
					}else{
						return new myOclType("trgRef", "unkown123")
					}
				}else{
					val mm = t as OclModelElement
					val mmName = mm.model.name
					val clName = mm.name
					val tp = String.format("%s$%s", mmName, clName);
					r.add(tp)
				}
			}
		}
		
		// get trg according to src
		val trgs = atl.findRuleBySrcsTypes(r)
		
		// unify trg
		val fType = emf.unifyTypes(driver.trgmm, trgs)
		return new myOclType("trgRef", fType)
	}

	def static dispatch myOclType infer(StringExp expr) {
		return new myOclType("primitive", "string")
	}

	def static dispatch myOclType infer(Integer expr) {
		return new myOclType("primitive", "int")
	}

	def static dispatch myOclType infer(Boolean expr) {
		return new myOclType("primitive", "bool")
	}
}
