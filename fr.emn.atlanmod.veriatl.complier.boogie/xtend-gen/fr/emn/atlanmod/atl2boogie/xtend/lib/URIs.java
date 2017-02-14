package fr.emn.atlanmod.atl2boogie.xtend.lib;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;
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
      outputStream.write(content.getBytes(Charset.forName("UTF-8")));
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
}
