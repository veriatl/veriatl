implementation driver(){
call init_tar_model();
call CopyClass_matchAll();
call CopyDevice_matchAll();
call CopyInteraction_matchAll();
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
call CopyInformationFlow_matchAll();
call CopyCollaboration_matchAll();
call CopyAssociationClass_matchAll();
call CopyUseCase_matchAll();
call CopyPrimitiveType_matchAll();
call CopyExtension_matchAll();
call CopyArtifact_matchAll();
call CopyStateMachine_matchAll();
call CopyAssociation_matchAll();
call CopyComponent_matchAll();
call CopyProperty_matchAll();
call CopyOperation_matchAll();
call CopyReception_matchAll();
call CopyPort_matchAll();
call CopyConnector_matchAll();
call CopyGeneralization_matchAll();
call CopyExtensionEnd_matchAll();

call CopyClass_applyAll();
call CopyDevice_applyAll();
call CopyInteraction_applyAll();
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
call CopyInformationFlow_applyAll();
call CopyCollaboration_applyAll();
call CopyAssociationClass_applyAll();
call CopyUseCase_applyAll();
call CopyPrimitiveType_applyAll();
call CopyExtension_applyAll();
call CopyArtifact_applyAll();
call CopyStateMachine_applyAll();
call CopyAssociation_applyAll();
call CopyComponent_applyAll();
call CopyProperty_applyAll();
call CopyOperation_applyAll();
call CopyReception_applyAll();
call CopyPort_applyAll();
call CopyConnector_applyAll();
call CopyGeneralization_applyAll();
call CopyExtensionEnd_applyAll();

//InformationFlow_convey_classifiers 
// rule size -> 28
assert (forall _if:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$InformationFlow), _if) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , _if, UMLs$InformationFlow.conveyed))) > 0 ==> (forall c1_:ref :: // [null]
	     	   Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , _if, UMLs$InformationFlow.conveyed)), $Box(c1_)) ==>
	     	     dtype(c1_) <: UMLs$Class  ||  dtype(c1_) <: UMLs$Interface  ||  dtype(c1_) <: UMLs$InformationItem  ||  dtype(c1_) <: UMLs$Signal  ||  dtype(c1_) <: UMLs$Component)
	     )
;

//InformationItem_has_no 
// rule size -> 8
assert (forall ii:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$InformationItem), ii) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , ii, UMLs$Classifier.generalization))) > 0 ==> Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , ii, UMLs$Classifier.feature))) > 0 ==> Seq#IsEmpty(Seq#FromArray( $tarHeap , read( $tarHeap , ii, UMLs$Classifier.generalization)))  &&  Seq#IsEmpty(Seq#FromArray( $tarHeap , read( $tarHeap , ii, UMLs$Classifier.feature))))
;
}
