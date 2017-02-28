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
call CopyDataType_matchAll();
call CopyCommunicationPath_matchAll();
call CopyCollaboration_matchAll();
call CopyReadLinkObjectEndAction_matchAll();
call CopyAssociationClass_matchAll();
call CopyUseCase_matchAll();
call CopyPrimitiveType_matchAll();
call CopyExtension_matchAll();
call CopyArtifact_matchAll();
call CopyStateMachine_matchAll();
call CopyAssociation_matchAll();
call CopyComponent_matchAll();
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
call CopyDataType_applyAll();
call CopyCommunicationPath_applyAll();
call CopyCollaboration_applyAll();
call CopyReadLinkObjectEndAction_applyAll();
call CopyAssociationClass_applyAll();
call CopyUseCase_applyAll();
call CopyPrimitiveType_applyAll();
call CopyExtension_applyAll();
call CopyArtifact_applyAll();
call CopyStateMachine_applyAll();
call CopyAssociation_applyAll();
call CopyComponent_applyAll();

//ReadLinkObjectEndAction_type_of_result 
// rule size -> 32
assert (forall rloea:ref :: // [UMLs$ReadLinkObjectEndAction]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$ReadLinkObjectEndAction), rloea) ==>
	     Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Type), read( $tarHeap , read( $tarHeap , rloea, UMLs$ReadLinkObjectEndAction.end), UMLs$TypedElement.type)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$OutputPin), read( $tarHeap , rloea, UMLs$ReadLinkObjectEndAction.result)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Type), read( $tarHeap , read( $tarHeap , rloea, UMLs$ReadLinkObjectEndAction.result), UMLs$TypedElement.type)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Property), read( $tarHeap , rloea, UMLs$ReadLinkObjectEndAction.end)) ==> read( $tarHeap , read( $tarHeap , rloea, UMLs$ReadLinkObjectEndAction.result), UMLs$TypedElement.type) == read( $tarHeap , read( $tarHeap , rloea, UMLs$ReadLinkObjectEndAction.end), UMLs$TypedElement.type))
;
}
