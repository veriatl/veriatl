package fr.emn.atlanmod.veriatl.tests.util;

import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;

import org.eclipse.emf.common.util.URI;

import fr.emn.atlanmod.veriatl.tools.Commands;
import fr.emn.atlanmod.veriatl.tools.VerificationResult;
import fr.emn.atlanmod.veriatl.util.Files;
import fr.emn.atlanmod.veriatl.util.URIs;

public class BoogieTask {

	static Path z3Path = Commands.resolve("Z3-4.5.1");
	static Path veriATLPath = Commands.resolve("VeriATL-1.0.0");
	
    /**
     * Run Boogie with the given arguments.
     * 
     * <p> By default, a dry run of skeleton gives Prelude is syntactical correct or not.
     */
	public static VerificationResult skeleton(String... args) {

		ArrayList<String> boogie_args = new ArrayList<String>();
		String z3abs = z3Path.resolve("z3") + ".exe";

		// add Boogie options
		boogie_args.add("/nologo");
		boogie_args.add("/z3exe:" + z3abs);


		// load prelude files
		String veriatlabs = veriATLPath.toAbsolutePath().toString() + "\\Prelude\\";
		boogie_args.addAll(Files.namesAbs(veriatlabs));

		// add args
		boogie_args.addAll(Arrays.asList(args));

		return Commands.boogie().exec().execute(boogie_args);

	}
	
	/**
	 * Run Boogie Syntactic Check for the given generated file of a metamodel. 
	 * */
	public static VerificationResult syn_check_metamodel(String mm_path){
		return BoogieTask.skeleton(mm_path);
	}
}
