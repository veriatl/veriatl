package fr.emn.atlanmod.veriatl.core;



import java.io.File;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;

import org.eclipse.emf.common.util.URI;

import datastructure.Node;
import datastructure.NodeHelper;
import datastructure.TriBoolean;
import fr.emn.atlanmod.atl2boogie.xtend.core.driver;
import fr.emn.atlanmod.atl2boogie.xtend.util.CompilerConstants;
import fr.emn.atlanmod.veriatl.launcher.VeriATLLaunchConstants;
import fr.emn.atlanmod.veriatl.tools.Commands;
import fr.emn.atlanmod.veriatl.tools.VerificationResult;
import fr.emn.atlanmod.veriatl.util.Files;
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
     *   
     *
     */
    public static void execBoogie(Context context, String affectedRules) {

		String postName = context.postName();
		
		String[] aRules = affectedRules.split(",");
		Arrays.parallelSetAll(aRules, (i) -> aRules[i].trim());
		
		
		if(aRules.length == 1){
			String affectedRule = aRules[0];
			if (postName.toLowerCase().equals("all")) {
				URI goals = context.basePath().appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME);
				for (String goal : URIs.allFolders(goals)) {
					execBoogieSingle(context, goal, affectedRule);
				}
			} else {
				execBoogieSingle(context, postName, affectedRule);
			}	
		}else{
			if (postName.toLowerCase().equals("all")) {
				URI goals = context.basePath().appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME);
				for (String goal : URIs.allFolders(goals)) {
					execBoogieSingleMultiStep(context, goal, aRules);
				}
			} else {
				execBoogieSingleMultiStep(context, postName, aRules);
			}
		}

		

    }
    

    private static void execBoogieSingleMultiStep(Context context, String postName, String[] affectedRules) {
    	ArrayList<String> caches = Caches.loadCaches(context, postName);
    	
    	if(affectedRules.length > caches.size() || caches.size() < 2){
    		System.out.println("Insuffcient numbers of caches for made multi-step changes");
    		return;
    	}
    	
    	for(int i = 0; i < affectedRules.length; i++){
    		String affectedRule = affectedRules[i];
    		boolean finalChange = (i == affectedRules.length - 1); 
    		
    		String previousCache = caches.get(i);
    		String currentCache = caches.get(i+1);
    		URI pCache;
    		URI cCache;
    		ArrayList<Node> oldTree;
    		ArrayList<Node> curTree;
    		
    		cCache = context.basePath().appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME).appendSegment(postName).appendSegment(currentCache).appendFileExtension(VeriATLLaunchConstants.CACHE_EXT);
    		curTree = URIs.load(cCache);
    		String cacheState = "";
    		
        	if(previousCache == null) {
        		pCache = cCache;
        		oldTree = curTree;
        		cacheState = "self";
        	}else{
        		pCache = context.basePath().appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME)
        				.appendSegment(postName).appendSegment(previousCache)
        				.appendFileExtension(VeriATLLaunchConstants.CACHE_EXT);
        		oldTree = URIs.load(pCache);
        		
        		cacheState = previousCache;
        	}
        	
        	

        	Node curRoot = NodeHelper.findRoot(curTree);
        	HashSet<String> curTrace = NodeHelper.UnionTraces(curRoot, NodeHelper.findDescendantLeafs(curTree, curRoot));
        	
        	if(curRoot.isChecked() && !curTrace.contains(affectedRule) && !curRoot.getResult().toString().equals("UNKNOWN")){
    			System.out.println(String.format("Mode: inc-checked-post\t%s is %s", postName, curRoot.getResult().toString()));
    		}else{
    			Node oldRoot = NodeHelper.findRoot(oldTree);
    			HashSet<String> oldTrace = NodeHelper.UnionTraces(oldRoot, NodeHelper.findDescendantLeafs(oldTree, oldRoot));
    			
    			
    			if(oldTrace.equals(curTrace) && !oldRoot.getResult().toString().equals("UNKNOWN") && !curTrace.contains(affectedRule)){
    				System.out.println(String.format("Mode: inc-cached-post\t%s is %s", postName, oldRoot.getResult().toString()));
    				curRoot.setResult(oldRoot.getResult());
    				curRoot.setTime(oldRoot.getTime());
    			}else{
    				curTree = NodeHelper.populate(oldTree, curTree, affectedRule);
    				
    				
    				Node simPost = NodeHelper.findSimplifiedPost(curTree);
    				NodeHelper.restore(curTree);
    				
    				
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
    			        args.addAll(Files.namesAbs(veriatlabs));
    			        
    			        // add auxu files
    			        String auxu = URIs.abs(context.basePath().appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME));
    			        args.addAll(Files.namesAbs(auxu));
    			        
    			        // add postcondition to be verified
    			        String post = URIs.abs(context.basePath()
    			        		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
    			        		.appendSegment(postName)
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
    		        	
    			        if(finalChange){
    			        	VerificationResult r = Commands.boogie().exec().execute(args);
        					
        					// update result and repopulate verification result tree
        					simPost.setResult(r.getTriBooleanResult());
        					curTree = NodeHelper.repopulate(curTree);	
        					curRoot.setResult(r.getTriBooleanResult());
        					curRoot.setTime(r.getTime());
        					System.out.println(String.format("Mode: inc-verify-post\tusing Cache:%s\tid:%s\tres: %s\ttime:%s", cacheState, postName, r.getTriBooleanResult(), r.getTime()));
    			        }else{
    			        	// nothing to do if it is not a final change
    			        }
    			        
    				}else{
    					System.out.println(String.format("Mode: inc-pop-post\tusing Cache:%s\tid:%s\tres: %s\ttime:%s", cacheState, postName, curRoot.getResult(), curRoot.getTime()));
    				}
    				
    				
    			}
    			// curRoot is now checked
    			curRoot.Check(true);
    			
    			// serialize curTree
    			URI output = context.basePath();
    			localize.ocldecomposerDriver.writeTree(output, postName, currentCache, curTree);
    			
    		}
    	}
    	
    	
    	
    }
    
    private static void execBoogieSingle(Context context, String postName, String affectedRule) {
    	ArrayList<String> caches = Caches.loadCaches(context, postName);
    	String previousCache = Caches.prevCache(caches);
		String currentCache = Caches.curCache(caches);
		URI pCache;
		URI cCache;
		ArrayList<Node> oldTree;
		ArrayList<Node> curTree;
		
		cCache = context.basePath().appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME).appendSegment(postName).appendSegment(currentCache).appendFileExtension(VeriATLLaunchConstants.CACHE_EXT);
		curTree = URIs.load(cCache);
		String cacheState = "";
		
    	if(previousCache == null) {
    		pCache = cCache;
    		oldTree = curTree;
    		cacheState = "self";
    	}else{
    		pCache = context.basePath().appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME)
    				.appendSegment(postName).appendSegment(previousCache)
    				.appendFileExtension(VeriATLLaunchConstants.CACHE_EXT);
    		oldTree = URIs.load(pCache);
    		
    		cacheState = previousCache;
    	}
    	
    	

    	Node curRoot = NodeHelper.findRoot(curTree);
    	HashSet<String> curTrace = NodeHelper.UnionTraces(curRoot, NodeHelper.findDescendantLeafs(curTree, curRoot));
    	
    	if(curRoot.isChecked() && !curTrace.contains(affectedRule) && !curRoot.getResult().toString().equals("UNKNOWN")){
			System.out.println(String.format("Mode: inc-checked-post\t%s is %s", postName, curRoot.getResult().toString()));
		}else{
			Node oldRoot = NodeHelper.findRoot(oldTree);
			HashSet<String> oldTrace = NodeHelper.UnionTraces(oldRoot, NodeHelper.findDescendantLeafs(oldTree, oldRoot));
			
			
			if(oldTrace.equals(curTrace) && !oldRoot.getResult().toString().equals("UNKNOWN") && !curTrace.contains(affectedRule)){
				System.out.println(String.format("Mode: inc-cached-post\t%s is %s", postName, oldRoot.getResult().toString()));
				curRoot.setResult(oldRoot.getResult());
				curRoot.setTime(oldRoot.getTime());
			}else{
				curTree = NodeHelper.populate(oldTree, curTree, affectedRule);
				
				
				Node simPost = NodeHelper.findSimplifiedPost(curTree);
				NodeHelper.restore(curTree);
				
				
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
			        args.addAll(Files.namesAbs(veriatlabs));
			        
			        // add auxu files
			        String auxu = URIs.abs(context.basePath().appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME));
			        args.addAll(Files.namesAbs(auxu));
			        
			        // add postcondition to be verified
			        String post = URIs.abs(context.basePath()
			        		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
			        		.appendSegment(postName)
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
					System.out.println(String.format("Mode: inc-verify-post\tusing Cache:%s\tid:%s\tres: %s\ttime:%s", cacheState, postName, r.getTriBooleanResult(), r.getTime()));
				}else{
					System.out.println(String.format("Mode: inc-pop-post\tusing Cache:%s\tid:%s\tres: %s\ttime:%s", cacheState, postName, curRoot.getResult(), curRoot.getTime()));
				}
				
				
			}
			// curRoot is now checked
			curRoot.Check(true);
			
			// serialize curTree
			URI output = context.basePath();
			localize.ocldecomposerDriver.writeTree(output, postName, currentCache, curTree);
			
		}
    }
	
    
    /**
     * Debug Boogie.
     * <p>
     * ???
     *
     */
    public static void debugBoogie(Context context, String affectedRules) {
    	
    	String postName = context.postName();
    	String[] aRules = affectedRules.split(",");
    	Arrays.parallelSetAll(aRules, (i) -> aRules[i].trim());
    	
    	
		if(aRules.length == 1){
			String affectedRule = aRules[0];
			if (postName.toLowerCase().equals("all")) {
				URI goals = context.basePath().appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME);
				for (String goal : URIs.allFolders(goals)) {
					debugBoogieSingle(context, goal, affectedRule);
				}
			} else {
				debugBoogieSingle(context, postName, affectedRule);
			}		
		}else{
			if (postName.toLowerCase().equals("all")) {
				URI goals = context.basePath().appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME);
				for (String goal : URIs.allFolders(goals)) {
					debugBoogieSingleMultiStep(context, goal, aRules);
				}
			} else {
				debugBoogieSingleMultiStep(context, postName, aRules);
			}	
		}	

    }
    
    /**
     * Debug Boogie.
     * <p>
     * ???
     *
     */
    private static void debugBoogieSingleMultiStep(Context context, String postName, String[] affectedRules) {

    	ArrayList<String> caches = Caches.loadCaches(context, postName);
    	if(affectedRules.length > caches.size() || caches.size() < 2){
    		System.out.println("Insuffcient numbers of caches for made multi-step changes");
    		return;
    	}
    	
    	for(int i = 0; i < affectedRules.length; i++){
    		String affectedRule = affectedRules[i];
    		boolean finalChange = (i == affectedRules.length - 1); 
    		
    		String previousCache = caches.get(i);
    		String currentCache = caches.get(i+1);
        	
    		URI pCache;
    		URI cCache;
    		ArrayList<Node> oldTree;
    		ArrayList<Node> curTree;
    		
    		cCache = context.basePath().appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME)
    				.appendSegment(postName).appendSegment(currentCache)
    				.appendFileExtension(VeriATLLaunchConstants.CACHE_EXT);
    		curTree = URIs.load(cCache);
    		
    		pCache = context.basePath().appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME)
    				.appendSegment(postName).appendSegment(previousCache)
    				.appendFileExtension(VeriATLLaunchConstants.CACHE_EXT);
    		oldTree = URIs.load(pCache);
        	
        	
        	if(! finalChange){
        		// only do cache checking and saving if the made change is not final change.
        		for(Node n: NodeHelper.findAllLeafs(curTree)){
        			
		    		if(n.isChecked() && !n.getTraces().contains(affectedRule) && !n.getResult().toString().equals("UNKNOWN")){
		    			System.out.println(String.format("Inc-checked-sub:%s-%s:%s:0", postName, n.getName(), n.getResult().toString()));
		    		}else{
		    			Node cache = NodeHelper.findSubInCache(oldTree, n);
		    			
		    			if(cache != null && !cache.getResult().toString().equals("UNKNOWN") && !n.getTraces().contains(affectedRule)){
		    				System.out.println(String.format("Inc-cached-sub:%s-%s:%s:0", postName, n.getName(), cache.getResult().toString()));
		    				n.Check(true);
		    				n.setResult(cache.getResult());
		    				n.setTime(0);
		    			}
		    		}
		    	}
            	
                // repopulate the proof tree, to get root node verification result
                Node curRoot = NodeHelper.findRoot(curTree);
                if(curRoot.getResult().toString().equals("UNKNOWN")){
                	curTree = NodeHelper.repopulate(curTree);	
                }
                
                // save to currentCache
                URI output = context.basePath();
        		localize.ocldecomposerDriver.writeTree(output, postName, currentCache, curTree);
        		
        		
        	}else{
        		
        		ArrayList<String> todo = new ArrayList<String>();
	        	
            	// verify full post
            	{
            		// Optimization: do not reverify if curRoot is checked
            		String res = "UNKNOWN";
            		long time = 0;
            		Node curRoot = NodeHelper.findRoot(curTree);
            		if(curRoot.isChecked()){
            			res = curRoot.getResult().toString();
            			time = curRoot.getTime();
            		}else{
            			ArrayList<String> args = new ArrayList<String>();
            	    	
            	        String z3abs = z3Path.resolve("z3")+".exe";;
            	        
            	        // add Boogie options
            	        args.add("/nologo");
            	        args.add("/z3exe:"+z3abs);
            	        //args.add("/trace");
            	        
            	        // add prelude files
            	        String veriatlabs = veriATLPath.toAbsolutePath().toString()+"\\Prelude\\";
            	        args.addAll(Files.namesAbs(veriatlabs));
            	        
            	        // add auxu files
            	        String auxu = URIs.abs(context.basePath().appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME));
            	        args.addAll(Files.namesAbs(auxu));
            	        
            			
            			// add PO
            			String post = URIs.abs(context.basePath()
            	        		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
            	        		.appendSegment(postName)
            	        		.appendSegment(CompilerConstants.FULL)
            	        		.appendFileExtension(CompilerConstants.BOOGIE_EXT)
            	        );
            	        args.add(post);
            	        
            	        
            	        VerificationResult r = Commands.boogie().exec().execute(args); 
            	        res = r.getResult().toString().toUpperCase();
            	        time = r.getTime();
            		}
        	        
        	        
        			if(res.equals("TRUE")){
        				// optimization: if post is verified, mark its sub-goals as verified too
        				for(Node n : NodeHelper.findAllLeafs(curTree)){
        					n.Check(true);
        					n.setResult(TriBoolean.TRUE);
        					n.setTime(0);
        					
        				}
        				System.out.println(String.format("Inc-checked-sub:%s-%s:%s:%s", postName, "all", "TRUE", time));
        			}else{
        				// find sub-goals that need to be reverified
        				for(Node n: NodeHelper.findAllLeafs(curTree)){
        	
        		    		if(n.isChecked() && !n.getTraces().contains(affectedRule) && !n.getResult().toString().equals("UNKNOWN")){
        		    			System.out.println(String.format("Inc-checked-sub:%s-%s:%s:0", postName, n.getName(), n.getResult().toString()));
        		    		}else{
        		    			Node cache = NodeHelper.findSubInCache(oldTree, n);
        		    			
        		    			if(cache != null && !cache.getResult().toString().equals("UNKNOWN") && !n.getTraces().contains(affectedRule)){
        		    				System.out.println(String.format("Inc-cached-sub:%s-%s:%s:0", postName, n.getName(), cache.getResult().toString()));
        		    				n.Check(true);
        		    				n.setResult(cache.getResult());
        		    				n.setTime(0);
        		    			}else{
        		    				
        		    				todo.add(n.getName());
        		    			}
        		    		}
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
                args.addAll(Files.namesAbs(veriatlabs));
                
                // add auxu files
                String auxu = URIs.abs(context.basePath().appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME));
                args.addAll(Files.namesAbs(auxu));
                
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
                	System.out.println(String.format("Mode: Inc-verify-sub\tid:%s-%s\tres: %s\ttime:%s", postName, n.getName(), r.getTriBooleanResult(), r.getTime()));
                }
                 
                // repopulate the proof tree, to get root node verification result
                Node curRoot = NodeHelper.findRoot(curTree);
                if(curRoot.getResult().toString().equals("UNKNOWN")){
                	curTree = NodeHelper.repopulate(curTree);	
                }
                
                // save to currentCache
                URI output = context.basePath();
        		localize.ocldecomposerDriver.writeTree(output, postName, currentCache, curTree);	
                
                
        		// print proof tree
        		URI gvName = NodeHelper.printTreeBasic(context.basePath(), postName, curTree);
        		GraphVizTasks.execDot(gvName);	
        	}
        	
    		
    	}
		
    }
    
    /**
     * Debug Boogie.
     * <p>
     * ???
     *
     */
    private static void debugBoogieSingle(Context context, String postName, String affectedRule) {

    	ArrayList<String> caches = Caches.loadCaches(context, postName);
    	String previousCache = Caches.prevCache(caches);
		String currentCache = Caches.curCache(caches);
    	
		URI pCache;
		URI cCache;
		ArrayList<Node> oldTree;
		ArrayList<Node> curTree;
		
		cCache = context.basePath().appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME).appendSegment(postName).appendSegment(currentCache).appendFileExtension(VeriATLLaunchConstants.CACHE_EXT);
		curTree = URIs.load(cCache);
		
    	if(previousCache == null) {
    		pCache = cCache;
    		oldTree = curTree;
    	}else{
    		pCache = context.basePath().appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME)
    				.appendSegment(postName).appendSegment(previousCache)
    				.appendFileExtension(VeriATLLaunchConstants.CACHE_EXT);
    		oldTree = URIs.load(pCache);
    	}
    	
    	
    	
    	ArrayList<String> todo = new ArrayList<String>();
    	

    	
    	// verify full post
    	{
    		// Optimization: do not reverify if curRoot is checked
    		String res = "UNKNOWN";
    		long time = 0;
    		Node curRoot = NodeHelper.findRoot(curTree);
    		if(curRoot.isChecked()){
    			res = curRoot.getResult().toString();
    			time = curRoot.getTime();
    		}else{
    			ArrayList<String> args = new ArrayList<String>();
    	    	
    	        String z3abs = z3Path.resolve("z3")+".exe";;
    	        
    	        // add Boogie options
    	        args.add("/nologo");
    	        args.add("/z3exe:"+z3abs);
    	        //args.add("/trace");
    	        
    	        // add prelude files
    	        String veriatlabs = veriATLPath.toAbsolutePath().toString()+"\\Prelude\\";
    	        args.addAll(Files.namesAbs(veriatlabs));
    	        
    	        // add auxu files
    	        String auxu = URIs.abs(context.basePath().appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME));
    	        args.addAll(Files.namesAbs(auxu));
    	        
    			
    			// add PO
    			String post = URIs.abs(context.basePath()
    	        		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
    	        		.appendSegment(postName)
    	        		.appendSegment(CompilerConstants.FULL)
    	        		.appendFileExtension(CompilerConstants.BOOGIE_EXT)
    	        );
    	        args.add(post);
    	        
    	        
    	        VerificationResult r = Commands.boogie().exec().execute(args); 
    	        res = r.getResult().toString().toUpperCase();
    	        time = r.getTime();
    		}
	        
	        
			if(res.equals("TRUE")){
				// optimization: if post is verified, mark its sub-goals as verified too
				for(Node n : NodeHelper.findAllLeafs(curTree)){
					n.Check(true);
					n.setResult(TriBoolean.TRUE);
					n.setTime(0);
					
				}
				System.out.println(String.format("Inc-checked-sub:%s-%s:%s:%s", postName, "all", "TRUE", time));
			}else{
				// find sub-goals that need to be reverified
				for(Node n: NodeHelper.findAllLeafs(curTree)){
	
		    		if(n.isChecked() && !n.getTraces().contains(affectedRule) && !n.getResult().toString().equals("UNKNOWN")){
		    			System.out.println(String.format("Inc-checked-sub:%s-%s:%s:0", postName, n.getName(), n.getResult().toString()));
		    		}else{
		    			Node cache = NodeHelper.findSubInCache(oldTree, n);
		    			
		    			if(cache != null && !cache.getResult().toString().equals("UNKNOWN") && !n.getTraces().contains(affectedRule)){
		    				System.out.println(String.format("Inc-cached-sub:%s-%s:%s:0", postName, n.getName(), cache.getResult().toString()));
		    				n.Check(true);
		    				n.setResult(cache.getResult());
		    				n.setTime(0);
		    			}else{
		    				
		    				todo.add(n.getName());
		    			}
		    		}
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
        args.addAll(Files.namesAbs(veriatlabs));
        
        // add auxu files
        String auxu = URIs.abs(context.basePath().appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME));
        args.addAll(Files.namesAbs(auxu));
        
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
        	System.out.println(String.format("Mode: Inc-verify-sub\tid:%s-%s\tres: %s\ttime:%s", postName, n.getName(), r.getTriBooleanResult(), r.getTime()));
        }
         
        // repopulate the proof tree, to get root node verification result
        Node curRoot = NodeHelper.findRoot(curTree);
        if(curRoot.getResult().toString().equals("UNKNOWN")){
        	curTree = NodeHelper.repopulate(curTree);	
        }
        
        // save to currentCache
        URI output = context.basePath();
		localize.ocldecomposerDriver.writeTree(output, postName, currentCache, curTree);	
        
        
		// print proof tree
		URI gvName = NodeHelper.printTreeBasic(context.basePath(), postName, curTree);
		GraphVizTasks.execDot(gvName);
		
    }
    
    

	


}
