/**
 * 
 */
package fr.emn.atlanmod.atl2boogie.xtend.lib

import java.io.IOException
import java.nio.charset.Charset
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.URIConverter
import org.eclipse.emf.ecore.resource.impl.ExtensibleURIConverterImpl
import java.io.OutputStream
import fr.emn.atlanmod.atl2boogie.xtend.util.CompilerConstants
import java.util.Date
import java.text.SimpleDateFormat
import java.util.ArrayList
import datastructure.Node
import java.io.ObjectOutputStream

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
	
	/**
	 * write proof tree to a URI
	 * TODO don't append
	 * @param outputPath
	 * @param tree
	 * @param append
	 */
	def static void writeTree(URI outputPath, String post, String surfix, ArrayList<Node> tree) {
		val cache = String.format("%s", surfix);
		
		val cachePath = outputPath.appendSegment(CompilerConstants.CACHE).appendSegment(post).appendSegment(cache).appendFileExtension(CompilerConstants.CACHEEXT);
		
		val URIConverter uriConverter = new ExtensibleURIConverterImpl();

		try {
			val OutputStream outputStream = uriConverter.createOutputStream(cachePath);
			val ObjectOutputStream out = new ObjectOutputStream(outputStream);
			out.writeObject(tree);
	        out.flush();
	        out.close();
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
		
	}
}
