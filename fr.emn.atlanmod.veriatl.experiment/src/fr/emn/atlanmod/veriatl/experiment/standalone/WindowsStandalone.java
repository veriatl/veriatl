/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.standalone;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.eclipse.emf.common.util.URI;

import fr.emn.atlanmod.atl2boogie.xtend.core.driver;
import fr.emn.atlanmod.veriatl.experiment.exec.IncrementalTasks;
import fr.emn.atlanmod.veriatl.experiment.exec.NormalTasks;
import fr.emn.atlanmod.veriatl.launcher.VeriATLLaunchConstants;
import localize.ocldecomposerDriver;

/**
 * @author zcheng
 *
 */
public class WindowsStandalone {

	
	static String[] mutants = new String[]{"AF2", "AR", "DB3", "DR1","MB6", "MF6"};
	static String org = "ORG";
	private static final Map<String, String> changes = createMap();

    private static Map<String, String> createMap() {
        Map<String, String> result = new HashMap<String, String>();
        result.put("AF2", "RS2RS");
        result.put("AR", "CS2RS");
        result.put("DB3", "IS2IS");
        result.put("DR1", "SM2SM");
        result.put("MB6", "T2TB");
        result.put("MF6", "T2TB");
        
        return Collections.unmodifiableMap(result);
    }
    
	
	
	public static ContextConstruction init(String proj){
		String moduleName = "HSM2FSM";
		String s = "HSM";
		String t = "FSM";
		
		URI base = URI.createFileURI(proj);		
		URI src = URI.createFileURI(String.format("./%s/Source/%s.ecore", proj, s));
		URI trg = URI.createFileURI(String.format("./%s/Source/%s.ecore", proj, t)); 
		URI contract = URI.createFileURI(String.format("./%s/Source/%sContract.atl", proj, moduleName));	
		URI cache = URI.createFileURI(String.format("./%s/", proj)).appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME);
		
		String post = "all";
		
		return new ContextConstruction(moduleName, src, trg, contract, base, post);
	}

	
	public static void gen(ContextConstruction context){
		driver.generate(
				context.basePath.appendSegment("Source").appendSegment(context.moduleName).appendFileExtension("atl"), 
				context.inMetamodel, context.outMetamodel,
				context.contractPath,
				context.basePath.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME));
	}
	
	public static void decompose(ContextConstruction context) throws Exception{
		ocldecomposerDriver.decompose(
				context.basePath.appendSegment("Source").appendSegment(context.moduleName).appendFileExtension("atl"), 
				context.basePath.appendSegment("Source").appendSegment(context.moduleName).appendFileExtension("emftvm"), 
				context.moduleName, 
				context.inMetamodel,
				context.outMetamodel, 
				context.contractPath,
				context.basePath.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME));
	}
	
	
	public static void genAll(String p) throws Exception{
		
		String proj = String.format("%s/%s", p, org);
		ContextConstruction context = init(proj);
		gen(context);
		decompose(context);
		
		for(String trg : mutants){
			proj = String.format("%s/%s", p, trg);
			context = init(proj);
			gen(context);
			decompose(context);
		}
		
	}
	
	public static void execNormal(String p) throws Exception{
		String proj = String.format("%s/%s", p, org);
		ContextConstruction context = init(proj);
		NormalTasks.execBoogie(context);
		
		for(String trg : mutants){
			proj = String.format("%s/%s", p, trg);
			context = init(proj);
			NormalTasks.execBoogie(context);
		}
	}
	
	public static void execIncremental(String p) throws Exception{
		// prepare cache
		String proj = String.format("%s/%s", p, org);
		ContextConstruction context = init(proj);
		NormalTasks.execBoogie(context);
		
		// copy cache
		
		for(String trg : mutants){
			proj = String.format("%s/%s", p, trg);
			context = init(proj);
			String aRule = changes.get(trg);
			IncrementalTasks.execBoogie(context, aRule);
		}
		
	}
	
	public static void main(String[] args) throws Exception {	
		String p = "HSM2FSM";
		genAll(p);
		
		//execNormal(p);
		execIncremental(p);
	}

}
