package datastructure;




public class ContextEntry  {

	ContextNature n;
	boolean eliminated;
	


	public ContextEntry(ContextNature nature){
		this.n = nature;
		this.eliminated = false;
	}
	
	public ContextEntry(ContextNature nature, boolean e){
		this.n = nature;
		this.eliminated = e;
	}
	
	public ContextNature getNature() {
		return n;
	}

	public void setNature(ContextNature n) {
		this.n = n;
	}
	
	public boolean isEliminated() {
		return eliminated;
	}

	public void setEliminated(boolean eliminated) {
		this.eliminated = eliminated;
	}

	public String toString() {
		return String.format("%s", n.toString());
	}
	

}

