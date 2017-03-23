
package fr.emn.atlanmod.uml.casestudy.core

import fr.emn.atlanmod.uml.casestudy.rewrite.OCL2ATL
import fr.emn.atlanmod.uml.casestudy.util.URIs
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl



class StandAlone{
	
	static Resource	ocl_resource;

	
	def static void main(String[] args) {
		val inputURI = URI.createFileURI("./resources/UML.normalize.ocl.oclas")
		doEMFSetup(inputURI)
		
		var String res = "";
		val outputURI = URI.createFileURI("./resources/UML.normalize.ocl.atl")
		
		res+="module UMLCopierContract;\n";
		res+="create OUT : UMLs from IN : UML;\n";

		for (EObject eobject : ocl_resource.getContents()) {
			res += OCL2ATL.rewrite(eobject);
		}
		
		
		URIs.write(outputURI, res); 
		
	}
	
	def static doEMFSetup(URI oclPath) {
		// load metamodels	
		EPackage.Registry.INSTANCE.put(ATLPackage.eNS_URI, ATLPackage.eINSTANCE);

		
		// register resource processors
		Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put("xmi", new XMIResourceFactoryImpl);
		Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put("oclas", ATLResourceFactory.getInstance());
		//Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put("ecore", new EcoreResourceFactoryImpl;
		
		
		// get resource from input URI
		val rs = new ResourceSetImpl		
		ocl_resource = rs.getResource(oclPath, true)

		// initialize uri mapping
		val ecore_resource = rs.getResource(URI.createFileURI("./resources/UML.ecore.oclas"), true)
		val lib_resource = rs.getResource(URI.createFileURI("./resources/OCL-2.5.oclas"), true)
		
		ecore_resource.setURI(URI.createURI("UML.ecore.oclas"));
		lib_resource.setURI(URI.createURI("http://www.eclipse.org/ocl/2015/Library.oclas"));
		
	

	}
	
	def public static EPackage loadEcore(String metamodelPath) throws Exception {
		// Load metamodels

		val rs = new ResourceSetImpl();
		rs.getResourceFactoryRegistry().getExtensionToFactoryMap().put("ecore", new EcoreResourceFactoryImpl());
		val r = rs.getResource(URI.createFileURI(metamodelPath), true);
		val eObject = r.getContents().get(0);
		if (eObject instanceof EPackage) {
			val p =  eObject as EPackage;
			return p;
		}

		throw new Exception("reading metamodel fails hard! abort...");

	}
	

	
}
