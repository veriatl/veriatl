implementation driver(){
call init_tar_model();
call CopyClass_matchAll();
call CopyDevice_matchAll();
call CopyInteraction_matchAll();
call CopyOutputPin_matchAll();
call CopySignal_matchAll();
call CopyActivity_matchAll();
call CopyFunctionBehavior_matchAll();
call CopyOpaqueBehavior_matchAll();
call CopyEnumeration_matchAll();
call CopyNode_matchAll();
call CopyInterface_matchAll();
call CopyInformationItem_matchAll();
call CopyProtocolStateMachine_matchAll();
call CopyDeploymentSpecification_matchAll();
call CopyStereotype_matchAll();
call CopyExecutionEnvironment_matchAll();
call CopyActor_matchAll();
call CopyDataType_matchAll();
call CopyCommunicationPath_matchAll();
call CopyCollaboration_matchAll();
call CopyAssociationClass_matchAll();
call CopyUseCase_matchAll();
call CopyPrimitiveType_matchAll();
call CopyExtension_matchAll();
call CopyCreateObjectAction_matchAll();
call CopyArtifact_matchAll();
call CopyStateMachine_matchAll();
call CopyAssociation_matchAll();
call CopyComponent_matchAll();
call CopyClass_applyAll();
call CopyDevice_applyAll();
call CopyInteraction_applyAll();
call CopyOutputPin_applyAll();
call CopySignal_applyAll();
call CopyActivity_applyAll();
call CopyFunctionBehavior_applyAll();
call CopyOpaqueBehavior_applyAll();
call CopyEnumeration_applyAll();
call CopyNode_applyAll();
call CopyInterface_applyAll();
call CopyInformationItem_applyAll();
call CopyProtocolStateMachine_applyAll();
call CopyDeploymentSpecification_applyAll();
call CopyStereotype_applyAll();
call CopyExecutionEnvironment_applyAll();
call CopyActor_applyAll();
call CopyDataType_applyAll();
call CopyCommunicationPath_applyAll();
call CopyCollaboration_applyAll();
call CopyAssociationClass_applyAll();
call CopyUseCase_applyAll();
call CopyPrimitiveType_applyAll();
call CopyExtension_applyAll();
call CopyCreateObjectAction_applyAll();
call CopyArtifact_applyAll();
call CopyStateMachine_applyAll();
call CopyAssociation_applyAll();
call CopyComponent_applyAll();

//CreateObjectAction_same_type 
// rule size -> 29
assert (forall coa:ref :: // [UMLs$CreateObjectAction]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$CreateObjectAction), coa) ==>
	     Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Classifier), read( $tarHeap , coa, UMLs$CreateObjectAction.classifier)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$OutputPin), read( $tarHeap , coa, UMLs$CreateObjectAction.result)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Type), read( $tarHeap , read( $tarHeap , coa, UMLs$CreateObjectAction.result), UMLs$TypedElement.type)) ==> read( $tarHeap , read( $tarHeap , coa, UMLs$CreateObjectAction.result), UMLs$TypedElement.type) == read( $tarHeap , coa, UMLs$CreateObjectAction.classifier))
;
}