function genBy(ref, String, HeapType, HeapType): bool;
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyComment, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Comment &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Comment)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyPackage, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Package &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Package)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyDependency, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Dependency &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Dependency)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyElementImport, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ElementImport &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ElementImport)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyPackageImport, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$PackageImport &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$PackageImport)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyConstraint, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Constraint &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Constraint)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyAssociation, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Association &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Association)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyTemplateBinding, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$TemplateBinding &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$TemplateBinding)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyTemplateSignature, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$TemplateSignature &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$TemplateSignature)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyTemplateParameter, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$TemplateParameter &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$TemplateParameter)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyTemplateParameterSubstitution, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$TemplateParameterSubstitution &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$TemplateParameterSubstitution)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyGeneralization, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Generalization &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Generalization)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyGeneralizationSet, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$GeneralizationSet &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$GeneralizationSet)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopySubstitution, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Substitution &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Substitution)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyRealization, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Realization &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Realization)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyAbstraction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Abstraction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Abstraction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyOpaqueExpression, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$OpaqueExpression &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$OpaqueExpression)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyParameter, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Parameter &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Parameter)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyConnectorEnd, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ConnectorEnd &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ConnectorEnd)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyProperty, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Property &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Property)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyDeployment, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Deployment &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Deployment)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyDeploymentSpecification, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$DeploymentSpecification &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$DeploymentSpecification)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyArtifact, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Artifact &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Artifact)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyManifestation, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Manifestation &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Manifestation)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyOperation, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Operation &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Operation)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyClass, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Class &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Class)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyInterfaceRealization, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$InterfaceRealization &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$InterfaceRealization)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyInterface, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Interface &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Interface)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyReception, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Reception &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Reception)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopySignal, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Signal &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Signal)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyProtocolStateMachine, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ProtocolStateMachine &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ProtocolStateMachine)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyStateMachine, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$StateMachine &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$StateMachine)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyRegion, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Region &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Region)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyTransition, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Transition &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Transition)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyTrigger, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Trigger &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Trigger)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyPort, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Port &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Port)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyState, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$State &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$State)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyConnectionPointReference, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ConnectionPointReference &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ConnectionPointReference)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyPseudostate, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Pseudostate &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Pseudostate)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyProtocolConformance, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ProtocolConformance &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ProtocolConformance)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyConnector, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Connector &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Connector)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyExtension, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Extension &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Extension)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyExtensionEnd, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ExtensionEnd &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ExtensionEnd)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyStereotype, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Stereotype &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Stereotype)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyImage, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Image &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Image)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyProfile, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Profile &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Profile)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyModel, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Model &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Model)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyParameterSet, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ParameterSet &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ParameterSet)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyDataType, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$DataType &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$DataType)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyOperationTemplateParameter, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$OperationTemplateParameter &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$OperationTemplateParameter)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyConnectableElementTemplateParameter, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ConnectableElementTemplateParameter &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ConnectableElementTemplateParameter)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyCollaborationUse, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$CollaborationUse &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$CollaborationUse)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyCollaboration, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Collaboration &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Collaboration)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyUseCase, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$UseCase &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$UseCase)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyInclude, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Include &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Include)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyExtend, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Extend &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Extend)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyExtensionPoint, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ExtensionPoint &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ExtensionPoint)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyRedefinableTemplateSignature, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$RedefinableTemplateSignature &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$RedefinableTemplateSignature)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyClassifierTemplateParameter, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ClassifierTemplateParameter &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ClassifierTemplateParameter)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyStringExpression, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$StringExpression &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$StringExpression)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyExpression, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Expression &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Expression)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyUsage, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Usage &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Usage)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyPackageMerge, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$PackageMerge &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$PackageMerge)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyProfileApplication, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ProfileApplication &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ProfileApplication)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyEnumeration, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Enumeration &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Enumeration)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyEnumerationLiteral, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$EnumerationLiteral &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$EnumerationLiteral)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyInstanceSpecification, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$InstanceSpecification &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$InstanceSpecification)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopySlot, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Slot &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Slot)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyPrimitiveType, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$PrimitiveType &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$PrimitiveType)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyLiteralInteger, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$LiteralInteger &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$LiteralInteger)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyLiteralString, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$LiteralString &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$LiteralString)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyLiteralBoolean, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$LiteralBoolean &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$LiteralBoolean)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyLiteralNull, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$LiteralNull &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$LiteralNull)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyInstanceValue, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$InstanceValue &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$InstanceValue)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyLiteralUnlimitedNatural, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$LiteralUnlimitedNatural &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$LiteralUnlimitedNatural)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyOpaqueBehavior, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$OpaqueBehavior &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$OpaqueBehavior)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyFunctionBehavior, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$FunctionBehavior &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$FunctionBehavior)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyOpaqueAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$OpaqueAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$OpaqueAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyStructuredActivityNode, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$StructuredActivityNode &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$StructuredActivityNode)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyActivity, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Activity &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Activity)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyVariable, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Variable &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Variable)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyActivityPartition, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ActivityPartition &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ActivityPartition)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyInterruptibleActivityRegion, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$InterruptibleActivityRegion &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$InterruptibleActivityRegion)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyExceptionHandler, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ExceptionHandler &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ExceptionHandler)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyOutputPin, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$OutputPin &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$OutputPin)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyPin, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Pin &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Pin)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyInputPin, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$InputPin &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$InputPin)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopySendSignalAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$SendSignalAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$SendSignalAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyCallOperationAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$CallOperationAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$CallOperationAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyCallBehaviorAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$CallBehaviorAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$CallBehaviorAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopySequenceNode, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$SequenceNode &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$SequenceNode)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyControlFlow, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ControlFlow &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ControlFlow)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyInitialNode, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$InitialNode &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$InitialNode)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyActivityParameterNode, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ActivityParameterNode &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ActivityParameterNode)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyValuePin, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ValuePin &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ValuePin)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyMessage, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Message &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Message)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyInteraction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Interaction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Interaction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyLifeline, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Lifeline &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Lifeline)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyPartDecomposition, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$PartDecomposition &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$PartDecomposition)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyInteractionUse, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$InteractionUse &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$InteractionUse)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyGate, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Gate &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Gate)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyGeneralOrdering, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$GeneralOrdering &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$GeneralOrdering)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyOccurrenceSpecification, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$OccurrenceSpecification &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$OccurrenceSpecification)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyInteractionOperand, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$InteractionOperand &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$InteractionOperand)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyInteractionConstraint, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$InteractionConstraint &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$InteractionConstraint)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyStateInvariant, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$StateInvariant &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$StateInvariant)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyActionExecutionSpecification, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ActionExecutionSpecification &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ActionExecutionSpecification)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyBehaviorExecutionSpecification, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$BehaviorExecutionSpecification &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$BehaviorExecutionSpecification)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyExecutionEvent, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ExecutionEvent &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ExecutionEvent)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyCreationEvent, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$CreationEvent &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$CreationEvent)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyDestructionEvent, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$DestructionEvent &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$DestructionEvent)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopySendOperationEvent, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$SendOperationEvent &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$SendOperationEvent)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopySendSignalEvent, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$SendSignalEvent &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$SendSignalEvent)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyMessageOccurrenceSpecification, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$MessageOccurrenceSpecification &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$MessageOccurrenceSpecification)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyExecutionOccurrenceSpecification, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ExecutionOccurrenceSpecification &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ExecutionOccurrenceSpecification)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyReceiveOperationEvent, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ReceiveOperationEvent &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ReceiveOperationEvent)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyReceiveSignalEvent, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ReceiveSignalEvent &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ReceiveSignalEvent)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyActor, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Actor &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Actor)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyCallEvent, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$CallEvent &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$CallEvent)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyChangeEvent, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ChangeEvent &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ChangeEvent)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopySignalEvent, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$SignalEvent &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$SignalEvent)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyAnyReceiveEvent, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$AnyReceiveEvent &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$AnyReceiveEvent)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyForkNode, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ForkNode &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ForkNode)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyFlowFinalNode, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$FlowFinalNode &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$FlowFinalNode)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyCentralBufferNode, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$CentralBufferNode &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$CentralBufferNode)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyMergeNode, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$MergeNode &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$MergeNode)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyDecisionNode, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$DecisionNode &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$DecisionNode)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyObjectFlow, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ObjectFlow &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ObjectFlow)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyActivityFinalNode, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ActivityFinalNode &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ActivityFinalNode)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyComponentRealization, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ComponentRealization &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ComponentRealization)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyComponent, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Component &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Component)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyNode, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Node &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Node)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyCommunicationPath, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$CommunicationPath &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$CommunicationPath)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyDevice, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Device &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Device)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyExecutionEnvironment, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ExecutionEnvironment &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ExecutionEnvironment)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyCombinedFragment, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$CombinedFragment &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$CombinedFragment)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyContinuation, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Continuation &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Continuation)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyConsiderIgnoreFragment, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ConsiderIgnoreFragment &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ConsiderIgnoreFragment)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyCreateObjectAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$CreateObjectAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$CreateObjectAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyDestroyObjectAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$DestroyObjectAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$DestroyObjectAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyTestIdentityAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$TestIdentityAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$TestIdentityAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyReadSelfAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ReadSelfAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ReadSelfAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyReadStructuralFeatureAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ReadStructuralFeatureAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ReadStructuralFeatureAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyClearStructuralFeatureAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ClearStructuralFeatureAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ClearStructuralFeatureAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyRemoveStructuralFeatureValueAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$RemoveStructuralFeatureValueAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$RemoveStructuralFeatureValueAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyAddStructuralFeatureValueAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$AddStructuralFeatureValueAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$AddStructuralFeatureValueAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyLinkEndData, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$LinkEndData &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$LinkEndData)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyQualifierValue, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$QualifierValue &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$QualifierValue)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyReadLinkAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ReadLinkAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ReadLinkAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyLinkEndCreationData, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$LinkEndCreationData &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$LinkEndCreationData)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyCreateLinkAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$CreateLinkAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$CreateLinkAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyDestroyLinkAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$DestroyLinkAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$DestroyLinkAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyLinkEndDestructionData, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$LinkEndDestructionData &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$LinkEndDestructionData)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyClearAssociationAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ClearAssociationAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ClearAssociationAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyBroadcastSignalAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$BroadcastSignalAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$BroadcastSignalAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopySendObjectAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$SendObjectAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$SendObjectAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyValueSpecificationAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ValueSpecificationAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ValueSpecificationAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyTimeExpression, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$TimeExpression &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$TimeExpression)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyDuration, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Duration &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Duration)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyDurationInterval, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$DurationInterval &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$DurationInterval)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyInterval, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Interval &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Interval)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyTimeConstraint, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$TimeConstraint &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$TimeConstraint)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyIntervalConstraint, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$IntervalConstraint &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$IntervalConstraint)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyTimeInterval, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$TimeInterval &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$TimeInterval)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyDurationConstraint, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$DurationConstraint &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$DurationConstraint)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyTimeObservation, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$TimeObservation &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$TimeObservation)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyDurationObservation, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$DurationObservation &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$DurationObservation)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyFinalState, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$FinalState &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$FinalState)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyTimeEvent, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$TimeEvent &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$TimeEvent)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyReadVariableAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ReadVariableAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ReadVariableAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyClearVariableAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ClearVariableAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ClearVariableAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyAddVariableValueAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$AddVariableValueAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$AddVariableValueAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyRemoveVariableValueAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$RemoveVariableValueAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$RemoveVariableValueAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyRaiseExceptionAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$RaiseExceptionAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$RaiseExceptionAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyActionInputPin, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ActionInputPin &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ActionInputPin)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyInformationItem, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$InformationItem &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$InformationItem)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyInformationFlow, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$InformationFlow &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$InformationFlow)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyReadExtentAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ReadExtentAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ReadExtentAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyReclassifyObjectAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ReclassifyObjectAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ReclassifyObjectAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyReadIsClassifiedObjectAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ReadIsClassifiedObjectAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ReadIsClassifiedObjectAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyStartClassifierBehaviorAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$StartClassifierBehaviorAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$StartClassifierBehaviorAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyReadLinkObjectEndAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ReadLinkObjectEndAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ReadLinkObjectEndAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyReadLinkObjectEndQualifierAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ReadLinkObjectEndQualifierAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ReadLinkObjectEndQualifierAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyCreateLinkObjectAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$CreateLinkObjectAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$CreateLinkObjectAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyAcceptEventAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$AcceptEventAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$AcceptEventAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyAcceptCallAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$AcceptCallAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$AcceptCallAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyReplyAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ReplyAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ReplyAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyUnmarshallAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$UnmarshallAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$UnmarshallAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyReduceAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ReduceAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ReduceAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyStartObjectBehaviorAction, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$StartObjectBehaviorAction &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$StartObjectBehaviorAction)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyJoinNode, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$JoinNode &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$JoinNode)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyDataStoreNode, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$DataStoreNode &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$DataStoreNode)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyConditionalNode, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ConditionalNode &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ConditionalNode)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyClause, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$Clause &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$Clause)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyLoopNode, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$LoopNode &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$LoopNode)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyExpansionNode, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ExpansionNode &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ExpansionNode)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyExpansionRegion, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ExpansionRegion &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ExpansionRegion)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyProtocolTransition, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$ProtocolTransition &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$ProtocolTransition)
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _CopyAssociationClass, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:UML$AssociationClass &&
(dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0)) <: UML$AssociationClass)
);
