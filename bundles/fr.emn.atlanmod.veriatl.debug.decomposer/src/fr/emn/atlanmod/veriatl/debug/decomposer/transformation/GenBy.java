package fr.emn.atlanmod.veriatl.debug.decomposer.transformation;

import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.emf.ecore.EPackage;
import org.eclipse.m2m.atl.common.ATL.InPatternElement;
import org.eclipse.m2m.atl.common.ATL.MatchedRule;
import org.eclipse.m2m.atl.common.ATL.Rule;
import org.eclipse.m2m.atl.common.OCL.OclExpression;
import org.eclipse.m2m.atl.common.OCL.OclModelElement;

import fr.emn.atlanmod.atl2boogie.xtend.lib.atl;
import fr.emn.atlanmod.atl2boogie.xtend.lib.myOclType;
import fr.emn.atlanmod.atl2boogie.xtend.ocl.TypeInference;
import fr.emn.atlanmod.atl2boogie.xtend.ocl.ocl2boogie;


public class GenBy {

	private static EPackage srcMM;
	private static List<MatchedRule> rules;
	private static int depth ;
	
	public static void init(List<MatchedRule> rs, EPackage mm) {
		rules = rs;
		srcMM = mm;
	}

	
	public static void getOutPatternDepth(){
		
		int max = 0;
		
		for (MatchedRule r : rules) {
			int pos = r.getOutPattern().getElements().size();
			if(pos > max){
				max = pos;
			}
		}
		
		depth = max;
	}
	
	
	public static String print() throws FileNotFoundException {
		String res = "";

		getOutPatternDepth();
		for(int pos = 0; pos < depth; pos++){
			res += printSignature(pos);
		}
		
		for (MatchedRule r : rules) {
			for(int pos =0; pos < r.getOutPattern().getElements().size();pos++){
				res += printAxiomHeader(r, pos);

				Map<String, String> replacers = getInputsMaps(r, pos);
				Map<String, myOclType> types = getInputsTypes(r);
				for (InPatternElement input : r.getInPattern().getElements()) {
					res += printInputElement(input, replacers);
				}

				TypeInference.init(types);
				res += printFilter(r, replacers);
				res += printAxiomFooter();
			}

		}

		ocl2boogie.offReplacing();
		return res;
	}

	private static Map<String, myOclType> getInputsTypes(MatchedRule r) {
		Map<String, myOclType> rtn = new HashMap<String, myOclType>();

		for (InPatternElement input : r.getInPattern().getElements()) {
			OclModelElement tp = (OclModelElement) input.getType();
			String type = String.format("%s$%s", tp.getModel().getName(), tp.getName());
			myOclType mTp = new myOclType("srcRef", type);
			rtn.put(input.getVarName(), mTp);
		}

		return rtn;
	}

	private static String printFilter(MatchedRule r, Map<String, String> replacers) {
		String res = "";
		
		ocl2boogie.onReplacing(replacers);

		
		OclExpression filter = r.getInPattern().getFilter();
		if(filter == null){
			res += "true";
		}else{
			atl.srcHeaps.add("$s");
			res += ocl2boogie.genOclExpression(filter, "$s");
		}

		return res+"\n";
	}

	private static String printInputElement(InPatternElement input, Map<String, String> replacers) {
		String replace = replacers.get(input.getVarName());
		OclModelElement tp = (OclModelElement) input.getType();
		String type = String.format("%s$%s", tp.getModel().getName(), tp.getName());
		String s = String.format("%s!=null && read($s,%s,alloc) && dtype(%s)<:%s &&", replace, replace, replace, type);
		return s+"\n";
	}

	private static Map<String, String> getInputsMaps(MatchedRule r, int pos) {
		Map<String, String> rtn = new HashMap<String, String>();
		String filled = pos == 0 ? "":Integer.toString(pos);
		
		int i = 0;
		for (InPatternElement input : r.getInPattern().getElements()) {
			String v = String.format("Seq#Index(getTarsBySrcs%s_inverse(__r), %d)", filled, i);
			rtn.put(input.getVarName(), v);
			i++;
		}

		return rtn;
	}

	private static String printAxiomHeader(Rule r, int i) {
		String filled = i == 0 ? "":Integer.toString(i);
		String s = String.format("axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy%s(__r, _%s, $s, $t) <==>",
				filled, r.getName());
		return s+"\n";

	}

	private static String printAxiomFooter() {
		String s = ");";
		return s+"\n";

	}
	
	private static String printSignature(int i) {
		String filled = i == 0 ? "":Integer.toString(i);
		String sig = String.format("function genBy%s(ref, String, HeapType, HeapType): bool;", filled);
		return sig+"\n";
	}

}
