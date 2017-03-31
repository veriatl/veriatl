/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.UMLCopier;

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
		testAdd();
		testDel();
		testGuard();
		testBind();
	}
	
	
	
	public static void testAdd() throws Exception{
		WindowsStandalone.createTask(folders, mutantsAdd, org, changesAdd, "UML2UMLs", "UML", "UMLs");
	
		// fine-grained incremental verification mode
		WindowsStandalone.incPostInit(proj);
		WindowsStandalone.incPostRegressionNoCache(proj);
		WindowsStandalone.incPostRegressionCache(proj);
		
		// sub-goal verification mode
		WindowsStandalone.standardSubInit(proj);
		WindowsStandalone.incSubInit(proj);

		// Boogie inc verification mode
		WindowsStandalone.BoogieIncPostInit(proj);
	}
	
	
	public static void testDel() throws Exception{
		WindowsStandalone.createTask(folders, mutantsDel, org, changesDel, "UML2UMLs", "UML", "UMLs");
	
		// fine-grained incremental verification mode
		WindowsStandalone.incPostInit(proj);
		WindowsStandalone.incPostRegressionNoCache(proj);
		WindowsStandalone.incPostRegressionCache(proj);
		
		// sub-goal verification mode
		WindowsStandalone.standardSubInit(proj);
		WindowsStandalone.incSubInit(proj);

		// Boogie inc verification mode
		WindowsStandalone.BoogieIncPostInit(proj);
	}
	
	public static void testGuard() throws Exception{
		WindowsStandalone.createTask(folders, mutantsFilter, org, changesFilter, "UML2UMLs", "UML", "UMLs");
	
		// fine-grained incremental verification mode
		WindowsStandalone.incPostInit(proj);
		WindowsStandalone.incPostRegressionNoCache(proj);
		WindowsStandalone.incPostRegressionCache(proj);
		
		// sub-goal verification mode
		WindowsStandalone.standardSubInit(proj);
		WindowsStandalone.incSubInit(proj);

		// Boogie inc verification mode
		WindowsStandalone.BoogieIncPostInit(proj);
	}
	
	public static void testBind() throws Exception{
		WindowsStandalone.createTask(folders, mutantsBind, org, changesBind, "UML2UMLs", "UML", "UMLs");
	
		// fine-grained incremental verification mode
		WindowsStandalone.incPostInit(proj);
		WindowsStandalone.incPostRegressionNoCache(proj);
		WindowsStandalone.incPostRegressionCache(proj);
		
		// sub-goal verification mode
		WindowsStandalone.standardSubInit(proj);
		WindowsStandalone.incSubInit(proj);

		// Boogie inc verification mode
		WindowsStandalone.BoogieIncPostInit(proj);
	}
}
