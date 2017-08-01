package fr.emn.atlanmod.veriatl.tests.util;

public class Strings {

	/**
	 * Return filename without extension.
	 * 
	 * If dot symbol is not found in the input, the input is returned.
	 * */
	public static String filename(String FileFullName){
		
		// null check
		if(FileFullName == null) {
			return null;
		}
		
		// dot check
		int dot = FileFullName.lastIndexOf(".");
		
		if(dot != -1){
			return FileFullName.substring(0, FileFullName.lastIndexOf("."));
		}else{
			return FileFullName;
		}
		
	}
}
