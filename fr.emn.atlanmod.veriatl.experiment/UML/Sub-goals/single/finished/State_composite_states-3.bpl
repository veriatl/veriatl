implementation driver(){
call init_tar_model();
call CopyFinalState_matchAll();
call CopyPseudostate_matchAll();
call CopyState_matchAll();
call CopyFinalState_applyAll();
call CopyPseudostate_applyAll();
call CopyState_applyAll();

//State_composite_states 
// rule size -> 3
assert (forall s:ref :: // [UMLs$State]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$State), s) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , s, UMLs$State.connectionPoint))) > 0 ==> Seq#NotEmpty(Seq#FromArray( $tarHeap , read( $tarHeap , s, UMLs$State.connectionPoint))) ==> read( $tarHeap , s, UMLs$State.isComposite))
;
}
