package fr.emn.atlanmod.veriatl.experiment.mutation.ocl

import java.util.HashMap
import java.util.HashSet
import org.eclipse.emf.ecore.EObject
import org.eclipse.ocl.pivot.BooleanLiteralExp
import org.eclipse.ocl.pivot.CollectionLiteralExp
import org.eclipse.ocl.pivot.EnumLiteralExp
import org.eclipse.ocl.pivot.Enumeration
import org.eclipse.ocl.pivot.IfExp
import org.eclipse.ocl.pivot.IntegerLiteralExp
import org.eclipse.ocl.pivot.IteratorExp
import org.eclipse.ocl.pivot.IteratorVariable
import org.eclipse.ocl.pivot.LetExp
import org.eclipse.ocl.pivot.NullLiteralExp
import org.eclipse.ocl.pivot.OCLExpression
import org.eclipse.ocl.pivot.Operation
import org.eclipse.ocl.pivot.OperationCallExp
import org.eclipse.ocl.pivot.OppositePropertyCallExp
import org.eclipse.ocl.pivot.PropertyCallExp
import org.eclipse.ocl.pivot.Type
import org.eclipse.ocl.pivot.TypeExp
import org.eclipse.ocl.pivot.UnlimitedNaturalLiteralExp
import org.eclipse.ocl.pivot.VariableDeclaration
import org.eclipse.ocl.pivot.VariableExp

class OCL {
	static private HashSet<String> wdSetInner = new HashSet<String>
	static public HashMap<String, EObject> bvMap = new HashMap<String, EObject>
	static private String[] keywords = #['true', 'false',
	'Bag', 'Set', 'OrderedSet', 'Sequence', 'Tuple', 'Integer', 'Real', 'Boolean', 'String', 'TupleType', 'Map',
	'not', 'and', 'or', 'xor', 'implies', 'module', 'create', 'from', 'uses', 'helper', 'def', 'context', 
	'rule', 'using', 'derived', 'to', 'mapsTo', 'distinct', 'foreach', 'in', 'do', 'if', 'then', 'else', 
	'endif', 'let', 'library', 'query', 'for', 'div', 'refining', 'entrypoint']
	
	
	

	// dispatcher
	def static dispatch String gen(EObject e) '''
	// We dont understand «e.eClass.name»'''
	
	// dispatcher
	def static dispatch String gen(OCLExpression e) '''
	// We dont understand ocl expression «e.eClass.name»'''
	
	// TODO size, tostring, =(isocltype) some operation depends on type print differently
	// TODO some collection is not printing properly, e.g. union
	def static dispatch String gen(OperationCallExp e) '''
	«val op = if (e.referredOperation.name =="") e.name else e.referredOperation.name»
	«val src = gen(e.ownedSource)»
	«val args = if(e.ownedArguments.size!=0 && op!=null) e.ownedArguments.map(arg |  gen(arg) ).join(op) else ""»
	«val args_dot = if(e.ownedArguments.size!=0 && op!=null) e.ownedArguments.map(arg |  gen(arg) ).join(',') else ""»«
	IF op=="not" || op=="abs"
	»«op»(«gen(e.ownedSource)»)«
	ELSEIF op=="+" || op =="-"  || op =="*" || op =="/" 
	|| op =="=" || op =="<>" || op ==">" || op =="<" || op ==">=" || op =="<=" 
	|| op =="implies"  || op =="and"  || op =="or" || op =="div" || op =="mod" || op=="xor" 
	»«src» «op» «args»«
	ELSEIF op=="size" || op=="flatten"  || op=="allInstances"   || op=="asBag"  || op=="asOrderedSet"  
	|| op=="asSequence"  || op=="asSet"  || op=="isEmpty"  || op=="max" || op=="min"  || op=="notEmpty"  || op=="oclIsUndefined"  || op=="oclType" 
	|| op=="first"  || op=="last" 
	|| op=="oclAsSet" 
	»«src»->«op»()«
	ELSEIF op=="oclIsUndefined"  || op=="oclIsInvalid" 
	|| op=="toBoolean"  || op=="toInteger"  || op=="toLower"  || op=="toLowerCase" 
	|| op=="toString"  || op=="toUpper"  || op=="toUpperCase"  
	»«src».«op»()«
	ELSEIF op=="oclAsType" || op=="oclIsKindOf" || op=="oclIsTypeOf" 
	|| op=="concat" || op=="endsWith"  || op=="indexOf"  || op=="lastIndexOf"  || op=="startsWith" || op=="substring" 	
	|| op=="conformsTo"
	»«src».«op»(«args_dot»)«
	ELSEIF op=="excluding" || op=="excludingAll" || op=="including" || op=="includingAll"  || op=="selectByKind"  || op=="selectByKind"  || op=="selectByType"  
	|| op=="count"  || op=="excludes"  || op=="includes"  || op=="includesAll" || op=="intersection"  
	|| op=="at"    
	|| op=="append" || op=="appendAll"  || op=="prepend"  || op=="prependAll"  || op=="reverse" || op=="union" 
	|| op=="is" || op=="excludesAll" 
	»«src»->«op»(«args_dot»)«
	ELSE»«src».«op»(«args_dot»)«
	ENDIF»'''
	
	def static dispatch String gen(PropertyCallExp e) '''«gen(e.ownedSource)».«e.referredProperty.name»'''
	
	def static dispatch String gen(OppositePropertyCallExp e) '''«gen(e.ownedSource)».«e.referredProperty.name»'''
	
	

	
	def static dispatch String gen(VariableExp e) '''
	«val itName = genIteratorName(gen(e.type))»
	«val ref = e.referredVariable»«
	IF (bvMap.values.contains(ref))»
		«getKeyByValue(bvMap, ref)»«
	ELSE»«
		IF bvMap.keySet.contains(itName)
		»«val candidate = bvMap.get(itName)»«
			IF candidate == null»
					«itName»
			«{bvMap.put(itName, ref);null}»«
			ELSEIF candidate == ref»
			«itName»«
			ELSE»
			«ref.name»«
			ENDIF»«
		ELSE»
				«itName»
			«{bvMap.put(itName, e);null}»«
		ENDIF»«
	ENDIF»'''
	

	

	//TODO var name shadowing: Bug:  deployment_target, non_leaf_redefinition
	def static dispatch String gen(IteratorVariable e) '''
	«val clazz = genIteratorName(gen(e.type))»
	«val itName = clazz+e.name»
	«val hashName = clazz+itName+e.hashCode»«
	IF (bvMap.keySet.contains(itName) && bvMap.get(itName) == e)»«itName»«
	ELSEIF (bvMap.keySet.contains(itName) && bvMap.get(itName) != e)»«
		IF bvMap.keySet.contains(hashName)»
		«hashName»«
		ELSE»
		«hashName»«{bvMap.put(hashName, e);null}»«
		ENDIF»«
	ELSEIF !(bvMap.keySet.contains(itName))»«itName»«{bvMap.put(itName, e);null}»«
	ENDIF»'''
	
	def static dispatch String gen(Operation e) '''«e.name»'''
	
	def static dispatch String gen(Type e) '''«e.name»'''
	
	def static dispatch String gen(IntegerLiteralExp e) '''«e.integerSymbol»'''
	
	def static dispatch String gen(BooleanLiteralExp e) '''«e.booleanSymbol»'''
	
	//TODO confirm how to print keyword enumerate type
	def static dispatch String gen(EnumLiteralExp e) '''
	«val n = e.referredLiteral.name»
	«if (keywords.contains(n)) "#_"+n else "#"+n»'''
	
	def static dispatch String gen(NullLiteralExp e) '''OclUndefined'''
	
	

	
	
	// TODO ATL supported?
	def static dispatch String gen(CollectionLiteralExp e) '''Sequence{}'''
	
	// TODO dont know what is this means, put it to *. since sometimes is set to 1, see `multiplicity_of_output`
	def static dispatch String gen(UnlimitedNaturalLiteralExp e) '''*'''
	



  
    def static dispatch String gen(IfExp e) '''
if («gen(e.ownedCondition)») then 
  «gen(e.ownedThen)»
else 
  «gen(e.ownedElse)»
endif'''

	
	def static isConsistentVariable(HashMap<String, EObject> map, EObject exp) {
		if(exp instanceof VariableExp){
			val itName = genIteratorName(gen(exp.type))
			return  !map.containsKey(itName) || map.get(itName) == exp
		}else if ( exp instanceof IteratorVariable){
			val itName = genIteratorName(gen(exp.type))
			return  !map.containsKey(itName) || map.get(itName) == exp
		}else{
			return true;
		}
		
	}
	
	
	def static boolean isPrimtive(PropertyCallExp e) {
		val String s = OCL.gen(e.type)
		if(s == "String" || s == "Integer" 
			|| s == "Boolean" || s == "Real"
		){
			return true
		}else if(e.type instanceof Enumeration){
			return true
		}else{
			return false
		}
	}
	
	def static boolean isCollection(PropertyCallExp e) {
		val String s = OCL.gen(e.type)
		if(s == "Set" || s == "OrderedSet" || s == "Sequence" 
		){
			return true
		}else{
			return false
		}
	}
	
	def static getKeyByValue(HashMap<String, EObject> map, VariableDeclaration exp) {
		for(String key : map.keySet){
			if(map.get(key) == exp){
				return key
			}
		}
		
		return "no such key"
	}
	
	def static String genIteratorName(String clazz) {
		var String rtn="";
		
		for(var i = 0; i<clazz.length; i++){
			if(Character.isUpperCase(clazz.charAt(i))){
				rtn += Character.toLowerCase(clazz.charAt(i))
			}
		}
		
		if(keywords.contains(rtn)){
			rtn = "_"+rtn;
		}
		
		
		return rtn;
	}
	
	def static boolean printAtHere(PropertyCallExp e, String v) {
		var boolean r = false;
		
		if (e.ownedSource instanceof VariableExp ){
			if (OCL.gen(e.ownedSource).trim == v){
				r = true
			}
		}else if(e.ownedSource instanceof PropertyCallExp){
			r = printAtHere(e.ownedSource as PropertyCallExp, v)
		}
		
		return r;
	}
	
}
