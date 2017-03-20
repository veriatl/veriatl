package fr.emn.atlanmod.veriatl.core;

import java.util.Collections;

import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.debug.core.ILaunchConfiguration;
import org.eclipse.emf.common.util.URI;
import org.eclipse.m2m.atl.emftvm.launcher.EMFTVMLaunchConstants;

import fr.emn.atlanmod.veriatl.launcher.VeriATLLaunchConstants;

/**
 * A class representing an execution context that manages and pre-processes the parameters from a
 * {@link ILaunchConfiguration}.
 */
public class Context {

    private final URI pluginUri;
    private final String moduleName;

    
    private final URI inModel;
    private final URI outModel;

    private final Mode mode;



    private final URI contractPath;
    private final URI basePath;
    private final String postName;
    
    
    private final IProgressMonitor monitor;

    private boolean initialized;

    private URI inMetamodel;
    private URI outMetamodel;

    /**
     * Constructs a new {@code Context} with the given parameters.
     */
    public Context(URI pluginUri, String moduleName, URI src, URI trg, URI inModel, URI outModel, Mode mode, 
    		URI contract, URI base, String post, IProgressMonitor monitor) {
        this.pluginUri = pluginUri;
        this.moduleName = moduleName;

        this.inMetamodel = src;
        this.outMetamodel = trg;

        this.inModel = inModel;
        this.outModel = outModel;

        this.mode = mode;

        this.monitor = monitor;
        
        this.contractPath = contract;
        this.basePath = base;
        this.postName = post;
        
        
        
       
        

        initialized = false;
    }

    /**
     * Creates a new {@code Context} from the given {@code configuration}.
     *
     * @param configuration the configuration to parse
     *
     * @return a new context
     */
    public static Context from(ILaunchConfiguration configuration, IProgressMonitor monitor) {
        try {
            String moduleName = configuration.getAttribute(EMFTVMLaunchConstants.MODULE_NAME, "");

            String modulePath = configuration.getAttribute(EMFTVMLaunchConstants.MODULE_PATH, "");
            URI pluginUri = URI.createPlatformResourceURI(modulePath.substring(0, modulePath.lastIndexOf("/")), false);

            URI src = URI.createURI(configuration.getAttribute(VeriATLLaunchConstants.SRC_PATH, ""));
            URI trg = URI.createURI(configuration.getAttribute(VeriATLLaunchConstants.TRG_PATH, ""));
            

            URI inModel = URI.createURI(configuration.getAttribute(EMFTVMLaunchConstants.INPUT_MODELS, Collections.emptyMap()).values().iterator().next());
            URI outModel = URI.createURI(configuration.getAttribute(EMFTVMLaunchConstants.OUTPUT_MODELS, Collections.emptyMap()).values().iterator().next());

            Mode m = null;
            if(configuration.getAttribute(Mode.EXEC.getName(), true)){
            	m = Mode.EXEC;
            }else if(configuration.getAttribute(Mode.GEN.getName(), true)){
            	m = Mode.GEN;
            }else if(configuration.getAttribute(Mode.VERIFY.getName(), true)){
            	m = Mode.VERIFY;
            }else{
            	m = Mode.DEBUG;
            }

            URI contract = URI.createURI(configuration.getAttribute(VeriATLLaunchConstants.CONTRACT_PATH, ""));
            URI base = URI.createURI(configuration.getAttribute(VeriATLLaunchConstants.PROJ_PATH, ""));
            String post = configuration.getAttribute(VeriATLLaunchConstants.POST_NAME, "");
            
            
            return new Context(pluginUri, moduleName, src, trg, inModel, outModel, m, contract, base, post, monitor);
        }
        catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    
    /**
     * Returns the {@link String} of the ATL module name.
     *
     * @return the String
     */
    public String moduleName() {
        return moduleName;
    }
    
    /**
     * Returns the {@link URI} of the ATL module, without its extension.
     *
     * @return the URI
     */
    public URI module() {
        return pluginUri.appendSegment(moduleName);
    }


    

    /**
     * Returns the input model.
     *
     * @return the model
     */
    public URI inModel() {
        return inModel;
    }

    /**
     * Returns the output model.
     *
     * @return the model
     */
    public URI outModel() {
        return outModel;
    }

    /**
     * Returns the direction of the transformation.
     *
     * @return the direction
     */
    public Mode mode() {
        return mode;
    }



    /**
     * Returns the metamodel of the source model.
     *
     * @return the URI of the metamodel, or {@code null} if it is not defined
     */
    public URI inMetamodel() {
        return inMetamodel;
    }

    /**
     * Defines the metamodel of the source model.
     *
     * @param inMetamodel the URI of the metamodel
     */
    public void inMetamodel(URI inMetamodel) {
        this.inMetamodel = inMetamodel;
    }

    /**
     * Returns the metamodel of the target model.
     *
     * @return the URI of the metamodel, or {@code null} if it is not defined
     */
    public URI outMetamodel() {
        return outMetamodel;
    }

    /**
     * Defines the metamodel of the target model.
     *
     * @param outMetamodel the URI of the metamodel
     */
    public void outMetamodel(URI outMetamodel) {
        this.outMetamodel = outMetamodel;
    }

    /**
     * Checks whether that this context has been initialized.
     *
     * @return {@code true} if the context has been initialized
     */
    public boolean isInitialized() {
        return initialized;
    }

    /**
     * Defines this context as initialized.
     */
    public void setInitialized() {
        this.initialized = true;
    }

    
    
    /**
     * Returns the path of the contract.
     *
     * @return the contractPath
     */
    public URI contractPath() {
        return contractPath;
    }
    
    /**
     * Returns the project path.
     *
     * @return the basePath
     */
    public URI basePath() {
        return basePath;
    }
    
    /**
     * Returns the name of the postcondition to be verified.
     *
     * @return the postName
     */
    public String postName() {
        return postName;
    }
    /**
     * Returns the progress monitor of this context.
     *
     * @return the progress monitor
     */
    public IProgressMonitor monitor() {
        return monitor;
    }
}
