package fr.emn.atlanmod.veriatl.tests.compiler;


import static java.util.Objects.isNull;
import static org.junit.Assert.*;

import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.Map;

import org.eclipse.core.resources.IFile;
import org.eclipse.core.resources.ResourcesPlugin;
import org.eclipse.core.runtime.FileLocator;
import org.eclipse.core.runtime.IPath;
import org.eclipse.core.runtime.Path;
import org.eclipse.core.runtime.Platform;
import org.eclipse.emf.common.util.URI;
import org.junit.Before;
import org.junit.Test;
import org.osgi.framework.Bundle;

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
	 * Test generation of Boogie code syntactically correct.
	 * */
	@Test
	public void compile_ResultAreSyntacticalCorrect(){
		// Compile source metamodel to Boogie code
		driver.doSetup(transformation_uri, src_metamodel_uri, trg_metamodel_uri, contract_uri, output_uri);
		driver.compileSourceMetamodel();
		driver.compileTargetMetamodel();
		driver.compileATL();
		driver.compileConstants();
		
		URI src_mm_uri = base_uri
        		.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME)
        		.appendSegment(Strings.filename(source_metamodel_file_name))
        		.appendFileExtension(CompilerConstants.BOOGIE_EXT);
		
		URI trg_mm_uri = base_uri
        		.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME)
        		.appendSegment(Strings.filename(target_metamodel_file_name))
        		.appendFileExtension(CompilerConstants.BOOGIE_EXT);
		
		URI constants_uri = base_uri
        		.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME)
        		.appendSegment(CompilerConstants.CONST)
        		.appendFileExtension(CompilerConstants.BOOGIE_EXT);
		
		URI surj_uri = base_uri
        		.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME)
        		.appendSegment(Strings.filename(CompilerConstants.SURJECT))
        		.appendFileExtension(CompilerConstants.BOOGIE_EXT);
		
		URI match_uri = base_uri
        		.appendSegment(VeriATLLaunchConstants.BOOGIE_FOLDER_NAME)
        		.appendSegment(Strings.filename(CompilerConstants.MATCHER))
        		.appendFileExtension(CompilerConstants.BOOGIE_EXT);
		
		// get absolute file path of src metamodel
		String src_mm_abs = fr.emn.atlanmod.veriatl.tests.util.URIs.abs(src_mm_uri);
		String trg_mm_abs = fr.emn.atlanmod.veriatl.tests.util.URIs.abs(trg_mm_uri);
		String constants_abs = fr.emn.atlanmod.veriatl.tests.util.URIs.abs(constants_uri);
		String surj_abs = fr.emn.atlanmod.veriatl.tests.util.URIs.abs(surj_uri);
		String match_abs = fr.emn.atlanmod.veriatl.tests.util.URIs.abs(match_uri);
		
		// check compilation result, assert no error occurs.
		VerificationResult r = BoogieTask.syn_check_metamodel(src_mm_abs, trg_mm_abs, constants_abs, surj_abs, match_abs);
		String status = r.status();
		String res = r.getResult();
		
		assertEquals(status, "OK");
		assertEquals(res, "true");
		
		
		
	}
	
	
	
	
}
