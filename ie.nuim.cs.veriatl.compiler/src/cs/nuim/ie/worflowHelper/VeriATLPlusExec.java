package cs.nuim.ie.worflowHelper;



import java.io.File;
import java.util.Map;

import org.apache.commons.io.FileUtils;

import ie.nuim.cs.atl.core.printClassifierTable;
import ie.nuim.cs.atl.core.printStringConstant;

public class VeriATLPlusExec extends Exec {
	
	public VeriATLPlusExec(String b, Map<String, String> d, String pN, String bP) {
		super(b, d, pN, bP);
	}


	
	public void genContract(String proj) throws Exception{
		String dirPath = base + "/" + proj + "/";
		String contract = dirPath + dirs.get("contract");
		String outPath = dirPath + dirs.get("correct");
		
		String workflow = base  + "/src/workflow/" + "Preconditions.mwe";
		String srcPath = FileHelper.getFirstFile(contract);
		
		doRun(srcPath, outPath, workflow);
		
	}
	
	public void genRuntime(String proj) throws Exception{
		String dirPath = proj + "/";	// for ASM reader, base is omitted.
		String asm = dirPath + dirs.get("asm");
		String asmPath = FileHelper.getFirstFile(asm);
		String outPath = dirPath + dirs.get("rule");
		
		
		String src = dirPath + dirs.get("srcmm");
		String tar = dirPath + dirs.get("tarmm");

		String srcId = FileHelper.getFirstFileName(src);
		String tarId = FileHelper.getFirstFileName(tar);
		
		String srcPath = src + "/"+ srcId+".ecore";
		String tarPath = tar + "/"+ tarId+".ecore";


		String genCl = outPath+"/classifierTable.bpl";
		String genConst = outPath + "/constants.bpl";

		printClassifierTable.genClassifierTable(srcPath, tarPath, genCl);
		printStringConstant.genStringConstant(asmPath, srcPath, tarPath, genConst);
	}
	

	
	
	
	
	
	public void genExecSem(String proj) throws Exception{
		
		String dirPath = base + "/" + proj + "/";
		
		
		String atl = dirPath + dirs.get("atl");
		String outPath = dirPath + dirs.get("exec");	
		String workflow = "";	
		String atlPath = FileHelper.getFirstFile(atl);
		

		
		workflow = base  + "/src/workflow/" + "atlApplyAll2Boogie.mwe";		
		doRun(atlPath, outPath, workflow);
		
		workflow = base  + "/src/workflow/" + "atlMatchAll2Boogie.mwe";	
		doRun(atlPath, outPath, workflow);	
		
		workflow = base  + "/src/workflow/" + "surjective.mwe";	
		doRun(atlPath, outPath, workflow);	
		
		
	}

	
	public void clean(String proj) throws Exception {
		String dirPath = base + "/" + proj + "/";
		String tar = dirPath + dirs.get("mm");	
		
		for(File f : FileUtils.listFiles(new File(tar), new String[]{"conf"}, true)){
			f.delete();
		}
	}



	@Override
	public void genAuxu(String proj) throws Exception{
		// TODO Auto-generated method stub
		
	}


	

	

}
