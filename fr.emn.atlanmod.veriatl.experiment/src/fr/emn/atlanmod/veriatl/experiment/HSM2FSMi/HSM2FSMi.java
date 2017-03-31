/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.HSM2FSMi;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import fr.emn.atlanmod.veriatl.experiment.standalone.WindowsStandalone;



/**
 * @author zcheng
 *
 */
public class HSM2FSMi {
	static String[] folders = new String[]{"Auxu", "Caches", "Sub-goals", "Boogie"};
	static String[] posts;
	static String[] mutants = new String[]{"AF2", "AR", "DB3", "DR1","MB6", "MF6"};
	
	static String org = "ORG";
	static String proj = "HSM2FSMi";
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
		WindowsStandalone.createTask(folders, mutants, org, changes, "HSM2FSM", "HSM", "FSM");
		

		WindowsStandalone.cleanAll(proj);
		
		// post fine-grained incremental verification mode
		WindowsStandalone.incPostInit(proj);
		WindowsStandalone.incPostRegressionNoCache(proj);
		WindowsStandalone.incPostRegressionCache(proj);
		
		// sub-goal fine-grained incremental verification mode
		WindowsStandalone.incSubInit(proj);

		// Boogie inc verification mode
		WindowsStandalone.BoogieIncPostInit(proj);

	}
}
