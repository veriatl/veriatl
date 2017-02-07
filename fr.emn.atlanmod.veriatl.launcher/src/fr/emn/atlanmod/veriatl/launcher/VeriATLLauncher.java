/**
 * 
 */
package fr.emn.atlanmod.veriatl.launcher;

import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.SubMonitor;
import org.eclipse.debug.core.ILaunch;
import org.eclipse.debug.core.ILaunchConfiguration;
import org.eclipse.debug.core.model.ILaunchConfigurationDelegate;

import fr.emn.atlanmod.veriatl.core.Context;
import fr.emn.atlanmod.veriatl.core.Mode;
import fr.emn.atlanmod.veriatl.util.Metamodels;

/**
 * @author zcheng
 *
 */
public class VeriATLLauncher implements ILaunchConfigurationDelegate {
    @Override
    public void launch(ILaunchConfiguration launchConfiguration, String mode, ILaunch launch, IProgressMonitor monitor) {

        SubMonitor subMonitor = SubMonitor.convert(monitor);
        subMonitor.beginTask("VeriATL", 16);

        // Loads the current context
        Context context = Context.from(launchConfiguration, subMonitor);

        // Register all metamodels
        context.metamodels().forEach(Metamodels::register);

        // Run transformation
        if (context.mode() == Mode.EXEC) {
        	System.out.println("VeriATL: EXEC Successfully executed");
        	//Tasks.forwardTransformation().apply(context);
        }
        else if (context.mode() == Mode.GEN) {
        	System.out.println("VeriATL: GENBOOGIE Successfully executed");
        	//Tasks.forwardTransformation().apply(context);
        }
        else if (context.mode() == Mode.VERIFY) {
        	System.out.println("VeriATL: VERIFY Successfully executed");
        	//Tasks.backwardTransformation().apply(context);
        }
        else if (context.mode() == Mode.DEBUG) {
        	System.out.println("VeriATL: DEBUG Successfully executed");
        	//Tasks.backwardTransformation().apply(context);
        }
        else {
            throw new IllegalStateException("Unknown mode");
        }

        subMonitor.done();

        System.out.println("VeriATL: Successfully executed");
    }
}
