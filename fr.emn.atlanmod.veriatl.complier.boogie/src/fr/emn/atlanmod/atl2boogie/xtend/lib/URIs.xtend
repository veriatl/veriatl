/**
 * 
 */
package fr.emn.atlanmod.atl2boogie.xtend.lib

import java.io.IOException
import java.nio.charset.Charset
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.URIConverter
import org.eclipse.emf.ecore.resource.impl.ExtensibleURIConverterImpl

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

		val URIConverter uriConverter = new ExtensibleURIConverterImpl();

		try {
			if(uriConverter.exists(target, null)){
				uriConverter.delete(target, null)
			}
			
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}


	}
}
