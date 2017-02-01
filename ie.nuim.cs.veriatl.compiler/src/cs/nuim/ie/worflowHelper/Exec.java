package cs.nuim.ie.worflowHelper;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.mwe.core.WorkflowRunner;
import org.eclipse.emf.mwe.core.monitor.NullProgressMonitor;

public abstract class Exec {
	public static String base = System.getProperty("user.dir");
	public static Map<String, String> dirs ;
	public static String projName;
	public static String boogiePath;
	
	public Exec(String b, Map<String, String> d, String pN, String bP){
		base = b;
		dirs = d;
		projName = pN;
		boogiePath = bP;
	}
	
	
	public void genExternalConfigruation(String proj, String nature) throws Exception{
		String outPath = base+"/"+proj+nature+".launch";
		String content = genExternalConfigruationHeader();
		
		content += "<stringAttribute key=\"org.eclipse.ui.externaltools.ATTR_LOCATION\" value=\""+boogiePath+"\"/>";
		content += "\n";	
		
		content += "<stringAttribute key=\"org.eclipse.ui.externaltools.ATTR_TOOL_ARGUMENTS\" value=\"";
		
		String prelude = "src/Prelude/";
		content += FileHelper.getFilesNames(base+"/", prelude, ".bpl", "&#10;");
		
		String auxPath = proj+dirs.get("rule")+"/";

		content += auxPath+"classifierTable.bpl"+"&#10;";
		content += auxPath+"constants.bpl"+"&#10;";
		
		String mmPath = proj+dirs.get("mm")+"/";
		content += FileHelper.getFilesNames(base+"/", mmPath, ".bpl", "&#10;");
		
		String execPath = proj+dirs.get("exec")+"/";
		content += FileHelper.getFilesNames(base+"/", execPath, ".bpl", "&#10;");
		
	
		if(nature.equals("_Correctness")){
			String driver = proj+dirs.get("correct")+"/";
			content += driver + "Driver.bpl&#10;";
		}
		
		content += "${resource_loc}";
		content += "\"/>";
		content += "\n";
		
		content += "<stringAttribute key=\"org.eclipse.ui.externaltools.ATTR_WORKING_DIRECTORY\" value=\""+base+"\"/>";
		content += "\n";
		
		content += genExternalConfigruationFooter();
		
		FileHelper.myFileWriter(outPath, content);
		
	}
	
	
	public String genExternalConfigruationHeader(){
		String header = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>";
		header += "\n";
		header += "<launchConfiguration type=\"org.eclipse.ui.externaltools.ProgramLaunchConfigurationType\">";
		header += "\n";
		return header;
	}
	
	public String genExternalConfigruationFooter(){
		String footer = "</launchConfiguration>";
		return footer;
	}
	
	public void genMetamodels(String proj) throws Exception{
		String dirPath = base + "/" + proj + "/";
		String src = dirPath + dirs.get("srcmm");
		String tar = dirPath + dirs.get("tarmm");
		String outPath = dirPath + dirs.get("mm");
		
		String workflow = base  + "/src/workflow/" + "mm2Boogie.mwe";
		
		String srcPath = FileHelper.getFirstFile(src);
		String tarPath = FileHelper.getFirstFile(tar);
		
		doRun(srcPath, outPath, workflow);
		doRun(tarPath, outPath, workflow);	
		 
	    workflow = base  + "/src/workflow/" + "aux2Boogie.mwe";
	    doRun(srcPath, outPath, workflow);
		doRun(tarPath, outPath, workflow);	
		
		workflow = base  + "/src/workflow/" + "validSrc2Boogie.mwe";
	    doRun(srcPath, outPath, workflow);
		
	}
	
	@SuppressWarnings("deprecation")
	void doRun(String inputPath, String outPath, String workflow){
		File f = new File(inputPath);
		URI fileURI = URI.createFileURI(f.getAbsolutePath());

		Map<String, String> properties = new HashMap<String, String>();
		properties.put("model", fileURI.toString());
		properties.put("src-gen",outPath);
		Map slotContents = new HashMap();
		
		WorkflowRunner wr = new WorkflowRunner();
		
		wr.run(workflow, new NullProgressMonitor(), properties, slotContents);
	}
	
	
	
	public abstract void genContract(String proj) throws Exception;
	public abstract void genRuntime(String proj) throws Exception;
	public abstract void genExecSem(String proj) throws Exception;
	public abstract void genAuxu(String proj) throws Exception;
	
	public abstract void clean(String proj) throws Exception ;


	
	
}
