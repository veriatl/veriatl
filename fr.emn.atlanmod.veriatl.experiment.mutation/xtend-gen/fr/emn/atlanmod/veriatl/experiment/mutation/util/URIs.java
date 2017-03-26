package fr.emn.atlanmod.veriatl.experiment.mutation.util;

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
}
