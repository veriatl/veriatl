package transformation;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.m2m.atl.common.ATL.Helper;
import org.eclipse.m2m.atl.common.ATL.MatchedRule;
import org.eclipse.m2m.atl.common.ATL.Module;
import org.eclipse.m2m.atl.common.ATL.ModuleElement;
import org.eclipse.m2m.atl.common.ATL.Rule;
import org.eclipse.m2m.atl.common.OCL.OclExpression;
import org.eclipse.m2m.atl.common.OCL.Operation;
import org.eclipse.m2m.atl.core.IExtractor;
import org.eclipse.m2m.atl.core.IModel;
import org.eclipse.m2m.atl.core.emf.EMFExtractor;
import org.eclipse.m2m.atl.core.emf.EMFModel;
import org.eclipse.m2m.atl.engine.parser.AtlParser;

public class TransformationLoader {
public static String atlEcore = "src/metamodel/ATL.ecore";

	
	public static List<MatchedRule> init(String contractPath) throws Exception{
		InputStream input = new FileInputStream(contractPath);
		AtlParser atlParser = AtlParser.getDefault();
		IModel m = atlParser.parseToModel(input);
		
		//IExtractor extractor = new EMFExtractor();
		//extractor.extract(m, contractPath+".xmi");
		
		ArrayList<MatchedRule> rtn = new ArrayList<MatchedRule>();
		
		if(m instanceof EMFModel){
			EMFModel emf = (EMFModel) m;
			for(EObject o : emf.getResource().getContents()){
				if(o instanceof Module){
					Module mod = (Module) o;
					for(ModuleElement elem : mod.getElements()){
						if(elem instanceof MatchedRule){
							MatchedRule r = (MatchedRule) elem;		
							rtn.add(r);
							
						}
					}
				}
			}	
		}
		
		return rtn;
	}
}
