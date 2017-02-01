package cs.nuim.ie.worflowHelper;



import java.io.File;
import java.util.Map;

import org.apache.commons.io.FileUtils;

import ie.nuim.cs.atl.core.printClassifierTable;
import ie.nuim.cs.atl.core.printStringConstant;
import fr.emn.atlanmod.atl2boogie.xtend.core.*;

public class VeriATLPlusPlusExec extends Exec {
	
	public VeriATLPlusPlusExec(String b, Map<String, String> d, String pN, String bP) {
		super(b, d, pN, bP);
	}
	
	
	public void genAuxu(String proj) throws Exception{
		
		String dirPath = proj + "/" ;
		
		
		
		String atl = dirPath + dirs.get("atl_src");
		File atlFile = FileHelper.getFilebyExt(atl, "atl");	
		String src = dirPath + dirs.get("srcmm");
		String tar = dirPath + dirs.get("tarmm");	
		
		String atlPath = dirPath + dirs.get("atl_src") + "/"+atlFile.getName();
		String srcPath = FileHelper.getFirstFile(src);
		String tarPath = FileHelper.getFirstFile(tar);
		
		String contract = dirPath + dirs.get("contract_src");
		File contractFile = FileHelper.getFilebyExt(contract, "atl");	
		String contractPath = "";
		
		if(contractFile == null){
			contractPath = "NoContract";
		}else{
			contractPath = dirPath + dirs.get("contract_src") + "/"+contractFile.getName();
		}
		
		String outPath = dirPath + dirs.get("exec") + "/";	
		new driver().generate(atlPath, srcPath, tarPath, contractPath, outPath);
	}

	
	public void clean(String proj) throws Exception {
		String dirPath = base + "/" + proj + "/";
		String tar = dirPath + dirs.get("mm");	
		
		for(File f : FileUtils.listFiles(new File(tar), new String[]{"conf"}, true)){
			f.delete();
		}
	}


	@Override
	public void genContract(String proj) throws Exception {
		
	}


	@Override
	public void genRuntime(String proj) throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void genExecSem(String proj) throws Exception {
		// TODO Auto-generated method stub
		
	}


	

	

}
