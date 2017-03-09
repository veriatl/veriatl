/**
 * 
 */
package fr.emn.atlanmod.veriatl.experiment.standalone;





import org.eclipse.emf.common.util.URI;

import fr.emn.atlanmod.veriatl.core.Mode;

/**
 * @author zcheng
 *
 */
public class ContextConstruction {


    public final String moduleName; 
    public final URI inModel;
    public final URI outModel;
    public final Mode mode;
    public final URI contractPath;
    public final URI basePath;
    public final String postName;
    public boolean initialized;
    public URI inMetamodel;
    public URI outMetamodel;
    
    private ContextConstruction(String moduleName, URI src, URI trg, URI inModel, URI outModel, Mode mode, 
    		URI contract, URI base, String post) {

        this.moduleName = moduleName;
        this.inMetamodel = src;
        this.outMetamodel = trg;
        this.inModel = inModel;
        this.outModel = outModel;
        this.mode = mode;     
        this.contractPath = contract;
        this.basePath = base;
        this.postName = post;
        initialized = false;
    }
    


}
