package incremental;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

import datastructure.IncrementalResult;

public class evaluation {

	public static void ORG() throws Exception{
		incrementalDriver.init();
		incrementalDriver.verify_org("HSM2FSM");
		incrementalDriver.verify_org("DB3");
		incrementalDriver.verify_org("MB6");
		incrementalDriver.verify_org("AF2");
		incrementalDriver.verify_org("MF6");
		incrementalDriver.verify_org("DR1");
		incrementalDriver.verify_org("AR");
	
	}
	
	public static void LOC() throws Exception{
		incrementalDriver.init();
		incrementalDriver.verify_loc("HSM2FSM");
		incrementalDriver.verify_loc("DB3");
		incrementalDriver.verify_loc("MB6");
		incrementalDriver.verify_loc("AF2");
		incrementalDriver.verify_loc("MF6");
		incrementalDriver.verify_loc("DR1");
		incrementalDriver.verify_loc("AR");
	
	}
	
	public static void INC_POST_CACHE() throws Exception{
		incrementalDriver.init();
		IncrementalResult hsm2fsmRes = incrementalDriver.verify_loc("HSM2FSM");

		incrementalDriver.inc_verify_post_cache("HSM2FSM", "DB3", "IS2IS", hsm2fsmRes,true);
		incrementalDriver.inc_verify_post_cache("HSM2FSM", "MB6", "T2TB", hsm2fsmRes,true);
		incrementalDriver.inc_verify_post_cache("HSM2FSM", "AF2", "RS2RS", hsm2fsmRes,true);
		incrementalDriver.inc_verify_post_cache("HSM2FSM", "MF6", "T2TB", hsm2fsmRes,true);
		incrementalDriver.inc_verify_post_cache("HSM2FSM", "DR1", "SM2SM", hsm2fsmRes,true);
		incrementalDriver.inc_verify_post_cache("HSM2FSM", "AR", "CS2RS", hsm2fsmRes,true);
		
	}
	
	
	public static void INC_POST_NOCACHE() throws Exception{
		incrementalDriver.init();
		IncrementalResult hsm2fsmRes = incrementalDriver.verify_loc("HSM2FSM");
		
		incrementalDriver.inc_verify_post_cache("HSM2FSM", "DB3", "IS2IS", hsm2fsmRes,false);
		incrementalDriver.inc_verify_post_cache("HSM2FSM", "MB6", "T2TB", hsm2fsmRes,false);
		incrementalDriver.inc_verify_post_cache("HSM2FSM", "AF2", "RS2RS", hsm2fsmRes,false);
		incrementalDriver.inc_verify_post_cache("HSM2FSM", "MF6", "T2TB", hsm2fsmRes,false);
		incrementalDriver.inc_verify_post_cache("HSM2FSM", "DR1", "SM2SM", hsm2fsmRes,false);
		incrementalDriver.inc_verify_post_cache("HSM2FSM", "AR", "CS2RS", hsm2fsmRes,false);
	
	}
	
	
	public static void INC_SUB() throws Exception{
		incrementalDriver.init();
		IncrementalResult hsm2fsmRes = incrementalDriver.verify_loc("HSM2FSM");
		
		incrementalDriver.inc_verify_sub("HSM2FSM", "DB3", "IS2IS", hsm2fsmRes);
		incrementalDriver.inc_verify_sub("HSM2FSM", "MB6", "T2TB", hsm2fsmRes);
		incrementalDriver.inc_verify_sub("HSM2FSM", "AF2", "RS2RS", hsm2fsmRes);
		incrementalDriver.inc_verify_sub("HSM2FSM", "MF6", "T2TB", hsm2fsmRes);
		incrementalDriver.inc_verify_sub("HSM2FSM", "DR1", "SM2SM", hsm2fsmRes);
		incrementalDriver.inc_verify_sub("HSM2FSM", "AR", "CS2RS", hsm2fsmRes);
	
	}
	
	public static void init(String folder) throws IOException{
		
		String[] proj = new String[]{"HSM2FSM", "DB3", "MB6", "AF2", "MF6", "DR1", "AR"};
		
		String destDir = new String("./");
		String srcDir = new String(folder);
		
		for(String s : proj){
			FileUtils.copyDirectory(new File(srcDir+s), new File(destDir+s));
		}

	}
	
	
	public static void clean() throws IOException{
		String[] proj = new String[]{"HSM2FSM", "DB3", "MB6", "AF2", "MF6", "DR1", "AR"};
		
		for(String s : proj){
			FileUtils.deleteDirectory(new File(s));
		}
		
	}
	
	
	public static void main(String[] args) throws Exception {
		
		init("correct2not/");

		ORG();
		LOC();
		INC_POST_CACHE();
		INC_POST_NOCACHE();
		INC_SUB();
		clean();
	}

}
