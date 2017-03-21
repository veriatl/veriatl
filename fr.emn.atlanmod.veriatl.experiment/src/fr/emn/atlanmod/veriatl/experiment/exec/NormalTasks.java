package fr.emn.atlanmod.veriatl.experiment.exec;



import java.io.File;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashSet;

import org.eclipse.emf.common.util.URI;

import datastructure.Node;
import datastructure.NodeHelper;
import fr.emn.atlanmod.atl2boogie.xtend.core.driver;
import fr.emn.atlanmod.atl2boogie.xtend.util.CompilerConstants;
import fr.emn.atlanmod.veriatl.experiment.standalone.ContextConstruction;
import fr.emn.atlanmod.veriatl.launcher.VeriATLLaunchConstants;
import fr.emn.atlanmod.veriatl.tools.Commands;
import fr.emn.atlanmod.veriatl.tools.VerificationResult;
import fr.emn.atlanmod.veriatl.util.URIs;


public final class NormalTasks {

	private static String z3 = "../fr.emn.atlanmod.veriatl.tools/lib/Z3-4.5.1/win-64/z3.exe";
	private static String veriatl = "../fr.emn.atlanmod.veriatl.tools/lib/VeriATL-1.0.0/win-64/";
	
    private NormalTasks() {
        throw new IllegalStateException("This class should not be initialized");
    }

    
    public static void execBoogie(ContextConstruction context) {

		String postName = context.postName;

		if (postName.toLowerCase().equals("all")) {
			URI goals = context.basePath.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME);
			for (String goal : URIs.allFolders(goals)) {
				execBoogieSingle(context, goal);
			}
		} else {
			execBoogieSingle(context, postName);
		}	

    }
    
    /**
     * Exec Boogie in Normal mode: no cache system used.
     * <p>
     * ???
     *
     */
    private static void execBoogieSingle(ContextConstruction context, String postName) {

		ArrayList<String> args = new ArrayList<String>();
        String z3abs = z3;
        
        // add Boogie options
        args.add("/nologo");
        args.add("/z3exe:"+z3abs);
        //args.add("/trace");
        
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
        args.add(post);
        
        
        VerificationResult r = DefaultCommand.execute(args);
        System.out.println(String.format("Normal-verify-post:%s:%s:%s", postName, r.getTriBooleanResult(), r.getTime()));
            

    	

    }
    
    
    public static void debugBoogie(ContextConstruction context) {
    	
    	String postName = context.postName;
    	

		if (postName.toLowerCase().equals("all")) {
			URI goals = context.basePath.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME);
			for (String goal : URIs.allFolders(goals)) {
				debugBoogieSingle(context, goal);
			}
		} else {
			debugBoogieSingle(context, postName);
		}	
    			 	

    }
    
    /**
     * Debug Boogie in Normal mode: no cache system used.
     * <p>
     * ???
     *
     */
    private static void debugBoogieSingle(ContextConstruction context, String postName) {
    	ArrayList<String> caches = Caches.loadCaches(context, postName);
		String currentCache = Caches.curCache(caches);
    	URI cCache = context.basePath.appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME).appendSegment(postName).appendSegment(currentCache).appendFileExtension(VeriATLLaunchConstants.CACHE_EXT);
    	ArrayList<Node> curTree = URIs.load(cCache);
    	
    	ArrayList<String> args = new ArrayList<String>();
        String z3abs = z3;
        
        // add Boogie options
        args.add("/nologo");
        args.add("/z3exe:"+z3abs);

        
        // add prelude files
        String veriatlabs = veriatl+"\\Prelude\\";
        args.addAll(getFiles(veriatlabs));
        
        // add auxu files
        String auxu = URIs.abs(context.basePath.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME));
        args.addAll(getFiles(auxu));
        
        // retrieve sub-goals
        ArrayList<String> argsClone = new ArrayList<String>();
        for(Node sub : NodeHelper.findAllLeafs(curTree)) {
        	
    		String subgoalAbsPath = URIs.abs(
            		context.basePath
            		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
            		.appendSegment(postName)
            		.appendSegment(sub.getName()).appendFileExtension(CompilerConstants.BOOGIE_EXT)
            );
        	
    		argsClone.addAll(args);
        	argsClone.add(subgoalAbsPath);
        	
        	String genBy = URIs.abs(context.basePath
            		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
            		.appendSegment(CompilerConstants.GENBY)
            		.appendFileExtension(CompilerConstants.BOOGIE_EXT)
            );
        	argsClone.add(genBy);
        	
        	VerificationResult r = DefaultCommand.execute(argsClone);
        	argsClone.clear();
        	
        	// process result
        	Node n = NodeHelper.findNode(curTree, sub.getName());
        	n.Check(true);
			n.setResult(r.getTriBooleanResult());
        	n.setTime(r.getTime());
        	System.out.println(String.format("Normal-verify-sub:%s-%s:%s:%s", postName, n.getName(), r.getTriBooleanResult(), r.getTime()));
    			
        }
    

           
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
