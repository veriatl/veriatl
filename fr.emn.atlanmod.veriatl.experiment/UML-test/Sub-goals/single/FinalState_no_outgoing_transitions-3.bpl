implementation driver(){
call init_tar_model();
call CopyTransition_matchAll();
call CopyFinalState_matchAll();
call CopyProtocolTransition_matchAll();
call CopyTransition_applyAll();
call CopyFinalState_applyAll();
call CopyProtocolTransition_applyAll();

//FinalState_no_outgoing_transitions 
// rule size -> 3
assert (forall fs:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$FinalState), fs) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , fs, UMLs$Vertex.outgoing))) > 0 ==> Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , fs, UMLs$Vertex.outgoing))) == 0)
;
}
