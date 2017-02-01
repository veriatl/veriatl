package cs.nuim.ie.worflowHelper;


import java.util.Map;



import ie.nuim.cs.atl.core.printBoogie;
import ie.nuim.cs.atl.core.printClassifierTable;
import ie.nuim.cs.atl.core.printStringConstant;

public class VeriATLExec extends Exec {
	
	public VeriATLExec(String b, Map<String, String> d, String pN, String bP) {
		super(b, d, pN, bP);
	}



	public void genContract(String proj) throws Exception{
		String dirPath = base + "/" + proj + "/";
		String contract = dirPath + dirs.get("contract");
		String outPath = dirPath + dirs.get("correct");
		
		String workflow = base  + "/src/workflow/" + "Contract2Boogie.mwe";
		String srcPath = FileHelper.getFirstFile(contract);
		
		doRun(srcPath, outPath, workflow);
		
		String atl = dirPath + dirs.get("atl");
		String atlPath = FileHelper.getFirstFile(atl);
		workflow = base  + "/src/workflow/" + "Driver2Boogie.mwe";
		
		doRun(atlPath, outPath, workflow);
	}
	
	
	
	public void genRuntime(String proj) throws Exception{
		String dirPath = proj + "/";	// for ASM reader, base is omitted.
		String asm = dirPath + dirs.get("asm");
		String asmPath = FileHelper.getFirstFile(asm);
		String outPath = dirPath + dirs.get("rule");
		
		String emftvm = dirPath + dirs.get("emftvm")+"/";
		String moduleName = FileHelper.getFirstFileName(emftvm);
		
		
		String src = dirPath + dirs.get("srcmm");
		String tar = dirPath + dirs.get("tarmm");

		String srcId = FileHelper.getFirstFileName(src);
		String tarId = FileHelper.getFirstFileName(tar);
		
		String srcPath = src + "/"+ srcId+".ecore";
		String tarPath = tar + "/"+ tarId+".ecore";

		String genASM = outPath+"/";
		String genCl = outPath+"/classifierTable.bpl";
		String genConst = outPath + "/constants.bpl";


		
		printBoogie.genBoogie(asmPath, emftvm, moduleName, srcPath, srcId, tarPath, tarId, genASM);
		printClassifierTable.genClassifierTable(srcPath, tarPath, genCl);
		printStringConstant.genStringConstant(asmPath, srcPath, tarPath, genConst);
	}
	
	


	public void genExecSem(String proj) throws Exception{
		
		String dirPath = base + "/" + proj + "/";
		
		
		String atl = dirPath + dirs.get("atl");
		String outPath = dirPath + dirs.get("exec");	
		String workflow = base  + "/src/workflow/" + "atlApply2Boogie.mwe";	
		

		
		
		String atlPath = FileHelper.getFirstFile(atl);
		doRun(atlPath, outPath, workflow);
		
		workflow = base  + "/src/workflow/" + "atlApplyAll2Boogie.mwe";		
		doRun(atlPath, outPath, workflow);
		
		workflow = base  + "/src/workflow/" + "atlMatchAll2Boogie.mwe";	
		doRun(atlPath, outPath, workflow);	
		
		workflow = base  + "/src/workflow/" + "surjective.mwe";	
		doRun(atlPath, outPath, workflow);	
		
		//The genBy generator generates less effective genBy.bpl.
		//workflow = base  + "/src/workflow/" + "genBy.mwe";	
		//doRun(atlPath, outPath, workflow);	
		
	}


	//TODO write the clean function
	@Override
	public void clean(String proj) throws Exception {
		
	}



	@Override
	public void genAuxu(String proj) throws Exception {
		// TODO Auto-generated method stub
		
	}
	

	
	

}
