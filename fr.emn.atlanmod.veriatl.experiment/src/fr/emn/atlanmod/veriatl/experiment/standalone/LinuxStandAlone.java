/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.standalone;

import java.io.File;
import java.util.ArrayList;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.eclipse.emf.common.util.URI;

import fr.emn.atlanmod.atl2boogie.xtend.core.driver;
import fr.emn.atlanmod.veriatl.experiment.exec.BoogieTasks;
import fr.emn.atlanmod.veriatl.experiment.linux.execevo.IncrementalTasksEvo;
import fr.emn.atlanmod.veriatl.launcher.VeriATLLaunchConstants;
import localize.ocldecomposerDriver;

/**
 * @author zcheng
 *
 */
public class LinuxStandAlone {
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
	
	

	

	
	/*
	 * Prepare for 2nd column
	 * */
	public static void PreparePostNoCache(String p) throws Exception{
		System.out.println(String.format("=================== %s-post-prepare-nocache ===================", org));
		// clean
		//TODO
		String toDelete = String.format("%s/%s/%s/",p, org, "NoCached");
		FileUtils.deleteDirectory(new File(toDelete));

		
		// compute post result only
		String proj = String.format("%s/%s", p, org);
		ContextConstruction context = init(proj);
		//TODO
		clean(context);
		gen(context);
		decompose(context);
		IncrementalTasksEvo.execBoogie(context, "");
		
		String srcCache = String.format("%s/%s/%s/",p, org, "Caches");
		String dstCache = String.format("%s/%s/%s/",p, org, "NoCached");
		
		FileUtils.moveDirectory(new File(srcCache), new File(dstCache));
		

	}
	
	
	

	
	

	

	
	
	public static void incPostInit(String p) throws Exception{
		//TODO
		PreparePostNoCache(p);	
	}
	


	
	public static void BoogieIncPostInit(String p) throws Exception{
		// gen v0
		System.out.println(String.format("=================== %s-boogie-snapshot-v0 ===================", org));
		String proj = String.format("%s/%s", p, org);
		ContextConstruction context = init(proj);
		ArrayList<String> posts = BoogieTasks.gen(context, "v0");
		
		for(String trg : mutants){
			System.out.println(String.format("=================== %s-boogie-snapshot-v1 ===================", trg));
			// copy v0
			String srcCache = String.format("%s/%s/%s/",p, org, "Boogie");
			String dstCache = String.format("%s/%s/%s/",p, trg, "Boogie");
			FileUtils.copyDirectory(new File(srcCache), new File(dstCache));
			
			// gen v1
			proj = String.format("%s/%s", p, trg);
			context = init(proj);
			BoogieTasks.gen(context, "v1");
			
			// verify v1
			BoogieTasks.exec(context, posts);
		}
		
		
	}
	


	
	
	public static void codeGen(String p) throws Exception {

		System.out.println(String.format("=================== %s-code-gen ===================", org));
		// clean
		// TODO
		String toDelete = String.format("%s/%s/%s/", p, org, "NoCached");
		FileUtils.deleteDirectory(new File(toDelete));

		// compute post result only
		String proj = String.format("%s/%s", p, org);
		ContextConstruction context = init(proj);
		// TODO
		clean(context);
		gen(context);
		decompose(context);
		// TODO
		//IncrementalTasksEvo.execBoogie(context, "");

		String srcCache = String.format("%s/%s/%s/", p, org, "Caches");
		String dstCache = String.format("%s/%s/%s/", p, org, "NoCached");

		FileUtils.moveDirectory(new File(srcCache), new File(dstCache));

	}


}
