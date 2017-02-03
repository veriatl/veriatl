package fr.emn.atlanmod.atl2boogie.xtend.core

import fr.emn.atlanmod.atl2boogie.xtend.lib.emf
import fr.emn.atlanmod.atl2boogie.xtend.ocl.*
import fr.emn.atlanmod.atl2boogie.xtend.atl.matcher2boogie
import fr.emn.atlanmod.atl2boogie.xtend.atl.applyer2boogie
import fr.emn.atlanmod.atl2boogie.xtend.atl.contract2boogie
import fr.emn.atlanmod.atl2boogie.xtend.atl.surjective2boogie
import fr.emn.atlanmod.atl2boogie.xtend.emf.mm2boogie

import java.util.HashMap
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl
import org.eclipse.m2m.atl.common.ATL.ATLPackage
import org.eclipse.m2m.atl.common.OCL.OCLPackage
import org.eclipse.m2m.atl.emftvm.compiler.AtlResourceFactoryImpl
import java.io.File
import com.google.common.base.Charsets
import com.google.common.io.Files
import java.util.HashSet

import org.eclipse.m2m.atl.common.ATL.MatchedRule
import java.util.ArrayList

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
		generate(args.get(0), args.get(1), args.get(2), args.get(3), args.get(4))
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
	
	def static doVeriATLSetup(String atl, String src, String tar, String contract, String path) {
		val rs = new ResourceSetImpl
		
		val srcRes = rs.getResource(URI.createFileURI(src), true)
		val trgRes = rs.getResource(URI.createFileURI(tar), true)
		
		fMapSrc = emf.getsfInfo(srcRes)
		fMapTrg = emf.getsfInfo(trgRes)
		srcmm = emf.getEPackage(srcRes)
		trgmm = emf.getEPackage(trgRes)
		
		atl_resource = rs.getResource(URI.createFileURI(atl), true)
		contract_resource = rs.getResource(URI.createFileURI(contract), true)
	}
	
	
	
	
	/**
	 * 
	 */
	def static generate(String atl, String src, String tar, String contract, String path) {
		doEMFSetup
		doVeriATLSetup(atl, src, tar, contract, path)

		// gen matchers
		var res = "";
		
		for (content : atl_resource.contents) {
			res += matcher2boogie.genModule_matches(content)	
		}
		
		Files.write(res, new File(path+'ATL_match.bpl'), Charsets.UTF_8)
		
		// gen applyers
		var res2 = "";
		
		for (content : atl_resource.contents) {
			res2 += applyer2boogie.genModule_applys(content)	
		}
		
		Files.write(res2, new File(path+'ATL_apply.bpl'), Charsets.UTF_8)
		
		// gen surjectivity function
		var res4 = "";
		
		for (content : atl_resource.contents) {
			res4 += surjective2boogie.genModule_surjective(content)	
		}
		
		Files.write(res4, new File(path+'surjective.bpl'), Charsets.UTF_8)
		
		
		// gen contracts
		var res3 = "";
			
		for (content : contract_resource.contents) {
			res3 += contract2boogie.genHelpers(content)	
		}
	
		Files.write(res3, new File(path+'Preconditions.bpl'), Charsets.UTF_8)
		
		
		// gen src mm
		var res5 = "";
		res5 += mm2boogie.gen_Metamodel(srcmm)	
		Files.write(res5, new File(path+srcmm.name+'.bpl'), Charsets.UTF_8)
		
		
		// gen trg mm
		var res6 = "";
		res6 += mm2boogie.gen_Metamodel(trgmm)	
		Files.write(res6, new File(path+trgmm.name+'.bpl'), Charsets.UTF_8)
		
		// gen trg mm
		var res7 = "";
		for (s : constants) {
			res7 += String.format("const unique _%s: String;\n", s)
		}
		
		Files.write(res7, new File(path+'constants.bpl'), Charsets.UTF_8)
		
	}
	

	




		
	
	
	
	
	
}
