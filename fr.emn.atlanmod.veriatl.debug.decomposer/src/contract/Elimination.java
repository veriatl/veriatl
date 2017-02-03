package contract;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.m2m.atl.common.OCL.*;
import org.eclipse.m2m.atl.emftvm.ExecEnv;

import datastructure.ContextEntry;
import datastructure.ContextHelper;
import datastructure.ContextNature;
import datastructure.Node;
import datastructure.ProveOption;
import datastructure.Tactic;
import fr.emn.atlanmod.atl2boogie.xtend.lib.myOclType;
import fr.emn.atlanmod.atl2boogie.xtend.ocl.TypeInference;
import keywords.Keyword;
import metamodel.EMFCopier;
import metamodel.EMFHelper;
import ocl.OclHelper;


public class Elimination {
	
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
	}
	
	public static boolean terminated(ArrayList<Node> leafs){
		
		boolean rst = true;
		
		for(Node leaf : leafs){
			for(ContextEntry entry : leaf.getContext().values()){
				if(!entry.isEliminated()){
					return false;
				}
			}
		}
		
		return rst;
	}
	
	public static void elimin(Node n, EObject expr) {
		if (expr instanceof IteratorExp) {
			IteratorExp todo = (IteratorExp) expr;
			_elimin(n, todo);
		}else if(expr instanceof OperatorCallExp){
			OperatorCallExp todo = (OperatorCallExp) expr;
			_elimin(n, todo);
		}else if(expr instanceof OperationCallExp){
			OperationCallExp todo = (OperationCallExp) expr;
			_elimin(n, todo);
		}
	}
	
	static void _elimin(Node n, IteratorExp expr) {
		
	}
	
	static void _elimin(Node n, OperatorCallExp expr) {
		if(expr.getOperationName().equals("and")){
			OclExpression src = expr.getSource();
			EList<OclExpression> args = expr.getArguments();
			
			HashMap<EObject, ContextEntry> inferNextLv =  ContextHelper.cloneContext(n.getContext());
			inferNextLv.put(src, new ContextEntry(ContextNature.INFER));		
			for(OclExpression arg : args){
				inferNextLv.put(arg, new ContextEntry(ContextNature.INFER));
			}
			
			Node n1 = new Node(n.getLevel()+1, n.getContent(), n, inferNextLv, n.getRel2Parent(), Tactic.AND_ELIM);
			tree.add(n1);
			
		}else if(expr.getOperationName().equals("or")){	
			OclExpression src = expr.getSource();
			EList<OclExpression> args = expr.getArguments();
			
			HashMap<EObject, ContextEntry> inferNextLv =ContextHelper.cloneContext(n.getContext());
			inferNextLv.put(src, new ContextEntry(ContextNature.ASSUME));
			
			Node n1 = new Node(n.getLevel()+1, n.getContent(), n, inferNextLv, ProveOption.EACH, Tactic.OR_ELIM);
			tree.add(n1);
			
			for(OclExpression arg : args){
				HashMap<EObject, ContextEntry> inferNextLv2 = ContextHelper.cloneContext(n.getContext());
				inferNextLv2.put(arg, new ContextEntry(ContextNature.ASSUME));
				
				Node nn = new Node(n.getLevel()+1, n.getContent(), n, inferNextLv2, ProveOption.EACH, Tactic.OR_ELIM);
				tree.add(nn);
			}
			
			
		}else if(expr.getOperationName().equals("implies")){
			OclExpression lhs = expr.getSource();
			OclExpression rhs = expr.getArguments().get(0);
			
			for(EObject entry : n.getContext().keySet()){
				if(OclHelper.Equal(lhs, entry)){
					HashMap<EObject, ContextEntry> inferNextLv2 =  ContextHelper.cloneContext(n.getContext());
					inferNextLv2.put(rhs, new ContextEntry(ContextNature.INFER));
					
					Node nn = new Node(n.getLevel()+1, n.getContent(), n, inferNextLv2, n.getRel2Parent(), Tactic.IMPLY_ELIM);
					tree.add(nn);
				}
			}
			
		}else if(expr.getOperationName().equals("not")){
			OclExpression src = expr.getSource();
			
			for(EObject entry : n.getContext().keySet()){
				if(OclHelper.Equal(src, entry)){
					HashMap<EObject, ContextEntry> inferNextLv2 =  ContextHelper.cloneContext(n.getContext());
					BooleanExp falseExpr = make.createBooleanExp();
					falseExpr.setBooleanSymbol(false);
					inferNextLv2.put(falseExpr, new ContextEntry(ContextNature.INFER));
					
					Node nn = new Node(n.getLevel()+1, n.getContent(), n, inferNextLv2, n.getRel2Parent(), Tactic.NEG_ELIM);
					tree.add(nn);
				}
			}
		}
		
	}
	
	static void _elimin(Node n, OperationCallExp expr) {
		if(expr.getOperationName().equals("includes")){
			OclExpression col = expr.getSource();
			OclExpression src = expr.getArguments().get(0);
			
			myOclType tp = TypeInference.infer(col);
			String elemType = tp.getType();
			
			
			
			if(trace.get(elemType)!=null && trace.get(elemType).size()>0){
				
				String first = trace.get(elemType).get(0);
				
				int pos = first.lastIndexOf("#");
				String genBy = "";
				
				
				String fstRName = first.substring(0, pos);
				String outid = first.substring(pos+1);
				if(outid.equals("0")){
					genBy = "genBy";
				}else{
					genBy = String.format("genBy%s", outid);
				}
				
				OperationCallExp c1 = make.createOperationCallExp();
				c1.setOperationName(genBy);
				StringExp s = make.createStringExp();
				s.setStringSymbol(fstRName);
				c1.setSource(EMFCopier.deepCopy(src));
				c1.getArguments().add(s);
				
				OperatorCallExp or = make.createOperatorCallExp();
				or.setOperationName("or");
				or.setSource(c1);
				
				List<String> subTrace  = trace.get(elemType).subList(1, trace.get(elemType).size());
				
				for(String rule : subTrace ){
					int pos2 = first.lastIndexOf("#");
					String genBy2 = "";
					
					
					String restRName = rule.substring(0, pos2);
					String outid2 = first.substring(pos2+1);
					if(outid2.equals("0")){
						genBy2 = "genBy";
					}else{
						genBy2 = String.format("genBy%s", outid2);
					}
					
					OperationCallExp cn = make.createOperationCallExp();
					cn.setOperationName(genBy2);
					StringExp sn = make.createStringExp();
					sn.setStringSymbol(restRName);
					cn.setSource(EMFCopier.deepCopy(src));
					cn.getArguments().add(sn);
					
					or.getArguments().add(cn);
				}
				
				HashMap<EObject, ContextEntry> inferNextLv =  ContextHelper.cloneContext(n.getContext());
				inferNextLv.put(or, new ContextEntry(ContextNature.INFER));
				
				Node newNode = new Node(n.getLevel() + 1, n.getContent(), n, inferNextLv, n.getRel2Parent(), Tactic.INCLUDES_ELIM_2);
				tree.add(newNode);
				
			}
		}else if(expr.getOperationName().equals("excludes")){
			OclExpression col = expr.getSource();
			OclExpression src = expr.getArguments().get(0);
			
			myOclType tp = TypeInference.infer(col);
			String elemType = tp.getType();
			
			if(trace.get(elemType)!=null && trace.get(elemType).size()>0){
				String first = trace.get(elemType).get(0);
				
				int pos = first.lastIndexOf("#");
				String genBy = "";
				
				
				String fstRName = first.substring(0, pos);
				String outid = first.substring(pos+1);
				if(outid.equals("0")){
					genBy = "genBy";
				}else{
					genBy = String.format("genBy%s", outid);
				}
				
				OperationCallExp c1 = make.createOperationCallExp();
				c1.setOperationName(genBy);
				StringExp s = make.createStringExp();
				s.setStringSymbol(fstRName);
				c1.setSource(EMFCopier.deepCopy(src));
				c1.getArguments().add(s);
				
				OperatorCallExp or = make.createOperatorCallExp();
				or.setOperationName("or");
				or.setSource(c1);
				
				List<String> subTrace  = trace.get(elemType).subList(1, trace.get(elemType).size());
				
				for(String rule : subTrace){
					int pos2 = first.lastIndexOf("#");
					String genBy2 = "";
					
					
					String restRName = rule.substring(0, pos2);
					String outid2 = first.substring(pos2+1);
					if(outid2.equals("0")){
						genBy2 = "genBy";
					}else{
						genBy2 = String.format("genBy%s", outid2);
					}
					
					OperationCallExp cn = make.createOperationCallExp();
					cn.setOperationName(genBy2);
					StringExp sn = make.createStringExp();
					sn.setStringSymbol(restRName);
					cn.setSource(EMFCopier.deepCopy(src));
					cn.getArguments().add(sn);
					
					or.getArguments().add(cn);
				}
				
				OperatorCallExp not = make.createOperatorCallExp();
				not.setOperationName("not");
				not.setSource(or);
				
				HashMap<EObject, ContextEntry> inferNextLv = ContextHelper.cloneContext(n.getContext());
				inferNextLv.put(not, new ContextEntry(ContextNature.INFER));
				
				Node newNode = new Node(n.getLevel() + 1, n.getContent(), n, inferNextLv, n.getRel2Parent(), Tactic.EXCLUDES_ELIM_2);
				tree.add(newNode);
				
			}
		}else if(expr.getOperationName().equals("oclIsUndefined")){	//TODO there probably more operation can be applied this elimin rule.
			OclExpression src = expr.getSource();
			if(src instanceof NavigationOrAttributeCallExp){
				// identify single valued navigation
				myOclType tp = TypeInference.infer(src);
	
				
				if(!tp.getKind().equals("trgRefs") && !tp.getKind().equals("primitive")){
					OperationCallExp col = make.createCollectionOperationCallExp();
					col.setOperationName("allInstances");
					OclModelElement m = make.createOclModelElement();
					
					String mmName = EMFHelper.getModel(tp.getType());
					String clName = EMFHelper.getClassifier(tp.getType());
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
					
					
					if(!OclHelper.isMember(n.getContext().keySet(), includes) && !OclHelper.isMember(n.getContext().keySet(), excludes)){
						HashMap<EObject, ContextEntry> inferNextLv =  ContextHelper.cloneContext(n.getContext());
						inferNextLv.put(includes, new ContextEntry(ContextNature.ASSUME));
						Node n1 = new Node(n.getLevel() + 1, n.getContent(), n, inferNextLv, ProveOption.EACH, Tactic.NAV_SINGLE_INTRO);
						tree.add(n1);
						
						HashMap<EObject, ContextEntry> inferNextLv2 =  ContextHelper.cloneContext(n.getContext());
						inferNextLv2.put(excludes, new ContextEntry(ContextNature.ASSUME));
						Node n2 = new Node(n.getLevel() + 1, n.getContent(), n, inferNextLv2, ProveOption.EACH, Tactic.NAV_SINGLE_INTRO);
						tree.add(n2);	
					}
						
				
				}
			}	
		}
		
		
		
	}

	// the input is with the format of "ruleName#outElementOrder"
	// see Trace.java getTrace for more information
	private static String genByGenerator(String arg) {
		int pos = arg.lastIndexOf("#");
		String[] args =  {arg.substring(0, pos), arg.substring(pos)};
		
		
		
		
		return null;
	}
}
