/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.exec;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;

import fr.emn.atlanmod.veriatl.experiment.standalone.ContextConstruction;
import fr.emn.atlanmod.veriatl.launcher.VeriATLLaunchConstants;
import fr.emn.atlanmod.veriatl.util.URIs;

/**
 * @author zcheng
 *
 */
public class Caches {
    public static ArrayList<String> loadCaches(ContextConstruction context, String postName) {
		ArrayList<String> caches = URIs.allNames(context.basePath
				.appendSegment(VeriATLLaunchConstants.CACHE_FOLDER_NAME).appendSegment(postName));
		Collections.sort(caches, new Comparator<String>() {
			public int compare(String s1, String s2) {
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
				Date d1;
				Date d2;
				try {
					d1 = df.parse(s1);
					d2 = df.parse(s2);
					return d1.compareTo(d2);
				} catch (ParseException e) {
					e.printStackTrace();
				}

				return 0;
			}
		});
		
		return caches;
    }
	
    public static String curCache(ArrayList<String> caches) {
		return caches.get(caches.size()-1);
	}
	
    public static String prevCache(ArrayList<String> caches) {
		if(caches.size()<=1) {
			return null;
		}else {
			return caches.get(caches.size()-2);
		}
	}
}
