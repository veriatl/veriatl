package fr.emn.atlanmod.atl2boogie.xtend.lib


// this class has been used by ATL resolution
class myOclType {
	String kind	// unknown, srcRef, trgRef, srcRefs, trgRefs, primitive(int/bool/string), temp(for resolveTemp)
	String type
	
	new(String k, String t) {
    	kind = k
    	type = t
  	}
  	
  	new() {
    	kind = "Unkown"
    	type = "NotCare"
  	}
  	
  	def String getKind(){
  		return kind
  	}
  	
  	def String getType(){
  		return type
  	}
  	
  	override String toString(){
  		return String.format("kind: %s, type: %s\n", kind, type)
  	}
}