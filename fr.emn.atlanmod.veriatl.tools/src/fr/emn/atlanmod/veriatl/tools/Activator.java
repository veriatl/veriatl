package fr.emn.atlanmod.veriatl.tools;

import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;

public class Activator implements BundleActivator {

    private static BundleContext context;

    static BundleContext getContext() {
        return context;
    }

    @Override
    public void start(BundleContext bundleContext) throws Exception {
        context = bundleContext;
    }

    @Override
    public void stop(BundleContext bundleContext) throws Exception {
        context = null;
    }
}
