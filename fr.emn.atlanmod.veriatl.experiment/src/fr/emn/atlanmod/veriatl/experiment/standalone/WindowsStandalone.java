/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.standalone;

import java.io.File;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;
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
	static String[] folders;
	static String[] posts;
	static String[] mutants;
	static String org;
	private static Map<String, String> changes;	

	
    public static void createTask(String[] f, String[] m, String o, Map<String, String> c){
    	folders = f;
    	mutants = m;
    	org = o;
    	changes = c;
    }
    
    
	public static ContextConstruction init(String p){
		String moduleName = "HSM2FSM";
		String s = "HSM";
		String t = "FSM";
		
		URI base = URI.createFileURI(p);		
		URI src = URI.createFileURI(String.format("./%s/Source/%s.ecore", p, s));
		URI trg = URI.createFileURI(String.format("./%s/Source/%s.ecore", p, t)); 
		URI contract = URI.createFileURI(String.format("./%s/Source/%sContract.atl", p, moduleName));	
		URI cache = URI.createFileURI(String.format("./%s/", p)).appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME);
		
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
	
	

	
	/*
	 * 1st column
	 * */
	public static void StandardVeriATLPost(String p) throws Exception{
		System.out.println(String.format("=================== %s-post-standard ===================", org));
		String proj = String.format("%s/%s", p, org);
		ContextConstruction context = init(proj);
		clean(context);
		gen(context);
		decompose(context);
		NormalTasks.execBoogie(context);
		
		for(String trg : mutants){
			System.out.println(String.format("=================== %s-post-standard ===================", trg));
			proj = String.format("%s/%s", p, trg);
			context = init(proj);
			clean(context);
			gen(context);
			decompose(context);
			NormalTasks.execBoogie(context);
		}
		
	}
	
	/*
	 * Prepare for 2nd column
	 * */
	public static void PreparePostNoCache(String p) throws Exception{
		// clean
		String toDelete = String.format("%s/%s/%s/",p, org, "NoCached");
		FileUtils.deleteDirectory(new File(toDelete));

		
		// compute post result only
		String proj = String.format("%s/%s", p, org);
		ContextConstruction context = init(proj);
		clean(context);
		gen(context);
		decompose(context);
		IncrementalTasks.execBoogie(context, "");
		
		String srcCache = String.format("%s/%s/%s/",p, org, "Caches");
		String dstCache = String.format("%s/%s/%s/",p, org, "NoCached");
		
		FileUtils.moveDirectory(new File(srcCache), new File(dstCache));
		

	}
	
	/*
	 * Prepare for 3rd column
	 * */
	public static void PreparePostCache(String p) throws Exception{
		String toDelete = String.format("%s/%s/%s/",p, org, "Cached");
		FileUtils.deleteDirectory(new File(toDelete));
		

		
		// compute sub-goals result
		String proj = String.format("%s/%s", p, org);
		ContextConstruction context = init(proj);
		clean(context);
		gen(context);
		decompose(context);
		IncrementalTasks.debugBoogie(context, "");
		
		String srcCache = String.format("%s/%s/%s/",p, org, "Caches");
		String dstCache = String.format("%s/%s/%s/",p, org, "Cached");
		
		FileUtils.moveDirectory(new File(srcCache), new File(dstCache));
	}
	
	/*
	 * 2nd column: inc without cache
	 * */
	public static void IncrementalVeriATLPostNoCache(String p) throws Exception{
		for(String trg : mutants){
			String proj = String.format("%s/%s", p, trg);
			ContextConstruction context = init(proj);
			clean(context);
		}
		
		for(String trg : mutants){
			System.out.println(String.format("=================== %s-post-nocache ===================", trg));
			// copy cache
			String srcCache = String.format("%s/%s/%s/",p, org, "NoCached");
			String dstCache = String.format("%s/%s/%s/",p, trg, "Caches");
			FileUtils.copyDirectory(new File(srcCache), new File(dstCache));
			
			String proj = String.format("%s/%s", p, trg);
			ContextConstruction context = init(proj);
			gen(context);
			decompose(context);
			String aRule = changes.get(trg);
			IncrementalTasks.execBoogie(context, aRule);
		}
		
	}
	
	
	/*
	 * 3rd column: inc with cache
	 * */
	public static void IncrementalVeriATLPostCache(String p) throws Exception{

		// clean previous cache
		for(String trg : mutants){
			String proj = String.format("%s/%s", p, trg);
			ContextConstruction context = init(proj);
			clean(context);
		}
		
		for(String trg : mutants){
			System.out.println(String.format("=================== %s-post-cache ===================", trg));
			// copy cache
			String srcCache = String.format("%s/%s/%s/",p, org, "Cached");
			String dstCache = String.format("%s/%s/%s/",p, trg, "Caches");
			FileUtils.copyDirectory(new File(srcCache), new File(dstCache));
			
			String proj = String.format("%s/%s", p, trg);
			ContextConstruction context = init(proj);
			gen(context);
			decompose(context);
			String aRule = changes.get(trg);
			IncrementalTasks.execBoogie(context, aRule);
		}
		
	}
	
	
	
	/*
	 * 4th column
	 * */
	public static void StandardVeriATLSub(String p) throws Exception{
		System.out.println(String.format("=================== %s-sub-standard ===================", org));
		String proj = String.format("%s/%s", p, org);
		ContextConstruction context = init(proj);
		clean(context);
		gen(context);
		decompose(context);
		NormalTasks.debugBoogie(context);
		
		for(String trg : mutants){
			proj = String.format("%s/%s", p, trg);
			context = init(proj);
			clean(context);
			gen(context);
			decompose(context);
			NormalTasks.debugBoogie(context);
		}
		
	}
	
	

	
	/*
	 * 5th column: inc with cache
	 * */
	public static void IncrementalVeriATLSubCache(String p) throws Exception{
		
		// clean previous cache
		for(String trg : mutants){
			String proj = String.format("%s/%s", p, trg);
			ContextConstruction context = init(proj);
			clean(context);
		}
		
		for(String trg : mutants){
			System.out.println(String.format("=================== %s-sub-cache ===================", trg));
			// copy cache
			String srcCache = String.format("%s/%s/%s/",p, org, "Cached");
			String dstCache = String.format("%s/%s/%s/",p, trg, "Caches");
			FileUtils.copyDirectory(new File(srcCache), new File(dstCache));
			
			String proj = String.format("%s/%s", p, trg);
			ContextConstruction context = init(proj);
			gen(context);
			decompose(context);
			String aRule = changes.get(trg);
			IncrementalTasks.debugBoogie(context, aRule);
		}
		
	}
	
	
	
	public static void standardPostInit(String p) throws Exception{
		StandardVeriATLPost(p);
	}
	
	
	public static void incPostInit(String p) throws Exception{
		PreparePostNoCache(p);
		IncrementalVeriATLPostNoCache(p);
		
		PreparePostCache(p);
		IncrementalVeriATLPostCache(p);
	}
	
	public static void standardSubInit(String p) throws Exception{
		StandardVeriATLSub(p);
	}
	
	public static void incSubInit(String p) throws Exception{
		IncrementalVeriATLSubCache(p);
	}
	
	
	
	
	public static void standardPostRegression(String p) throws Exception{
		StandardVeriATLPost(p);
	}
	
	public static void incPostRegression(String p) throws Exception{
		IncrementalVeriATLPostNoCache(p);
		IncrementalVeriATLPostCache(p);
	}
	
	public static void standardSubRegression(String p) throws Exception{
		StandardVeriATLSub(p);
	}
	
	public static void incSubRegression(String p) throws Exception{
		IncrementalVeriATLSubCache(p);
	}
	

	
	
	


}
