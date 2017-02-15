package transformation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EClassifier;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl;
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl;
import org.eclipse.m2m.atl.emftvm.EmftvmFactory;
import org.eclipse.m2m.atl.emftvm.ExecEnv;
import org.eclipse.m2m.atl.emftvm.Metamodel;
import org.eclipse.m2m.atl.emftvm.OutputRuleElement;
import org.eclipse.m2m.atl.emftvm.Rule;
import org.eclipse.m2m.atl.emftvm.impl.resource.EMFTVMResourceFactoryImpl;
import org.eclipse.m2m.atl.emftvm.util.DefaultModuleResolver;

import metamodel.EMFLoader;

public class Trace {

	private static final EmftvmFactory FACTORY = EmftvmFactory.eINSTANCE;
	
	public static ExecEnv moduleLoader(URI emftvmPath, String moduleName, 
			URI srcURI, URI trgURI, String sourceId, String targetId)
	{
		ExecEnv env = EmftvmFactory.eINSTANCE.createExecEnv();
		ResourceSet rs = new ResourceSetImpl();
		rs.getResourceFactoryRegistry().getExtensionToFactoryMap().put("xmi", new XMIResourceFactoryImpl());
		rs.getResourceFactoryRegistry().getExtensionToFactoryMap().put("ecore", new EcoreResourceFactoryImpl());
		rs.getResourceFactoryRegistry().getExtensionToFactoryMap().put("emftvm", new EMFTVMResourceFactoryImpl());
		
		// Load src metamodels
		Metamodel srcMetamodel = FACTORY.createMetamodel();
		srcMetamodel.setResource(rs.getResource(srcURI, true));
		env.registerMetaModel(sourceId, srcMetamodel);
		
		// Load trg metamodels
		Metamodel trgMetaModel = FACTORY.createMetamodel();
		trgMetaModel.setResource(rs.getResource(trgURI, true));
		env.registerMetaModel(targetId, trgMetaModel);
	
		
		// load emftvm module
		DefaultModuleResolver mr = new DefaultModuleResolver(emftvmPath.toString()+ "/", rs);
		env.loadModule(mr, moduleName);
		
		return env;
		
	}
	
	
	

	public static Map<String, ArrayList<String>> getTrace(EPackage tarmm, ExecEnv env) throws Exception{
		
		Map<String, ArrayList<String>> rtn = new HashMap<String, ArrayList<String>>();
		Map<String, HashSet<String>> inheritence = EMFLoader.readParantsInfo(tarmm);
		
		String tarPrefix = tarmm.getName()+"$";
		
		
		for(EClassifier cl : tarmm.getEClassifiers()){
			String clName = tarPrefix+cl.getName();
			
			for(Rule r : env.getRules()){
				
				int i = 0;
				
				for(OutputRuleElement output : r.getOutputElements()){
					String outName = tarPrefix+output.getType();
					
					if(clName.equals(outName) || EMFLoader.isSubtype(outName, clName, tarmm, inheritence)){
						String traceName = String.format("%s#%d", r.getName(), i);
											
						if(rtn.containsKey(clName)){
							rtn.get(clName).add(traceName);
						}else{
							ArrayList<String> trace = new ArrayList<String>();
							trace.add(traceName);
							rtn.put(clName, trace);
						}
					}
					
					i++;
				}
			}
		}
		
		return rtn;
	}
	
	
	
	public static ArrayList<String> ruleOrdered(ExecEnv env){
		ArrayList<String> rtn = new ArrayList<String>();
		for(Rule r : env.getRules()){
			rtn.add(r.getName());
			
		}
		return rtn;
	}
	
	
	

}
