package fr.emn.atlanmod.veriatl.tests.util;

import static java.util.Objects.isNull;

import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.Map;

import org.eclipse.core.runtime.FileLocator;
import org.eclipse.core.runtime.IPath;
import org.eclipse.core.runtime.Path;
import org.eclipse.core.runtime.Platform;
import org.eclipse.emf.common.util.URI;
import org.osgi.framework.Bundle;

import fr.emn.atlanmod.veriatl.tests.launcher.Activator;

public class URIs {

	
	/**
	 * Return the absolute path of a given uri.
	 * */
	public static String abs(URI uri) {
		IPath internalPath = new Path(uri.toFileString());
		Bundle bundle = Platform.getBundle(Activator.PLUGIN_ID);
		Map<String, String> options = Collections.emptyMap();
		java.nio.file.Path p = null;
		try {
			URL url = FileLocator.resolve(FileLocator.find(bundle, internalPath, options));

			if (isNull(url)) {
				throw new NullPointerException("Unable to find the files in '" + internalPath + "'");
			}

			p = Paths.get(url.toURI());
		} catch (IOException | URISyntaxException e) {
			e.printStackTrace();
		}
		
		return p.toAbsolutePath().toString();
	}
}
