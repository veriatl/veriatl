/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.UMLCopierMutant;

import fr.emn.atlanmod.veriatl.experiment.standalone.WindowsStandalone;



/**
 * @author zcheng
 *
 */
public class UML {
	static String[] folders = new String[]{"Auxu", "Caches", "Sub-goals", "Boogie"};
	static String[] posts;
	static String org = "ORG";
	static String proj = "UML";
	
    
	public static void main(String[] args) throws Exception {		
		testCodeGen();
	}
	
	
	
	public static void testCodeGen() throws Exception{
		WindowsStandalone.createTask(folders, null, org, null, "UML2UMLs", "UML", "UMLs");
	
		WindowsStandalone.cleanAll(proj);
		
		// post fine-grained incremental verification mode
		WindowsStandalone.codeGen(proj);
	}
	
	
	
}
