package contract;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.m2m.atl.common.ATL.*;
import org.eclipse.m2m.atl.common.OCL.*;

import org.eclipse.m2m.atl.core.IExtractor;
import org.eclipse.m2m.atl.core.IModel;
import org.eclipse.m2m.atl.core.emf.EMFExtractor;
import org.eclipse.m2m.atl.core.emf.EMFModel;
import org.eclipse.m2m.atl.engine.parser.AtlParser;

public class ContractLoader {

	public static String atlEcore = "src/metamodel/ATL.ecore";

	
	public static List<OclExpression> init(String contractPath) throws Exception{
		InputStream input = new FileInputStream(contractPath);
		AtlParser atlParser = AtlParser.getDefault();
		IModel m = atlParser.parseToModel(input);
		
		//IExtractor extractor = new EMFExtractor();
		//extractor.extract(m, contractPath+".xmi");
		
		ArrayList<OclExpression> rtn = new ArrayList<OclExpression>();
		
		if(m instanceof EMFModel){
			EMFModel emf = (EMFModel) m;
			
			for(EObject o : emf.getResource().getContents()){
				if(o instanceof Module){
					Module mod = (Module) o;
					
					for(ModuleElement elem : mod.getElements()){
						if(elem instanceof Helper){
							Helper h = (Helper) elem;		
							
							if(h.getDefinition().getFeature() instanceof Operation){
								if(((Operation)h.getDefinition().getFeature()).getName().startsWith("post_")){
									
									Operation contract = (Operation) h.getDefinition().getFeature();
									rtn.add(contract.getBody());	
								}							
							}
							
						}
					}
				}
			}	
		}
		
		return rtn;
	}
	
	

	
	
	public static void main(String[] args) throws Exception{
		init("HSM2FSM/Source/ContractSRC/HSM2FSMContract.atl");

	}

}
