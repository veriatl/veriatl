/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.standalone;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.eclipse.emf.common.util.URI;

import experiment.VCGenerator;
import experiment.experimentDriver;
import fr.emn.atlanmod.atl2boogie.xtend.core.driver;
import fr.emn.atlanmod.veriatl.launcher.VeriATLLaunchConstants;
import localize.ocldecomposerDriver;

/**
 * @author zcheng
 *
 */
public class WindowsStandalone {
	static String[] folders;
	static String[] posts;
	static String[] mutants;
	static String org;
	private static Map<String, String> changes;	
	static String moduleName ;
	static String s;
	static String t;
	
    public static void createTask(String[] f, String[] m, String o, Map<String, String> c, String module, String src, String trg){
    	folders = f;
    	mutants = m;
    	org = o;
    	changes = c;
    	moduleName = module;
    	s = src;
    	t = trg;
    }
    
    
	public static ContextConstruction init(String p){
		
		
		URI base = URI.createFileURI(p);		
		URI src = URI.createFileURI(String.format("./%s/Source/%s.ecore", p, s));
		URI trg = URI.createFileURI(String.format("./%s/Source/%s.ecore", p, t)); 
		URI contract = URI.createFileURI(String.format("./%s/Source/%sContract.atl", p, moduleName));	
		//URI cache = URI.createFileURI(String.format("./%s/", p)).appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME);
		
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
	
	public static void clean(ContextConstruction context) throws Exception{
		String path = context.basePath.toFileString();
		for(String f : folders){
			String toDelete = String.format("%s/%s", path, f); 
			FileUtils.deleteDirectory(new File(toDelete));
		}	
	}
	
	
	public static void cleanAll(String p) throws Exception{
		
		for(String trg : mutants){
			String proj = String.format("%s/%s", p, trg);
			ContextConstruction context = init(proj);
			clean(context);
		}	
	}
	
	public static void genAll(String p) throws Exception{
		
		
		for(String trg : mutants){
			String proj = String.format("%s/%s", p, trg);
			ContextConstruction context = init(proj);
			gen(context);
			decompose(context);
		}
		
	}
	
	

	

	
	

	public static void decomposeNew(ContextConstruction context) throws Exception{
		experimentDriver.decompose(
				context.basePath.appendSegment("Source").appendSegment(context.moduleName).appendFileExtension("atl"), 
				context.basePath.appendSegment("Source").appendSegment(context.moduleName).appendFileExtension("emftvm"), 
				context.moduleName, 
				context.inMetamodel,
				context.outMetamodel, 
				context.contractPath,
				context.basePath.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME));
	}
	
	public static void doExperimentLinux(String p) throws Exception {

		System.out.println(String.format("=================== %s-code-gen ===================", org));
		// clean
		// TODO
//		String toDelete = String.format("%s/%s/%s/", p, org, "NoCached");
//		FileUtils.deleteDirectory(new File(toDelete));

		// compute post result only
		String proj = String.format("%s/%s", p, org);
		ContextConstruction context = init(proj);
		// TODO
		clean(context);
		gen(context);
		decomposeNew(context);
		// TODO
//		fr.emn.atlanmod.veriatl.experiment.linux.execevo.IncrementalTasksEvo.execBoogie(context, VCGenerator.INCCombine);
//		fr.emn.atlanmod.veriatl.experiment.linux.execevo.IncrementalTasksEvo.execBoogie(context, VCGenerator.INCSep);
//		fr.emn.atlanmod.veriatl.experiment.linux.execevo.IncrementalTasksEvo.execBoogie(context, "single");
//		fr.emn.atlanmod.veriatl.experiment.linux.execevo.IncrementalTasksEvo.execBoogie(context, VCGenerator.HEURISTIC);

	}


	public static void doExperimentWindows(String p) throws Exception {

		System.out.println(String.format("=================== %s-code-gen ===================", org));
		// clean
		// TODO
//		String toDelete = String.format("%s/%s/%s/", p, org, "NoCached");
//		FileUtils.deleteDirectory(new File(toDelete));

		// compute post result only
		String proj = String.format("%s/%s", p, org);
		ContextConstruction context = init(proj);
		// TODO
		clean(context);
		gen(context);
		decomposeNew(context);
		// TODO
		//fr.emn.atlanmod.veriatl.experiment.windows.execevo.IncrementalTasksEvo.execBoogie(context, VCGenerator.INCCombine);
		//fr.emn.atlanmod.veriatl.experiment.windows.execevo.IncrementalTasksEvo.execBoogie(context, VCGenerator.INCSep);
		//fr.emn.atlanmod.veriatl.experiment.windows.execevo.IncrementalTasksEvo.execBoogie(context, VCGenerator.SINGLE);
		//fr.emn.atlanmod.veriatl.experiment.windows.execevo.IncrementalTasksEvo.execBoogie(context, VCGenerator.HEURISTIC);
	}
	
	

}
