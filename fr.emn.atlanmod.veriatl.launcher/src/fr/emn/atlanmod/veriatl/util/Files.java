package fr.emn.atlanmod.veriatl.util;

import java.io.File;
import java.util.ArrayList;

public class Files {

	/**
	 * Get absolute path names within the given folder
	 * */
	public static ArrayList<String> namesAbs(String folder){
    	ArrayList<String> r = new ArrayList<String>();
    	File f = new File(folder);
    	for(final File file : f.listFiles()){
    		r.add(file.getAbsolutePath());
    	}
    	return r;
    }
	

}
