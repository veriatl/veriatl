/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.standalone;

import org.eclipse.emf.common.util.URI;

import fr.emn.atlanmod.atl2boogie.xtend.core.driver;
import fr.emn.atlanmod.veriatl.core.Context;
import fr.emn.atlanmod.veriatl.core.Mode;
import fr.emn.atlanmod.veriatl.launcher.VeriATLLaunchConstants;
import localize.ocldecomposerDriver;

/**
 * @author zcheng
 *
 */
public class WindowsStandalone {

	public static ContextConstruction init(String proj){
		String moduleName = "HSM2FSM";
		String s = "HSM";
		String t = "FSM";
		
		URI base = URI.createFileURI(proj);		
		URI src = URI.createFileURI(String.format("./%s/Source/%s.ecore", proj, s));
		URI trg = URI.createFileURI(String.format("./%s/Source/%s.ecore", proj, t)); 
		URI contract = URI.createFileURI(String.format("./%s/Source/%sContract.atl", proj, proj));	
		URI cache = URI.createFileURI(String.format("./%s/", proj)).appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME);
		
		String post = "";
		
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
	
	public static void main(String[] args) throws Exception {	
		ContextConstruction context = init("HSM2FSM_GUI");
		gen(context);
		decompose(context);
		
		
	}

}
