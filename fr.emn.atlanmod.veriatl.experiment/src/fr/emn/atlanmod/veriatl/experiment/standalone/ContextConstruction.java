/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.standalone;





import org.eclipse.emf.common.util.URI;
import fr.emn.atlanmod.veriatl.core.Context;

/**
 * @author zcheng
 *
 */
public class ContextConstruction {


    public final String moduleName; 
    public final URI contractPath;
    public final URI basePath;
    public final String postName;
    public boolean initialized;
    public URI inMetamodel;
    public URI outMetamodel;
    
    public ContextConstruction(String moduleName, URI src, URI trg,
    		URI contract, URI base, String post) {

        this.moduleName = moduleName;
        this.inMetamodel = src;
        this.outMetamodel = trg;   
        this.contractPath = contract;
        this.basePath = base;
        this.postName = post;
        initialized = false;
    }
    

    // TODO  for experiment, we change the context constructor to public, reverse it back!
    public Context wrap(){
    	return new Context(null, this.moduleName, this.inMetamodel, this.outMetamodel, null, null, null, 
        		this.contractPath, this.basePath, this.postName, null);
    }

}
