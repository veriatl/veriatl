package runtime;

import datastructure.TriBoolean;

public class VerificationResult {
	String result;
	long time;
	String id;
	
	public VerificationResult(String id, String r, long t){
		this.id=id;
		this.result = r;
		this.time = t;
	}
	
	public String toString(){
		return String.format("Id:%s, Time: %s, Result: %s", this.id, this.time, this.result);
	}
	
	public String getResult(){
		return result;
	}
	
	public TriBoolean getTriBooleanResult(){
		if(this.result.equals("true")){
			return TriBoolean.TRUE;
		}else if(this.result.equals("false")){
			return TriBoolean.FALSE;
		}else{
			return TriBoolean.UNKNOWN;
		}
		
	}
}
