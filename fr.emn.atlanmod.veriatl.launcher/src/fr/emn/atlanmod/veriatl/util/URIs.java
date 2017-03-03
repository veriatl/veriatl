package fr.emn.atlanmod.veriatl.util;

import org.eclipse.core.resources.ResourcesPlugin;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.resource.URIConverter;
import org.eclipse.emf.ecore.resource.impl.ExtensibleURIConverterImpl;

import datastructure.Node;
import fr.emn.atlanmod.atl2boogie.xtend.util.CompilerConstants;

import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.nio.channels.WritableByteChannel;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import static java.util.Objects.nonNull;

/**
 * Utility methods for working with {@link URI}s.
 */
public final class URIs {

    private URIs() {
        throw new IllegalStateException("This class should not be initialized");
    }

    /**
     * Returns the absolute path of the platform-based {@code uri}.
     *
     * @param uri the URI for which to find the absolute path
     *
     * @return the absolute path of the URI
     */
    public static String abs(URI uri) {
        return Paths.get(
                ResourcesPlugin.getWorkspace()
                        .getRoot()
                        .getFile(new org.eclipse.core.runtime.Path(uri.toPlatformString(true)))
                        .getRawLocation()
                        .toOSString()).toString();
    }

    /**
     * Returns the filename of the {@code uri} with a new {@code suffix}.
     *
     * @param uri    the uri
     * @param suffix the new suffix of the filename.
     *
     * @return the filename of the {@code uri}. If {@code suffix} is {@code null}, returns the filename without its
     * extension.
     */
    public static String fn(URI uri, String suffix) {
        return fn(uri.trimFileExtension().lastSegment(), suffix);
    }

    /**
     * Returns the filename of the {@code uri} with a new {@code suffix}.
     *
     * @param uri    the literal representation of the uri
     * @param suffix the new suffix of the filename.
     *
     * @return the filename of the {@code uri}. If {@code suffix} is {@code null}, returns the filename without its
     * extension.
     */
    public static String fn(String uri, String suffix) {
        return uri.concat(nonNull(suffix) ? suffix : "");
    }

    /**
     * Copies the content of the {@code source} {@link URI} to the {@code target} {@link URI}.
     *
     * @param source the URI to copy
     * @param target the URI of the copy
     *
     * @return the {@code target} URI
     */
    public static URI copy(URI source, URI target) {
        try {
            URIConverter uriConverter = new ExtensibleURIConverterImpl();
            uriConverter.createInputStream(source);
            uriConverter.createOutputStream(target);

            try (InputStream inputStream = uriConverter.createInputStream(source); OutputStream outputStream = uriConverter.createOutputStream(target)) {
                try (ReadableByteChannel inputChannel = Channels.newChannel(inputStream); WritableByteChannel outputChannel = Channels.newChannel(outputStream)) {
                    final ByteBuffer buffer = ByteBuffer.allocateDirect(16 * 1024);
                    while (inputChannel.read(buffer) != -1) {
                        buffer.flip();
                        outputChannel.write(buffer);
                        buffer.compact();
                    }
                    buffer.flip();
                    while (buffer.hasRemaining()) {
                        outputChannel.write(buffer);
                    }
                }
            }
            return target;
        }
        catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    
    
	@SuppressWarnings("unchecked")
	/**
	 * load proof tree from the given URI, return {@code null} if no tree is found.
	 * */
	public static ArrayList<Node> load(URI src) {
		URIConverter uriConverter = new ExtensibleURIConverterImpl();
		ArrayList<Node> arr;

		try {
			InputStream inputStream = uriConverter.createInputStream(src);
			ObjectInputStream in = new ObjectInputStream(inputStream);
			arr = (ArrayList<Node>) in.readObject();
			in.close();
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	

}
