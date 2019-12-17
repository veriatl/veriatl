package fr.emn.atlanmod.veriatl.core;



import java.util.ArrayList;
import java.util.List;

import org.eclipse.emf.common.util.URI;

import fr.emn.atlanmod.veriatl.util.URIs;


public final class GraphVizTasks {


    private GraphVizTasks() {
        throw new IllegalStateException("This class should not be initialized");
    }

    
    
	public static void execDot(URI file) {		
		String abs = URIs.getBaseName(URIs.abs(file));
		
		List<String> params = new ArrayList<String>();
		params.add("dot");
		params.add("-Tpdf");
		params.add(String.format("%s.gv", abs));
		params.add("-o");
		params.add(String.format("%s.pdf", abs));
			
		
		String[] args = params.toArray(new String[0]);		
        Process p;
		try {
			p = Runtime.getRuntime().exec(args);
			p.waitFor();
		} catch (Exception e) {
			e.printStackTrace();
		}
		URIs.deleteFile(file);
	}
}
