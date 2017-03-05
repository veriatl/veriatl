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
			boolean incMode = true;
			
			
			if (context.mode() == Mode.VERIFY) {
				if(!incMode) {
					NormalTasks.execBoogie(context);
				}else {
					IncrementalTasks.execBoogie(context, aRule);
				}
			}else if (context.mode() == Mode.DEBUG) {
				// added for testing purpose
				if(!incMode) {
					NormalTasks.debugBoogie(context);
				}else {
					IncrementalTasks.debugBoogie(context, aRule);
				}
				
			} else {
				throw new IllegalStateException("Unknown mode");
			}		
		} 

		subMonitor.done();
		System.out.println("Finished");
	}
	
	

}
