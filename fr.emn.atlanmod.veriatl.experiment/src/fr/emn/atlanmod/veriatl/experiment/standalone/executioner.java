package fr.emn.atlanmod.veriatl.experiment.standalone;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class executioner {
	static String proj;
	static String preludePath;
	static String auxuPath;
	static String subgoalPath;
	static String boogie;
	static String z3;

	static String[] excludes = new String[] { 
			"Behavior_feature_of_context_classifier", //Solved
			"CommunicationPath_association_ends", //Solved
			"ConsiderIgnoreFragment_type",	
			"Constraint_not_apply_to_self",
			"CreateObjectAction_classifier_not_abstract",
			"DurationConstraint_has_one_or_two_constrainedElements",
			"ReadLinkObjectEndAction_ends_of_association",
			"TimeConstraint_has_one_constrainedElement" 
	};
	
	
	static String[] includes = new String[] { 
			
			"InformationFlow_convey_classifiers", //Solved:80
			//"State_destinations_or_sources_of_transitions", //Solved:180

	};



	public static void init(String p, String mission) {
		proj = p;
		auxuPath = String.format("./%s/Auxu/", proj);
		subgoalPath = String.format("./%s/Sub-goals/%s", proj, mission);

		preludePath = "./lib/VeriATL-1.0.0/win-64/Prelude/";
		boogie = "./lib/Boogie-2.3.0/win-64/Boogie.exe";
		z3 = "./lib/Z3-4.5.1/win-64/z3.exe";

	}

	private static ArrayList<String> getFiles(String folder) {
		ArrayList<String> r = new ArrayList<String>();
		File f = new File(folder);
		for (final File file : f.listFiles()) {
			r.add(file.getAbsolutePath());
		}
		return r;
	}

	private static void moveFile(String folder, String src) throws IOException {
		String moveTo = folder + "/finished/";
		Files.createDirectories(Paths.get(moveTo));
		
		File a = new File(src);
		a.renameTo(new File(moveTo + a.getName()));
		a.delete();
	}
	
	private static boolean isVerify(String trg) {
		boolean res = false;
		
		for(String post : excludes) {
			
			if(trg.indexOf(post)!=-1) {
				
				res = true;
			}
		}
		return res;
	}
	
	

	
	private static boolean isVerify2(String trg) {
		boolean res = false;
		
		for(String post : includes) {
			if(trg.indexOf(post)!=-1) {
				if(!isVerify(trg)) {
					res = true;
				}
				
			}
		}
			
		return res;
	}
	
	public static void verify() throws Exception {

		List<String> params = new ArrayList<String>();
		params.add(boogie);
		params.add("/nologo");
		params.add("/z3exe:" + z3);
		params.add("/timeLimit:150");

		params.addAll(getFiles(preludePath));
		params.addAll(getFiles(auxuPath));

		for (String post : getFiles(subgoalPath)) {

			// params.add(post); // this might be a good idea to see at which
			// point we over the treshhold.

			String id = String.format("%s-%s", proj, post);

			List<String> paramsClone = new ArrayList<String>();
			paramsClone.addAll(params);
			paramsClone.add(post);

			String[] args = paramsClone.toArray(new String[0]);


			//if(isVerify2(post)) {
			if(true) {
				long start = System.currentTimeMillis();
				Process p = Runtime.getRuntime().exec(args);
				p.waitFor();
				long end = System.currentTimeMillis();
				
				BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
				String res = "false";

				long time = end - start;

				String line;
				while ((line = input.readLine()) != null) {
					//System.out.println(line);
					if(line.indexOf("Boogie program verifier finished") != -1){
						if (line.indexOf("inconclusive") != -1) {
							res = "inconclusive";
						} else if (line.indexOf("time out") != -1){
							res = "time_out";
						} else{
							if (line.indexOf(", 0 errors") != -1) {
								res = "true";
							}
						}
						break;
					}
					
				}

				input.close();
				System.out.println(String.format("Id:%s,	Res:%s,	Time:%s ", id, res, time));
				moveFile(subgoalPath, post);
				
			}
			

			
		}

	}

	public static void main(String[] args) throws Exception {
		//init("UML", "subsumes/4-Pin_control_pins");
		//init("UML", "subsumes/4-FinalNode_no_outgoing_edges");
		//verify();
		
			
//		File f = new File("./UML/Sub-goals/subsumes/");
//		for (final File file : f.listFiles()) {
//			if(file.isDirectory()){
//				String n = String.format("subsumes/%s", file.getName());
//				init("UML", n);
//				verify();
//			}
//		}
			
		
		init("UML", "big_disjoint_15");
		verify();
		

	}
}
