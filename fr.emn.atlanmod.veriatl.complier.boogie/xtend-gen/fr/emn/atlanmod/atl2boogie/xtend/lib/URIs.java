package fr.emn.atlanmod.atl2boogie.xtend.lib;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.nio.file.Paths;
import org.eclipse.core.resources.IFile;
import org.eclipse.core.resources.IWorkspace;
import org.eclipse.core.resources.IWorkspaceRoot;
import org.eclipse.core.resources.ResourcesPlugin;
import org.eclipse.core.runtime.IPath;
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
    IWorkspace _workspace = ResourcesPlugin.getWorkspace();
    IWorkspaceRoot _root = _workspace.getRoot();
    String _platformString = target.toPlatformString(true);
    Path _path = new Path(_platformString);
    IFile _file = _root.getFile(_path);
    IPath _rawLocation = _file.getRawLocation();
    String _oSString = _rawLocation.toOSString();
    java.nio.file.Path _get = Paths.get(_oSString);
    final String folder = _get.toString();
    File _file_1 = new File(folder);
    URIs.deleteFolder(_file_1);
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
