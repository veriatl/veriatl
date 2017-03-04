/**
 * 
 */
package fr.emn.atlanmod.veriatl.launcher;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;

import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.SubMonitor;
import org.eclipse.debug.core.ILaunch;
import org.eclipse.debug.core.ILaunchConfiguration;
import org.eclipse.debug.core.model.ILaunchConfigurationDelegate;

import fr.emn.atlanmod.atl2boogie.xtend.core.driver;
import fr.emn.atlanmod.atl2boogie.xtend.ocl.TypeInference;
import fr.emn.atlanmod.atl2boogie.xtend.ocl.ocl2boogie;
import fr.emn.atlanmod.veriatl.core.Context;
import fr.emn.atlanmod.veriatl.core.IncrementalTasks;
import fr.emn.atlanmod.veriatl.core.Mode;
import fr.emn.atlanmod.veriatl.core.NormalTasks;
import fr.emn.atlanmod.veriatl.util.Metamodels;
import fr.emn.atlanmod.veriatl.util.URIs;
import localize.ocldecomposerDriver;

/**
 * @author zcheng
 *
 */
public class VeriATLLauncher implements ILaunchConfigurationDelegate {
	@Override
	public void launch(ILaunchConfiguration launchConfiguration, String mode, ILaunch launch,
			IProgressMonitor monitor) {

		SubMonitor subMonitor = SubMonitor.convert(monitor);
		subMonitor.beginTask("VeriATL", 16);

		// Loads the current context
		Context context = Context.from(launchConfiguration, subMonitor);

		// Register all metamodels
		Metamodels.register(context.inMetamodel());
		Metamodels.register(context.outMetamodel());

		
		// Run transformation
		if (context.mode() == Mode.EXEC) {
			System.out.println("VeriATL: EXEC Successfully executed");
			// Tasks.forwardTransformation().apply(context);
		} else if (context.mode() == Mode.GEN) {

			driver.generate(context.module().appendFileExtension("atl"), context.inMetamodel(), context.outMetamodel(),
					context.contractPath(),
					context.basePath().appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME));

			try {
				ocldecomposerDriver.decompose(
						context.module().appendFileExtension("atl"),
						context.module().appendFileExtension("emftvm"), 
						context.moduleName(), 
						context.inMetamodel(),
						context.outMetamodel(), 
						context.contractPath(),
						context.basePath().appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME));
//				experimentDriver.decompose(
//						context.module().appendFileExtension("atl"),
//						context.module().appendFileExtension("emftvm"), 
//						context.moduleName(), 
//						context.inMetamodel(),
//						context.outMetamodel(), 
//						context.contractPath(),
//						context.basePath().appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			TypeInference.clean();
			ocl2boogie.clean();
		} else  {
			String aRule = "SM2SM";
			
			// load caches, and sort in desc order.
			ArrayList<String> caches = URIs.allNames(context.basePath().appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME).appendSegment(context.postName()));
			Collections.sort(caches, new Comparator<String>(){
			    public int compare(String s1, String s2){
			    	DateFormat df = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
			    	Date d1;
			    	Date d2 ;
					try {
						d1 = df.parse(s1);
						d2 = df.parse(s2);
						return d1.compareTo(d2);
					} catch (ParseException e) {
						e.printStackTrace();
					}
			    	
			        return 0;
			    }
			});
			

			
			String pCache = prevCache(caches);
			String cCache = curCache(caches);
			
			if (context.mode() == Mode.VERIFY) {
				if(pCache == null) {
					NormalTasks.execBoogie(context);
				}else {
					//TODO if is in incremental mode
					IncrementalTasks.execBoogie(context, aRule, pCache, cCache);
				}
			}else if (context.mode() == Mode.DEBUG) {
				// added for testing purpose
				if(pCache == null) {
					NormalTasks.debugBoogie(context);
				}else {
					//TODO if is in incremental mode
					IncrementalTasks.debugBoogie(context, aRule, pCache, cCache);
				}
				
			} else {
				throw new IllegalStateException("Unknown mode");
			}		
		} 

		subMonitor.done();
		System.out.println("Finished");
	}
	
	
	
	private static String curCache(ArrayList<String> caches) {
		return caches.get(caches.size()-1);
	}
	
	private static String prevCache(ArrayList<String> caches) {
		if(caches.size()<=1) {
			return null;
		}else {
			return caches.get(caches.size()-2);
		}
	}
	
}
