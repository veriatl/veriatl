implementation driver(){
call init_tar_model();
call CopyFunctionBehavior_matchAll();
call CopyOperation_matchAll();
call CopyReception_matchAll();
call CopyOpaqueBehavior_matchAll();
call CopyInteraction_matchAll();
call CopyActivity_matchAll();
call CopyProtocolStateMachine_matchAll();
call CopyStateMachine_matchAll();
call CopyFunctionBehavior_applyAll();
call CopyOperation_applyAll();
call CopyReception_applyAll();
call CopyOpaqueBehavior_applyAll();
call CopyInteraction_applyAll();
call CopyActivity_applyAll();
call CopyProtocolStateMachine_applyAll();
call CopyStateMachine_applyAll();

//BehavioralFeature_abstract_no_method 
// rule size -> 8
assert (forall bf:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$BehavioralFeature), bf) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , bf, UMLs$BehavioralFeature.method))) > 0 ==> read( $tarHeap , bf, UMLs$BehavioralFeature.isAbstract) ==> Seq#IsEmpty(Seq#FromArray( $tarHeap , read( $tarHeap , bf, UMLs$BehavioralFeature.method))))
;
}
