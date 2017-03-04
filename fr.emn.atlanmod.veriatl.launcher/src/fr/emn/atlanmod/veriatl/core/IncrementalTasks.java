package fr.emn.atlanmod.veriatl.core;



import java.io.File;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashSet;

import org.eclipse.emf.common.util.URI;

import datastructure.Node;
import datastructure.NodeHelper;
import fr.emn.atlanmod.atl2boogie.xtend.core.driver;
import fr.emn.atlanmod.atl2boogie.xtend.util.CompilerConstants;
import fr.emn.atlanmod.veriatl.launcher.VeriATLLaunchConstants;
import fr.emn.atlanmod.veriatl.tools.Commands;
import fr.emn.atlanmod.veriatl.tools.VerificationResult;
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
     * TODO bug in simplified POST trace
     *
     */
    public static void execBoogie(Context context, String affectedRule, String previousCache, String currentCache) {
    	String postName = context.postName();
    	URI pCache = context.basePath().appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME).appendSegment(postName).appendSegment(previousCache).appendFileExtension(VeriATLLaunchConstants.CACHE_EXT);
    	URI cCache = context.basePath().appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME).appendSegment(postName).appendSegment(currentCache).appendFileExtension(VeriATLLaunchConstants.CACHE_EXT);
    	
    	ArrayList<Node> oldTree = URIs.load(pCache);
    	ArrayList<Node> curTree = URIs.load(cCache);
    	
    	Node curRoot = NodeHelper.findRoot(curTree);
    	HashSet<String> curTrace = NodeHelper.UnionTraces(curRoot, NodeHelper.findDescendantLeafs(curTree, curRoot));
    	
    	if(curRoot.isChecked()){
			System.out.println(String.format("Checked: %s is %s", postName, curRoot.getResult().toString()));
		}else{
			Node oldRoot = NodeHelper.findRoot(oldTree);
			HashSet<String> oldTrace = NodeHelper.UnionTraces(curRoot, NodeHelper.findDescendantLeafs(oldTree, oldRoot));
			
			
			if(oldTrace.equals(curTrace) && !oldRoot.getResult().toString().equals("UNKNOWN") && !curTrace.contains(affectedRule)){
				System.out.println(String.format("%s is cached with %s", postName, oldRoot.getResult().toString()));
				curRoot.setResult(oldRoot.getResult());
			}else{
				curTree = NodeHelper.populate(oldTree, curTree, affectedRule);
				
				Node simPost = NodeHelper.findSimplifiedPost(curTree);

				
				if(simPost!=null){
					// generate PO
					HashSet<String> simTrace = NodeHelper.UnionTraces(simPost, NodeHelper.findDescendantLeafs(curTree, simPost));

					simPost.setTraces(simTrace);
					String boogie = simPost.toBoogie();
					String sim = String.format("%s_sim",postName);
					URI output = context.basePath().appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME).appendSegment(postName);
					driver.generateBoogieFile(output, sim, CompilerConstants.BOOGIE_EXT, boogie);
					
					
					
					// verify PO
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
			        		.appendSegment(sim)
			        		.appendFileExtension(CompilerConstants.BOOGIE_EXT)
			        );
			        args.add(post);
			        
			        String genBy = URIs.abs(context.basePath()
		            		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
		            		.appendSegment(CompilerConstants.GENBY)
		            		.appendFileExtension(CompilerConstants.BOOGIE_EXT)
		            );
			        args.add(genBy);
		        	
			        VerificationResult r = Commands.boogie().exec().execute(args);
					
					// update result and repopulate verification result tree
					simPost.setResult(r.getTriBooleanResult());
					curTree = NodeHelper.repopulate(curTree);	
					curRoot.setResult(r.getTriBooleanResult());
					curRoot.setTime(r.getTime());
					System.out.println(curRoot.getResult());
				}
				
				// curRoot is now checked
				curRoot.Check(true);
				
				// serialize curTree
				URI output = context.basePath();
				localize.ocldecomposerDriver.writeTree(output, postName, currentCache, curTree);
			}
		}
    	
    	
    	
    	
    	
    	
    	

    }
    

	
    /**
     * Debug Boogie.
     * <p>
     * ???
     *
     */
    public static void debugBoogie(Context context, String affectedRule, String previousCache, String currentCache) {
    	String postName = context.postName();
    	URI pCache = context.basePath().appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME).appendSegment(postName).appendSegment(previousCache).appendFileExtension(VeriATLLaunchConstants.CACHE_EXT);
    	URI cCache = context.basePath().appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME).appendSegment(postName).appendSegment(currentCache).appendFileExtension(VeriATLLaunchConstants.CACHE_EXT);
    	
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
    				n.Check(true);
    				n.setResult(cache.getResult());
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
        	
        	VerificationResult r = Commands.boogie().exec().execute(argsClone);
        	argsClone.clear();
        	
        	// process result
        	Node n = NodeHelper.findNode(curTree, sub);
        	n.Check(true);
			n.setResult(r.getTriBooleanResult());
        	n.setTime(r.getTime());
        }
          
        // save to currentCache
        URI output = context.basePath();
		localize.ocldecomposerDriver.writeTree(output, postName, currentCache, curTree);	
        
        
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
