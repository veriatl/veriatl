/**
 * 
 */
package fr.emn.atlanmod.atl2boogie.xtend.lib

import java.io.IOException
import java.nio.charset.Charset
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.URIConverter
import org.eclipse.emf.ecore.resource.impl.ExtensibleURIConverterImpl
import java.nio.file.Paths
import org.eclipse.core.resources.ResourcesPlugin
import java.io.File
import org.eclipse.core.runtime.Platform

/**
 * @author zcheng
 * 
 */
class URIs {

	/**
	 * Write the {@code String} {@link content} to the {@code target} {@link URI}.
	 * 
	 * @param target the URI of the write
	 * @param content the content to write
	 * 
	 * @return the {@code target} URI
	 */
	def public static URI write(URI target, String content) throws RuntimeException{

		val URIConverter uriConverter = new ExtensibleURIConverterImpl();

		try {
			var outputStream = uriConverter.createOutputStream(target)
			outputStream.write(content.getBytes(Charset.forName("UTF-8")))
			outputStream.close
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}

		return target;

	}
	
	def public static void delete(URI target) throws RuntimeException{
		
		if(!Platform.isRunning()){
			// do some standalone application del
			return
		}
		
		val folder = Paths.get(
                ResourcesPlugin.getWorkspace()
                        .getRoot()
                        .getFile(new org.eclipse.core.runtime.Path(target.toPlatformString(true)))
                        .getRawLocation()
                        .toOSString()).toString();
                     
        deleteFolder(new File(folder))
	}
	
	def private static void deleteFolder(File folder) {
	    val files = folder.listFiles();
	    if(files !== null) { //some JVMs return null for empty dirs
	        for(File f: files) {
	            if(f.isDirectory()) {
	                deleteFolder(f);
	            } else {
	                f.delete();
	            }
	        }
	    }
	    //folder.delete();
	}
	

}
