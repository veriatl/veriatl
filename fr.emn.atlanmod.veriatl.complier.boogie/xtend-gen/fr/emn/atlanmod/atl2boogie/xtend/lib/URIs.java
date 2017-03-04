package fr.emn.atlanmod.atl2boogie.xtend.lib;

import fr.emn.atlanmod.atl2boogie.xtend.util.CompilerConstants;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.resource.URIConverter;
import org.eclipse.emf.ecore.resource.impl.ExtensibleURIConverterImpl;
import org.eclipse.xtext.xbase.lib.Exceptions;

/**
 * @author zcheng
 */
@SuppressWarnings("all")
public class URIs {
  /**
   * Write the {@code String} {@link content} to the {@code target} {@link URI}.
   * 
   * @param target the URI of the write
   * @param content the content to write
   * 
   * @return the {@code target} URI
   */
  public static URI write(final URI target, final String content) throws RuntimeException {
    final URIConverter uriConverter = new ExtensibleURIConverterImpl();
    try {
      OutputStream outputStream = uriConverter.createOutputStream(target);
      Charset _forName = Charset.forName("UTF-8");
      byte[] _bytes = content.getBytes(_forName);
      outputStream.write(_bytes);
      outputStream.close();
    } catch (final Throwable _t) {
      if (_t instanceof IOException) {
        final IOException e = (IOException)_t;
        e.printStackTrace();
        throw new RuntimeException(e);
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
    return target;
  }
  
  public static void delete(final URI target) throws RuntimeException {
    final URIConverter uriConverter = new ExtensibleURIConverterImpl();
    try {
      boolean _exists = uriConverter.exists(target, null);
      if (_exists) {
        uriConverter.delete(target, null);
      }
    } catch (final Throwable _t) {
      if (_t instanceof IOException) {
        final IOException e = (IOException)_t;
        e.printStackTrace();
        throw new RuntimeException(e);
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  /**
   * write proof tree to a URI
   * TODO don't append
   * @param outputPath
   * @param tree
   * @param append
   */
  public static void writeTree(final URI outputPath, final String post, final String surfix, final /* ArrayList<Node> */Object tree) {
    final String cache = String.format("%s", surfix);
    URI _appendSegment = outputPath.appendSegment(CompilerConstants.CACHE);
    URI _appendSegment_1 = _appendSegment.appendSegment(post);
    URI _appendSegment_2 = _appendSegment_1.appendSegment(cache);
    final URI cachePath = _appendSegment_2.appendFileExtension(CompilerConstants.CACHEEXT);
    final URIConverter uriConverter = new ExtensibleURIConverterImpl();
    try {
      final OutputStream outputStream = uriConverter.createOutputStream(cachePath);
      final ObjectOutputStream out = new ObjectOutputStream(outputStream);
      out.writeObject(tree);
      out.flush();
      out.close();
    } catch (final Throwable _t) {
      if (_t instanceof IOException) {
        final IOException e = (IOException)_t;
        e.printStackTrace();
        throw new RuntimeException(e);
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
}
