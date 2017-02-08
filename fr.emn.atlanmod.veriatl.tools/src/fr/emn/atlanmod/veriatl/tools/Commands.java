package fr.emn.atlanmod.veriatl.tools;

import org.eclipse.core.runtime.FileLocator;
import org.eclipse.core.runtime.IPath;
import org.eclipse.core.runtime.Platform;
import org.osgi.framework.Bundle;

import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.Map;

import static java.util.Objects.isNull;

/**
 * A factory of {@link CommandBuilder}s.
 */
public class Commands {

	private static final String BUNDLE_SYMBOLIC_NAME = "fr.emn.atlanmod.veriatl.tools";

	private Commands() {
		throw new IllegalStateException("This class should not be initialized");
	}


	
	/**
	 * Returns a specific {@link CommandBuilder} for Boogie.
	 *
	 * @return a new builder
	 */
	public static BoogieCommandBuilder boogie() {
		return new BoogieCommandBuilder(resolve("Boogie-2.3.0"));
	}

	/**
	 * Resolves the absolute path of a library's binaries, according to the
	 * given {@code name}. These binaries must be located in the
	 * {@code lib/${name}/bin} folder of the current bundle.
	 *
	 * @param name
	 *            the name of the library
	 *
	 * @return the absolute path of the library
	 */
	public static Path resolve(String name) {
		IPath internalPath = new org.eclipse.core.runtime.Path(String.format("lib/%s/%s", name, os()));
		Bundle bundle = Platform.getBundle(BUNDLE_SYMBOLIC_NAME);
		Map<String, String> options = Collections.emptyMap();

		try {
			URL url = FileLocator.resolve(FileLocator.find(bundle, internalPath, options));

			if (isNull(url)) {
				throw new NullPointerException("Unable to find the binaries in '" + internalPath + "'");
			}

			return Paths.get(url.toURI());
		} catch (IOException | URISyntaxException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	private static String os() {
		String name = System.getProperty("os.name").toLowerCase();
		String arch = System.getProperty("os.arch").toLowerCase();

		if (name.contains("win")) {
			name = "win";
		} else if (name.contains("mac")) {
			name = "osx";
		} else {
			name = "linux";
		}

		if (arch.contains("64")) {
			arch = "64";
		} else {
			arch = "32";
		}

		return String.format("%s-%s", name, arch);
	}
}