package fr.emn.atlanmod.veriatl.tests.compiler;


import static org.junit.Assert.assertEquals;

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

	// Meta information of the test suite
	private static String proj_under_test = "HSM2FSM";
	private static String source_metamodel_file_name = "HSM.ecore";
	private static String target_metamodel_file_name = "FSM.ecore";
	private static String contract_file_name = "HSM2FSMContract.atl";
	private static String transformation_file_name = "HSM2FSM.atl";
	
	// URI of compilation inputs
	private static URI base_uri;
	private static URI src_metamodel_uri;
	private static URI trg_metamodel_uri;
	private static URI contract_uri;
	private static URI transformation_uri;
	private static URI output_uri;
	
	// URI of boogie generated files
	private static URI boogie_src_mm_uri;
	private static URI boogie_trg_mm_uri;
	private static URI boogie_constants_uri;
	private static URI boogie_surj_uri;
	private static URI boogie_match_uri;
	
	// Absolute path of boogie generated files
	private static String boogie_src_mm_abs;
	private static String boogie_trg_mm_abs;
	private static String boogie_constants_abs;
	private static String boogie_surj_abs;
	private static String boogie_match_abs;
	
	/**
	 * Test initialization.
	 * */
	@Before
	public void setUp() {
		// Initialize URIs of compilation inputs
		base_uri = URI.createURI(String.format("./resources/%s/", proj_under_test));		
		src_metamodel_uri = URI.createURI(String.format("./resources/%s/Source/%s", proj_under_test, source_metamodel_file_name));
		trg_metamodel_uri = URI.createURI(String.format("./resources/%s/Source/%s", proj_under_test, target_metamodel_file_name)); 
		contract_uri = URI.createURI(String.format("./resources/%s/Source/%s", proj_under_test, contract_file_name));
		transformation_uri = URI.createURI(String.format("./resources/%s/Source/%s", proj_under_test, transformation_file_name));	
		output_uri = base_uri.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME);
		
		
		// Compile source metamodel to Boogie code
		driver.doSetup(transformation_uri, src_metamodel_uri, trg_metamodel_uri, contract_uri, output_uri);
		driver.compileSourceMetamodel();
		driver.compileTargetMetamodel();
		driver.compileATL();
		driver.compileConstants();
		
		// Initialize URIs of boogie generated files
		boogie_src_mm_uri = base_uri
        		.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME)
        		.appendSegment(Strings.filename(source_metamodel_file_name))
        		.appendFileExtension(CompilerConstants.BOOGIE_EXT);
		
		boogie_trg_mm_uri = base_uri
        		.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME)
        		.appendSegment(Strings.filename(target_metamodel_file_name))
        		.appendFileExtension(CompilerConstants.BOOGIE_EXT);
		
		boogie_constants_uri = base_uri
        		.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME)
        		.appendSegment(CompilerConstants.CONST)
        		.appendFileExtension(CompilerConstants.BOOGIE_EXT);
		
		boogie_surj_uri = base_uri
        		.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME)
        		.appendSegment(Strings.filename(CompilerConstants.SURJECT))
        		.appendFileExtension(CompilerConstants.BOOGIE_EXT);
		
		boogie_match_uri = base_uri
        		.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME)
        		.appendSegment(Strings.filename(CompilerConstants.MATCHER))
        		.appendFileExtension(CompilerConstants.BOOGIE_EXT);
		
		// Initialize absolute file paths of boogie generated files
		boogie_src_mm_abs = fr.emn.atlanmod.veriatl.tests.util.URIs.abs(boogie_src_mm_uri);
		boogie_trg_mm_abs = fr.emn.atlanmod.veriatl.tests.util.URIs.abs(boogie_trg_mm_uri);
		boogie_constants_abs = fr.emn.atlanmod.veriatl.tests.util.URIs.abs(boogie_constants_uri);
		boogie_surj_abs = fr.emn.atlanmod.veriatl.tests.util.URIs.abs(boogie_surj_uri);
		boogie_match_abs = fr.emn.atlanmod.veriatl.tests.util.URIs.abs(boogie_match_uri);
		
	}
	

	
	/**
	 * Test generation of Boogie code syntactically correct.
	 * */
	@Test
	public void compile_ResultAreSyntacticalCorrect(){	
		// check compilation result, assert no error occurs.
		VerificationResult r = BoogieTask.syn_check_metamodel(boogie_src_mm_abs, boogie_trg_mm_abs, boogie_constants_abs, boogie_surj_abs, boogie_match_abs);
		String status = r.status();
		String res = r.getResult();
		
		assertEquals(status, "OK");
		assertEquals(res, "true");
		
		
		
	}
	
	
	
	
}
