/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.standalone;

import java.util.Map;



/**
 * @author zcheng
 *
 */
public class UML {
	static String[] folders = new String[]{"Auxu", "Caches", "Sub-goals"};
	static String[] posts;
	static String[] mutantsAdd = CreateMap.AddMutants();
	
	//static String[] mutants = new String[]{"DR1"};
	static String org = "ORG";
	static String proj = "UML";
	private static final Map<String, String> changesAdd = CreateMap.Add();


    
    
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
