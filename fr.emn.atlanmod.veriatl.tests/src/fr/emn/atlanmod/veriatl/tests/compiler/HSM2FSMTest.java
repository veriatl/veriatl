package fr.emn.atlanmod.veriatl.tests.compiler;


import static org.junit.Assert.assertTrue;

import org.eclipse.emf.common.util.URI;
import org.junit.Before;
import org.junit.Test;

import fr.emn.atlanmod.atl2boogie.xtend.core.driver;
import fr.emn.atlanmod.atl2boogie.xtend.util.CompilerConstants;
import fr.emn.atlanmod.veriatl.launcher.VeriATLLaunchConstants;
import fr.emn.atlanmod.veriatl.tests.util.BoogieTask;
import fr.emn.atlanmod.veriatl.tests.util.Strings;
import fr.emn.atlanmod.veriatl.tools.VerificationResult;


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
	private static URI output_uri;
	
	
	
	/**
	 * Test initialization.
	 * */
	@Before
	public void setUp() {
		// initialize URIs
		base_uri = URI.createURI(String.format("./resources/%s/", proj_under_test));		
		src_metamodel_uri = URI.createURI(String.format("./resources/%s/Source/%s", proj_under_test, source_metamodel_file_name));
		trg_metamodel_uri = URI.createURI(String.format("./resources/%s/Source/%s", proj_under_test, target_metamodel_file_name)); 
		contract_uri = URI.createURI(String.format("./resources/%s/Source/%s", proj_under_test, contract_file_name));
		transformation_uri = URI.createURI(String.format("./resources/%s/Source/%s", proj_under_test, transformation_file_name));	
		output_uri = base_uri.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME);
		
		
	}
	

	
	/**
	 * Test {@code compileSourceMetamodel} method generate syntactically correct source metamodel.
	 * */
	@Test
	public void compileSourceMetamodel_compile_ResultAreSyntacticalCorrect(){
		// run compiler
		driver.doSetup(transformation_uri, src_metamodel_uri, trg_metamodel_uri, contract_uri, output_uri);
		driver.compileSourceMetamodel();
		
		// run Boogie against compilation 
		URI src_mm_uri = base_uri
        		.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME)
        		.appendSegment(Strings.filename(source_metamodel_file_name))
        		.appendFileExtension(CompilerConstants.BOOGIE_EXT);
		
		// check compilation result, assert no error occurs.
		VerificationResult r = BoogieTask.syn_check_metamodel(src_mm_uri.toFileString());
		String status = r.status();
		
		assertTrue(status.equals("OK"));
	}
	
	
	
	
	
}
