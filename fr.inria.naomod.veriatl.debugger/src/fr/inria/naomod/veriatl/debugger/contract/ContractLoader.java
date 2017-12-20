package fr.inria.naomod.veriatl.debugger.contract;


import java.util.List;
import java.util.stream.Collectors;

import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.m2m.atl.common.ATL.Helper;
import org.eclipse.m2m.atl.common.ATL.Module;
import org.eclipse.m2m.atl.common.OCL.OclExpression;
import org.eclipse.m2m.atl.common.OCL.Operation;

public class ContractLoader {

	/**
	 * Find postconditions in a given resources.
	 * */
	public static List<OclExpression> findPostconditions(Resource m) throws Exception{
		List<OclExpression> rtn  = m.getContents().stream()
				               .filter(Module.class::isInstance)
				               .map(Module.class::cast)
				               .map(Module::getElements)
				               .flatMap(List::stream)
				               .filter(Helper.class::isInstance)
				               .map(Helper.class::cast)
				               .map(hlp -> hlp.getDefinition().getFeature())
				               .filter(Operation.class::isInstance)
				               .map(Operation.class::cast)
				               .filter(op -> op.getBody().getCommentsBefore().stream().anyMatch(c -> c.contains("@post ")))
				               .map(Operation::getBody)
				               .collect(Collectors.toList());
		
		return rtn;
	}
	


}
