package fr.inria.naomod.veriatl.debugger.driver

import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl
import org.eclipse.m2m.atl.common.ATL.ATLPackage
import org.eclipse.m2m.atl.common.OCL.OCLPackage
import org.eclipse.m2m.atl.emftvm.compiler.AtlResourceFactoryImpl
import fr.inria.naomod.veriatl.debugger.contract.ContractLoader

class driver {
	


	
	/** 
	 * Setup EMF factories, so that corresponding resources can be load into memory.
	 * */
	def static doEMFSetup() {
		// load metamodels	
		EPackage.Registry.INSTANCE.put(ATLPackage.eNS_URI, ATLPackage.eINSTANCE)
		EPackage.Registry.INSTANCE.put(OCLPackage.eNS_URI, OCLPackage.eINSTANCE)

		// register resource processors
		Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put("xmi", new XMIResourceFactoryImpl)
		Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put("atl", new AtlResourceFactoryImpl())
		Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put("ecore", new EcoreResourceFactoryImpl())
	}
	
	/**
	 * Setup VeriATL resources.
	 */
	def static doVeriATLSetup(URI contract) {
		val rs = new ResourceSetImpl

		val contract_resource = rs.getResource(contract, true)
		val posts = ContractLoader.findPostconditions(contract_resource)
		
		
		
		
		System.out.println(posts.size())
	}
	

	
	/**
	 * Set up VeriATL compiler.
	 */	
	def static void doSetup(URI contract){
		doEMFSetup
		doVeriATLSetup(contract)
		
	}

	
	
	/**
	 * Core compiler for VeriATL plugin.
	 */
	def static void main(String[] args) {
		val contract = "./resources/ER2RELContract.atl"
		val contract_uri = URI.createFileURI(contract);
		doSetup(contract_uri)
		
		
	}
	

	



	
	

	
}
