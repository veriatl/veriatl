package fr.emn.atlanmod.veriatl.experiment.exec;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import org.apache.commons.io.FileUtils;
import org.eclipse.emf.common.util.URI;

import fr.emn.atlanmod.atl2boogie.xtend.core.driver;
import fr.emn.atlanmod.atl2boogie.xtend.util.CompilerConstants;
import fr.emn.atlanmod.veriatl.experiment.execevo.DefaultCommandEvo;
import fr.emn.atlanmod.veriatl.experiment.standalone.ContextConstruction;
import fr.emn.atlanmod.veriatl.launcher.VeriATLLaunchConstants;
import fr.emn.atlanmod.veriatl.tools.VerificationResult;
import fr.emn.atlanmod.veriatl.util.URIs;

public class BoogieTasks {
	
	private static String z3 = "../fr.emn.atlanmod.veriatl.tools/lib/Z3-4.5.1/win-64/z3.exe";
	private static String veriatl = "../fr.emn.atlanmod.veriatl.tools/lib/VeriATL-1.0.0/win-64/";
	
	public static ArrayList<String> gen(ContextConstruction context, String suffix) throws IOException{
		ArrayList<String> args = new ArrayList<String>();
		String postName = context.postName;

		if (postName.toLowerCase().equals("all")) {
			URI goals = context.basePath.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME);
			for (String goal : URIs.allFolders(goals)) {
				genSingle(context, goal, suffix);
				args.add(goal);
			}
		} else {
			genSingle(context, postName, suffix);
			args.add(postName);
		}	

		return args;
    }
	
	
	
	private static void genSingle(ContextConstruction context, String postName, String suffix) throws IOException {
		ArrayList<File> args = new ArrayList<File>();
		// add prelude files
        String veriatlabs = veriatl+"\\Prelude\\";
        args.addAll(getFiles(veriatlabs));
        
        // add auxu files
        String auxu = URIs.abs(context.basePath.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME));
        args.addAll(getFiles(auxu));
        
        // add PO
 		String post = URIs.abs(context.basePath
         		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
         		.appendSegment(postName)
         		.appendSegment(CompilerConstants.FULL)
         		.appendFileExtension(CompilerConstants.BOOGIE_EXT)
         );
        args.add(new File(post));
        
        String content = "";
        for(File f : args) {
        	content += FileUtils.readFileToString(f, "UTF-8");
        	content += "\n";
        }
        
        
        URI outputPath = context.basePath
         		.appendSegment("Boogie");
        
        driver.generateBoogieFile(outputPath, String.format("%s.%s", postName,suffix), CompilerConstants.BOOGIE_EXT, content);
        
	}
	
	public static void exec(ContextConstruction context, ArrayList<String> posts) throws IOException{

		for(String post : posts) {
			ArrayList<String> args = new ArrayList<String>();
	        String z3abs = z3;
	        		
	        
	        // add Boogie options
	        args.add("/nologo");
	        args.add("/z3exe:"+z3abs);
	        args.add("/timeLimit:60");
	        args.add("/verifySnapshots:3");
	        args.add("/traceTimes");
	       
	        
	        // add postcondition to be verified
	        String postName = URIs.abs(context.basePath
	        		.appendSegment("Boogie")
	        		.appendSegment(post)
	        		.appendFileExtension(CompilerConstants.BOOGIE_EXT)
	        );
	        
	        
	        args.add(postName);

	       
	        
	        VerificationResult r = DefaultCommandEvo.execute(args);
	        System.out.println(String.format("inc-boogie-post:%s:%s:%s",  post, r.getTriBooleanResult().toString(), r.getTime()));
		}

    }
	
	
	 private static ArrayList<File> getFiles(String folder){
	    	ArrayList<File> r = new ArrayList<File>();
	    	File f = new File(folder);
	    	for(final File file : f.listFiles()){
	    		r.add(file);
	    	}
	    	return r;
	    }
}
