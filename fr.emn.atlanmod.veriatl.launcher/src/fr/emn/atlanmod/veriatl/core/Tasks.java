package fr.emn.atlanmod.veriatl.core;



import java.io.File;
import java.nio.file.Path;
import java.util.ArrayList;

import fr.emn.atlanmod.veriatl.tools.Commands;


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

    	
        String z3abs = z3Path.resolve("z3")+".exe";
        String veriatlabs = veriATLPath.toAbsolutePath().toString()+"\\Prelude\\";
        
        getFiles(veriatlabs);
        
        Commands.boogie().exec().execute(
        		"/nologo",
                "/z3exe:"+z3abs, 
                
        );
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
