implementation driver(){
call init_tar_model();
call CopyFinalState_matchAll();
call CopyConnectionPointReference_matchAll();
call CopyPseudostate_matchAll();
call CopyState_matchAll();
call CopyStateMachine_matchAll();
call CopyProtocolStateMachine_matchAll();
call CopyFinalState_applyAll();
call CopyConnectionPointReference_applyAll();
call CopyPseudostate_applyAll();
call CopyState_applyAll();
call CopyStateMachine_applyAll();
call CopyProtocolStateMachine_applyAll();

//State_destinations_or_sources_of_transitions 
// rule size -> 6
assert (forall s:ref :: // [UMLs$State]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$State), s) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , s, UMLs$State.connection))) > 0 ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$StateMachine), read( $tarHeap , s, UMLs$State.submachine)) ==> read( $tarHeap , s, UMLs$State.isSubmachineState) ==> (forall cprcp:ref :: // [null]
	     	   Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , s, UMLs$State.connection)), $Box(cprcp)) ==>
	     	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , cprcp, UMLs$ConnectionPointReference.exit))) > 0 ==> Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , cprcp, UMLs$ConnectionPointReference.entry))) > 0 ==> (forall pps:ref :: // [UMLs$Pseudostate]
	     	     	   Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , cprcp, UMLs$ConnectionPointReference.entry)), $Box(pps)) ==>
	     	     	     Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$StateMachine), read( $tarHeap , pps, UMLs$Pseudostate.stateMachine)) ==> read( $tarHeap , pps, UMLs$Pseudostate.stateMachine) == read( $tarHeap , s, UMLs$State.submachine))
	     	       &&  (forall ppps788592721:ref :: // [UMLs$Pseudostate]
	     	     	   Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , cprcp, UMLs$ConnectionPointReference.exit)), $Box(ppps788592721)) ==>
	     	     	     Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$StateMachine), read( $tarHeap , ppps788592721, UMLs$Pseudostate.stateMachine)) ==> read( $tarHeap , ppps788592721, UMLs$Pseudostate.stateMachine) == read( $tarHeap , s, UMLs$State.submachine))
	     	     )
	     )
;
}
