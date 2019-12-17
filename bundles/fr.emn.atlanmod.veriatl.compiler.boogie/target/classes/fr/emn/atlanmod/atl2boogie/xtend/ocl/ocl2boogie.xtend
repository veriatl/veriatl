package fr.emn.atlanmod.atl2boogie.xtend.ocl

import fr.emn.atlanmod.atl2boogie.xtend.core.driver
import fr.emn.atlanmod.atl2boogie.xtend.lib.atl
import fr.emn.atlanmod.atl2boogie.xtend.lib.emf
import java.util.ArrayList
import java.util.HashMap
import java.util.Map
import org.eclipse.emf.ecore.EObject
import org.eclipse.m2m.atl.common.OCL.BooleanExp
import org.eclipse.m2m.atl.common.OCL.IntegerExp
import org.eclipse.m2m.atl.common.OCL.Iterator
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

class ocl2boogie {
	
	public static Map<String, String> iteratorTyping = new HashMap<String, String> 
	public static Map<String, String> replaceMap
	public static boolean isReplacing = false
	
	

	
	
	// dispatcher
	def static dispatch CharSequence genOclExpression(EObject e, CharSequence heap) '''We don't understand «e.eClass.name» '''
	
	
	def static dispatch CharSequence genOclExpression(OperationCallExp e, CharSequence heap) '''
	«val src = genOclExpression(e.source, heap)»
	«val op = e.operationName»
	«val args = e.arguments.map(arg|genOclExpression(arg, heap)).join(" ")»
	«if (op == "oclIsUndefined") String.format("(%s==null || !read(%s, %s, alloc))", src, heap, src)
	 else if (op=="allInstances") String.format("Fun#LIB#AllInstanceFrom(%s, %s)", heap, src)
	 else if (op=="oclIsTypeOf") String.format("dtype(%s) == %s", src, args)
	 else if (op=="oclIsKindOf") String.format("dtype(%s) <: %s", src, args)
	 else if (op=="resolveTemp") gen_resolveTemp(e, heap)
	 else if (op.startsWith("genBy")) gen_genByExpr(e, heap)
	 else genOclSequenceExpression(e, heap)»'''
	
	def static gen_genByExpr(OperationCallExp e, CharSequence heap) '''
	«val src = e.getSource»
	«val rl = e.getArguments.get(0)»
	«val op = e.getOperationName»
	«String.format("%s(%s, %s, %s, %s)", op, genOclExpression(src, heap), genOclExpression(rl, heap), atl.genSrcHeap, atl.genTrgHeap)»'''
	
	// Justification: resolveTemp must have at least two args, the first one is a src var in the current rule context, the second one to identify which tar to retrieve
	// as a technical requirement, if two rules has the same identifier, their declarations in the rules need to have the same order, e.g. all in position 1/2/3 etc.
	//TODO currently, we assume the first arg is a variable, it could be tuple, seq etc.
	def static gen_resolveTemp(OperationCallExp e, CharSequence heap) '''
	«var arg = e.arguments.get(0)»
	«var arg1 = e.arguments.get(1)»
	«if (!(arg1 instanceof StringExp)) "Error: the second arg of resolveTemp is not a string."
	 else String.format("%s(Seq#Singleton(%s))", atl.getLinkFunction(atl.findOutPos((arg1 as StringExp).stringSymbol)), genOclExpression(arg, heap))»
	'''
	
	def static getCollectionType(OclExpression e){
		if(e.eClass.name == "VariableExp"){
			return ((e as VariableExp).referredVariable.type as OclModelElement).name
		}else{
			return "NotCollection"
		}
	}

	def static genNaryExpression(OperatorCallExp e, CharSequence heap) '''
	«val lhs = genOclExpression(e.source, heap)»
	«val op = {if (e.operationName=="and")  " && " else if (e.operationName=="or") " || " else e.operationName}»
	«val rhss = e.arguments.map(arg|genOclExpression(arg, heap)).join(op)»
	«if (e.getArguments.size > 0) String.format("%s %s %s", lhs, op, rhss) else lhs»'''
	
	// print string/seq/set
	def static dispatch CharSequence genOclExpression(OperatorCallExp e, CharSequence heap) '''
	«val src = genOclExpression(e.source, heap)»
	«val op = e.operationName»
	«val args = e.arguments.map(arg|genOclExpression(arg, heap)).join(op)»
	«val srcTp = TypeInference.infer(e.source)»«val srcType = srcTp.type»«val srcKind = srcTp.kind»
	«if (srcKind == "primitive" && srcType == "string") genOclStringExpression(e, heap)
	 else if (op == "not") String.format("!(%s)", src)
	 else if (op=="abs") String.format("Math#Abs(%s)", src)
	 else if (op=="and") genNaryExpression(e, heap)
	 else if (op=="or") genNaryExpression(e, heap) 
	 else if (op=="implies") String.format("%s ==> %s", src, args)
	 else if (op=="<>") String.format("%s != %s", src, args)
	 else if (op=="=") String.format("%s == %s", src, args)
	 else if (op==">") String.format("%s > %s", src, args)
	 else if (op=="<") String.format("%s < %s", src, args)
	 else if (op==">=") String.format("%s >= %s", src, args)
	 else if (op=="<=") String.format("%s <= %s", src, args)
	 else if (op=="+") String.format("%s + %s", src, args)
	 else if (op=="-") String.format("%s - %s", src, args)
	 else if (op=="*") String.format("%s * %s", src, args)
	 else if (op=="div") String.format("%s div %s", src, args)
	 else if (op=="mod") String.format("%s mod %s", src, args)
	 else String.format("We don't understand operator: %s, %s", op, srcKind)»'''
	
	def static genOclStringExpression(OperatorCallExp expr, CharSequence heap) '''
	«val src = genOclExpression(expr.source, heap)»«val op = expr.operationName»«val args = expr.arguments.map(arg|genOclExpression(arg, heap)).join(",")»
	«IF op=='size'»Seq#Length(«src»)«
	ELSEIF op=='toUpper'»String#ToUpper(«src»)«
	ELSEIF op=='toLower'»String#ToLower(«src»)«
	ELSE»«
	    IF op == 'concat'»Seq#Append(«src», «args»)«
	    ELSEIF op == '+'»Seq#Append(«src», «args»)«
	    ELSEIF op == 'startsWith'»String#StartsWith(«src», «args»)«
		ELSEIF op == 'endsWith'»String#EndsWith(«src», «args»)«
		ELSEIF op == 'substring'»String#Substring(«src», «args»)«
		ELSEIF op == '<>'»«String.format("%s != %s", src, args)»«
		ELSEIF op == '='»«String.format("%s == %s", src, args)»«
		ELSE»We don't understand string operation: «op»«
		ENDIF»
	«ENDIF»
	'''
	
	//TODO print this way if src is nav, print other way if src is iterator
	def static genOclSequenceExpression(OperationCallExp expr, CharSequence heap) '''«val src = genOclExpression(expr.source, heap)»«val op = expr.operationName»«val args = expr.arguments.map(arg|genOclExpression(arg, heap)).join(",")»«
	IF expr.source instanceof NavigationOrAttributeCallExp»«
		IF op=='size'»Seq#Length(Seq#FromArray(«heap», «src»))«
		ELSEIF op=='isEmpty'»Seq#IsEmpty(Seq#FromArray(«heap», «src»))«
		ELSEIF op=='notEmpty'»Seq#NotEmpty(Seq#FromArray(«heap», «src»))«
		ELSEIF op=='flatten'»Iterator#Flatten(«src», «heap»)«
		ELSEIF op=='first'»Seq#First(Seq#FromArray(«heap», «src»))«
		ELSEIF op=='last'»Seq#Last(Seq#FromArray(«heap», «src»))«
		ELSE»«
		    IF op == 'append'»Seq#Build«
		    ELSEIF op == 'prepend'»Seq#Prepend«
			ELSEIF op == 'includes'»Seq#Contains«
			ELSEIF op == 'excludes'»!Seq#Contains«
			ELSEIF op == 'at'»Seq#Index«
			ELSEIF op == 'insertAt'»Seq#InsertAt«
			ELSEIF op == 'subSequence'»Seq#SubSequence«
			ELSEIF op == 'union'»Seq#Append«
			ELSE»«String.format("We don't understand operation: %s", expr.getOperationName)»«
			ENDIF»(Seq#FromArray(«heap», «src»), $Box(«args»))«
		ENDIF»«
	ELSE»«
		IF op=='size'»Seq#Length(«src»)«
		ELSEIF op=='isEmpty'»Seq#IsEmpty(«src»)«
		ELSEIF op=='notEmpty'»Seq#NotEmpty(«src»)«
		ELSEIF op=='flatten'»Iterator#Flatten(«src», «heap»)«	// special case where nav/iterator have the same behaviour
		ELSEIF op=='first'»Seq#First(«src»)«
		ELSEIF op=='last'»Seq#Last(«src»)«
		ELSE»«
		    IF op == 'append'»Seq#Build«
		    ELSEIF op == 'prepend'»Seq#Prepend«
			ELSEIF op == 'includes'»Seq#Contains«
			ELSEIF op == 'excludes'»!Seq#Contains«
			ELSEIF op == 'at'»Seq#Index«
			ELSEIF op == 'insertAt'»Seq#InsertAt«
			ELSEIF op == 'subSequence'»Seq#SubSequence«
			ELSEIF op == 'union'»Seq#Append«
			ELSE»«String.format("We don't understand operation: %s", expr.getOperationName)»«
			ENDIF»(«src», «args»)«
		ENDIF»«
	ENDIF»'''
	
	
	def static dispatch CharSequence genOclExpression(IteratorExp e, CharSequence heap) '''
	«val kind = e.name» 
	«if (kind == "forAll") genForallExpression(e, heap)
	 else if (kind=="exists") genExistsExpression(e, heap)
	 else if (kind=="collect") genCollectExpression(e, heap)
	 else if (kind=="select") genSelectExpression(e, heap)
	 else if (kind=="one") genOneExpression(e, heap)
	 else String.format("We don't understand iterator %s", kind)»'''
	
	def static genOneExpression(IteratorExp e, CharSequence heap) '''
	// «iteratorPreprocess(e, heap)»
	«val bid = e.body.location.replace(":","_").replace("-","_")»
	«val src = genOclExpression(e.source, heap)»
	«val srcNature = if (e.source instanceof NavigationOrAttributeCallExp) "nav" else "collector"»
	«val oType = TypeInference.infer(e.source).type.split("\\$")»
	«val mm = oType.get(0)» // «iteratorPreprocess(e, heap)»
	«{if (mm == driver.srcmm.name) atl.srcHeaps.add(atl.genHeapInLambda(bid).toString) else atl.trgHeaps.add(atl.genHeapInLambda(bid).toString) ;""}»	
	«IF srcNature == "nav"
	»(Iterator#One#Box(«String.format("Seq#FromArray(%s, %s)", heap, src)», «heap», 
	  (lambda «e.iterators.map(it| String.format("%s:ref", (it as Iterator).varName) ).join(",")», «atl.genHeapInLambda(bid)»: HeapType :: «genOclExpression(e.body, atl.genHeapInLambda(bid))»)))
	«ELSE
	»(Iterator#One(«src», «heap», 
	  (lambda «e.iterators.map(it| String.format("%s:ref", (it as Iterator).varName) ).join(",")», «atl.genHeapInLambda(bid)»: HeapType :: «genOclExpression(e.body, atl.genHeapInLambda(bid))»)))
	«ENDIF»
	'''
	

	
	def static iteratorPreprocess(IteratorExp e, CharSequence heap) {
		e.iterators.map(it | iteratorTyping.put(it.varName,TypeInference.infer(e.source).type))
	}
	
	//TODO how to store iteratorPreprocess without side effects in Xtend?
	//TODO use printedSrc
	def static genForallExpression(IteratorExp e, CharSequence heap) '''
	«val src = genOclExpression(e.source, heap)»
	«val srcNature = if (e.source instanceof NavigationOrAttributeCallExp) "nav" else "collector"»
	«IF srcNature == "nav"
	»(forall «e.iterators.map(it| String.format("%s:ref", (it as Iterator).varName) ).join(",")» :: // «iteratorPreprocess(e, heap)»
		   «e.iterators.map(it| String.format("Seq#Contains(%s, %s)", String.format("Seq#FromArray(%s, %s)", heap, src),  String.format("$Box(%s)", (it as Iterator).varName))).join("&&")» ==>
		     «genOclExpression(e.body, heap)»)
	«ELSE
	»(forall «e.iterators.map(it| String.format("%s:ref", (it as Iterator).varName) ).join(",")» :: // «iteratorPreprocess(e, heap)»
		   «e.iterators.map(it| String.format("Seq#Contains(%s, %s)", genOclExpression(e.source, heap), (it as Iterator).varName) ).join("&&")» ==>
		     «genOclExpression(e.body, heap)»)
	«ENDIF»'''
	
	//TODO use printedSrc
	def static genExistsExpression(IteratorExp e, CharSequence heap) '''
	«val src = genOclExpression(e.source, heap)»
	«val srcNature = if (e.source instanceof NavigationOrAttributeCallExp) "nav" else "collector"»
	«IF srcNature == "nav"
	»(exists «e.iterators.map(it| String.format("%s:ref", (it as Iterator).varName) ).join(",")» :: // «iteratorPreprocess(e, heap)»
		   «e.iterators.map(it| String.format("Seq#Contains(%s, %s)", String.format("Seq#FromArray(%s, %s)", heap, src),  String.format("$Box(%s)", (it as Iterator).varName))).join("&&")» &&
		     «genOclExpression(e.body, heap)»)
	«ELSE
	»(exists «e.iterators.map(it| String.format("%s:ref", (it as Iterator).varName) ).join(",")» :: // «iteratorPreprocess(e, heap)»
		   «e.iterators.map(it| String.format("Seq#Contains(%s, %s)", genOclExpression(e.source, heap), (it as Iterator).varName) ).join("&&")» &&
		     «genOclExpression(e.body, heap)»)
	«ENDIF»'''
	
	
	def static genCollectExpression(IteratorExp e, CharSequence heap) '''
	// «iteratorPreprocess(e, heap)»
	«val bid = e.body.location.replace(":","_").replace("-","_")»
	«val src = genOclExpression(e.source, heap)»
	«val srcNature = if (e.source instanceof NavigationOrAttributeCallExp) "nav" else "collector"»
	«val oType = TypeInference.infer(e.source).type.split("\\$")»
	«val mm = oType.get(0)» // «iteratorPreprocess(e, heap)»
	«{if (mm == driver.srcmm.name) atl.srcHeaps.add(atl.genHeapInLambda(bid).toString) else atl.trgHeaps.add(atl.genHeapInLambda(bid).toString) ;""}»	
	«IF srcNature == "nav"
	»(Iterator#Collect#Box(«String.format("Seq#FromArray(%s, %s)", heap, src)», «heap», 
	  (lambda «e.iterators.map(it| String.format("%s:ref", (it as Iterator).varName) ).join(",")», «atl.genHeapInLambda(bid)»: HeapType :: «genOclExpression(e.body, atl.genHeapInLambda(bid))»)))
	«ELSE
	»(Iterator#Collect(«src», «heap», 
	  (lambda «e.iterators.map(it| String.format("%s:ref", (it as Iterator).varName) ).join(",")», «atl.genHeapInLambda(bid)»: HeapType :: «genOclExpression(e.body, atl.genHeapInLambda(bid))»)))
	«ENDIF»
	'''
	

	def static genSelectExpression(IteratorExp e, CharSequence heap) '''
	// «iteratorPreprocess(e, heap)»
	«val bid = e.body.location.replace(":","_").replace("-","_")»
	«val src = genOclExpression(e.source, heap)»
	«val srcNature = if (src instanceof NavigationOrAttributeCallExp) "nav" else "collector"»
	«val oType = TypeInference.infer(e.source).type.split("\\$")»
	«val mm = oType.get(0)» // «iteratorPreprocess(e, heap)»
	«{if (mm == driver.srcmm.name) atl.srcHeaps.add(atl.genHeapInLambda(bid).toString) else atl.trgHeaps.add(atl.genHeapInLambda(bid).toString) ;""}»	
	«IF srcNature == "nav"
	»(Iterator#Select#Box(0, Seq#Length(«String.format("Seq#FromArray(%s, %s)", heap, src)»)-1, «String.format("Seq#FromArray(%s, %s)", heap, src)», «heap»,
		  (lambda «e.iterators.map(it| String.format("%s:ref", (it as Iterator).varName) ).join(",")», «atl.genHeapInLambda(bid)»: HeapType :: «genOclExpression(e.body, atl.genHeapInLambda(bid))»)))
	«ELSE
	»(Iterator#Select(0, Seq#Length(«src»)-1, «src», «heap»,
		  (lambda «e.iterators.map(it| String.format("%s:ref", (it as Iterator).varName) ).join(",")», «atl.genHeapInLambda(bid)»: HeapType :: «genOclExpression(e.body, atl.genHeapInLambda(bid))»)))
	«ENDIF»
	
	
	
	
	'''
	     
	def static dispatch CharSequence genOclExpression(VariableExp e, CharSequence heap) '''
	«if (isReplacing) replaceMap.get(e.referredVariable.varName) else e.referredVariable.varName»'''
	
	def static dispatch CharSequence genOclExpression(BooleanExp e, CharSequence heap) '''«e.booleanSymbol.toString»'''
	
	def static dispatch CharSequence genOclExpression(OclModelElement e, CharSequence heap) '''«e.model.name»$«e.name»'''
		
	def static dispatch CharSequence genOclExpression(NavigationOrAttributeCallExp e, CharSequence heap) '''
	«var o = genOclExpression(e.source, heap)»
	«var oType = TypeInference.infer(e.source).type.split("\\$")»
	«val mm = oType.get(0)»
	«val cl = oType.get(1)»
	«var f = if(heap.toString==atl.genSrcHeap.toString || heap.toString==atl.genHeapInGuardFun.toString || atl.srcHeaps.contains(heap.toString)) emf.getFeatureNameInMetamodel(driver.fMapSrc, driver.srcmm, mm, cl, e.name)
	         else if(heap.toString==atl.genTrgHeap.toString || atl.trgHeaps.contains(heap.toString)) emf.getFeatureNameInMetamodel(driver.fMapTrg, driver.trgmm, mm, cl, e.name)
	         else "we don't know the kind of heap: "+ heap»
	read(«heap», «o», «f»)'''
	
	
	def static dispatch CharSequence genOclExpression(StringExp e, CharSequence heap) '''
	«val s = e.stringSymbol.replace(" ", "_")»
	«{driver.constants.add(s);""}»
	_«s»'''
	
	def static dispatch CharSequence genOclExpression(IntegerExp e, CharSequence heap) '''«e.integerSymbol»'''
	
	def static dispatch CharSequence genOclExpression(Iterator e, CharSequence heap) '''«e.getVarName»'''
	
	def static dispatch CharSequence genOclExpression(TupleExp e, CharSequence heap) '''
	«val col = getInitExprs(e)»
	«atl.getLinkFunction(0)»(«(0..col.size-1).map[i | if (i==col.size-1) "Seq#Singleton(" else "Seq#Build("].reduce[res, s | res+s]»«col.join('),')» ))
	'''
	
	def static getInitExprs(TupleExp e) {
		var r = new ArrayList<String>
		for(TuplePart p : e.tuplePart){
			if(p.initExpression instanceof VariableExp){
				val v = (p.initExpression as VariableExp)
				r.add(v.referredVariable.varName)
			}
		}
		return r
	}
	
	
	def static onReplacing(Map<String, String> m){
		isReplacing = true
		replaceMap = m
	}
	
	def static offReplacing(){
		isReplacing = false
		replaceMap = new HashMap<String, String> 
	}
	
	def static clean(){
		iteratorTyping.clear()
	}
	
	
}