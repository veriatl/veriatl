package fr.emn.atlanmod.veriatl.core;



import java.io.File;
import java.nio.file.Path;
import java.util.ArrayList;

import org.eclipse.emf.common.util.URI;

import fr.emn.atlanmod.atl2boogie.xtend.util.CompilerConstants;
import fr.emn.atlanmod.veriatl.debug.decomposer.datastructure.Node;
import fr.emn.atlanmod.veriatl.debug.decomposer.datastructure.NodeHelper;
import fr.emn.atlanmod.veriatl.launcher.VeriATLLaunchConstants;
import fr.emn.atlanmod.veriatl.tools.Commands;
import fr.emn.atlanmod.veriatl.tools.VerificationResult;
import fr.emn.atlanmod.veriatl.util.URIs;


public final class NormalTasks {

	private static Path z3Path = Commands.resolve("Z3-4.5.1");
	private static Path veriATLPath = Commands.resolve("VeriATL-1.0.0");
	
    private NormalTasks() {
        throw new IllegalStateException("This class should not be initialized");
    }

    
    public static void execBoogie(Context context) {

		String postName = context.postName();

		if (postName.toLowerCase().equals("all")) {
			URI goals = context.basePath().appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME);
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
    private static void execBoogieSingle(Context context, String postName) {

		ArrayList<String> args = new ArrayList<String>();
        String z3abs = z3Path.resolve("z3")+".exe";
        
        // add Boogie options
        args.add("/nologo");
        args.add("/z3exe:"+z3abs);
        //args.add("/trace");
        
        // add prelude files
        String veriatlabs = veriATLPath.toAbsolutePath().toString()+"\\Prelude\\";
        args.addAll(getFiles(veriatlabs));
        
        // add auxu files
        String auxu = URIs.abs(context.basePath().appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME));
        args.addAll(getFiles(auxu));
        
		
		// add PO
		String post = URIs.abs(context.basePath()
        		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
        		.appendSegment(postName)
        		.appendSegment(CompilerConstants.FULL)
        		.appendFileExtension(CompilerConstants.BOOGIE_EXT)
        );
        args.add(post);
        
        
        VerificationResult r =Commands.boogie().exec().execute(args);
        System.out.println(String.format("Mode: Normal-verify-post\tid:%s\tres: %s\ttime:%s", postName, r.getTriBooleanResult(), r.getTime()));
            

    	

    }
    
    
    public static void debugBoogie(Context context) {
    	
    	String postName = context.postName();
    	

		if (postName.toLowerCase().equals("all")) {
			URI goals = context.basePath().appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME);
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
    private static void debugBoogieSingle(Context context, String postName) {
    	ArrayList<String> caches = Caches.loadCaches(context, postName);
		String currentCache = Caches.curCache(caches);
    	URI cCache = context.basePath().appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME).appendSegment(postName).appendSegment(currentCache).appendFileExtension(VeriATLLaunchConstants.CACHE_EXT);
    	ArrayList<Node> curTree = URIs.load(cCache);
    	
    	ArrayList<String> args = new ArrayList<String>();
        String z3abs = z3Path.resolve("z3")+".exe";
        
        // add Boogie options
        args.add("/nologo");
        args.add("/z3exe:"+z3abs);

        
        // add prelude files
        String veriatlabs = veriATLPath.toAbsolutePath().toString()+"\\Prelude\\";
        args.addAll(getFiles(veriatlabs));
        
        // add auxu files
        String auxu = URIs.abs(context.basePath().appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME));
        args.addAll(getFiles(auxu));
        
        // retrieve sub-goals
        ArrayList<String> argsClone = new ArrayList<String>();
        for(Node sub : NodeHelper.findAllLeafs(curTree)) {
        	
    		String subgoalAbsPath = URIs.abs(
            		context.basePath()
            		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
            		.appendSegment(postName)
            		.appendSegment(sub.getName()).appendFileExtension(CompilerConstants.BOOGIE_EXT)
            );
        	
    		argsClone.addAll(args);
        	argsClone.add(subgoalAbsPath);
        	
        	String genBy = URIs.abs(context.basePath()
            		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
            		.appendSegment(CompilerConstants.GENBY)
            		.appendFileExtension(CompilerConstants.BOOGIE_EXT)
            );
        	argsClone.add(genBy);
        	
        	VerificationResult r = Commands.boogie().exec().execute(argsClone);
        	argsClone.clear();
        	
        	// process result
        	Node n = NodeHelper.findNode(curTree, sub.getName());
        	n.Check(true);
			n.setResult(r.getTriBooleanResult());
        	n.setTime(r.getTime());
        	System.out.println(String.format("Mode: Normal-verify-sub\tid:%s-%s\tres: %s\ttime:%s", postName, n.getName(), r.getTriBooleanResult(), r.getTime()));
    			
        }
    
        
		// print proof tree
		//URI gvName = NodeHelper.printTreeBasic(context.basePath(), postName, curTree);
		//GraphVizTasks.execDot(gvName);
           
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
