package fr.emn.atlanmod.veriatl.debug.contract;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.m2m.atl.common.OCL.BooleanExp;
import org.eclipse.m2m.atl.common.OCL.Iterator;
import org.eclipse.m2m.atl.common.OCL.IteratorExp;
import org.eclipse.m2m.atl.common.OCL.NavigationOrAttributeCallExp;
import org.eclipse.m2m.atl.common.OCL.OCLFactory;
import org.eclipse.m2m.atl.common.OCL.OclExpression;
import org.eclipse.m2m.atl.common.OCL.OclModel;
import org.eclipse.m2m.atl.common.OCL.OclModelElement;
import org.eclipse.m2m.atl.common.OCL.OperationCallExp;
import org.eclipse.m2m.atl.common.OCL.OperatorCallExp;
import org.eclipse.m2m.atl.common.OCL.VariableExp;
import org.eclipse.m2m.atl.emftvm.ExecEnv;

import fr.emn.atlanmod.atl2boogie.xtend.lib.myOclType;
import fr.emn.atlanmod.atl2boogie.xtend.ocl.TypeInference;
import fr.emn.atlanmod.veriatl.debug.decomposer.datastructure.ContextEntry;
import fr.emn.atlanmod.veriatl.debug.decomposer.datastructure.ContextHelper;
import fr.emn.atlanmod.veriatl.debug.decomposer.datastructure.ContextNature;
import fr.emn.atlanmod.veriatl.debug.decomposer.datastructure.Node;
import fr.emn.atlanmod.veriatl.debug.decomposer.datastructure.ProveOption;
import fr.emn.atlanmod.veriatl.debug.decomposer.datastructure.Tactic;
import fr.emn.atlanmod.veriatl.debug.decomposer.metamodel.EMFCopier;
import fr.emn.atlanmod.veriatl.debug.decomposer.metamodel.EMFLoader;
import fr.emn.atlanmod.veriatl.debug.decomposer.ocl.OclHelper;


//TODO
// Control bv, forall a2 implies exists a2




public class Introduction  {

	static ExecEnv env;
	static Map<String, ArrayList<String>> trace;
	static ArrayList<Node> tree = new ArrayList<Node>();
	static EPackage tarmm;
	static private OCLFactory make = OCLFactory.init();
	

	public static void init(ExecEnv e, Map<String, ArrayList<String>> t, ArrayList<Node> tr, EPackage mm){
		env = e;
		trace = t;
		tree =tr;
		tarmm = mm;
		//TypeInference.clean();
		//ocl2boogie.clean();
	}


	public static void introduction(Node n, OclExpression expr, LinkedHashMap<EObject, ContextEntry> Inferred, int depth, ProveOption op) {
		
		if (expr instanceof IteratorExp) {
			IteratorExp todo = (IteratorExp) expr;
			_introduction(n, todo, Inferred, depth, op);
		}else if(expr instanceof OperatorCallExp){
			OperatorCallExp todo = (OperatorCallExp) expr;
			_introduction(n, todo, Inferred, depth, op);
		}else if(expr instanceof OperationCallExp){
			OperationCallExp todo = (OperationCallExp) expr;
			_introduction(n, todo, Inferred, depth, op);
		}
		
		
	}

	static void _introduction(Node curr, IteratorExp expr, LinkedHashMap<EObject, ContextEntry> Inferred, int depth, ProveOption op) {

		Iterator bv = expr.getIterators().get(0);
		OclExpression loopBody = expr.getBody();
		OclExpression loopSrc = expr.getSource();
		


		
		if (expr.getName().toLowerCase().equals("forall")) {		
			LinkedHashMap<EObject, ContextEntry> inferNextLv = ContextHelper.cloneContext(Inferred);
			inferNextLv.put(bv, new ContextEntry(ContextNature.BV));

			myOclType bvType = new myOclType("trgRef", TypeInference.infer(loopSrc).getType());
			TypeInference.lookup.put(bv.getVarName(), bvType);

			// bv in src
			OperationCallExp inclusion = make.createOperationCallExp();
			inclusion.setOperationName("includes");
			
			inclusion.setSource(EMFCopier.deepCopy(loopSrc));
			
			VariableExp var = make.createVariableExp();
			var.setReferredVariable(EMFCopier.deepCopy(bv));
			inclusion.getArguments().add(var);
			inferNextLv.put(inclusion, new ContextEntry(ContextNature.ASSUME));
			
			Node n = new Node(depth + 1, loopBody, curr, inferNextLv, ProveOption.EACH, Tactic.FORALL_INTRO);
			tree.add(n);
			

		}else if (expr.getName().toLowerCase().equals("exists")) {	

		}	

		
		
	}
	
	static void _introduction(Node n, OperationCallExp expr, LinkedHashMap<EObject, ContextEntry> Inferred, int depth, ProveOption op){	
		
		OclExpression src = expr.getSource();
		
		if(src instanceof NavigationOrAttributeCallExp){
			// identify single valued navigation
			myOclType tp = TypeInference.infer(src);

			
			if(!tp.getKind().equals("trgRefs") && !tp.getKind().equals("primitive")){
				
				OperationCallExp col = make.createCollectionOperationCallExp();
				col.setOperationName("allInstances");
				OclModelElement m = make.createOclModelElement();
				
				String mmName = EMFLoader.getModel(tp.getType());
				String clName = EMFLoader.getClassifier(tp.getType());
				
				m.setName(clName);
				OclModel model = make.createOclModel();
				model.setName(mmName);
				m.setModel(model);
				col.setSource(m);
				
				OperationCallExp includes = make.createOperationCallExp();
				includes.setOperationName("includes");
				includes.setSource(EMFCopier.deepCopy(col));
				includes.getArguments().add(EMFCopier.deepCopy(src));
				
				OperationCallExp excludes = make.createOperationCallExp();
				excludes.setOperationName("excludes");
				excludes.setSource(EMFCopier.deepCopy(col));
				excludes.getArguments().add(EMFCopier.deepCopy(src));
				
				
				if(!OclHelper.isMember(Inferred.keySet(), includes) && !OclHelper.isMember(Inferred.keySet(), excludes)){
					LinkedHashMap<EObject, ContextEntry> inferNextLv =  ContextHelper.cloneContext(Inferred);
					inferNextLv.put(includes, new ContextEntry(ContextNature.ASSUME));
					Node n1 = new Node(depth + 1, expr, n, inferNextLv, ProveOption.EACH, Tactic.NAV_SINGLE_INTRO);
					tree.add(n1);
					
					LinkedHashMap<EObject, ContextEntry> inferNextLv2 =  ContextHelper.cloneContext(Inferred);
					inferNextLv2.put(excludes, new ContextEntry(ContextNature.ASSUME));
					Node n2 = new Node(depth + 1, expr, n, inferNextLv2, ProveOption.EACH, Tactic.NAV_SINGLE_INTRO);
					tree.add(n2);	
				}
					
					

			}
		}
		
	}
	
	static void _introduction(Node curr, OperatorCallExp expr, LinkedHashMap<EObject, ContextEntry> Inferred, int depth, ProveOption op){
		
		if(expr.getOperationName().equals("implies")){
			
			OclExpression rhs = expr.getArguments().get(0);
			
			LinkedHashMap<EObject, ContextEntry> inferNextLv =  ContextHelper.cloneContext(Inferred);
			inferNextLv.put(expr.getSource(), new ContextEntry(ContextNature.ASSUME));
			
			Node n = new Node(depth + 1, rhs, curr, inferNextLv, op, Tactic.IMPLY_INTRO);
			tree.add(n);
			
			
		}else if(expr.getOperationName().equals("and")){
			OclExpression lhs = expr.getSource();
			OclExpression rhs = expr.getArguments().get(0);
			
			LinkedHashMap<EObject, ContextEntry> inferNextLvLhs =  ContextHelper.cloneContext(Inferred);
			LinkedHashMap<EObject, ContextEntry> inferNextLvRhs =  ContextHelper.cloneContext(Inferred);
			
			Node n1 = new Node(depth + 1, lhs, curr, inferNextLvLhs, ProveOption.EACH, Tactic.SPLIT);
			tree.add(n1);
			
			
			Node n2 = new Node(depth + 1, rhs, curr, inferNextLvRhs, ProveOption.EACH, Tactic.SPLIT);
			tree.add(n2);
			
				
		}else if(expr.getOperationName().equals("or")){
			OclExpression lhs = expr.getSource();
			//OclExpression rhs = expr.getArguments().get(0);
			
			//TODO, Currently we do not branching, and always generate the left most expr into the proof tree.
			Node n1 = new Node(depth + 1, lhs, curr, Inferred, ProveOption.EACH, Tactic.OR_LEFT);
			tree.add(n1);
			
//			Node n1 = new Node(depth + 1, lhs, curr, Inferred, ProveOption.ANY, Tactic.OR_LEFT);
//			tree.add(n1);
//			
//			// this should be branching to all operands of or expr
//			Node n2 = new Node(depth + 1, rhs, curr, Inferred, ProveOption.ANY, Tactic.OR_RIGHT);
//			tree.add(n2);
			
			
		}else if(expr.getOperationName().equals("not")){
			OclExpression src = expr.getSource();
			BooleanExp bFalse = make.createBooleanExp();
			bFalse.setBooleanSymbol(false);
			
			LinkedHashMap<EObject, ContextEntry> inferNextLv =  ContextHelper.cloneContext(Inferred);
			inferNextLv.put(src, new ContextEntry(ContextNature.ASSUME));
			
			Node n1 = new Node(depth + 1, bFalse, curr, inferNextLv, op, Tactic.NEG_INTRO);
			tree.add(n1);
			
			
			
		}
		
		
		
		
	}
	
	

	
}
