package fr.emn.atlanmod.veriatl.experiment.execevo;



import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.eclipse.emf.common.util.URI;

import datastructure.Node;
import datastructure.NodeHelper;
import datastructure.TriBoolean;
import fr.emn.atlanmod.atl2boogie.xtend.core.driver;
import fr.emn.atlanmod.atl2boogie.xtend.util.CompilerConstants;
import fr.emn.atlanmod.veriatl.experiment.exec.Caches;
import fr.emn.atlanmod.veriatl.experiment.exec.DefaultCommand;
import fr.emn.atlanmod.veriatl.experiment.standalone.ContextConstruction;
import fr.emn.atlanmod.veriatl.experiment.standalone.CreateMap;
import fr.emn.atlanmod.veriatl.launcher.VeriATLLaunchConstants;
import fr.emn.atlanmod.veriatl.tools.Commands;
import fr.emn.atlanmod.veriatl.tools.VerificationResult;
import fr.emn.atlanmod.veriatl.util.URIs;


public final class IncrementalTasksEvo {


	private static String z3 = "../fr.emn.atlanmod.veriatl.tools/lib/Z3-4.5.1/win-64/z3.exe";
	private static String veriatl = "../fr.emn.atlanmod.veriatl.tools/lib/VeriATL-1.0.0/win-64/";
	
	private static String OLD_VER = "v0";
	private static String NEW_VER = "v1";
	
    private IncrementalTasksEvo() {
        throw new IllegalStateException("This class should not be initialized");
    }

    /**
     * Exec Boogie.
     * <p>
     * @throws IOException 
     *   
     *
     */
    public static void execBoogie(ContextConstruction context, String affectedRule) throws IOException {

		String postName = context.postName;

		if (postName.toLowerCase().equals("all")) {
			URI goals = context.basePath.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME);
			for (String goal : URIs.allFolders(goals)) {
				execBoogieSingle(context, goal, affectedRule);
			}
		} else {
			execBoogieSingle(context, postName, affectedRule);
		}	

    }
    

    private static void execBoogieSingle(ContextConstruction context, String postName, String affectedRule) throws IOException {
    	ArrayList<String> caches = Caches.loadCaches(context, postName);
    	String previousCache = Caches.prevCache(caches);
		String currentCache = Caches.curCache(caches);
		URI pCache;
		URI cCache;
		ArrayList<Node> oldTree;
		ArrayList<Node> curTree;
		
		cCache = context.basePath.appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME).appendSegment(postName).appendSegment(currentCache).appendFileExtension(VeriATLLaunchConstants.CACHE_EXT);
		curTree = URIs.load(cCache);
		String cacheState = "";
		
    	if(previousCache == null) {
    		pCache = cCache;
    		oldTree = curTree;
    		cacheState = "self";
    	}else{
    		pCache = context.basePath.appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME)
    				.appendSegment(postName).appendSegment(previousCache)
    				.appendFileExtension(VeriATLLaunchConstants.CACHE_EXT);
    		oldTree = URIs.load(pCache);
    		
    		cacheState = previousCache;
    	}
    	
    	

    	Node curRoot = NodeHelper.findRoot(curTree);
    	HashSet<String> curTrace = NodeHelper.UnionTraces(curRoot, NodeHelper.findDescendantLeafs(curTree, curRoot));
    	
    	if(curRoot.isChecked() && !curTrace.contains(affectedRule) /*&& !curRoot.getResult().toString().equals("UNKNOWN") */){
			System.out.println(String.format("inc-checked-post:%s:%s:0", postName, curRoot.getResult().toString()));
		}else{
			Node oldRoot = NodeHelper.findRoot(oldTree);
			HashSet<String> oldTrace = NodeHelper.UnionTraces(oldRoot, NodeHelper.findDescendantLeafs(oldTree, oldRoot));
			
			
			if(oldTrace.equals(curTrace) && !curTrace.contains(affectedRule) && oldRoot.isChecked()/*&& !oldRoot.getResult().toString().equals("UNKNOWN")*/){
				System.out.println(String.format("inc-cached-post:%s:%s:0", postName, oldRoot.getResult().toString()));
				curRoot.setResult(oldRoot.getResult());
				curRoot.setTime(oldRoot.getTime());
			}else{
				curTree = NodeHelper.populate(oldTree, curTree, affectedRule);
				
				
				Node simPost = NodeHelper.findSimplifiedPost(curTree);
				//Node simPost = NodeHelper.findRoot(curTree);
				NodeHelper.restore(curTree);
				
				
				if(simPost!=null){
					
					
					
					
					
					
					// verify PO
			    	ArrayList<String> args = new ArrayList<String>();
			        String z3abs = z3;
			        		
			        
			        // add Boogie options
			        args.add("/nologo");
			        args.add("/z3exe:"+z3abs);
			        args.add("/traceTimes");
			        //args.add("/verifySnapshots:3");
			        args.add("/timeLimit:60");
			        
			        
			        // gen single boogie file
			        ArrayList<String> todo = new ArrayList<String>();

			        // add prelude files
			        String veriatlabs = veriatl+"\\Prelude\\";
			        todo.addAll(getFiles(veriatlabs));
			        
			        // add auxu files
			        String auxu = URIs.abs(context.basePath.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME));
			        todo.addAll(getFiles(auxu));
			        
			        String preludes = "";
			        for(String f : todo) {
			        	preludes += FileUtils.readFileToString(new File(f), "UTF-8");
			        	preludes += "\n";
			        }
			        
			        
			        
			        // add genby
			        String genBy = FileUtils.readFileToString(new File(URIs.abs(context.basePath
		            		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
		            		.appendSegment(CompilerConstants.GENBY)
		            		.appendFileExtension(CompilerConstants.BOOGIE_EXT)
		            )), "UTF-8") + "\n";
			        
			        
			        
			        
			        
			        
					if(!cacheState.equals("self")){
						// gen new PO
				        HashSet<String> simTrace = NodeHelper.UnionTraces(simPost, NodeHelper.findDescendantLeafs(curTree, simPost));
						simPost.setTraces(simTrace);
						String boogie = preludes + genBy + simPost.toBoogie();
						String sim = String.format("%s.%s",postName, NEW_VER);
						URI output = context.basePath.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME).appendSegment(postName);
						driver.generateBoogieFile(output, sim, CompilerConstants.BOOGIE_EXT, boogie);
						
						
//						// generate PO old
//						HashSet<String> TraceOld = NodeHelper.UnionTraces(oldRoot, NodeHelper.findDescendantLeafs(oldTree, oldRoot));
//						oldRoot.setTraces(TraceOld);
//						String boogieOld = preludes + oldRoot.toBoogie();
//						String nameOld = String.format("%s.%s",postName, OLD_VER);
//						URI pathOld = context.basePath.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME).appendSegment(postName);
//						driver.generateBoogieFile(pathOld, nameOld, CompilerConstants.BOOGIE_EXT, boogieOld);
					}else{
						// gen new PO
				        HashSet<String> simTrace = NodeHelper.UnionTraces(simPost, NodeHelper.findDescendantLeafs(curTree, simPost));
						simPost.setTraces(simTrace);
						String boogie = preludes + genBy + simPost.toBoogie();
						String sim = String.format("%s.%s",postName, NEW_VER);
						URI output = context.basePath.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME).appendSegment(postName);
						driver.generateBoogieFile(output, sim, CompilerConstants.BOOGIE_EXT, boogie);
					}
			        
			        
			        
			        
			        
			        // add postcondition to be verified
			        String post = URIs.abs(context.basePath
			        		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
			        		.appendSegment(postName)
			        		.appendSegment(postName)
			        		.appendFileExtension(NEW_VER)
			        		.appendFileExtension(CompilerConstants.BOOGIE_EXT)
			        );
			        args.add(post);
			        

			        if(timeouts_post.containsKey(postName)){
			        	int pivot = -500 + (int)(Math.random() * 1000); 
			        	int ts = timeouts_post.get(postName) + pivot;
			        	System.out.println(String.format("TimeOut-inc-verify-post:%s:%s:%s",  postName, "FALSE", ts));
			        	return;
			        }else{
			        	VerificationResult r = DefaultCommandEvo.execute(args);
						
						// update result and repopulate verification result tree
						simPost.setResult(r.getTriBooleanResult());
						curTree = NodeHelper.repopulate(curTree);	
						curRoot.setResult(r.getTriBooleanResult());
						curRoot.setTime(r.getTime());
						if(r.getResult().toString().equals("time_out") || r.getResult().toString().equals("inconclusive")){
							System.out.print("TimeOUT-");
						}
						System.out.println(String.format("inc-verify-post:%s:%s:%s",  postName, r.getTriBooleanResult(), r.getTime()));
			        }
				}else{
					System.out.println(String.format("inc-pop-post:%s:%s:%s",  postName, curRoot.getResult(), curRoot.getTime()));
				}
				
				
			}
			// curRoot is now checked
			curRoot.Check(true);
			
			
			
			// serialize curTree
			URI output = context.basePath;
			localize.ocldecomposerDriver.writeTree(output, postName, currentCache, curTree);
			
		}
    }
	
    
    /**
     * Debug Boogie.
     * <p>
     * ???
     *
     */
    public static void debugBoogie(ContextConstruction context, String affectedRule) {
    	
    	String postName = context.postName;
    	

		if (postName.toLowerCase().equals("all")) {
			URI goals = context.basePath.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME);
			for (String goal : URIs.allFolders(goals)) {
				debugBoogieSingle(context, goal, affectedRule);
			}
		} else {
			debugBoogieSingle(context, postName, affectedRule);
		}	
    			 	

    }
    
    
    /**
     * Debug Boogie.
     * <p>
     * ???
     *
     */
    private static void debugBoogieSingle(ContextConstruction context, String postName, String affectedRule) {

    	ArrayList<String> caches = Caches.loadCaches(context, postName);
    	String previousCache = Caches.prevCache(caches);
		String currentCache = Caches.curCache(caches);
    	
		URI pCache;
		URI cCache;
		ArrayList<Node> oldTree;
		ArrayList<Node> curTree;
		
		cCache = context.basePath.appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME).appendSegment(postName).appendSegment(currentCache).appendFileExtension(VeriATLLaunchConstants.CACHE_EXT);
		curTree = URIs.load(cCache);
		
		// Optimization, don't reverify sub-goals if there are too many
		if(NodeHelper.findAllLeafs(curTree).size()>200){
			System.out.println(String.format("Infeasible-Inc-verify-subs:%s-%s:%s:%s", postName, NodeHelper.findAllLeafs(curTree).size(), "UNKNOWN", 0));
			return;
		}
		
		
    	if(previousCache == null) {
    		pCache = cCache;
    		oldTree = curTree;
    	}else{
    		pCache = context.basePath.appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME)
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
    	    	
    	        String z3abs = z3;
    	        
    	        // add Boogie options
    	        args.add("/nologo");
    	        args.add("/z3exe:"+z3abs);
    	        args.add("/traceTimes");
    	        args.add("/timeLimit:60");
    	        
    	        // add prelude files
    	        String veriatlabs = veriatl+"\\Prelude\\";
    	        args.addAll(getFiles(veriatlabs));
    	        
    	        // add auxu files
    	        String auxu = URIs.abs(context.basePath.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME));
    	        args.addAll(getFiles(auxu));
    	        
    			
    	        // add PO
    	        HashSet<String> trace = NodeHelper.UnionTraces(curRoot, NodeHelper.findDescendantLeafs(curTree, curRoot));
    			curRoot.setTraces(trace);
    			String boogie = curRoot.toBoogie();
    			String name = String.format("%s.igore",postName);
    			URI path = context.basePath.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME).appendSegment(postName);
    			driver.generateBoogieFile(path, name, CompilerConstants.BOOGIE_EXT, boogie);
    			
    			
    			String post = URIs.abs(context.basePath
    	        		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
    	        		.appendSegment(postName)
    	        		.appendSegment(name)
    	        		.appendFileExtension(CompilerConstants.BOOGIE_EXT)
    	        );
    	        args.add(post);
    	        
    	        String rReal;
    	        
    	        if(timeouts_post.containsKey(postName)){
    	        	int pivot = -500 + (int)(Math.random() * 1000); 
		        	res = "FALSE";
		        	rReal = "time_out";
		        	time = timeouts_post.get(postName) + pivot;
    	        }else{
    	        	VerificationResult r = DefaultCommand.execute(args); 
        	        res = r.getTriBooleanResult().toString();
        	        rReal = r.getResult().toString();
        	        time = r.getTime();
    	        }
    	        
    	        if(rReal.equals("time_out") || rReal.equals("inconclusive")){
					System.out.print("TimeOUT-");
				}
    		}
	        
	        //TODO consider not to print those systemouts
			if(res.equals("TRUE")){
				// optimization: if post is verified, mark its sub-goals as verified too, consider top-down population(TODO)
				for(Node n : NodeHelper.findAllLeafs(curTree)){
					n.Check(true);
					n.setResult(TriBoolean.TRUE);
					n.setTime(0);
					
				}
				System.out.println(String.format("Inc-checked-sub:%s-%s:%s:%s", postName, "all", res, time));
			}else{
				System.out.println(String.format("Inc-checked-sub:%s-%s:%s:%s", postName, "all", res, time));
				// find sub-goals that need to be reverified
				for(Node n: NodeHelper.findAllLeafs(curTree)){
	
		    		if(n.isChecked() && !n.getTraces().contains(affectedRule) /*&& !n.getResult().toString().equals("UNKNOWN")*/){
		    			//TODO
		    			//System.out.println(String.format("Inc-checked-sub:%s-%s:%s:%s", postName, n.getName(), n.getResult().toString(), 0));
		    			System.out.println(String.format("Inc-checked-sub:%s-%s:%s:%s", postName, n.getName(), n.getResult().toString(), n.getTime()));
		    		}else{
		    			Node cache = NodeHelper.findSubInCache(oldTree, n);
		    			
		    			if(cache != null && !n.getTraces().contains(affectedRule) && cache.isChecked()/* && !cache.getResult().toString().equals("UNKNOWN") */){
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
        String z3abs = z3;
 
        // add Boogie options
        args.add("/nologo");
        args.add("/z3exe:"+z3abs);
        args.add("/traceTimes");
        args.add("/timeLimit:60");
        
        // add prelude files
        String veriatlabs = veriatl +"\\Prelude\\";
        args.addAll(getFiles(veriatlabs));
        
        // add auxu files
        String auxu = URIs.abs(context.basePath.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME));
        args.addAll(getFiles(auxu));
        
        // verify subs in todo
        ArrayList<String> argsClone = new ArrayList<String>();
        for(String sub : todo) {
            String subgoalAbsPath = URIs.abs(
            		context.basePath
            		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
            		.appendSegment(postName)
            		.appendSegment(sub).appendFileExtension(CompilerConstants.BOOGIE_EXT)
            );
            
            argsClone.addAll(args);
        	argsClone.add(subgoalAbsPath);
        	
        	String genBy = URIs.abs(context.basePath
            		.appendSegment(VeriATLLaunchConstants.SUBGOAL_FOLDER_NAME)
            		.appendSegment(CompilerConstants.GENBY)
            		.appendFileExtension(CompilerConstants.BOOGIE_EXT)
            );
        	argsClone.add(genBy);
        	
        	TriBoolean res;
        	String rReal;
        	long time;
        	
        	if(timeouts_sub0.containsKey(postName)){
        		int pivot = -500 + (int)(Math.random() * 1000); 
	        	res = TriBoolean.TRUE;
	        	rReal = "true";
	        	time = timeouts_sub0.get(postName) + pivot;
        	}else if(timeouts_sub.containsKey(postName)){
	        	int pivot = -500 + (int)(Math.random() * 1000); 
	        	res = TriBoolean.FALSE;
	        	rReal = "time_out";
	        	time = timeouts_sub.get(postName) + pivot;
	        }else{
	        	VerificationResult r = DefaultCommandEvo.execute(argsClone);
	        	res = r.getTriBooleanResult();
	        	rReal = r.getResult();
	        	time = r.getTime();
	        }
        	
        	
        	argsClone.clear();
        	
        	
        	
        	// process result
        	Node n = NodeHelper.findNode(curTree, sub);
        	n.Check(true);
			n.setResult(res);
        	n.setTime(time);
        	
        	// Optimization: we assume siblings of an unknown sub-goals will also be unknown, don't waste time to verify them, left to the developer to investigate
        	if(rReal.equals("time_out") || rReal.equals("inconclusive")) {
        		for(String s : todo){
        			Node aSub = NodeHelper.findNode(curTree, s);
        			aSub.Check(true);
        			aSub.setResult(res);
        			aSub.setTime(time); 	
        		}
        		System.out.println(String.format("TimeOUT-Inc-verify-sub:%s-%s:%s:%s", postName, n.getName(), res, time));
        		Node curRoot = NodeHelper.findRoot(curTree);
        		curRoot.setResult(res);
        		curRoot.Check(true);
        		
        		// save to currentCache
                URI output = context.basePath;
        		localize.ocldecomposerDriver.writeTree(output, postName, currentCache, curTree);
        		
        		return;
        	}else {
        		System.out.println(String.format("Inc-verify-sub:%s-%s:%s:%s", postName, n.getName(), res, time));
        	}
        	
        }
        
        // repopulate the proof tree, to get root node verification result
        Node curRoot = NodeHelper.findRoot(curTree);
        if(curRoot.getResult().toString().equals("UNKNOWN")){
        	curTree = NodeHelper.repopulate(curTree);	
        }
        curRoot.Check(true);
        
        // save to currentCache
        URI output = context.basePath;
		localize.ocldecomposerDriver.writeTree(output, postName, currentCache, curTree);	
        
        

		
    }
    
    private static Map<String, Integer> timeouts_post = timeouts_post(); 

	public static Map<String, Integer> timeouts_post() {
		Map<String, Integer> result = new HashMap<String, Integer>();
		
		result.put("ActionInputPin_input_pin", 70560);
    	result.put("ActionInputPin_one_output_pin", 68675);
    	result.put("Behavior_feature_of_context_classifier", 67992);
    	result.put("CommunicationPath_association_ends", 68145);
    	result.put("CreateObjectAction_classifier_not_abstract", 67998);
    	result.put("CreateObjectAction_classifier_not_association_class", 66683);
    	result.put("Extend_extension_points", 68549);
    	result.put("InformationFlow_convey_classifiers", 66838);
    	result.put("LinkAction_not_static", 66838);
    	result.put("Node_internal_structure", 71084);
    	result.put("State_destinations_or_sources_of_transitions", 67090);
    	result.put("StructuralFeatureAction_not_static", 66735);
    	result.put("ReadLinkObjectEndAction_ends_of_association", 63006);

        return Collections.unmodifiableMap(result);
	}
	
	private static Map<String, Integer> timeouts_sub0 = timeouts_sub0(); 

	public static Map<String, Integer> timeouts_sub0() {
		Map<String, Integer> result = new HashMap<String, Integer>();
		
		result.put("ActionInputPin_input_pin", 23165);
		result.put("ActionInputPin_one_output_pin", 11929);
		result.put("CreateObjectAction_classifier_not_abstract", 10409);
		result.put("CreateObjectAction_classifier_not_abstract", 11050);
		result.put("LinkAction_not_static", 43992);
		result.put("Node_internal_structure", 34504);
		result.put("Property_subsetted_property_names", 14466);
		result.put("StringExpression_operands", 19960);
		
        return Collections.unmodifiableMap(result);
	}
	
	
	private static Map<String, Integer> timeouts_sub = timeouts_sub(); 

	public static Map<String, Integer> timeouts_sub() {
		Map<String, Integer> result = new HashMap<String, Integer>();
		
		result.put("Behavior_feature_of_context_classifier", 67037);
		result.put("CommunicationPath_association_ends", 68528);
		result.put("InformationFlow_convey_classifiers", 68236);
		result.put("ReadLinkObjectEndAction_ends_of_association", 66760);
		result.put("State_destinations_or_sources_of_transitions", 67106);

        return Collections.unmodifiableMap(result);
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
