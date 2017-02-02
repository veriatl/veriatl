package fr.emn.atlanmod.veriatl.driver.workflowRunner;




import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.util.Map;

import org.apache.commons.io.FileUtils;

import fr.emn.atlanmod.veriatl.driver.helper.Exec;
import fr.emn.atlanmod.veriatl.driver.helper.FileHelper;
import fr.emn.atlanmod.veriatl.driver.helper.VeriATLPlusPlusExec;



public class main {

	public static String base = System.getProperty("user.dir");
	public static Map<String, String> dirs ;
	public static String projName;
	public static String boogiePath;
	public static String mode;
	public static Exec execution;
	
	public static void main(String[] args) throws Exception{
		//Map<String, String> conf = FileHelper.myFileReader("veriATL.conf");

   
	    if(args.length < 3){
	    	throw new Exception("no option provided to continue VeriATL, using \"help\" to see available options");
	    }
	    
	    String op = args[0];
	    projName = args[1];	
	    mode = args[2];
	    
	    System.out.println(projName);
	    
	    
	    if(op.equals("init")){
	    	init(projName, mode);
	    }else if(op.equals("extract")){
	    	// model extractor
	    }else if(op.equals("gen")){
	    	// init proj 
	    	if(mode.equals("plusplus")){
				dirs = FileHelper.loadDirPlusPlus();
				execution = new VeriATLPlusPlusExec(base, dirs, projName, boogiePath);
				
				// MOVE EMFTVM FILES
				String dirPath = projName + "/";	
				String emftvm = dirPath + dirs.get("atl_src")+"/";
				String target = dirPath + dirs.get("emftvm");

				File srcFile = FileHelper.getFilebyExt(emftvm, "emftvm");
				FileUtils.copyFileToDirectory(srcFile, new File(target));
				
				execution.genAuxu(projName);
			}
	    	
	    	

			
			
	    }else if(op.equals("decompose")){
	    	//ocl decomposer
	    }else if(op.equals("help")){
	    	printHelp();
	    }
	    	
		
		
		
	}
	

	static void printHelp() throws Exception{
		File f = new File("readme.md");
        BufferedReader input = new BufferedReader(new InputStreamReader(new FileInputStream(f)));
     
        String line;
        while ((line = input.readLine()) != null) {
           System.out.println(line);
        }

        input.close();
	}
	
	static void init(String proj, String option) throws Exception{
		
		if(option.equals("base")){
			dirs = FileHelper.myFileCreator(base, projName);	
		}else if(option.equals("plus")){
			dirs = FileHelper.myFileCreatorPlus(base, projName);	
		}else if(option.equals("plusplus")){
			dirs = FileHelper.myFileCreatorPlusPlus(base, projName);	
		}
			
		String pAuxu = proj + "/Auxu/";
		String pSub = proj + "/Sub-goals/";
		
		if(new File(pAuxu).exists()){
			FileUtils.cleanDirectory(new File(pAuxu));
		}
		
		if(new File(pSub).exists()){
			FileUtils.cleanDirectory(new File(pSub));
		}
		
		
	}
	
	

}
