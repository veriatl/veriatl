package transformation;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.emf.ecore.EPackage;
import org.eclipse.m2m.atl.common.ATL.*;
import org.eclipse.m2m.atl.common.OCL.*;
import org.eclipse.m2m.atl.emftvm.ExecEnv;
import org.eclipse.m2m.atl.emftvm.InputRuleElement;
import org.eclipse.m2m.atl.emftvm.OutputRuleElement;

import metamodel.EMFLoader;
import fr.emn.atlanmod.atl2boogie.xtend.lib.atl;
import fr.emn.atlanmod.atl2boogie.xtend.lib.myOclType;
import fr.emn.atlanmod.atl2boogie.xtend.ocl.*;


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
	
	
	public static void print(String path) throws FileNotFoundException {
		PrintStream original = new PrintStream(System.out);
		
		String fName = path + "genBy.bpl";
		PrintStream out = new PrintStream(new FileOutputStream(fName));
		System.setOut(out);

		getOutPatternDepth();
		for(int pos = 0; pos < depth; pos++){
			printSignature(pos);
		}
		
		for (MatchedRule r : rules) {
			for(int pos =0; pos < r.getOutPattern().getElements().size();pos++){
				printAxiomHeader(r, pos);

				Map<String, String> replacers = getInputsMaps(r, pos);
				Map<String, myOclType> types = getInputsTypes(r);
				for (InPatternElement input : r.getInPattern().getElements()) {
					printInputElement(input, replacers);
				}

				TypeInference.init(types);
				printFilter(r, replacers);
				printAxiomFooter();
			}

		}

		out.close();
		System.setOut(original);
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

	private static void printFilter(MatchedRule r, Map<String, String> replacers) {
		ocl2boogie.onReplacing(replacers);

		TypeInference.lookup.size();
		
		OclExpression filter = r.getInPattern().getFilter();
		if(filter == null){
			System.out.println("true");
		}else{
			//System.out.println(ocl2boogie.genOclExpression(filter, "$trgHeap"));
			atl.srcHeaps.add("$s");
			System.out.println(ocl2boogie.genOclExpression(filter, "$s"));
		}
		
	}

	private static void printInputElement(InPatternElement input, Map<String, String> replacers) {
		String replace = replacers.get(input.getVarName());
		OclModelElement tp = (OclModelElement) input.getType();
		String type = String.format("%s$%s", tp.getModel().getName(), tp.getName());
		String s = String.format("%s!=null && read($s,%s,alloc) && dtype(%s)<:%s &&", replace, replace, replace, type);
		System.out.println(s);
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

	private static void printAxiomHeader(Rule r, int i) {
		String filled = i == 0 ? "":Integer.toString(i);
		String s = String.format("axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy%s(__r, _%s, $s, $t) <==>",
				filled, r.getName());
		System.out.println(s);

	}

	private static void printAxiomFooter() {
		String s = ");";
		System.out.println(s);

	}
	
	private static void printSignature(int i) {
		String filled = i == 0 ? "":Integer.toString(i);
		String sig = String.format("function genBy%s(ref, String, HeapType, HeapType): bool;", filled);
		System.out.println(sig);
	}

}
