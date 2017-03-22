/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.standalone;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;



/**
 * @author zcheng
 *
 */
public class UML {
	static String[] folders = new String[]{"Auxu", "Caches", "Sub-goals"};
	static String[] posts;
	static String[] mutants = new String[]{"AF2", "AR", "DB3", "DR1","MB6", "MF6"};
	//static String[] mutants = new String[]{"MB6"};
	static String org = "ORG";
	static String proj = "UML2UMLs";
	private static final Map<String, String> changes = createMap();

    private static Map<String, String> createMap() {
        Map<String, String> result = new HashMap<String, String>();
        result.put("AF2", "RS2RS");
        result.put("AR", "CS2RS");
        result.put("DB3", "IS2IS");
        result.put("DR1", "SM2SM");
        result.put("MB6", "T2TB");
        result.put("MF6", "T2TB");
        
        return Collections.unmodifiableMap(result);
    }
    
    
	public static void main(String[] args) throws Exception {	
		WindowsStandalone.createTask(folders, mutants, org, changes, "UML2UMLs", "UML", "UMLs");
		
//		WindowsStandalone.standardPostInit(proj);
		WindowsStandalone.incPostInit(proj);
//		WindowsStandalone.standardSubInit(proj);
//		WindowsStandalone.incSubInit(proj);

		WindowsStandalone.BoogieIncPostInit(proj);
	}
}
