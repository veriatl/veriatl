implementation driver(){
call init_tar_model();
call CopyForkNode_matchAll();
call CopyUnmarshallAction_matchAll();
call CopyDestroyLinkAction_matchAll();
call CopyDataStoreNode_matchAll();
call CopyOutputPin_matchAll();
call CopyObjectFlow_matchAll();
call CopyReadSelfAction_matchAll();
call CopyReplyAction_matchAll();
call CopyStartClassifierBehaviorAction_matchAll();
call CopyReadVariableAction_matchAll();
call CopyReadStructuralFeatureAction_matchAll();
call CopyAcceptEventAction_matchAll();
call CopyReadLinkObjectEndQualifierAction_matchAll();
call CopyCreateLinkAction_matchAll();
call CopyInputPin_matchAll();
call CopyClearVariableAction_matchAll();
call CopyReadLinkObjectEndAction_matchAll();
call CopySequenceNode_matchAll();
call CopyValueSpecificationAction_matchAll();
call CopyReduceAction_matchAll();
call CopyCentralBufferNode_matchAll();
call CopyRemoveVariableValueAction_matchAll();
call CopyCallBehaviorAction_matchAll();
call CopyDestroyObjectAction_matchAll();
call CopyStartObjectBehaviorAction_matchAll();
call CopyReadExtentAction_matchAll();
call CopyCreateLinkObjectAction_matchAll();
call CopyTestIdentityAction_matchAll();
call CopyRaiseExceptionAction_matchAll();
call CopySendObjectAction_matchAll();
call CopyFlowFinalNode_matchAll();
call CopyMergeNode_matchAll();
call CopyCallOperationAction_matchAll();
call CopyClearStructuralFeatureAction_matchAll();
call CopyStructuredActivityNode_matchAll();
call CopyAddStructuralFeatureValueAction_matchAll();
call CopySendSignalAction_matchAll();
call CopyExpansionNode_matchAll();
call CopyClearAssociationAction_matchAll();
call CopyExpansionRegion_matchAll();
call CopyReadLinkAction_matchAll();
call CopyReadIsClassifiedObjectAction_matchAll();
call CopyInitialNode_matchAll();
call CopyBroadcastSignalAction_matchAll();
call CopyReclassifyObjectAction_matchAll();
call CopyActivityFinalNode_matchAll();
call CopyAddVariableValueAction_matchAll();
call CopyConditionalNode_matchAll();
call CopyActivityParameterNode_matchAll();
call CopyDecisionNode_matchAll();
call CopyJoinNode_matchAll();
call CopyOpaqueAction_matchAll();
call CopyLoopNode_matchAll();
call CopyAcceptCallAction_matchAll();
call CopyValuePin_matchAll();
call CopyCreateObjectAction_matchAll();
call CopyActionInputPin_matchAll();
call CopyRemoveStructuralFeatureValueAction_matchAll();
call CopyForkNode_applyAll();
call CopyUnmarshallAction_applyAll();
call CopyDestroyLinkAction_applyAll();
call CopyDataStoreNode_applyAll();
call CopyOutputPin_applyAll();
call CopyObjectFlow_applyAll();
call CopyReadSelfAction_applyAll();
call CopyReplyAction_applyAll();
call CopyStartClassifierBehaviorAction_applyAll();
call CopyReadVariableAction_applyAll();
call CopyReadStructuralFeatureAction_applyAll();
call CopyAcceptEventAction_applyAll();
call CopyReadLinkObjectEndQualifierAction_applyAll();
call CopyCreateLinkAction_applyAll();
call CopyInputPin_applyAll();
call CopyClearVariableAction_applyAll();
call CopyReadLinkObjectEndAction_applyAll();
call CopySequenceNode_applyAll();
call CopyValueSpecificationAction_applyAll();
call CopyReduceAction_applyAll();
call CopyCentralBufferNode_applyAll();
call CopyRemoveVariableValueAction_applyAll();
call CopyCallBehaviorAction_applyAll();
call CopyDestroyObjectAction_applyAll();
call CopyStartObjectBehaviorAction_applyAll();
call CopyReadExtentAction_applyAll();
call CopyCreateLinkObjectAction_applyAll();
call CopyTestIdentityAction_applyAll();
call CopyRaiseExceptionAction_applyAll();
call CopySendObjectAction_applyAll();
call CopyFlowFinalNode_applyAll();
call CopyMergeNode_applyAll();
call CopyCallOperationAction_applyAll();
call CopyClearStructuralFeatureAction_applyAll();
call CopyStructuredActivityNode_applyAll();
call CopyAddStructuralFeatureValueAction_applyAll();
call CopySendSignalAction_applyAll();
call CopyExpansionNode_applyAll();
call CopyClearAssociationAction_applyAll();
call CopyExpansionRegion_applyAll();
call CopyReadLinkAction_applyAll();
call CopyReadIsClassifiedObjectAction_applyAll();
call CopyInitialNode_applyAll();
call CopyBroadcastSignalAction_applyAll();
call CopyReclassifyObjectAction_applyAll();
call CopyActivityFinalNode_applyAll();
call CopyAddVariableValueAction_applyAll();
call CopyConditionalNode_applyAll();
call CopyActivityParameterNode_applyAll();
call CopyDecisionNode_applyAll();
call CopyJoinNode_applyAll();
call CopyOpaqueAction_applyAll();
call CopyLoopNode_applyAll();
call CopyAcceptCallAction_applyAll();
call CopyValuePin_applyAll();
call CopyCreateObjectAction_applyAll();
call CopyActionInputPin_applyAll();
call CopyRemoveStructuralFeatureValueAction_applyAll();

//ObjectFlow_no_executable_nodes 
// rule size -> 58
assert (forall of:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$ObjectFlow), of) ==>
	     Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$ActivityNode), read( $tarHeap , of, UMLs$ActivityEdge.source)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$ActivityNode), read( $tarHeap , of, UMLs$ActivityEdge.target)) ==> !(dtype(read( $tarHeap , of, UMLs$ActivityEdge.source)) <: UMLs$ExecutableNode  ||  dtype(read( $tarHeap , of, UMLs$ActivityEdge.target)) <: UMLs$ExecutableNode))
;
}