package fr.emn.atlanmod.veriatl.core;



import java.io.File;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.emf.common.util.URI;

import datastructure.Node;
import datastructure.NodeHelper;
import fr.emn.atlanmod.atl2boogie.xtend.core.driver;
import fr.emn.atlanmod.atl2boogie.xtend.util.CompilerConstants;
import fr.emn.atlanmod.veriatl.launcher.VeriATLLaunchConstants;
import fr.emn.atlanmod.veriatl.tools.Commands;
import fr.emn.atlanmod.veriatl.util.URIs;


public final class IncrementalTasks {

	private static Path z3Path = Commands.resolve("Z3-4.5.1");
	private static Path veriATLPath = Commands.resolve("VeriATL-1.0.0");
	
    private IncrementalTasks() {
        throw new IllegalStateException("This class should not be initialized");
    }

    /**
     * Exec Boogie.
     * <p>
     * ???
     *
     */
    public static void execBoogie(Context context, String affectedRule, String previousCache, String currentCache) {
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
        
        // add postcondition to be verified
        String post = URIs.abs(context.basePath()
        		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
        		.appendSegment(context.postName())
        		.appendSegment(CompilerConstants.ORG)
        		.appendFileExtension(CompilerConstants.BOOGIE_EXT)
        );
        args.add(post);
        
        
        Commands.boogie().exec().execute(args);
    }
    

	
    /**
     * Debug Boogie.
     * <p>
     * ???
     *
     */
    public static void debugBoogie(Context context, String affectedRule, String previousCache, String currentCache) {
    	String postName = context.postName();
    	URI pCache = context.basePath().appendSegment(CompilerConstants.CACHE).appendSegment(postName).appendSegment(previousCache).appendFileExtension(CompilerConstants.CACHEEXT);
    	URI cCache = context.basePath().appendSegment(CompilerConstants.CACHE).appendSegment(postName).appendSegment(currentCache).appendFileExtension(CompilerConstants.CACHEEXT);
    	
    	ArrayList<Node> oldTree = URIs.load(pCache);
    	ArrayList<Node> curTree = URIs.load(cCache);
    	
    	ArrayList<String> todo = new ArrayList<String>();
    	
    		
    	for(Node n: NodeHelper.findAllLeafs(curTree)){

    		if(n.isChecked()){
    			System.out.println(String.format("Checked: %s is %s", n.getName(), n.getResult().toString()));
    		}else{
    			Node cache = NodeHelper.findSubInCache(oldTree, n);
    			
    			if(cache != null && !cache.getResult().toString().equals("UNKNOWN") && !n.getTraces().contains(affectedRule)){
    				System.out.println(String.format("%s is %s", n.getName(), cache.getResult().toString()));
    			}else{
    				todo.add(n.getName());
    			}
    		}
    	}
    	
    	
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
        
        // verify subs in todo
        ArrayList<String> argsClone = new ArrayList<String>();
        for(String sub : todo) {
            String subgoalAbsPath = URIs.abs(
            		context.basePath()
            		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
            		.appendSegment(postName)
            		.appendSegment(sub).appendFileExtension(CompilerConstants.BOOGIE_EXT)
            );
            
            argsClone.addAll(args);
        	argsClone.add(subgoalAbsPath);
        	
        	String genBy = URIs.abs(context.basePath()
            		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
            		.appendSegment(CompilerConstants.GENBY)
            		.appendFileExtension(CompilerConstants.BOOGIE_EXT)
            );
        	argsClone.add(genBy);
        	
        	Commands.boogie().exec().execute(argsClone);
        	argsClone.clear();
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
