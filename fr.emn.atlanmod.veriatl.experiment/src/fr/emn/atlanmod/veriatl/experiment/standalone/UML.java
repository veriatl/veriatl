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
	//static String[] mutantsAdd = CreateMap.AddMutants();
	//private static final Map<String, String> changesAdd = CreateMap.Add();
	
	static String[] mutantsAdd = new String[]{"AR000"};
	private static final Map<String, String> changesAdd = add();
	static String org = "ORG";
	static String proj = "UML";
	

	public static Map<String, String> add() {
    	Map<String, String> result = new HashMap<String, String>();
        result.put("AR000", "CopyAbstraction_mutated");

        
        return Collections.unmodifiableMap(result);
    }
    
    
	public static void main(String[] args) throws Exception {	
		
		WindowsStandalone.createTask(folders, mutantsAdd, org, changesAdd, "UML2UMLs", "UML", "UMLs");
		// prepare cache
		WindowsStandalone.incPostInit(proj);
		
		
		

		
//		WindowsStandalone.incPostRegression(proj);
//		WindowsStandalone.standardSubInit(proj);
//		WindowsStandalone.incSubInit(proj);

//		WindowsStandalone.BoogieIncPostInit(proj);
	}
}
