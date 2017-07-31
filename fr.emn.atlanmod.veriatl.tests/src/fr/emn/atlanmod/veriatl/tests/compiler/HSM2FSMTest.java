package fr.emn.atlanmod.veriatl.tests.compiler;


import org.eclipse.emf.common.util.URI;
import org.junit.Before;
import org.junit.Test;


/**
 * VeriATL compiler test on HSM2FSM model transformation
 * */
public class HSM2FSMTest {

	private static String proj_under_test = "HSM2FSM";
	private static String source_metamodel_file_name = "HSM.ecore";
	private static String target_metamodel_file_name = "FSM.ecore";
	private static String contract_file_name = "HSM2FSMContract.atl";
	private static String transformation_file_name = "HSM2FSM.atl";
	
	
	private static URI base_uri;
	private static URI src_metamodel_uri;
	private static URI trg_metamodel_uri;
	private static URI contract_uri;
	private static URI transformation_uri;
	
	/**
	 * Test initialization.
	 * */
	@Before
	public static void setUp() {
		// initialize URIs
		base_uri = URI.createURI(String.format("./%s/", proj_under_test));		
		src_metamodel_uri = URI.createURI(String.format("./%s/Source/%s", proj_under_test, source_metamodel_file_name));
		trg_metamodel_uri = URI.createURI(String.format("./%s/Source/%s", proj_under_test, target_metamodel_file_name)); 
		contract_uri = URI.createURI(String.format("./%s/Source/%s", proj_under_test, contract_file_name));
		transformation_uri = URI.createURI(String.format("./%s/Source/%s", proj_under_test, transformation_file_name));
		
	}
}
