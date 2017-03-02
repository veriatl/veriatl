implementation driver(){
call init_tar_model();
call CopyCallBehaviorAction_matchAll();
call CopyStartObjectBehaviorAction_matchAll();
call CopyCallOperationAction_matchAll();
call CopyOutputPin_matchAll();
call CopyCallBehaviorAction_applyAll();
call CopyStartObjectBehaviorAction_applyAll();
call CopyCallOperationAction_applyAll();
call CopyOutputPin_applyAll();

//CallAction_synchronous_call 
// rule size -> 4
assert (forall ca:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$CallAction), ca) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , ca, UMLs$CallAction.result))) > 0 ==> Seq#NotEmpty(Seq#FromArray( $tarHeap , read( $tarHeap , ca, UMLs$CallAction.result))) ==> read( $tarHeap , ca, UMLs$CallAction.isSynchronous))
;
}
