package cs.nuim.ie;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;


import cs.nuim.ie.workflowRunner.xpandExec;

public class JavaExtension {
	enum propertyType {primitive, reference, references};
	
	
	
	static Map<String, Object> runtimeMap = new HashMap<String, Object>();
	
	public static void store(Object o, String key, Object val){
		runtimeMap.put(key, val);
	}
	
	public static Object query(Object o, String key){
		return runtimeMap.get(key);
	}
	
	
	public static boolean contains(Object o, String key){
		return runtimeMap.containsKey(key);
	}
	
	public static final HashMap<String, propertyType> FieldTypeTable = new HashMap<String, propertyType>();
	public static final HashMap<String, String> parentInfo = new HashMap<String, String>();
	public static final HashMap<String, String> SFTable = new HashMap<String, String>();
	
	static {
		String dir = xpandExec.base + "/" + xpandExec.projName + xpandExec.dirs.get("mm");
		File d = new File(dir);
		
		
		if(FieldTypeTable.keySet().isEmpty()){
			for(File f : d.listFiles()){
				if(f.getName().endsWith(".conf")){
					try {
						for(String line : FileUtils.readLines(f)){
							if(line.length()>0){
								String[] prop = line.split(":");
								if(prop[0].equals("FieldTypeTable")){
									switch(Integer.parseInt(prop[2])){
										case 0: FieldTypeTable.put(prop[1], propertyType.primitive); break;
										case 1: FieldTypeTable.put(prop[1], propertyType.reference);break;
										default: FieldTypeTable.put(prop[1], propertyType.references);
									}
								}else if(prop[0].equals("parentInfo")){
									parentInfo.put(prop[1], prop[2]);
								}else if(prop[0].equals("SFTable")){
									SFTable.put(prop[1], prop[2]);
								}
							}
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
	
	
	public static String getFeature(Object o, String mmName, String clName, String fName){
		String potentReturn = String.format("%s$%s.%s", mmName,clName,fName);
		
		
		if(FieldTypeTable.containsKey(potentReturn)){
			return potentReturn;
		}else{
			String classifier = String.format("%s$%s", mmName, clName);
			if(parentInfo.containsKey(classifier)){
				String parent = parentInfo.get(classifier);
				String rtn = String.format("%s.%s", parent,fName);
				return rtn;
			}else{
				return "_Unknown_Feature_";
			}
			 
		}
		
		
		
		
	}
	
	public static boolean isPrimitive(Object o, String property){
	
		if(FieldTypeTable.get(property)!=null && FieldTypeTable.get(property) == propertyType.primitive){
			return true;
		}

		return false;
	}
	
	public static boolean isReference(Object o, String property){

		if(FieldTypeTable.get(property)!=null && FieldTypeTable.get(property) == propertyType.reference){
			return true;
		}

		return false;
	}
	
	
	public static String getRefType(Object o, String mm, String cl, String ref){
		String sf = String.format("%s$%s.%s", mm,cl,ref);
		String qualifiedClassifier = String.format("%s$%s", mm, cl);
		String abClassifier = "_Unknown_Feature_";
		String absf = "_Unknown_Feature_";
		
		if(parentInfo.containsKey(qualifiedClassifier)){
			abClassifier = parentInfo.get(qualifiedClassifier);
			absf = String.format("%s.%s", abClassifier, ref);
		}
		
		if(SFTable.containsKey(sf)){
			return SFTable.get(sf);
		}else if(SFTable.containsKey(absf)){
			return SFTable.get(absf);
		}else{
			return String.format("%s:%s:%s", sf, mm, cl);
		}
		
		
	}

	
	
	
	
}
