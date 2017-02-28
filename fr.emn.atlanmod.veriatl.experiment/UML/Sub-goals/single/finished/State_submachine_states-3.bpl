implementation driver(){
call init_tar_model();
call CopyFinalState_matchAll();
call CopyConnectionPointReference_matchAll();
call CopyState_matchAll();
call CopyFinalState_applyAll();
call CopyConnectionPointReference_applyAll();
call CopyState_applyAll();

//State_submachine_states 
// rule size -> 3
assert (forall s:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$State), s) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , s, UMLs$State.connection))) > 0 ==> read( $tarHeap , s, UMLs$State.isSubmachineState) ==> Seq#NotEmpty(Seq#FromArray( $tarHeap , read( $tarHeap , s, UMLs$State.connection))))
;
}
