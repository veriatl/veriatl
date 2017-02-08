package fr.emn.atlanmod.veriatl.core;



import java.io.File;
import java.nio.file.Path;
import java.util.ArrayList;

import fr.emn.atlanmod.veriatl.launcher.VeriATLLaunchConstants;
import fr.emn.atlanmod.veriatl.tools.Commands;
import fr.emn.atlanmod.veriatl.util.URIs;


public final class Tasks {

	private static Path z3Path = Commands.resolve("Z3-4.5.1");
	private static Path veriATLPath = Commands.resolve("VeriATL-1.0.0");
	
    private Tasks() {
        throw new IllegalStateException("This class should not be initialized");
    }

    /**
     * Step 1. Exec Boogie.
     * <p>
     * ???
     *
     */
    public static void execBoogie(Context context) {
    	ArrayList<String> args = new ArrayList<String>();
        String z3abs = z3Path.resolve("z3")+".exe";
        
        // add Boogie options
        args.add("/nologo");
        args.add("/z3exe:"+z3abs);
        args.add("/trace");
        
        // add prelude files
        String veriatlabs = veriATLPath.toAbsolutePath().toString()+"\\Prelude\\";
        args.addAll(getFiles(veriatlabs));
        
        // add auxu files
        String auxu = URIs.abs(context.basePath().appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME));
        args.addAll(getFiles(auxu));
        
        // add postcondition to be verified
        String post = URIs.abs(context.basePath()
        		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
        		.appendSegment(context.postName())
        		.appendSegment("original")
        		.appendFileExtension("bpl")
        );
        args.add(post);
        
        
        Commands.boogie().exec().execute(args);
    }
    
    
    
    
    private static ArrayList<String> getFiles(String folder){
    	ArrayList<String> r = new ArrayList<String>();
    	File f = new File(folder);
    	for(final File file : f.listFiles()){
    		r.add(file.getAbsolutePath());
    	}
    	return r;
    }
    
}
