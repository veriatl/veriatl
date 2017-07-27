package fr.emn.atlanmod.veriatl.tests.compiler;


import org.eclipse.emf.common.util.URI;
import org.junit.Before;
import org.junit.Test;


/**
 * VeriATL compiler test on HSM2FSM model transformation
 * */
public class HSM2FSMTest {

	private static String proj_under_test = "HSM2FSM";
	
	/**
	 * Test initialization:
	 * */
	@Before
	public static void setUp() {
		// project name
		
		URI.createURI(uri);
		
		URI base = URI.createURI(proj_under_test);		
		URI src = URI.createURI(String.format("./%s/Source/%s.ecore", proj_under_test, s));
		URI trg = URI.createURI(String.format("./%s/Source/%s.ecore", proj_under_test, t)); 
		URI contract = URI.createURI(String.format("./%s/Source/%sContract.atl", proj_under_test, moduleName));
		
	}
}
