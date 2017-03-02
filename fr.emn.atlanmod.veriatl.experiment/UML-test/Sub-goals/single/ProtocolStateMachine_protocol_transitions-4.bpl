implementation driver(){
call init_tar_model();
call CopyTransition_matchAll();
call CopyProtocolTransition_matchAll();
call CopyProtocolStateMachine_matchAll();
call CopyRegion_matchAll();
call CopyTransition_applyAll();
call CopyProtocolTransition_applyAll();
call CopyProtocolStateMachine_applyAll();
call CopyRegion_applyAll();

//ProtocolStateMachine_protocol_transitions 
// rule size -> 4
assert (forall psm:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$ProtocolStateMachine), psm) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , psm, UMLs$StateMachine.region))) > 0 ==> (forall rr:ref :: // [null]
	     	   Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , psm, UMLs$StateMachine.region)), $Box(rr)) ==>
	     	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , rr, UMLs$Region.transition))) > 0 ==> (forall tt:ref :: // [null]
	     	     	   Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , rr, UMLs$Region.transition)), $Box(tt)) ==>
	     	     	     dtype(tt) == UMLs$ProtocolTransition)
	     	     )
	     )
;
}
