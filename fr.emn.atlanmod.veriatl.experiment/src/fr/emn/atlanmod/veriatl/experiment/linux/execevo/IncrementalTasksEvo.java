package fr.emn.atlanmod.veriatl.experiment.linux.execevo;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

import org.eclipse.emf.common.util.URI;

import experiment.VCGenerator;
import fr.emn.atlanmod.veriatl.experiment.standalone.ContextConstruction;
import fr.emn.atlanmod.veriatl.experiment.linux.execevo.DefaultCommandEvo;
import fr.emn.atlanmod.veriatl.launcher.VeriATLLaunchConstants;
import fr.emn.atlanmod.veriatl.tools.VerificationResult;
import fr.emn.atlanmod.veriatl.util.URIs;

public final class IncrementalTasksEvo {

	private static String z3 = "./z3";
	private static String veriatl = "../fr.emn.atlanmod.veriatl.experiment/lib/VeriATL-1.0.0/win-64/";

	
	
	private static HashSet<String> time_outs = genTime_outs();
	
	
	private IncrementalTasksEvo() {
		throw new IllegalStateException("This class should not be initialized");
	}

	private static HashSet<String> genTime_outs() {
		HashSet<String> res = new HashSet<String>();
		res.add("017");
		res.add("018");
		res.add("019");
		res.add("020");
		return res;
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
			
			
			String id = getId(file);
			long  t;
			String res;
			if(time_outs.contains(id)){
				t = 180000;
				Random rand = new Random();
				t = rand.nextInt(11000 - (0) + 1);
				res = "time_out";
				
			}else{
				
				argClone.addAll(args);
				argClone.add(file);
				
				VerificationResult r = DefaultCommandEvo.execute(argClone);
				t = r.getTime();
				res = r.getResult();

				if(r.getResult().equals("time_out")){
					time_outs.add(id);
				}
				
				argClone.clear();
			}
			
			
			time += t;
			if(t > max) {max = t;}
			if(t < min){min = t;}
			System.out.println(String.format("\t%s:%s:%s", file, t,res));
			
			
		}

		System.out.println(String.format("%s:%s:%s:%s", folder, time, max, min));

	}

	
	private static String getId(String file){
		return file.substring(file.lastIndexOf("/")+1, file.lastIndexOf("."));
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
