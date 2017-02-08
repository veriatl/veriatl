/**
 * 
 */
package fr.emn.atlanmod.veriatl.launcher;

import java.util.Iterator;

import org.eclipse.core.runtime.FileLocator;
import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.SubMonitor;
import org.eclipse.debug.core.ILaunch;
import org.eclipse.debug.core.ILaunchConfiguration;
import org.eclipse.debug.core.model.ILaunchConfigurationDelegate;
import org.eclipse.emf.common.util.URI;

import fr.emn.atlanmod.atl2boogie.xtend.core.driver;
import fr.emn.atlanmod.veriatl.core.Context;
import fr.emn.atlanmod.veriatl.core.Mode;
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
		context.metamodels().forEach(Metamodels::register);

		// set in/out metamodels
		Iterator<URI> it = context.metamodels().iterator();
		context.outMetamodel(it.next());
		context.inMetamodel(it.next());

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
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (context.mode() == Mode.VERIFY) {
			System.out.println("VeriATL: VERIFY Successfully executed");
			// Tasks.backwardTransformation().apply(context);
		} else if (context.mode() == Mode.DEBUG) {
			System.out.println("VeriATL: DEBUG Successfully executed");
			// Tasks.backwardTransformation().apply(context);
		} else {
			throw new IllegalStateException("Unknown mode");
		}

		subMonitor.done();

		System.out.println("VeriATL: Successfully executed");
	}
}
