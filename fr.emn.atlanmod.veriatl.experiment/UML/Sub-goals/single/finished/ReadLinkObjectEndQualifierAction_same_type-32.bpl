implementation driver(){
call init_tar_model();
call CopyProperty_matchAll();
call CopyClass_matchAll();
call CopyDevice_matchAll();
call CopyPort_matchAll();
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
call CopyExtensionEnd_matchAll();
call CopyDeploymentSpecification_matchAll();
call CopyStereotype_matchAll();
call CopyExecutionEnvironment_matchAll();
call CopyActor_matchAll();
call CopyReadLinkObjectEndQualifierAction_matchAll();
call CopyDataType_matchAll();
call CopyCommunicationPath_matchAll();
call CopyCollaboration_matchAll();
call CopyAssociationClass_matchAll();
call CopyUseCase_matchAll();
call CopyPrimitiveType_matchAll();
call CopyExtension_matchAll();
call CopyArtifact_matchAll();
call CopyStateMachine_matchAll();
call CopyComponent_matchAll();
call CopyAssociation_matchAll();
call CopyProperty_applyAll();
call CopyClass_applyAll();
call CopyDevice_applyAll();
call CopyPort_applyAll();
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
call CopyExtensionEnd_applyAll();
call CopyDeploymentSpecification_applyAll();
call CopyStereotype_applyAll();
call CopyExecutionEnvironment_applyAll();
call CopyActor_applyAll();
call CopyReadLinkObjectEndQualifierAction_applyAll();
call CopyDataType_applyAll();
call CopyCommunicationPath_applyAll();
call CopyCollaboration_applyAll();
call CopyAssociationClass_applyAll();
call CopyUseCase_applyAll();
call CopyPrimitiveType_applyAll();
call CopyExtension_applyAll();
call CopyArtifact_applyAll();
call CopyStateMachine_applyAll();
call CopyComponent_applyAll();
call CopyAssociation_applyAll();

//ReadLinkObjectEndQualifierAction_same_type 
// rule size -> 32
assert (forall rloeqa:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$ReadLinkObjectEndQualifierAction), rloeqa) ==>
	     Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Type), read( $tarHeap , read( $tarHeap , rloeqa, UMLs$ReadLinkObjectEndQualifierAction.qualifier), UMLs$TypedElement.type)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Property), read( $tarHeap , rloeqa, UMLs$ReadLinkObjectEndQualifierAction.qualifier)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$OutputPin), read( $tarHeap , rloeqa, UMLs$ReadLinkObjectEndQualifierAction.result)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Type), read( $tarHeap , read( $tarHeap , rloeqa, UMLs$ReadLinkObjectEndQualifierAction.result), UMLs$TypedElement.type)) ==> read( $tarHeap , read( $tarHeap , rloeqa, UMLs$ReadLinkObjectEndQualifierAction.result), UMLs$TypedElement.type) == read( $tarHeap , read( $tarHeap , rloeqa, UMLs$ReadLinkObjectEndQualifierAction.qualifier), UMLs$TypedElement.type))
;
}
