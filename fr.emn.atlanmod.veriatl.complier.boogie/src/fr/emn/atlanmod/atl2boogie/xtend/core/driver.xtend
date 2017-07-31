package fr.emn.atlanmod.atl2boogie.xtend.core

import fr.emn.atlanmod.atl2boogie.xtend.atl.applyer2boogie
import fr.emn.atlanmod.atl2boogie.xtend.atl.contract2boogie
import fr.emn.atlanmod.atl2boogie.xtend.atl.matcher2boogie
import fr.emn.atlanmod.atl2boogie.xtend.atl.surjective2boogie
import fr.emn.atlanmod.atl2boogie.xtend.emf.mm2boogie
import fr.emn.atlanmod.atl2boogie.xtend.lib.URIs
import fr.emn.atlanmod.atl2boogie.xtend.lib.emf
import fr.emn.atlanmod.atl2boogie.xtend.util.CompilerConstants
import fr.emn.atlanmod.atl2boogie.xtend.lib.myOclType
import fr.emn.atlanmod.atl2boogie.xtend.ocl.ocl2boogie
import fr.emn.atlanmod.atl2boogie.xtend.lib.atl
import java.util.ArrayList
import java.util.HashMap
import java.util.HashSet
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl
import org.eclipse.m2m.atl.common.ATL.ATLPackage
import org.eclipse.m2m.atl.common.ATL.MatchedRule
import org.eclipse.m2m.atl.common.OCL.OCLPackage
import org.eclipse.m2m.atl.emftvm.compiler.AtlResourceFactoryImpl
import fr.emn.atlanmod.atl2boogie.xtend.ocl.TypeInference

class driver {
	
	public static var fMapSrc = new HashMap<String, String>
	public static var fMapTrg = new HashMap<String, String>
	public static var EPackage srcmm 
	public static var EPackage trgmm 
	public static var HashSet<String> constants = new HashSet<String>
	public static var ExecEnv = new ArrayList<MatchedRule>
	
	public static var Resource atl_resource
	public static var Resource contract_resource
	
	public static var URI output_path

	/** 
	 * Setup EMF factories, so that corresponding resources can be load into memory.
	 * */
	def static doEMFSetup() {
		// load metamodels	
		EPackage.Registry.INSTANCE.put(ATLPackage.eNS_URI, ATLPackage.eINSTANCE)
		EPackage.Registry.INSTANCE.put(OCLPackage.eNS_URI, OCLPackage.eINSTANCE)

		// register resource processors
		Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put("xmi", new XMIResourceFactoryImpl);
		Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put("atl", new AtlResourceFactoryImpl());
		Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put("ecore", new EcoreResourceFactoryImpl());
	}
	
	/**
	 * Setup VeriATL resources.
	 */
	def static doVeriATLSetup(URI atl, URI src, URI trg, URI contract, URI output) {
		val rs = new ResourceSetImpl
		val srcRes = rs.getResource(src, true)
		val trgRes = rs.getResource(trg, true)
		
		// get filed-type map from source and target metamodels 
		fMapSrc = emf.getsfInfo(srcRes)
		fMapTrg = emf.getsfInfo(trgRes)
		
		// get EPackages for source and target metamodels
		srcmm = emf.getEPackage(srcRes)
		trgmm = emf.getEPackage(trgRes)
		
		// get abstract syntax tree of atl transformations and contract file.
		atl_resource = rs.getResource(atl, true)
		contract_resource = rs.getResource(contract, true)
		
		// setup output path
		output_path = output
	}
	
	/**
	 * Tear down static variables of all code generators for previous compilation session.
	 */	
	def static void doClean(){
		matcher2boogie.modDepth = 0
		
		surjective2boogie.isPrintedOutPatternElement = new HashSet<String>()
		surjective2boogie.modDepth = 0

		TypeInference.lookup = new HashMap<String, myOclType>();
		
		ocl2boogie.iteratorTyping = new HashMap<String, String>;
		ocl2boogie.isReplacing = false
		ocl2boogie.replaceMap = new HashMap<String, String>;
		
		atl.srcHeaps = new HashSet<String>;
		atl.trgHeaps = new HashSet<String>;
		
		output_path = null;
	}
	
	/**
	 * Set up VeriATL compiler.
	 */	
	def static void doSetup(URI atl, URI src, URI trg, URI contract, URI outputPath){
		doEMFSetup
		doVeriATLSetup(atl, src, trg, contract, outputPath)
		doClean
	}
	
	/**
	 * Compile ATL transformation
	 */
	def static void compileATL(){
		// gen matchers
		var match = "";
		
		for (content : atl_resource.contents) {
			match += matcher2boogie.genModule_matches(content)	
		}
		
		generateBoogieFile(output_path, CompilerConstants.MATCHER, CompilerConstants.BOOGIE_EXT, match)

		// gen applyers
		var apply = "";
		
		for (content : atl_resource.contents) {
			apply += applyer2boogie.genModule_applys(content)	
		}
		
		generateBoogieFile(output_path, CompilerConstants.APPLIER, CompilerConstants.BOOGIE_EXT, apply)
		
		// gen surjectivity function
		var surject = "";
		
		for (content : atl_resource.contents) {
			surject += surjective2boogie.genModule_surjective(content)	
		}
		
		generateBoogieFile(output_path, CompilerConstants.SURJECT, CompilerConstants.BOOGIE_EXT, surject)
	}
	
	/**
	 * Compile Source Metamodel.
	 */
	def static compileSourceMetamodel(){
		var srcBoogie = "";
		srcBoogie += mm2boogie.gen_Metamodel(srcmm)	
		generateBoogieFile(output_path, srcmm.name, CompilerConstants.BOOGIE_EXT, srcBoogie)
	}
	
	/**
	 * Compile Target Metamodel.
	 */
	def static compileTargetMetamodel(){
		var trgBoogie = "";
		trgBoogie += mm2boogie.gen_Metamodel(trgmm)	
		generateBoogieFile(output_path, trgmm.name, CompilerConstants.BOOGIE_EXT, trgBoogie)	
	}
	
	
	/**
	 * Compile Contracts.
	 */
	def static compileContracts(){
		var pre = "";
			
		for (content : contract_resource.contents) {
			pre += contract2boogie.genHelpers(content)	
		}
	
		generateBoogieFile(output_path, CompilerConstants.PRE, CompilerConstants.BOOGIE_EXT, pre)
	}
	
	
	/**
	 * Compile Constants.
	 * 
	 * @see fr.emn.atlanmod.atl2boogie.xtend.atl.matcher2boogie.genModuleElement_match()
	 * @see fr.emn.atlanmod.atl2boogie.xtend.ocl.ocl2boogie.genOclExpression(String, CharSequence)
	 * @see fr.emn.atlanmod.atl2boogie.xtend.emf.mm2boogie.gen_metamodel(EPackage)
	 */
	def static compileConstants(){
		// gen constants
		var const = "";
		for (s : constants) {
			const += String.format("const unique _%s: String;\n", s)
		}
		
		generateBoogieFile(output_path, CompilerConstants.CONST, CompilerConstants.BOOGIE_EXT, const)
	}
	
	
	/**
	 * Core compiler for VeriATL plugin.
	 */
	def static compileAll(URI atl, URI src, URI trg, URI contract, URI outputPath) {
		doSetup(atl, src, trg, contract, outputPath)
		
		compileSourceMetamodel
		compileTargetMetamodel
		compileATL
		compileContracts
		compileConstants
		
	}
	

	
	/**
	 * Helper for printing content to the output path, with the given filename and extension.
	 */
	def static URI generateBoogieFile(URI outputPath, String fileName, String ext, String content){
		val URI outputURI = outputPath.appendSegment(fileName).appendFileExtension(ext)
		return URIs.write(outputURI, content)
	}



	
	

	
}
