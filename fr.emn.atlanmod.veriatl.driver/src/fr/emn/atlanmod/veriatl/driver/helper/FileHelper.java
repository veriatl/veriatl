package fr.emn.atlanmod.veriatl.driver.helper;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;

public class FileHelper {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	
	
	public static void myFileWriter(String pName, String content) throws IOException{
		File file = new File(pName); 
		FileUtils.writeStringToFile(file, content, false);
	}
	
	public static Map<String, String> loadDirPlusPlus() throws IOException{
		Map<String, String> pthMap = new HashMap<String, String>();
		
		pthMap.put("mm","/Auxu");
		pthMap.put("correct","/Auxu");
		pthMap.put("exec","/Auxu");
		pthMap.put("rule","/Auxu");

		pthMap.put("srcmm","/Source/SRCMM");
		pthMap.put("tarmm","/Source/TARMM");

		pthMap.put("contract_src","/Source/ContractSRC");
		pthMap.put("atl_src","/Source/ATLSRC");
		pthMap.put("subgoal","/Sub-goals");
		pthMap.put("emftvm","/Source/EMFTVM");
		
		return pthMap;
	}
	
	public static Map<String, String> loadDirPlus() throws IOException{
		Map<String, String> pthMap = new HashMap<String, String>();
		
		pthMap.put("mm","/Auxu");
		pthMap.put("correct","/Auxu");
		pthMap.put("exec","/Auxu");
		pthMap.put("rule","/Auxu");
		pthMap.put("atl","/Source/ATL");
		pthMap.put("asm","/Source/ASM");
		pthMap.put("srcmm","/Source/SRCMM");
		pthMap.put("tarmm","/Source/TARMM");
		pthMap.put("contract","/Source/Contract");
		pthMap.put("contract_src","/Source/ContractSRC");
		pthMap.put("emftvm","/Source/EMFTVM");
		pthMap.put("atl_src","/Source/ATLSRC");
		pthMap.put("subgoal","/Sub-goals");
		
		return pthMap;
	}
	
	public static Map<String, String> loadDir() throws IOException{
		Map<String, String> pthMap = new HashMap<String, String>();
		
		pthMap.put("mm","/Metamodels");
		pthMap.put("correct","/ATL_Correctness");
		pthMap.put("rule","/ATL_Rule_Encoding");
		pthMap.put("exec","/ExecutionSemantics");
		pthMap.put("atl","/Source/ATL");
		pthMap.put("asm","/Source/ASM");
		pthMap.put("srcmm","/Source/SRCMM");
		pthMap.put("tarmm","/Source/TARMM");
		pthMap.put("contract","/Source/Contract");
		pthMap.put("contract_src","/Source/ContractSRC");
		pthMap.put("emftvm","/Source/EMFTVM");
		pthMap.put("atl_src","/Source/ATLSRC");
		
		return pthMap;
	}
	
	//TODO consider refactoring
	public static Map<String, String> myFileCreatorPlusPlus(String base, String name) throws IOException{
		Map<String, String> pthMap = new HashMap<String, String>();
		
		
		String pName = base+"/"+name;
		File file = new File(pName); 
		FileUtils.forceMkdir(file);
		
		pthMap = loadDirPlusPlus();
			
		for(String folder : pthMap.values()){
			String fName = pName+"/"+folder;
			file = new File(fName); 
			FileUtils.forceMkdir(file);
			
		}
		
		return pthMap;
	}
	
	public static Map<String, String> myFileCreatorPlus(String base, String name) throws IOException{
		Map<String, String> pthMap = new HashMap<String, String>();
		
		
		String pName = base+"/"+name;
		File file = new File(pName); 
		FileUtils.forceMkdir(file);
		
		pthMap = loadDirPlus();
			
		for(String folder : pthMap.values()){
			String fName = pName+"/"+folder;
			file = new File(fName); 
			FileUtils.forceMkdir(file);
			
		}
		
		return pthMap;
	}
	
	
	public static Map<String, String> myFileCreator(String base, String name) throws IOException{
		Map<String, String> pthMap = new HashMap<String, String>();
		
		
		String pName = base+"/"+name;
		File file = new File(pName); 
		FileUtils.forceMkdir(file);
		
	
		pthMap = loadDir();
		
		
		for(String folder : pthMap.values()){
			String fName = pName+"/"+folder;
			file = new File(fName); 
			FileUtils.forceMkdir(file);
			
		}
		
		return pthMap;
	}
	
	public static Map<String, String> myFileReader(String name) throws IOException{
		Map<String, String> conf = new HashMap<String, String>();
		List<String> lines = FileUtils.readLines(new File(name));
		
		for(String line : lines){
			String[] config = line.split(":");
			conf.put(config[0], config[1]);
		}
		
		return conf;
	}
	
	
	public static String getFirstFile(String name) {
		File file = new File(name);

        if (file.isDirectory()) {
            for(File fl : file.listFiles()){
            	return fl.getAbsolutePath();
            }
        }
        return null;
	}
	
	public static String getFirstFileName(String name) throws Exception{
		File file = new File(name);

        if (file.isDirectory()) {
            for(File fl : file.listFiles()){
            	return fl.getName().substring(0, fl.getName().lastIndexOf("."));
            }
        }
        throw new Exception("no file found");
	}
	
	
	public static File getFilebyExt(String path, String ext) throws Exception{
		
        for(File fl : FileUtils.listFiles(new File(path), new String[]{ext}, true)){
        	return fl;
        }
        
        return null;
	}
	
	public static String getFilesNames(String Base, String subPath, String ext, String delimiter) throws Exception{
		
		String Path = Base + subPath;
		
		File file = new File(Path);

		
		String res = "";
		
        if (file.isDirectory()) {
            for(File fl : file.listFiles()){
            	String flExt = fl.getName().substring(fl.getName().lastIndexOf("."));
            	
            	if(flExt.equals(ext)){
            		res += subPath+fl.getName();
            		res += delimiter;
            	}
            }
        }
		
        return res;
	}
	
	
}
