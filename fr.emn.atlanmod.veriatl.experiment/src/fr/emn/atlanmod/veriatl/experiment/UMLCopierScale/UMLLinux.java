/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.UMLCopierScale;

import fr.emn.atlanmod.veriatl.experiment.standalone.WindowsStandalone;



/**
 * @author zcheng
 *
 */
public class UMLLinux {
	static String[] folders = new String[]{"Auxu", "Sub-goals"};
	static String[] posts;
	static String org = "ORG";
	static String proj = "UMLScale";
	
    
	public static void main(String[] args) throws Exception {		
		testCodeGen();
	}
	
	
	
	public static void testCodeGen() throws Exception{
		WindowsStandalone.createTask(folders, null, org, null, "UML2UMLs", "UML", "UMLs");
		WindowsStandalone.doExperimentLinux(proj);

	}
	
	
	
}
