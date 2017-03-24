package fr.emn.atlanmod.veriatl.experiment.mutation.core

import fr.emn.atlanmod.veriatl.experiment.mutation.generator.*
import java.util.ArrayList
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.m2m.atl.common.ATL.ATLPackage
import org.eclipse.m2m.atl.common.ATL.MatchedRule
import org.eclipse.m2m.atl.common.ATL.Module
import org.eclipse.m2m.atl.emftvm.compiler.AtlResourceFactoryImpl
import fr.emn.atlanmod.veriatl.experiment.mutation.util.EMFUtil
import fr.emn.atlanmod.veriatl.experiment.mutation.datastructure.Add
import fr.emn.atlanmod.veriatl.experiment.mutation.util.URIs
import org.apache.commons.io.FileUtils
import java.io.File

class StandAlone {

	final static String basePath = "./resources/UML2UMLs/"
	final static String proj = "UML2UMLsTest.atl"
	

	def static void main(String[] args) {

		doEMFSetup()

		val rs = new ResourceSetImpl
		val atl = URI.createFileURI(String.format("%s/%s",basePath,proj))
		val atl_resource = rs.getResource(atl, true)

		// get matched rules
		var rules = new ArrayList
		var Module module;
		for (e : atl_resource.contents) {
			if (e instanceof Module) {
				module = e
				for (o : e.elements) {
					if (o instanceof MatchedRule) {
						rules.add(o)
					}
				}
			}
		}

		for (r : rules) {
			val pos = rules.indexOf(r)
			
			// ADD mutant
			val mutant = new Add(r).apply()
			val id = String.format("AR%03d", pos)
			val URI outPath = URI.createFileURI(String.format("%s/%s/Source/%s", basePath, id, proj));
			URIs.write(outPath, Mutation.Add(module, r, mutant))
			String srcCache = String.format("%s/%s/%s/",p, org, "NoCached");
			String dstCache = String.format("%s/%s/%s/",p, trg, "Caches");
			FileUtils.copyDirectory(new File(srcCache), new File(dstCache));
			println(String.format("result.put('%s', '%s');", id, mutant.name))

			
			
		}

	}

	

	def static doEMFSetup() {
		// load metamodels	
		EPackage.Registry.INSTANCE.put(ATLPackage.eNS_URI, ATLPackage.eINSTANCE);

		// register resource processors
		Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put("atl", new AtlResourceFactoryImpl);

	}



}
