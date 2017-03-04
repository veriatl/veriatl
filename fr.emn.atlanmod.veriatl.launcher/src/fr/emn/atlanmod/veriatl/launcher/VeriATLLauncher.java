/**
 * 
 */
package fr.emn.atlanmod.veriatl.launcher;

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
		} else if (context.mode() == Mode.VERIFY) {
			String aRule = "SM2SM";
			String pCache = "2017-03-04-15-02-49";
			String cCache = "2017-03-04-15-03-10";
			IncrementalTasks.execBoogie(context, aRule, pCache, cCache);
		} else if (context.mode() == Mode.DEBUG) {
			// added for testing purpose
			String aRule = "SM2SM";
			String pCache = "2017-03-04-14-20-43";
			String cCache = "2017-03-04-14-20-52";
			IncrementalTasks.debugBoogie(context, aRule, pCache, cCache);
		} else {
			throw new IllegalStateException("Unknown mode");
		}

		subMonitor.done();
		System.out.println("Finished");
	}
}
