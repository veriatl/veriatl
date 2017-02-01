package cs.nuim.ie.workflowRunner;




import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.util.Map;

import org.apache.commons.io.FileUtils;



import cs.nuim.ie.worflowHelper.Exec;
import cs.nuim.ie.worflowHelper.FileHelper;
import cs.nuim.ie.worflowHelper.VeriATLExec;
import cs.nuim.ie.worflowHelper.VeriATLPlusExec;
import cs.nuim.ie.worflowHelper.VeriATLPlusPlusExec;



public class xpandExec {

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
	    	if(mode.equals("base")){
	    		dirs = FileHelper.loadDir();
				execution = new VeriATLExec(base, dirs, projName, boogiePath);
				
				//execution.genExternalConfigruation(projName, "_TranslationValidation");
				//execution.genExternalConfigruation(projName, "_Correctness");
				
				execution.genMetamodels(projName);	//(2) uncomment this line to generate source and target metamodels. 
				execution.genExecSem(projName);		//(2) uncomment this line to execution semantics from ATL transformation.
				execution.genRuntime(projName);		//(2) uncomment this line to generate runtime behaviors from ASM implementation.
				execution.genContract(projName);	//(2) uncomment this line to generate contracts from ATL contracts.
				execution.clean(projName);
			}else if(mode.equals("plus")){
				dirs = FileHelper.loadDirPlus();
				execution = new VeriATLPlusExec(base, dirs, projName, boogiePath);
				
				execution.genMetamodels(projName);	//(2) uncomment this line to generate source and target metamodels. 
				execution.genExecSem(projName);		//(2) uncomment this line to execution semantics from ATL transformation.
				execution.genRuntime(projName);		//(2) uncomment this line to generate runtime behaviors from ASM implementation.
				execution.genContract(projName);	//(2) uncomment this line to generate contracts from ATL contracts.
				execution.clean(projName);
			}else if(mode.equals("plusplus")){
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
