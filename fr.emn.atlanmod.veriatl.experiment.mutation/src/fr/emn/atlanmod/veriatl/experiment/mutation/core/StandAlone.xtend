
package fr.emn.atlanmod.veriatl.experiment.mutation.core



import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl


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
import fr.emn.atlanmod.veriatl.experiment.mutation.generator.ATL
import fr.emn.atlanmod.veriatl.experiment.mutation.util.URIs
import org.eclipse.m2m.atl.common.ATL.Module
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.m2m.atl.common.ATL.SimpleInPatternElement
import org.eclipse.m2m.atl.common.ATL.SimpleOutPatternElement

class StandAlone{
	
	static Resource	ocl_resource;

	
	def static void main(String[] args) {
		
		doEMFSetup()
		
		val rs = new ResourceSetImpl
		val atl = URI.createFileURI("./resources/UML2UMLsTest.atl")
		val atl_resource = rs.getResource(atl, true)

		// get matched rules
		var rules = new ArrayList
		var Module module;
		for (e : atl_resource.contents) {
			if(e instanceof Module){
				module = e
				for(o : e.elements){
					if(o instanceof MatchedRule){
						rules.add(o)
					}
				}
			}
		}
		
		for(r : rules){
			val mutate =  copy(r) as MatchedRule
			val elem1 = (r.outPattern.elements.get(0) as SimpleOutPatternElement)
			val elem2 = (mutate.outPattern.elements.get(0) as SimpleOutPatternElement) 
			elem2.varName = "abc"
			println(elem1.varName)
			println(elem2.varName)
			//println(ATL.gen(module, r, mutate) )
			println("===")
		}
		
		
		
		
	}
	
	def static EObject copy(EObject eObject) 
  { 
    val  EcoreUtil.Copier copier = new  EcoreUtil.Copier(); 
    val EObject result = copier.copy(eObject); 
    copier.copyReferences(); 
    return result; 
  } 
  
	def static doEMFSetup() {
		// load metamodels	
		EPackage.Registry.INSTANCE.put(ATLPackage.eNS_URI, ATLPackage.eINSTANCE);

		
		// register resource processors
		Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put("xmi", new XMIResourceFactoryImpl);
		Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put("atl", new AtlResourceFactoryImpl);
		//Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put("ecore", new EcoreResourceFactoryImpl;

	}
	

	

	
}
