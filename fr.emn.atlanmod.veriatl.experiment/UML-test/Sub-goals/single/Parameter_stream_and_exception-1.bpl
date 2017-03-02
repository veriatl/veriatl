implementation driver(){
call init_tar_model();
call CopyParameter_matchAll();
call CopyParameter_applyAll();

//Parameter_stream_and_exception 
// rule size -> 1
assert (forall p:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Parameter), p) ==>
	     !(read( $tarHeap , p, UMLs$Parameter.isException)  &&  read( $tarHeap , p, UMLs$Parameter.isStream)))
;
}
