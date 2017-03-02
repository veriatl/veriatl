implementation driver(){
call init_tar_model();
call CopyProperty_matchAll();
call CopyStereotype_matchAll();
call CopyReception_matchAll();
call CopyExecutionEnvironment_matchAll();
call CopyClass_matchAll();
call CopyDevice_matchAll();
call CopyActor_matchAll();
call CopyPort_matchAll();
call CopyInteraction_matchAll();
call CopyCollaboration_matchAll();
call CopyActivity_matchAll();
call CopyAssociationClass_matchAll();
call CopyUseCase_matchAll();
call CopyFunctionBehavior_matchAll();
call CopyOperation_matchAll();
call CopyOpaqueBehavior_matchAll();
call CopyNode_matchAll();
call CopyConnector_matchAll();
call CopyExtensionEnd_matchAll();
call CopyProtocolStateMachine_matchAll();
call CopyStateMachine_matchAll();
call CopyComponent_matchAll();
call CopyProperty_applyAll();
call CopyStereotype_applyAll();
call CopyReception_applyAll();
call CopyExecutionEnvironment_applyAll();
call CopyClass_applyAll();
call CopyDevice_applyAll();
call CopyActor_applyAll();
call CopyPort_applyAll();
call CopyInteraction_applyAll();
call CopyCollaboration_applyAll();
call CopyActivity_applyAll();
call CopyAssociationClass_applyAll();
call CopyUseCase_applyAll();
call CopyFunctionBehavior_applyAll();
call CopyOperation_applyAll();
call CopyOpaqueBehavior_applyAll();
call CopyNode_applyAll();
call CopyConnector_applyAll();
call CopyExtensionEnd_applyAll();
call CopyProtocolStateMachine_applyAll();
call CopyStateMachine_applyAll();
call CopyComponent_applyAll();

//Behavior_feature_of_context_classifier 
// rule size -> 22
assert (forall b:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Behavior), b) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , read( $tarHeap , b, UMLs$Behavior.context), UMLs$Classifier.feature))) > 0 ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$BehavioralFeature), read( $tarHeap , b, UMLs$Behavior.specification)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$BehavioredClassifier), read( $tarHeap , b, UMLs$Behavior.context)) ==> Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , read( $tarHeap , b, UMLs$Behavior.context), UMLs$Classifier.feature)), $Box(read( $tarHeap , b, UMLs$Behavior.specification))))
;
}
