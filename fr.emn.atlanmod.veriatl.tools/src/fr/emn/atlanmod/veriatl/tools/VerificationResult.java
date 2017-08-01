package fr.emn.atlanmod.veriatl.tools;

import datastructure.TriBoolean;

// TODO considering change status to enum type
public class VerificationResult {
	String result;
	long time;
	String status;

	public VerificationResult(String s, String r, long t){
		this.status=s;
		this.result = r;
		this.time = t;
	}
	
	
	public String getResult(){
		return result;
	}
	
	public long getTime(){
		return time;
	}
	
	public TriBoolean getTriBooleanResult(){
		if(this.result.equals("true")){
		return TriBoolean.TRUE;
	}else {
		return TriBoolean.FALSE;
	}
		
//		if(this.result.equals("true")){
//			return TriBoolean.TRUE;
//		}else if(this.result.equals("false")){
//			return TriBoolean.FALSE;
//		}else{
//			return TriBoolean.UNKNOWN;
//		}
		
	}


	public String status() {
		return status;
	}
}
