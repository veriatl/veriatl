package fr.emn.atlanmod.veriatl.experiment.standalone;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class executioner {
	static String proj;
	static String preludePath;
	static String auxuPath;
	static String subgoalPath;
	static String boogie;
	static String z3;

	String[] excludes = new String[] { 
			"Behavior_feature_of_context_classifier.bpl",
			"CommunicationPath_association_ends.bpl" 
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

	public static void verify() throws Exception {

		List<String> params = new ArrayList<String>();
		params.add(boogie);
		params.add("/nologo");
		params.add("/z3exe:" + z3);
		params.add("/timeLimit:60");

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
				if (line.indexOf(", 0 errors") != -1) {
					if (line.indexOf("time out") != -1 || line.indexOf("inconclusive") != -1) {
						res = "inconclusive";
					} else {
						res = "true";
					}
					break;
				}
			}

			input.close();
			System.out.println(String.format("Id:%s,	Res:%s,	Time:%s ", id, res, time));
		}

	}

	public static void main(String[] args) throws Exception {
		init("UML", "single");
		verify();

	}
}