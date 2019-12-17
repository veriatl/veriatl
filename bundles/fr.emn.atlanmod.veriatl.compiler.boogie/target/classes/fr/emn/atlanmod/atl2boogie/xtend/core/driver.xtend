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
	
	def static void main(String[] args) {
		//generate(args.get(0), args.get(1), args.get(2), args.get(3), args.get(4))
		println("finished")
		//println(ocl2boogie.iteratorTyping)
		print(fMapSrc)
	}

	def static doEMFSetup() {
		// load metamodels	
		EPackage.Registry.INSTANCE.put(ATLPackage.eNS_URI, ATLPackage.eINSTANCE)
		EPackage.Registry.INSTANCE.put(OCLPackage.eNS_URI, OCLPackage.eINSTANCE)

		// register resource processors
		Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put("xmi", new XMIResourceFactoryImpl);
		Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put("atl", new AtlResourceFactoryImpl());
		Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put("ecore", new EcoreResourceFactoryImpl());
	}
	
	def static doVeriATLSetup(URI atl, URI src, URI trg, URI contract) {
		val rs = new ResourceSetImpl
		
		val srcRes = rs.getResource(src, true)
		val trgRes = rs.getResource(trg, true)
		
		fMapSrc = emf.getsfInfo(srcRes)
		fMapTrg = emf.getsfInfo(trgRes)
		srcmm = emf.getEPackage(srcRes)
		trgmm = emf.getEPackage(trgRes)
		
		atl_resource = rs.getResource(atl, true)
		contract_resource = rs.getResource(contract, true)
	}
	
	
	
	
	/**
	 * 
	 */
	def static generate(URI atl, URI src, URI trg, URI contract, URI outputPath) {
		doEMFSetup
		doVeriATLSetup(atl, src, trg, contract)
		doClean
		
//		// gen matchers
//		var match = "";
//		
//		for (content : atl_resource.contents) {
//			match += matcher2boogie.genModule_matches(content)	
//		}
//		
//		generateBoogieFile(outputPath, CompilerConstants.MATCHER, CompilerConstants.BOOGIE_EXT, match)
//
//		// gen applyers
//		var apply = "";
//		
//		for (content : atl_resource.contents) {
//			apply += applyer2boogie.genModule_applys(content)	
//		}
//		
//		generateBoogieFile(outputPath, CompilerConstants.APPLIER, CompilerConstants.BOOGIE_EXT, apply)
//		
//
//		
//		// gen surjectivity function
//		var surject = "";
//		
//		for (content : atl_resource.contents) {
//			surject += surjective2boogie.genModule_surjective(content)	
//		}
//		
//		generateBoogieFile(outputPath, CompilerConstants.SURJECT, CompilerConstants.BOOGIE_EXT, surject)
//		
//		
//		// gen contracts
//		var pre = "";
//			
//		for (content : contract_resource.contents) {
//			pre += contract2boogie.genHelpers(content)	
//		}
//	
//		generateBoogieFile(outputPath, CompilerConstants.PRE, CompilerConstants.BOOGIE_EXT, pre)
//		
//		
//		// gen src mm
//		var srcBoogie = "";
//		srcBoogie += mm2boogie.gen_Metamodel(srcmm)	
//		generateBoogieFile(outputPath, srcmm.name, CompilerConstants.BOOGIE_EXT, srcBoogie)
//		
//
//		
//		
//		// gen trg mm
//		var trgBoogie = "";
//		trgBoogie += mm2boogie.gen_Metamodel(trgmm)	
//		generateBoogieFile(outputPath, trgmm.name, CompilerConstants.BOOGIE_EXT, trgBoogie)
//		
//
//		
//		// gen constants
//		var const = "";
//		for (s : constants) {
//			const += String.format("const unique _%s: String;\n", s)
//		}
//		
//		generateBoogieFile(outputPath, CompilerConstants.CONST, CompilerConstants.BOOGIE_EXT, const)
//		
		
	}
	

	

	def static URI generateBoogieFile(URI outputPath, String fileName, String ext, String content){
		val URI outputURI = outputPath.appendSegment(fileName).appendFileExtension(ext)
		return URIs.write(outputURI, content)
	}


	// clean static variable of templates	
	def static void doClean(){
		matcher2boogie.modDepth = 0
		
		surjective2boogie.isPrintedOutPatternElement = new HashSet<String>()
		surjective2boogie.modDepth = 0
		
		contract2boogie.debugPost = ""
		
		TypeInference.lookup = new HashMap<String, myOclType>();
		
		ocl2boogie.iteratorTyping = new HashMap<String, String>;
		ocl2boogie.isReplacing = false
		ocl2boogie.replaceMap = new HashMap<String, String>;
		
		atl.srcHeaps = new HashSet<String>;
		atl.trgHeaps = new HashSet<String>;
	}
	
	

	
}
