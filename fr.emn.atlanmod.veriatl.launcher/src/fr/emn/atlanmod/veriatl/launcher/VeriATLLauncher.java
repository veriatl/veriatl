/**
 * 
 */
package fr.emn.atlanmod.veriatl.launcher;

import java.io.PrintStream;

import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.SubMonitor;
import org.eclipse.debug.core.ILaunch;
import org.eclipse.debug.core.ILaunchConfiguration;
import org.eclipse.debug.core.model.ILaunchConfigurationDelegate;
import org.eclipse.ui.console.ConsolePlugin;
import org.eclipse.ui.console.IConsole;
import org.eclipse.ui.console.IConsoleManager;
import org.eclipse.ui.console.MessageConsole;
import org.eclipse.ui.console.MessageConsoleStream;

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

		MessageConsole myConsole = findConsole("My Console");
		MessageConsoleStream out = myConsole.newMessageStream();
		VeriATLLauncher.setConsole(new PrintStream(out));
		   
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
			
			System.out.println("Code Generation Finished.");
			System.out.println("=== === === === === === ===");
		} else  {
			String aRule = context.affectedRule();
			boolean incMode = context.enableInc();
			
			
			if (context.mode() == Mode.VERIFY) {
				if(!incMode) {
					NormalTasks.execBoogie(context);
				}else {
					IncrementalTasks.execBoogie(context, aRule);
				}
				System.out.println("Verification Finished.");
				System.out.println("=== === === === === === ===");
			}else if (context.mode() == Mode.DEBUG) {
				// added for testing purpose
				if(!incMode) {
					NormalTasks.debugBoogie(context);
				}else {
					IncrementalTasks.debugBoogie(context, aRule);
				}
				System.out.println("Debugging Finished.");
				System.out.println("=== === === === === === ===");
			} else {
				throw new IllegalStateException("Unknown mode");
			}		
		} 

		subMonitor.done();
		
	}
	
	private MessageConsole findConsole(String name) {
	      ConsolePlugin plugin = ConsolePlugin.getDefault();
	      IConsoleManager conMan = plugin.getConsoleManager();
	      IConsole[] existing = conMan.getConsoles();
	      for (int i = 0; i < existing.length; i++)
	         if (name.equals(existing[i].getName()))
	            return (MessageConsole) existing[i];
	      //no console found, so create a new one
	      MessageConsole myConsole = new MessageConsole(name, null);
	      conMan.addConsoles(new IConsole[]{myConsole});
	      return myConsole;
	}
	

	private static void setConsole(PrintStream ps) {
	    System.setOut(ps);
	    System.setErr(ps);
	}
}
