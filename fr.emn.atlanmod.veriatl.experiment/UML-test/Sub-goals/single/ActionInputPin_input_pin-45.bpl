implementation driver(){
call init_tar_model();
call CopySendObjectAction_matchAll();
call CopyUnmarshallAction_matchAll();
call CopyDestroyLinkAction_matchAll();
call CopyCallOperationAction_matchAll();
call CopyStructuredActivityNode_matchAll();
call CopyClearStructuralFeatureAction_matchAll();
call CopyAddStructuralFeatureValueAction_matchAll();
call CopySendSignalAction_matchAll();
call CopyReadSelfAction_matchAll();
call CopyClearAssociationAction_matchAll();
call CopyExpansionRegion_matchAll();
call CopyReadLinkAction_matchAll();
call CopyReplyAction_matchAll();
call CopyReadIsClassifiedObjectAction_matchAll();
call CopyStartClassifierBehaviorAction_matchAll();
call CopyReadVariableAction_matchAll();
call CopyBroadcastSignalAction_matchAll();
call CopyReadStructuralFeatureAction_matchAll();
call CopyReclassifyObjectAction_matchAll();
call CopyAcceptEventAction_matchAll();
call CopyReadLinkObjectEndQualifierAction_matchAll();
call CopyConditionalNode_matchAll();
call CopyAddVariableValueAction_matchAll();
call CopyCreateLinkAction_matchAll();
call CopyInputPin_matchAll();
call CopySequenceNode_matchAll();
call CopyClearVariableAction_matchAll();
call CopyReadLinkObjectEndAction_matchAll();
call CopyValueSpecificationAction_matchAll();
call CopyReduceAction_matchAll();
call CopyOpaqueAction_matchAll();
call CopyRemoveVariableValueAction_matchAll();
call CopyCallBehaviorAction_matchAll();
call CopyDestroyObjectAction_matchAll();
call CopyStartObjectBehaviorAction_matchAll();
call CopyLoopNode_matchAll();
call CopyReadExtentAction_matchAll();
call CopyCreateLinkObjectAction_matchAll();
call CopyTestIdentityAction_matchAll();
call CopyValuePin_matchAll();
call CopyAcceptCallAction_matchAll();
call CopyCreateObjectAction_matchAll();
call CopyActionInputPin_matchAll();
call CopyRemoveStructuralFeatureValueAction_matchAll();
call CopyRaiseExceptionAction_matchAll();
call CopySendObjectAction_applyAll();
call CopyUnmarshallAction_applyAll();
call CopyDestroyLinkAction_applyAll();
call CopyCallOperationAction_applyAll();
call CopyStructuredActivityNode_applyAll();
call CopyClearStructuralFeatureAction_applyAll();
call CopyAddStructuralFeatureValueAction_applyAll();
call CopySendSignalAction_applyAll();
call CopyReadSelfAction_applyAll();
call CopyClearAssociationAction_applyAll();
call CopyExpansionRegion_applyAll();
call CopyReadLinkAction_applyAll();
call CopyReplyAction_applyAll();
call CopyReadIsClassifiedObjectAction_applyAll();
call CopyStartClassifierBehaviorAction_applyAll();
call CopyReadVariableAction_applyAll();
call CopyBroadcastSignalAction_applyAll();
call CopyReadStructuralFeatureAction_applyAll();
call CopyReclassifyObjectAction_applyAll();
call CopyAcceptEventAction_applyAll();
call CopyReadLinkObjectEndQualifierAction_applyAll();
call CopyConditionalNode_applyAll();
call CopyAddVariableValueAction_applyAll();
call CopyCreateLinkAction_applyAll();
call CopyInputPin_applyAll();
call CopySequenceNode_applyAll();
call CopyClearVariableAction_applyAll();
call CopyReadLinkObjectEndAction_applyAll();
call CopyValueSpecificationAction_applyAll();
call CopyReduceAction_applyAll();
call CopyOpaqueAction_applyAll();
call CopyRemoveVariableValueAction_applyAll();
call CopyCallBehaviorAction_applyAll();
call CopyDestroyObjectAction_applyAll();
call CopyStartObjectBehaviorAction_applyAll();
call CopyLoopNode_applyAll();
call CopyReadExtentAction_applyAll();
call CopyCreateLinkObjectAction_applyAll();
call CopyTestIdentityAction_applyAll();
call CopyValuePin_applyAll();
call CopyAcceptCallAction_applyAll();
call CopyCreateObjectAction_applyAll();
call CopyActionInputPin_applyAll();
call CopyRemoveStructuralFeatureValueAction_applyAll();
call CopyRaiseExceptionAction_applyAll();

//ActionInputPin_input_pin 
// rule size -> 45
assert (forall aip:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$ActionInputPin), aip) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , read( $tarHeap , aip, UMLs$ActionInputPin.fromAction), UMLs$Action.input))) > 0 ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Action), read( $tarHeap , aip, UMLs$ActionInputPin.fromAction)) ==> (forall ip1_:ref :: // [null]
	     	   Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , read( $tarHeap , aip, UMLs$ActionInputPin.fromAction), UMLs$Action.input)), $Box(ip1_)) ==>
	     	     dtype(ip1_) <: UMLs$ActionInputPin)
	     )
;
}
