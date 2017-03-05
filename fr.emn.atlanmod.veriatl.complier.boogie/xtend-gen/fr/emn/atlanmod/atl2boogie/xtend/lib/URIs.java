package fr.emn.atlanmod.atl2boogie.xtend.lib;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.nio.file.Paths;
import org.eclipse.core.resources.IWorkspaceRoot;
import org.eclipse.core.resources.ResourcesPlugin;
import org.eclipse.core.runtime.Path;
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
    IWorkspaceRoot _root = ResourcesPlugin.getWorkspace().getRoot();
    String _platformString = target.toPlatformString(true);
    Path _path = new Path(_platformString);
    final String folder = Paths.get(
      _root.getFile(_path).getRawLocation().toOSString()).toString();
    File _file = new File(folder);
    URIs.deleteFolder(_file);
  }
  
  private static void deleteFolder(final File folder) {
    final File[] files = folder.listFiles();
    if ((files != null)) {
      for (final File f : files) {
        boolean _isDirectory = f.isDirectory();
        if (_isDirectory) {
          URIs.deleteFolder(f);
        } else {
          f.delete();
        }
      }
    }
  }
}
