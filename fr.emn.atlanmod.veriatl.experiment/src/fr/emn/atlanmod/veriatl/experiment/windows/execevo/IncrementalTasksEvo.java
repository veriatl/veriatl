package fr.emn.atlanmod.veriatl.experiment.windows.execevo;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import org.eclipse.emf.common.util.URI;

import experiment.VCGenerator;
import fr.emn.atlanmod.veriatl.experiment.standalone.ContextConstruction;
import fr.emn.atlanmod.veriatl.launcher.VeriATLLaunchConstants;
import fr.emn.atlanmod.veriatl.tools.VerificationResult;
import fr.emn.atlanmod.veriatl.util.URIs;

public final class IncrementalTasksEvo {

	private static String z3 = "../fr.emn.atlanmod.veriatl.tools/lib/Z3-4.5.1/win-64/z3.exe";
	private static String veriatl = "../fr.emn.atlanmod.veriatl.experiment/lib/VeriATL-1.0.0/win-64/";

	private IncrementalTasksEvo() {
		throw new IllegalStateException("This class should not be initialized");
	}

	private static ArrayList<String> initBoogie() {
		ArrayList<String> args = new ArrayList<String>();

		// add Boogie options
		args.add("/nologo");
		args.add("/z3exe:" + z3);
		args.add("/traceTimes");
		args.add("/timeLimit:180");

		return args;
	}

	/**
	 * Exec Boogie.
	 * <p>
	 * 
	 * @throws IOException
	 * 
	 *
	 */
	public static void execBoogie(ContextConstruction context, String mode) throws IOException {

		if (mode.equals(VCGenerator.INCCombine)) {
			URI goal = context.basePath.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
					.appendSegment(VCGenerator.INCCombine);
			execBoogieCom(context, goal);
		} else if (mode.equals(VCGenerator.INCSep)) {
			URI goals = context.basePath.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
					.appendSegment(VCGenerator.INCSep);
			for (String goal : URIs.allFolders(goals)) {
				execBoogieSep(context, goals.appendSegment(goal));
			}
		} else if (mode.equals("single")){
			URI goal = context.basePath.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
					.appendSegment("single");
			execBoogieCom(context, goal);
		}

	}

	private static void execBoogieCom(ContextConstruction context, URI folder) throws IOException {
		String path = URIs.abs(folder);

		ArrayList<String> args = new ArrayList<String>();

		// add Boogie options
		args.addAll(initBoogie());

		// add prelude files
		String veriatlabs = veriatl + "/Prelude/";
		args.addAll(getFiles(veriatlabs));

		// add auxu files
		String auxu = URIs.abs(context.basePath.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME));
		args.addAll(getFiles(auxu));

		ArrayList<String> files = getFiles(path);
		ArrayList<String> argClone = new ArrayList<String>();

		for (String file : files) {
			argClone.addAll(args);
			// System.out.println(file);
			argClone.add(file);
			VerificationResult r = DefaultCommandEvo.execute(argClone);
			System.out.println(String.format("%s:%s:%s", file, r.getTime(), r.getResult()));
			argClone.clear();
		}

	}

	private static void execBoogieSep(ContextConstruction context, URI folder) throws IOException {
		String path = URIs.abs(folder);

		ArrayList<String> args = new ArrayList<String>();

		// add Boogie options
		args.addAll(initBoogie());

		// add prelude files
		String veriatlabs = veriatl + "/Prelude/";
		args.addAll(getFiles(veriatlabs));

		// add auxu files
		String auxu = URIs.abs(context.basePath.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME));
		args.addAll(getFiles(auxu));

		ArrayList<String> files = getFiles(path);
		ArrayList<String> argClone = new ArrayList<String>();
		long time = 0;
		long min = 999999;
		long max = 0;
		for (String file : files) {
			argClone.addAll(args);
			argClone.add(file);
			VerificationResult r = DefaultCommandEvo.execute(argClone);
			time += r.getTime();
			argClone.clear();
			if(r.getTime() > max) {max = r.getTime();}
			if(r.getTime() < min){min = r.getTime();}
			System.out.println(String.format("\t%s:%s:%s", file, r.getTime(),r.getResult()));
		}

		System.out.println(String.format("%s:%s:%s:%s", folder, time, max, min));

	}

	private static ArrayList<String> getFiles(String folder) {
		ArrayList<String> r = new ArrayList<String>();
		File f = new File(folder);
		File[] files = f.listFiles();
		
		for (final File file : files) {
			r.add(file.getAbsolutePath());
		}
		
		Collections.sort(r);
		return r;
	}

}
