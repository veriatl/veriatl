implementation driver(){
call init_tar_model();
call CopyFinalState_matchAll();
call CopyState_matchAll();
call CopyFinalState_applyAll();
call CopyState_applyAll();

//State_submachine_or_regions 
// rule size -> 2
assert (forall s:ref :: // [UMLs$State]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$State), s) ==>
	     read( $tarHeap , s, UMLs$State.isComposite) ==> !(read( $tarHeap , s, UMLs$State.isSubmachineState)))
;
}
