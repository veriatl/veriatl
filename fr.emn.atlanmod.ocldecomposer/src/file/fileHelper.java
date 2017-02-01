package file;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;


public class fileHelper {

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
	
	public static String getFirstFileNamebyExt(String path, String ext) throws Exception{
		
        for(File fl : FileUtils.listFiles(new File(path), new String[]{ext}, true)){
        	int sep = fl.getName().indexOf(".");
        	return fl.getName().substring(0, sep);
        }
        
        throw new Exception("no file found with the given ext");
	}
	
	public static String getFirstFilePathbyExt(String path, String ext) throws Exception{
		
        for(File fl : FileUtils.listFiles(new File(path), new String[]{ext}, true)){
        	return fl.getAbsolutePath();
        }
        
        throw new Exception("no file found with the given ext");
	}

	public static ArrayList<String> getFileNamesByPathExt(String path, String ext) throws Exception{
		ArrayList<String> rtn = new ArrayList<String>();
		
		
        for(File fl : FileUtils.listFiles(new File(path), new String[]{ext}, true)){
        	if(fl.getName().indexOf("original")==-1){
        		rtn.add(fl.getName());
        	}
        	
        }
        
        return rtn;
	}
	
}
