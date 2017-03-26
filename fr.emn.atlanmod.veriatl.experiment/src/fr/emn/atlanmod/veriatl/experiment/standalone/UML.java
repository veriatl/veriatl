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
	static String[] mutantsAdd = CreateMap.AddMutants();
	private static final Map<String, String> changesAdd = CreateMap.Add();
	
	static String[] mutantsDel = CreateMap.DelMutants();
	private static final Map<String, String> changesDel = CreateMap.Del();
	static String[] mutantsFilter = CreateMap.FilterMutants();
	
	private static final Map<String, String> changesFilter = CreateMap.Filter();
	
	static String[] mutantsBind = CreateMap.BindMutants();
	private static final Map<String, String> changesBind = CreateMap.Bind();
	
	static String org = "ORG";
	static String proj = "UML";
	


    
    
	public static void main(String[] args) throws Exception {	
		
		WindowsStandalone.createTask(folders, mutantsAdd, org, changesAdd, "UML2UMLs", "UML", "UMLs");
//		WindowsStandalone.createTask(folders, mutantsDel, org, changesDel, "UML2UMLs", "UML", "UMLs");
//		WindowsStandalone.createTask(folders, mutantsFilter, org, changesFilter, "UML2UMLs", "UML", "UMLs");
//		WindowsStandalone.createTask(folders, mutantsBind, org, changesBind, "UML2UMLs", "UML", "UMLs");
		
		
		// prepare cache
//		WindowsStandalone.incPostInit(proj);
//		WindowsStandalone.incPostRegressionNoCache(proj);
		WindowsStandalone.incPostRegressionCache(proj);
		
//		WindowsStandalone.standardSubInit(proj);
//		WindowsStandalone.incSubInit(proj);

//		WindowsStandalone.BoogieIncPostInit(proj);
	}
}
