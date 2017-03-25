package fr.emn.atlanmod.veriatl.experiment.mutation.core

import fr.emn.atlanmod.veriatl.experiment.mutation.datastructure.Add
import fr.emn.atlanmod.veriatl.experiment.mutation.datastructure.Bind
import fr.emn.atlanmod.veriatl.experiment.mutation.datastructure.SetGuard
import fr.emn.atlanmod.veriatl.experiment.mutation.generator.Mutation
import fr.emn.atlanmod.veriatl.experiment.mutation.util.EMFUtil
import fr.emn.atlanmod.veriatl.experiment.mutation.util.URIs
import java.io.File
import java.util.ArrayList
import org.apache.commons.io.FileUtils
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl
import org.eclipse.m2m.atl.common.ATL.ATLPackage
import org.eclipse.m2m.atl.common.ATL.MatchedRule
import org.eclipse.m2m.atl.common.ATL.Module
import org.eclipse.m2m.atl.emftvm.compiler.AtlResourceFactoryImpl

import static fr.emn.atlanmod.veriatl.experiment.mutation.generator.Mutation.*

class StandAlone {

	final static String basePath = "./resources/"
	final static String proj = "UML2UMLsTest.atl"
	final static String src = "UML.ecore"
	static var EPackage srcmm 
	
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
				// setup module 
				module = e
				Mutation.src = e.inModels.get(0).metamodel.name
				Mutation.trg = e.outModels.get(0).metamodel.name
				
				// add matched rules to be processed
				for (o : e.elements) {
					if (o instanceof MatchedRule) {
						rules.add(o)
					}
				}
			}
		}

		// gen mutations
		for (r : rules) {
			val pos = rules.indexOf(r)
			
			//add(module, r, pos)
			//del(module, r, pos)
			//filter(module, r, pos)
			bind(module, r, pos)
		}

	}

	def static add(Module module, MatchedRule r, int pos){
		//  mutant of ADD RULE
		val mutant = new Add(r).apply()
		val id = String.format("AR%03d", pos)
		val URI outPath = URI.createFileURI(String.format("%s/%s/Source/%s", basePath, id, proj));
		URIs.write(outPath, Mutation.Add(module, r, mutant))
			// copy contracts/metamodels/etc
		val srcCache = String.format("%s/UML2UMLs/Source/", basePath);
		val dstCache = String.format("%s/%s/Source/", basePath, id);
		FileUtils.copyDirectory(new File(srcCache), new File(dstCache));
			// gen identification
		println(String.format("result.put('%s', '%s');", id, mutant.name))
	}
	
	def static del(Module module, MatchedRule r, int pos){
		//  mutant of DEL RULE
		val id = String.format("DR%03d", pos)
		val URI outPath = URI.createFileURI(String.format("%s/%s/Source/%s", basePath, id, proj));
		URIs.write(outPath, Mutation.Del(module, r))
			// copy contracts/metamodels/etc
		val srcCache = String.format("%s/UML2UMLs/Source/", basePath);
		val dstCache = String.format("%s/%s/Source/", basePath, id);
		FileUtils.copyDirectory(new File(srcCache), new File(dstCache));
			// gen identification
		println(String.format("result.put('%s', '%s');", id, r.name))
	}
	
	
	def static filter(Module module, MatchedRule r, int pos){
		
		val mutants = new SetGuard(r).apply(srcmm)
		
		var i = 0
		for(mutant : mutants){
			// gen first filter mutant only
			if(i == 0){
				//  mutant of REDUCE FILTER rule
				val mpos = mutants.indexOf(mutant)
				val id = String.format("MF%03d_%03d", pos, mpos)
				val URI outPath = URI.createFileURI(String.format("%s/%s/Source/%s", basePath, id, proj));
				URIs.write(outPath, Mutation.SetGuard(module, r, mutant))
				
					// copy contracts/metamodels/etc
				val srcCache = String.format("%s/UML2UMLs/Source/", basePath);
				val dstCache = String.format("%s/%s/Source/", basePath, id);
				FileUtils.copyDirectory(new File(srcCache), new File(dstCache));
					// gen identification
				println(String.format("result.put('%s', '%s');", id, r.name))
			}
			i++
		}
		

	}
	
	def static bind(Module module, MatchedRule r, int pos){
		
		val mutants = new Bind(r).apply()
		
		var i = 0
		for(mutant : mutants){
			// gen first BIND mutant only
			if(i == 0){
				//  mutant of REDUCE FILTER rule
				val mpos = mutants.indexOf(mutant)
				val id = String.format("MB%03d_%03d", pos, mpos)
				val URI outPath = URI.createFileURI(String.format("%s/%s/Source/%s", basePath, id, proj));
				URIs.write(outPath, Mutation.SetGuard(module, r, mutant))
				
					// copy contracts/metamodels/etc
				val srcCache = String.format("%s/UML2UMLs/Source/", basePath);
				val dstCache = String.format("%s/%s/Source/", basePath, id);
				FileUtils.copyDirectory(new File(srcCache), new File(dstCache));
					// gen identification
				println(String.format("result.put('%s', '%s');", id, r.name))
			}
			i++
		}
		

	}
	def static doEMFSetup() {
		// load metamodels	
		EPackage.Registry.INSTANCE.put(ATLPackage.eNS_URI, ATLPackage.eINSTANCE);

		// register resource processors
		Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put("atl", new AtlResourceFactoryImpl);
		Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put("ecore", new EcoreResourceFactoryImpl());
		
		srcmm = EMFUtil.getEPackage(URI.createFileURI(String.format("%s/%s",basePath, src)))
	}



}
