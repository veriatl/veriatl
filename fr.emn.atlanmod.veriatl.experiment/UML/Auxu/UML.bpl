// print classifier const	
const unique UML$Element: ClassName extends  complete;
const unique UML$Element.ownedComment: Field ref;
const unique UML$Element.ownedElement: Field ref;
const unique UML$Element.owner: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$Element);
const unique UML$Clause: ClassName extends UML$Element complete;
const unique UML$Clause.body: Field ref;
const unique UML$Clause.bodyOutput: Field ref;
const unique UML$Clause.decider: Field ref;
const unique UML$Clause.predecessorClause: Field ref;
const unique UML$Clause.successorClause: Field ref;
const unique UML$Clause.test: Field ref;
const unique UML$Comment: ClassName extends UML$Element complete;
const unique UML$Comment.annotatedElement: Field ref;
const unique UML$Comment.body: Field String;
const unique UML$ExceptionHandler: ClassName extends UML$Element complete;
const unique UML$ExceptionHandler.exceptionInput: Field ref;
const unique UML$ExceptionHandler.exceptionType: Field ref;
const unique UML$ExceptionHandler.handlerBody: Field ref;
const unique UML$ExceptionHandler.protectedNode: Field ref;
const unique UML$Image: ClassName extends UML$Element complete;
const unique UML$Image.content: Field String;
const unique UML$Image.format: Field String;
const unique UML$Image.location: Field String;
const unique UML$LinkEndData: ClassName extends UML$Element complete;
const unique UML$LinkEndData.end: Field ref;
const unique UML$LinkEndData.qualifier: Field ref;
const unique UML$LinkEndData.value: Field ref;
const unique UML$LinkEndDestructionData: ClassName extends UML$LinkEndData complete;
const unique UML$LinkEndDestructionData.destroyAt: Field ref;
const unique UML$LinkEndDestructionData.isDestroyDuplicates: Field bool;
const unique UML$MultiplicityElement: ClassName extends UML$Element complete;
const unique UML$MultiplicityElement.isOrdered: Field bool;
const unique UML$MultiplicityElement.isUnique: Field bool;
const unique UML$MultiplicityElement.lower: Field int;
const unique UML$MultiplicityElement.lowerValue: Field ref;
const unique UML$MultiplicityElement.upper: Field ref;
const unique UML$MultiplicityElement.upperValue: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$MultiplicityElement);
const unique UML$NamedElement: ClassName extends UML$Element complete;
const unique UML$NamedElement.clientDependency: Field ref;
const unique UML$NamedElement.name: Field String;
const unique UML$NamedElement.nameExpression: Field ref;
const unique UML$NamedElement.namespace: Field ref;
const unique UML$NamedElement.qualifiedName: Field String;
const unique UML$NamedElement.visibility: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$NamedElement);
const unique UML$Namespace: ClassName extends UML$NamedElement complete;
const unique UML$Namespace.elementImport: Field ref;
const unique UML$Namespace.importedMember: Field ref;
const unique UML$Namespace.member: Field ref;
const unique UML$Namespace.ownedMember: Field ref;
const unique UML$Namespace.ownedRule: Field ref;
const unique UML$Namespace.packageImport: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$Namespace);
const unique UML$ParameterSet: ClassName extends UML$NamedElement complete;
const unique UML$ParameterSet.condition: Field ref;
const unique UML$ParameterSet.parameter: Field ref;
const unique UML$ParameterableElement: ClassName extends UML$Element complete;
const unique UML$ParameterableElement.owningTemplateParameter: Field ref;
const unique UML$ParameterableElement.templateParameter: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$ParameterableElement);
const unique UML$QualifierValue: ClassName extends UML$Element complete;
const unique UML$QualifierValue.qualifier: Field ref;
const unique UML$QualifierValue.value: Field ref;
const unique UML$RedefinableElement: ClassName extends UML$NamedElement complete;
const unique UML$RedefinableElement.isLeaf: Field bool;
const unique UML$RedefinableElement.redefinedElement: Field ref;
const unique UML$RedefinableElement.redefinitionContext: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$RedefinableElement);
const unique UML$Region: ClassName extends UML$Namespace,UML$RedefinableElement complete;
const unique UML$Region.extendedRegion: Field ref;
const unique UML$Region.state: Field ref;
const unique UML$Region.stateMachine: Field ref;
const unique UML$Region.subvertex: Field ref;
const unique UML$Region.transition: Field ref;
const unique UML$Relationship: ClassName extends UML$Element complete;
const unique UML$Relationship.relatedElement: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$Relationship);
const unique UML$Slot: ClassName extends UML$Element complete;
const unique UML$Slot.definingFeature: Field ref;
const unique UML$Slot.owningInstance: Field ref;
const unique UML$Slot.value: Field ref;
const unique UML$TemplateParameter: ClassName extends UML$Element complete;
const unique UML$TemplateParameter.default: Field ref;
const unique UML$TemplateParameter.ownedDefault: Field ref;
const unique UML$TemplateParameter.ownedParameteredElement: Field ref;
const unique UML$TemplateParameter.parameteredElement: Field ref;
const unique UML$TemplateParameter.signature: Field ref;
const unique UML$TemplateParameterSubstitution: ClassName extends UML$Element complete;
const unique UML$TemplateParameterSubstitution.actual: Field ref;
const unique UML$TemplateParameterSubstitution.formal: Field ref;
const unique UML$TemplateParameterSubstitution.ownedActual: Field ref;
const unique UML$TemplateParameterSubstitution.templateBinding: Field ref;
const unique UML$TemplateSignature: ClassName extends UML$Element complete;
const unique UML$TemplateSignature.ownedParameter: Field ref;
const unique UML$TemplateSignature.parameter: Field ref;
const unique UML$TemplateSignature.template: Field ref;
const unique UML$TemplateableElement: ClassName extends UML$Element complete;
const unique UML$TemplateableElement.ownedTemplateSignature: Field ref;
const unique UML$TemplateableElement.templateBinding: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$TemplateableElement);
const unique UML$Transition: ClassName extends UML$Namespace,UML$RedefinableElement complete;
const unique UML$Transition.container: Field ref;
const unique UML$Transition.effect: Field ref;
const unique UML$Transition.guard: Field ref;
const unique UML$Transition.kind: Field ref;
const unique UML$Transition.redefinedTransition: Field ref;
const unique UML$Transition.source: Field ref;
const unique UML$Transition.target: Field ref;
const unique UML$Transition.trigger: Field ref;
const unique UML$Trigger: ClassName extends UML$NamedElement complete;
const unique UML$Trigger.event: Field ref;
const unique UML$Trigger.port: Field ref;
const unique UML$TypedElement: ClassName extends UML$NamedElement complete;
const unique UML$TypedElement.type: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$TypedElement);
const unique UML$Vertex: ClassName extends UML$NamedElement complete;
const unique UML$Vertex.container: Field ref;
const unique UML$Vertex.incoming: Field ref;
const unique UML$Vertex.outgoing: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$Vertex);
const unique UML$ActivityEdge: ClassName extends UML$RedefinableElement complete;
const unique UML$ActivityEdge.activity: Field ref;
const unique UML$ActivityEdge.guard: Field ref;
const unique UML$ActivityEdge.inGroup: Field ref;
const unique UML$ActivityEdge.inPartition: Field ref;
const unique UML$ActivityEdge.inStructuredNode: Field ref;
const unique UML$ActivityEdge.interrupts: Field ref;
const unique UML$ActivityEdge.redefinedEdge: Field ref;
const unique UML$ActivityEdge.source: Field ref;
const unique UML$ActivityEdge.target: Field ref;
const unique UML$ActivityEdge.weight: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$ActivityEdge);
const unique UML$ActivityGroup: ClassName extends UML$NamedElement complete;
const unique UML$ActivityGroup.containedEdge: Field ref;
const unique UML$ActivityGroup.containedNode: Field ref;
const unique UML$ActivityGroup.inActivity: Field ref;
const unique UML$ActivityGroup.subgroup: Field ref;
const unique UML$ActivityGroup.superGroup: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$ActivityGroup);
const unique UML$ActivityNode: ClassName extends UML$RedefinableElement complete;
const unique UML$ActivityNode.activity: Field ref;
const unique UML$ActivityNode.inGroup: Field ref;
const unique UML$ActivityNode.inInterruptibleRegion: Field ref;
const unique UML$ActivityNode.inPartition: Field ref;
const unique UML$ActivityNode.inStructuredNode: Field ref;
const unique UML$ActivityNode.incoming: Field ref;
const unique UML$ActivityNode.outgoing: Field ref;
const unique UML$ActivityNode.redefinedNode: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$ActivityNode);
const unique UML$ActivityPartition: ClassName extends UML$ActivityGroup complete;
const unique UML$ActivityPartition.edge: Field ref;
const unique UML$ActivityPartition.isDimension: Field bool;
const unique UML$ActivityPartition.isExternal: Field bool;
const unique UML$ActivityPartition.node: Field ref;
const unique UML$ActivityPartition.represents: Field ref;
const unique UML$ActivityPartition.subpartition: Field ref;
const unique UML$ActivityPartition.superPartition: Field ref;
const unique UML$ClassifierTemplateParameter: ClassName extends UML$TemplateParameter complete;
const unique UML$ClassifierTemplateParameter.allowSubstitutable: Field bool;
const unique UML$ClassifierTemplateParameter.constrainingClassifier: Field ref;
const unique UML$CollaborationUse: ClassName extends UML$NamedElement complete;
const unique UML$CollaborationUse.roleBinding: Field ref;
const unique UML$CollaborationUse.type: Field ref;
const unique UML$ConnectableElement: ClassName extends UML$TypedElement,UML$ParameterableElement complete;
const unique UML$ConnectableElement.end: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$ConnectableElement);
const unique UML$ConnectableElementTemplateParameter: ClassName extends UML$TemplateParameter complete;
const unique UML$ConnectionPointReference: ClassName extends UML$Vertex complete;
const unique UML$ConnectionPointReference.entry: Field ref;
const unique UML$ConnectionPointReference.exit: Field ref;
const unique UML$ConnectionPointReference.state: Field ref;
const unique UML$ConnectorEnd: ClassName extends UML$MultiplicityElement complete;
const unique UML$ConnectorEnd.definingEnd: Field ref;
const unique UML$ConnectorEnd.partWithPort: Field ref;
const unique UML$ConnectorEnd.role: Field ref;
const unique UML$ControlFlow: ClassName extends UML$ActivityEdge complete;
const unique UML$ControlNode: ClassName extends UML$ActivityNode complete;
   axiom (forall r: ref :: dtype(r)!= UML$ControlNode);
const unique UML$DecisionNode: ClassName extends UML$ControlNode complete;
const unique UML$DecisionNode.decisionInput: Field ref;
const unique UML$DecisionNode.decisionInputFlow: Field ref;
const unique UML$DeployedArtifact: ClassName extends UML$NamedElement complete;
   axiom (forall r: ref :: dtype(r)!= UML$DeployedArtifact);
const unique UML$DeploymentTarget: ClassName extends UML$NamedElement complete;
const unique UML$DeploymentTarget.deployedElement: Field ref;
const unique UML$DeploymentTarget.deployment: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$DeploymentTarget);
const unique UML$DirectedRelationship: ClassName extends UML$Relationship complete;
const unique UML$DirectedRelationship.source: Field ref;
const unique UML$DirectedRelationship.target: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$DirectedRelationship);
const unique UML$ElementImport: ClassName extends UML$DirectedRelationship complete;
const unique UML$ElementImport.alias: Field String;
const unique UML$ElementImport.importedElement: Field ref;
const unique UML$ElementImport.importingNamespace: Field ref;
const unique UML$ElementImport.visibility: Field ref;
const unique UML$ExecutableNode: ClassName extends UML$ActivityNode complete;
const unique UML$ExecutableNode.handler: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$ExecutableNode);
const unique UML$Extend: ClassName extends UML$NamedElement,UML$DirectedRelationship complete;
const unique UML$Extend.condition: Field ref;
const unique UML$Extend.extendedCase: Field ref;
const unique UML$Extend.extension: Field ref;
const unique UML$Extend.extensionLocation: Field ref;
const unique UML$ExtensionPoint: ClassName extends UML$RedefinableElement complete;
const unique UML$ExtensionPoint.useCase: Field ref;
const unique UML$Feature: ClassName extends UML$RedefinableElement complete;
const unique UML$Feature.featuringClassifier: Field ref;
const unique UML$Feature.isStatic: Field bool;
   axiom (forall r: ref :: dtype(r)!= UML$Feature);
const unique UML$FinalNode: ClassName extends UML$ControlNode complete;
   axiom (forall r: ref :: dtype(r)!= UML$FinalNode);
const unique UML$FlowFinalNode: ClassName extends UML$FinalNode complete;
const unique UML$ForkNode: ClassName extends UML$ControlNode complete;
const unique UML$GeneralOrdering: ClassName extends UML$NamedElement complete;
const unique UML$GeneralOrdering.after: Field ref;
const unique UML$GeneralOrdering.before: Field ref;
const unique UML$Generalization: ClassName extends UML$DirectedRelationship complete;
const unique UML$Generalization.general: Field ref;
const unique UML$Generalization.generalizationSet: Field ref;
const unique UML$Generalization.isSubstitutable: Field ref;
const unique UML$Generalization.specific: Field ref;
const unique UML$Include: ClassName extends UML$NamedElement,UML$DirectedRelationship complete;
const unique UML$Include.addition: Field ref;
const unique UML$Include.includingCase: Field ref;
const unique UML$InitialNode: ClassName extends UML$ControlNode complete;
const unique UML$InteractionFragment: ClassName extends UML$NamedElement complete;
const unique UML$InteractionFragment.covered: Field ref;
const unique UML$InteractionFragment.enclosingInteraction: Field ref;
const unique UML$InteractionFragment.enclosingOperand: Field ref;
const unique UML$InteractionFragment.generalOrdering: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$InteractionFragment);
const unique UML$InteractionOperand: ClassName extends UML$Namespace,UML$InteractionFragment complete;
const unique UML$InteractionOperand.fragment: Field ref;
const unique UML$InteractionOperand.guard: Field ref;
const unique UML$InteractionUse: ClassName extends UML$InteractionFragment complete;
const unique UML$InteractionUse.actualGate: Field ref;
const unique UML$InteractionUse.argument: Field ref;
const unique UML$InteractionUse.refersTo: Field ref;
const unique UML$InteractionUse.returnValue: Field ref;
const unique UML$InteractionUse.returnValueRecipient: Field ref;
const unique UML$InterruptibleActivityRegion: ClassName extends UML$ActivityGroup complete;
const unique UML$InterruptibleActivityRegion.interruptingEdge: Field ref;
const unique UML$InterruptibleActivityRegion.node: Field ref;
const unique UML$JoinNode: ClassName extends UML$ControlNode complete;
const unique UML$JoinNode.isCombineDuplicate: Field bool;
const unique UML$JoinNode.joinSpec: Field ref;
const unique UML$Lifeline: ClassName extends UML$NamedElement complete;
const unique UML$Lifeline.coveredBy: Field ref;
const unique UML$Lifeline.decomposedAs: Field ref;
const unique UML$Lifeline.interaction: Field ref;
const unique UML$Lifeline.represents: Field ref;
const unique UML$Lifeline.selector: Field ref;
const unique UML$LinkEndCreationData: ClassName extends UML$LinkEndData complete;
const unique UML$LinkEndCreationData.insertAt: Field ref;
const unique UML$LinkEndCreationData.isReplaceAll: Field bool;
const unique UML$MergeNode: ClassName extends UML$ControlNode complete;
const unique UML$Message: ClassName extends UML$NamedElement complete;
const unique UML$Message.argument: Field ref;
const unique UML$Message.connector: Field ref;
const unique UML$Message.interaction: Field ref;
const unique UML$Message.messageKind: Field ref;
const unique UML$Message.messageSort: Field ref;
const unique UML$Message.receiveEvent: Field ref;
const unique UML$Message.sendEvent: Field ref;
const unique UML$Message.signature: Field ref;
const unique UML$MessageEnd: ClassName extends UML$NamedElement complete;
const unique UML$MessageEnd.message: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$MessageEnd);
const unique UML$ObjectFlow: ClassName extends UML$ActivityEdge complete;
const unique UML$ObjectFlow.isMulticast: Field bool;
const unique UML$ObjectFlow.isMultireceive: Field bool;
const unique UML$ObjectFlow.selection: Field ref;
const unique UML$ObjectFlow.transformation: Field ref;
const unique UML$ObjectNode: ClassName extends UML$ActivityNode,UML$TypedElement complete;
const unique UML$ObjectNode.inState: Field ref;
const unique UML$ObjectNode.isControlType: Field bool;
const unique UML$ObjectNode.ordering: Field ref;
const unique UML$ObjectNode.selection: Field ref;
const unique UML$ObjectNode.upperBound: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$ObjectNode);
const unique UML$OccurrenceSpecification: ClassName extends UML$InteractionFragment complete;
const unique UML$OccurrenceSpecification.toAfter: Field ref;
const unique UML$OccurrenceSpecification.toBefore: Field ref;
const unique UML$OperationTemplateParameter: ClassName extends UML$TemplateParameter complete;
const unique UML$PackageImport: ClassName extends UML$DirectedRelationship complete;
const unique UML$PackageImport.importedPackage: Field ref;
const unique UML$PackageImport.importingNamespace: Field ref;
const unique UML$PackageImport.visibility: Field ref;
const unique UML$PackageMerge: ClassName extends UML$DirectedRelationship complete;
const unique UML$PackageMerge.mergedPackage: Field ref;
const unique UML$PackageMerge.receivingPackage: Field ref;
const unique UML$PackageableElement: ClassName extends UML$NamedElement,UML$ParameterableElement complete;
   axiom (forall r: ref :: dtype(r)!= UML$PackageableElement);
const unique UML$Parameter: ClassName extends UML$ConnectableElement,UML$MultiplicityElement complete;
const unique UML$Parameter.default: Field String;
const unique UML$Parameter.defaultValue: Field ref;
const unique UML$Parameter.direction: Field ref;
const unique UML$Parameter.effect: Field ref;
const unique UML$Parameter.isException: Field bool;
const unique UML$Parameter.isStream: Field bool;
const unique UML$Parameter.operation: Field ref;
const unique UML$Parameter.parameterSet: Field ref;
const unique UML$PartDecomposition: ClassName extends UML$InteractionUse complete;
const unique UML$Pin: ClassName extends UML$ObjectNode,UML$MultiplicityElement complete;
const unique UML$Pin.isControl: Field bool;
   axiom (forall r: ref :: dtype(r)!= UML$Pin);
const unique UML$ProfileApplication: ClassName extends UML$DirectedRelationship complete;
const unique UML$ProfileApplication.appliedProfile: Field ref;
const unique UML$ProfileApplication.applyingPackage: Field ref;
const unique UML$ProfileApplication.isStrict: Field bool;
const unique UML$ProtocolConformance: ClassName extends UML$DirectedRelationship complete;
const unique UML$ProtocolConformance.generalMachine: Field ref;
const unique UML$ProtocolConformance.specificMachine: Field ref;
const unique UML$ProtocolTransition: ClassName extends UML$Transition complete;
const unique UML$ProtocolTransition.postCondition: Field ref;
const unique UML$ProtocolTransition.preCondition: Field ref;
const unique UML$ProtocolTransition.referred: Field ref;
const unique UML$Pseudostate: ClassName extends UML$Vertex complete;
const unique UML$Pseudostate.kind: Field ref;
const unique UML$Pseudostate.state: Field ref;
const unique UML$Pseudostate.stateMachine: Field ref;
const unique UML$RedefinableTemplateSignature: ClassName extends UML$RedefinableElement,UML$TemplateSignature complete;
const unique UML$RedefinableTemplateSignature.classifier: Field ref;
const unique UML$RedefinableTemplateSignature.extendedSignature: Field ref;
const unique UML$RedefinableTemplateSignature.inheritedParameter: Field ref;
const unique UML$State: ClassName extends UML$Namespace,UML$RedefinableElement,UML$Vertex complete;
const unique UML$State.connection: Field ref;
const unique UML$State.connectionPoint: Field ref;
const unique UML$State.deferrableTrigger: Field ref;
const unique UML$State.doActivity: Field ref;
const unique UML$State.entry: Field ref;
const unique UML$State.exit: Field ref;
const unique UML$State.isComposite: Field bool;
const unique UML$State.isOrthogonal: Field bool;
const unique UML$State.isSimple: Field bool;
const unique UML$State.isSubmachineState: Field bool;
const unique UML$State.redefinedState: Field ref;
const unique UML$State.region: Field ref;
const unique UML$State.stateInvariant: Field ref;
const unique UML$State.submachine: Field ref;
const unique UML$StateInvariant: ClassName extends UML$InteractionFragment complete;
const unique UML$StateInvariant.invariant: Field ref;
const unique UML$StructuralFeature: ClassName extends UML$Feature,UML$TypedElement,UML$MultiplicityElement complete;
const unique UML$StructuralFeature.isReadOnly: Field bool;
   axiom (forall r: ref :: dtype(r)!= UML$StructuralFeature);
const unique UML$TemplateBinding: ClassName extends UML$DirectedRelationship complete;
const unique UML$TemplateBinding.boundElement: Field ref;
const unique UML$TemplateBinding.parameterSubstitution: Field ref;
const unique UML$TemplateBinding.signature: Field ref;
const unique UML$Type: ClassName extends UML$PackageableElement complete;
const unique UML$Type.package: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$Type);
const unique UML$ValueSpecification: ClassName extends UML$PackageableElement,UML$TypedElement complete;
   axiom (forall r: ref :: dtype(r)!= UML$ValueSpecification);
const unique UML$Variable: ClassName extends UML$ConnectableElement,UML$MultiplicityElement complete;
const unique UML$Variable.activityScope: Field ref;
const unique UML$Variable.scope: Field ref;
const unique UML$Action: ClassName extends UML$ExecutableNode complete;
const unique UML$Action.context: Field ref;
const unique UML$Action.input: Field ref;
const unique UML$Action.isLocallyReentrant: Field bool;
const unique UML$Action.localPostcondition: Field ref;
const unique UML$Action.localPrecondition: Field ref;
const unique UML$Action.output: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$Action);
const unique UML$ActivityFinalNode: ClassName extends UML$FinalNode complete;
const unique UML$ActivityParameterNode: ClassName extends UML$ObjectNode complete;
const unique UML$ActivityParameterNode.parameter: Field ref;
const unique UML$BehavioralFeature: ClassName extends UML$Namespace,UML$Feature complete;
const unique UML$BehavioralFeature.concurrency: Field ref;
const unique UML$BehavioralFeature.isAbstract: Field bool;
const unique UML$BehavioralFeature.method: Field ref;
const unique UML$BehavioralFeature.ownedParameter: Field ref;
const unique UML$BehavioralFeature.ownedParameterSet: Field ref;
const unique UML$BehavioralFeature.raisedException: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$BehavioralFeature);
const unique UML$CentralBufferNode: ClassName extends UML$ObjectNode complete;
const unique UML$Classifier: ClassName extends UML$Namespace,UML$RedefinableElement,UML$Type,UML$TemplateableElement complete;
const unique UML$Classifier.attribute: Field ref;
const unique UML$Classifier.collaborationUse: Field ref;
const unique UML$Classifier.feature: Field ref;
const unique UML$Classifier.general: Field ref;
const unique UML$Classifier.generalization: Field ref;
const unique UML$Classifier.inheritedMember: Field ref;
const unique UML$Classifier.isAbstract: Field bool;
const unique UML$Classifier.isFinalSpecialization: Field bool;
const unique UML$Classifier.ownedUseCase: Field ref;
const unique UML$Classifier.powertypeExtent: Field ref;
const unique UML$Classifier.redefinedClassifier: Field ref;
const unique UML$Classifier.representation: Field ref;
const unique UML$Classifier.substitution: Field ref;
const unique UML$Classifier.useCase: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$Classifier);
const unique UML$ClearAssociationAction: ClassName extends UML$Action complete;
const unique UML$ClearAssociationAction.association: Field ref;
const unique UML$ClearAssociationAction.object: Field ref;
const unique UML$CombinedFragment: ClassName extends UML$InteractionFragment complete;
const unique UML$CombinedFragment.cfragmentGate: Field ref;
const unique UML$CombinedFragment.interactionOperator: Field ref;
const unique UML$CombinedFragment.operand: Field ref;
const unique UML$Connector: ClassName extends UML$Feature complete;
const unique UML$Connector.contract: Field ref;
const unique UML$Connector.end: Field ref;
const unique UML$Connector.kind: Field ref;
const unique UML$Connector.redefinedConnector: Field ref;
const unique UML$Connector.type: Field ref;
const unique UML$ConsiderIgnoreFragment: ClassName extends UML$CombinedFragment complete;
const unique UML$ConsiderIgnoreFragment.message: Field ref;
const unique UML$Constraint: ClassName extends UML$PackageableElement complete;
const unique UML$Constraint.constrainedElement: Field ref;
const unique UML$Constraint.context: Field ref;
const unique UML$Constraint.specification: Field ref;
const unique UML$Continuation: ClassName extends UML$InteractionFragment complete;
const unique UML$Continuation.setting: Field bool;
const unique UML$CreateObjectAction: ClassName extends UML$Action complete;
const unique UML$CreateObjectAction.classifier: Field ref;
const unique UML$CreateObjectAction.result: Field ref;
const unique UML$DataStoreNode: ClassName extends UML$CentralBufferNode complete;
const unique UML$DataType: ClassName extends UML$Classifier complete;
const unique UML$DataType.ownedAttribute: Field ref;
const unique UML$DataType.ownedOperation: Field ref;
const unique UML$Dependency: ClassName extends UML$PackageableElement,UML$DirectedRelationship complete;
const unique UML$Dependency.client: Field ref;
const unique UML$Dependency.supplier: Field ref;
const unique UML$Deployment: ClassName extends UML$Dependency complete;
const unique UML$Deployment.configuration: Field ref;
const unique UML$Deployment.deployedArtifact: Field ref;
const unique UML$Deployment.location: Field ref;
const unique UML$DestroyObjectAction: ClassName extends UML$Action complete;
const unique UML$DestroyObjectAction.isDestroyLinks: Field bool;
const unique UML$DestroyObjectAction.isDestroyOwnedObjects: Field bool;
const unique UML$DestroyObjectAction.target: Field ref;
const unique UML$Duration: ClassName extends UML$ValueSpecification complete;
const unique UML$Duration.expr: Field ref;
const unique UML$Duration.observation: Field ref;
const unique UML$Enumeration: ClassName extends UML$DataType complete;
const unique UML$Enumeration.ownedLiteral: Field ref;
const unique UML$Event: ClassName extends UML$PackageableElement complete;
   axiom (forall r: ref :: dtype(r)!= UML$Event);
const unique UML$ExecutionOccurrenceSpecification: ClassName extends UML$OccurrenceSpecification complete;
const unique UML$ExecutionOccurrenceSpecification.execution: Field ref;
const unique UML$ExecutionSpecification: ClassName extends UML$InteractionFragment complete;
const unique UML$ExecutionSpecification.finish: Field ref;
const unique UML$ExecutionSpecification.start: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$ExecutionSpecification);
const unique UML$ExpansionNode: ClassName extends UML$ObjectNode complete;
const unique UML$ExpansionNode.regionAsInput: Field ref;
const unique UML$ExpansionNode.regionAsOutput: Field ref;
const unique UML$Expression: ClassName extends UML$ValueSpecification complete;
const unique UML$Expression.operand: Field ref;
const unique UML$Expression.symbol: Field String;
const unique UML$FinalState: ClassName extends UML$State complete;
const unique UML$Gate: ClassName extends UML$MessageEnd complete;
const unique UML$GeneralizationSet: ClassName extends UML$PackageableElement complete;
const unique UML$GeneralizationSet.generalization: Field ref;
const unique UML$GeneralizationSet.isCovering: Field bool;
const unique UML$GeneralizationSet.isDisjoint: Field bool;
const unique UML$GeneralizationSet.powertype: Field ref;
const unique UML$InformationFlow: ClassName extends UML$PackageableElement,UML$DirectedRelationship complete;
const unique UML$InformationFlow.conveyed: Field ref;
const unique UML$InformationFlow.informationSource: Field ref;
const unique UML$InformationFlow.informationTarget: Field ref;
const unique UML$InformationFlow.realization: Field ref;
const unique UML$InformationFlow.realizingActivityEdge: Field ref;
const unique UML$InformationFlow.realizingConnector: Field ref;
const unique UML$InformationFlow.realizingMessage: Field ref;
const unique UML$InformationItem: ClassName extends UML$Classifier complete;
const unique UML$InformationItem.represented: Field ref;
const unique UML$InputPin: ClassName extends UML$Pin complete;
const unique UML$InstanceSpecification: ClassName extends UML$DeploymentTarget,UML$PackageableElement,UML$DeployedArtifact complete;
const unique UML$InstanceSpecification.classifier: Field ref;
const unique UML$InstanceSpecification.slot: Field ref;
const unique UML$InstanceSpecification.specification: Field ref;
const unique UML$InstanceValue: ClassName extends UML$ValueSpecification complete;
const unique UML$InstanceValue.instance: Field ref;
const unique UML$InteractionConstraint: ClassName extends UML$Constraint complete;
const unique UML$InteractionConstraint.maxint: Field ref;
const unique UML$InteractionConstraint.minint: Field ref;
const unique UML$Interface: ClassName extends UML$Classifier complete;
const unique UML$Interface.nestedClassifier: Field ref;
const unique UML$Interface.ownedAttribute: Field ref;
const unique UML$Interface.ownedOperation: Field ref;
const unique UML$Interface.ownedReception: Field ref;
const unique UML$Interface.protocol: Field ref;
const unique UML$Interface.redefinedInterface: Field ref;
const unique UML$Interval: ClassName extends UML$ValueSpecification complete;
const unique UML$Interval.max: Field ref;
const unique UML$Interval.min: Field ref;
const unique UML$IntervalConstraint: ClassName extends UML$Constraint complete;
const unique UML$InvocationAction: ClassName extends UML$Action complete;
const unique UML$InvocationAction.argument: Field ref;
const unique UML$InvocationAction.onPort: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$InvocationAction);
const unique UML$LinkAction: ClassName extends UML$Action complete;
const unique UML$LinkAction.endData: Field ref;
const unique UML$LinkAction.inputValue: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$LinkAction);
const unique UML$LiteralSpecification: ClassName extends UML$ValueSpecification complete;
   axiom (forall r: ref :: dtype(r)!= UML$LiteralSpecification);
const unique UML$LiteralString: ClassName extends UML$LiteralSpecification complete;
const unique UML$LiteralString.value: Field String;
const unique UML$LiteralUnlimitedNatural: ClassName extends UML$LiteralSpecification complete;
const unique UML$LiteralUnlimitedNatural.value: Field ref;
const unique UML$MessageEvent: ClassName extends UML$Event complete;
   axiom (forall r: ref :: dtype(r)!= UML$MessageEvent);
const unique UML$MessageOccurrenceSpecification: ClassName extends UML$OccurrenceSpecification,UML$MessageEnd complete;
const unique UML$Observation: ClassName extends UML$PackageableElement complete;
   axiom (forall r: ref :: dtype(r)!= UML$Observation);
const unique UML$OpaqueAction: ClassName extends UML$Action complete;
const unique UML$OpaqueAction.body: Field String;
const unique UML$OpaqueAction.inputValue: Field ref;
const unique UML$OpaqueAction.language: Field String;
const unique UML$OpaqueAction.outputValue: Field ref;
const unique UML$OpaqueExpression: ClassName extends UML$ValueSpecification complete;
const unique UML$OpaqueExpression.behavior: Field ref;
const unique UML$OpaqueExpression.body: Field String;
const unique UML$OpaqueExpression.language: Field String;
const unique UML$OpaqueExpression.result: Field ref;
const unique UML$Operation: ClassName extends UML$BehavioralFeature,UML$ParameterableElement,UML$TemplateableElement complete;
const unique UML$Operation.bodyCondition: Field ref;
const unique UML$Operation.class: Field ref;
const unique UML$Operation.datatype: Field ref;
const unique UML$Operation.interface: Field ref;
const unique UML$Operation.isOrdered: Field bool;
const unique UML$Operation.isQuery: Field bool;
const unique UML$Operation.isUnique: Field bool;
const unique UML$Operation.lower: Field ref;
const unique UML$Operation.postcondition: Field ref;
const unique UML$Operation.precondition: Field ref;
const unique UML$Operation.redefinedOperation: Field ref;
const unique UML$Operation.type: Field ref;
const unique UML$Operation.upper: Field ref;
const unique UML$OutputPin: ClassName extends UML$Pin complete;
const unique UML$Package: ClassName extends UML$Namespace,UML$PackageableElement,UML$TemplateableElement complete;
const unique UML$Package.URI: Field String;
const unique UML$Package.nestedPackage: Field ref;
const unique UML$Package.nestingPackage: Field ref;
const unique UML$Package.ownedStereotype: Field ref;
const unique UML$Package.ownedType: Field ref;
const unique UML$Package.packageMerge: Field ref;
const unique UML$Package.packagedElement: Field ref;
const unique UML$Package.profileApplication: Field ref;
const unique UML$PrimitiveType: ClassName extends UML$DataType complete;
const unique UML$Profile: ClassName extends UML$Package complete;
const unique UML$Profile.metaclassReference: Field ref;
const unique UML$Profile.metamodelReference: Field ref;
const unique UML$Property: ClassName extends UML$StructuralFeature,UML$ConnectableElement,UML$DeploymentTarget complete;
const unique UML$Property.aggregation: Field ref;
const unique UML$Property.association: Field ref;
const unique UML$Property.associationEnd: Field ref;
const unique UML$Property.class: Field ref;
const unique UML$Property.datatype: Field ref;
const unique UML$Property.defaultValue: Field ref;
const unique UML$Property.interface: Field ref;
const unique UML$Property.isComposite: Field bool;
const unique UML$Property.isDerived: Field bool;
const unique UML$Property.isDerivedUnion: Field bool;
const unique UML$Property.isID: Field bool;
const unique UML$Property.opposite: Field ref;
const unique UML$Property.owningAssociation: Field ref;
const unique UML$Property.qualifier: Field ref;
const unique UML$Property.redefinedProperty: Field ref;
const unique UML$Property.subsettedProperty: Field ref;
const unique UML$RaiseExceptionAction: ClassName extends UML$Action complete;
const unique UML$RaiseExceptionAction.exception: Field ref;
const unique UML$ReadExtentAction: ClassName extends UML$Action complete;
const unique UML$ReadExtentAction.classifier: Field ref;
const unique UML$ReadExtentAction.result: Field ref;
const unique UML$ReadIsClassifiedObjectAction: ClassName extends UML$Action complete;
const unique UML$ReadIsClassifiedObjectAction.classifier: Field ref;
const unique UML$ReadIsClassifiedObjectAction.isDirect: Field bool;
const unique UML$ReadIsClassifiedObjectAction.object: Field ref;
const unique UML$ReadIsClassifiedObjectAction.result: Field ref;
const unique UML$ReadLinkAction: ClassName extends UML$LinkAction complete;
const unique UML$ReadLinkAction.result: Field ref;
const unique UML$ReadLinkObjectEndAction: ClassName extends UML$Action complete;
const unique UML$ReadLinkObjectEndAction.end: Field ref;
const unique UML$ReadLinkObjectEndAction.object: Field ref;
const unique UML$ReadLinkObjectEndAction.result: Field ref;
const unique UML$ReadLinkObjectEndQualifierAction: ClassName extends UML$Action complete;
const unique UML$ReadLinkObjectEndQualifierAction.object: Field ref;
const unique UML$ReadLinkObjectEndQualifierAction.qualifier: Field ref;
const unique UML$ReadLinkObjectEndQualifierAction.result: Field ref;
const unique UML$ReadSelfAction: ClassName extends UML$Action complete;
const unique UML$ReadSelfAction.result: Field ref;
const unique UML$Reception: ClassName extends UML$BehavioralFeature complete;
const unique UML$Reception.signal: Field ref;
const unique UML$ReclassifyObjectAction: ClassName extends UML$Action complete;
const unique UML$ReclassifyObjectAction.isReplaceAll: Field bool;
const unique UML$ReclassifyObjectAction.newClassifier: Field ref;
const unique UML$ReclassifyObjectAction.object: Field ref;
const unique UML$ReclassifyObjectAction.oldClassifier: Field ref;
const unique UML$ReduceAction: ClassName extends UML$Action complete;
const unique UML$ReduceAction.collection: Field ref;
const unique UML$ReduceAction.isOrdered: Field bool;
const unique UML$ReduceAction.reducer: Field ref;
const unique UML$ReduceAction.result: Field ref;
const unique UML$ReplyAction: ClassName extends UML$Action complete;
const unique UML$ReplyAction.replyToCall: Field ref;
const unique UML$ReplyAction.replyValue: Field ref;
const unique UML$ReplyAction.returnInformation: Field ref;
const unique UML$SendObjectAction: ClassName extends UML$InvocationAction complete;
const unique UML$SendObjectAction.request: Field ref;
const unique UML$SendObjectAction.target: Field ref;
const unique UML$SendSignalAction: ClassName extends UML$InvocationAction complete;
const unique UML$SendSignalAction.signal: Field ref;
const unique UML$SendSignalAction.target: Field ref;
const unique UML$Signal: ClassName extends UML$Classifier complete;
const unique UML$Signal.ownedAttribute: Field ref;
const unique UML$SignalEvent: ClassName extends UML$MessageEvent complete;
const unique UML$SignalEvent.signal: Field ref;
const unique UML$StartClassifierBehaviorAction: ClassName extends UML$Action complete;
const unique UML$StartClassifierBehaviorAction.object: Field ref;
const unique UML$StringExpression: ClassName extends UML$Expression,UML$TemplateableElement complete;
const unique UML$StringExpression.owningExpression: Field ref;
const unique UML$StringExpression.subExpression: Field ref;
const unique UML$StructuralFeatureAction: ClassName extends UML$Action complete;
const unique UML$StructuralFeatureAction.object: Field ref;
const unique UML$StructuralFeatureAction.structuralFeature: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$StructuralFeatureAction);
const unique UML$StructuredActivityNode: ClassName extends UML$Action,UML$Namespace,UML$ActivityGroup complete;
const unique UML$StructuredActivityNode.edge: Field ref;
const unique UML$StructuredActivityNode.mustIsolate: Field bool;
const unique UML$StructuredActivityNode.node: Field ref;
const unique UML$StructuredActivityNode.structuredNodeInput: Field ref;
const unique UML$StructuredActivityNode.structuredNodeOutput: Field ref;
const unique UML$StructuredActivityNode.variable: Field ref;
const unique UML$StructuredClassifier: ClassName extends UML$Classifier complete;
const unique UML$StructuredClassifier.ownedAttribute: Field ref;
const unique UML$StructuredClassifier.ownedConnector: Field ref;
const unique UML$StructuredClassifier.part: Field ref;
const unique UML$StructuredClassifier.role: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$StructuredClassifier);
const unique UML$TestIdentityAction: ClassName extends UML$Action complete;
const unique UML$TestIdentityAction.first: Field ref;
const unique UML$TestIdentityAction.result: Field ref;
const unique UML$TestIdentityAction.second: Field ref;
const unique UML$TimeConstraint: ClassName extends UML$IntervalConstraint complete;
const unique UML$TimeConstraint.firstEvent: Field ref;
const unique UML$TimeEvent: ClassName extends UML$Event complete;
const unique UML$TimeEvent.isRelative: Field bool;
const unique UML$TimeEvent.when: Field ref;
const unique UML$TimeExpression: ClassName extends UML$ValueSpecification complete;
const unique UML$TimeExpression.expr: Field ref;
const unique UML$TimeExpression.observation: Field ref;
const unique UML$TimeInterval: ClassName extends UML$Interval complete;
const unique UML$TimeObservation: ClassName extends UML$Observation complete;
const unique UML$TimeObservation.event: Field ref;
const unique UML$TimeObservation.firstEvent: Field bool;
const unique UML$UnmarshallAction: ClassName extends UML$Action complete;
const unique UML$UnmarshallAction.object: Field ref;
const unique UML$UnmarshallAction.result: Field ref;
const unique UML$UnmarshallAction.unmarshallType: Field ref;
const unique UML$Usage: ClassName extends UML$Dependency complete;
const unique UML$ValuePin: ClassName extends UML$InputPin complete;
const unique UML$ValuePin.value: Field ref;
const unique UML$ValueSpecificationAction: ClassName extends UML$Action complete;
const unique UML$ValueSpecificationAction.result: Field ref;
const unique UML$ValueSpecificationAction.value: Field ref;
const unique UML$VariableAction: ClassName extends UML$Action complete;
const unique UML$VariableAction.variable: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$VariableAction);
const unique UML$WriteLinkAction: ClassName extends UML$LinkAction complete;
   axiom (forall r: ref :: dtype(r)!= UML$WriteLinkAction);
const unique UML$WriteStructuralFeatureAction: ClassName extends UML$StructuralFeatureAction complete;
const unique UML$WriteStructuralFeatureAction.result: Field ref;
const unique UML$WriteStructuralFeatureAction.value: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$WriteStructuralFeatureAction);
const unique UML$WriteVariableAction: ClassName extends UML$VariableAction complete;
const unique UML$WriteVariableAction.value: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$WriteVariableAction);
const unique UML$Abstraction: ClassName extends UML$Dependency complete;
const unique UML$Abstraction.mapping: Field ref;
const unique UML$AcceptEventAction: ClassName extends UML$Action complete;
const unique UML$AcceptEventAction.isUnmarshall: Field bool;
const unique UML$AcceptEventAction.result: Field ref;
const unique UML$AcceptEventAction.trigger: Field ref;
const unique UML$ActionExecutionSpecification: ClassName extends UML$ExecutionSpecification complete;
const unique UML$ActionExecutionSpecification.action: Field ref;
const unique UML$ActionInputPin: ClassName extends UML$InputPin complete;
const unique UML$ActionInputPin.fromAction: Field ref;
const unique UML$AddStructuralFeatureValueAction: ClassName extends UML$WriteStructuralFeatureAction complete;
const unique UML$AddStructuralFeatureValueAction.insertAt: Field ref;
const unique UML$AddStructuralFeatureValueAction.isReplaceAll: Field bool;
const unique UML$AddVariableValueAction: ClassName extends UML$WriteVariableAction complete;
const unique UML$AddVariableValueAction.insertAt: Field ref;
const unique UML$AddVariableValueAction.isReplaceAll: Field bool;
const unique UML$AnyReceiveEvent: ClassName extends UML$MessageEvent complete;
const unique UML$Artifact: ClassName extends UML$Classifier,UML$DeployedArtifact complete;
const unique UML$Artifact.fileName: Field String;
const unique UML$Artifact.manifestation: Field ref;
const unique UML$Artifact.nestedArtifact: Field ref;
const unique UML$Artifact.ownedAttribute: Field ref;
const unique UML$Artifact.ownedOperation: Field ref;
const unique UML$Association: ClassName extends UML$Classifier,UML$Relationship complete;
const unique UML$Association.endType: Field ref;
const unique UML$Association.isDerived: Field bool;
const unique UML$Association.memberEnd: Field ref;
const unique UML$Association.navigableOwnedEnd: Field ref;
const unique UML$Association.ownedEnd: Field ref;
const unique UML$BehaviorExecutionSpecification: ClassName extends UML$ExecutionSpecification complete;
const unique UML$BehaviorExecutionSpecification.behavior: Field ref;
const unique UML$BehavioredClassifier: ClassName extends UML$Classifier complete;
const unique UML$BehavioredClassifier.classifierBehavior: Field ref;
const unique UML$BehavioredClassifier.interfaceRealization: Field ref;
const unique UML$BehavioredClassifier.ownedBehavior: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$BehavioredClassifier);
const unique UML$BroadcastSignalAction: ClassName extends UML$InvocationAction complete;
const unique UML$BroadcastSignalAction.signal: Field ref;
const unique UML$CallAction: ClassName extends UML$InvocationAction complete;
const unique UML$CallAction.isSynchronous: Field bool;
const unique UML$CallAction.result: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$CallAction);
const unique UML$CallBehaviorAction: ClassName extends UML$CallAction complete;
const unique UML$CallBehaviorAction.behavior: Field ref;
const unique UML$CallEvent: ClassName extends UML$MessageEvent complete;
const unique UML$CallEvent.operation: Field ref;
const unique UML$CallOperationAction: ClassName extends UML$CallAction complete;
const unique UML$CallOperationAction.operation: Field ref;
const unique UML$CallOperationAction.target: Field ref;
const unique UML$ChangeEvent: ClassName extends UML$Event complete;
const unique UML$ChangeEvent.changeExpression: Field ref;
const unique UML$ClearStructuralFeatureAction: ClassName extends UML$StructuralFeatureAction complete;
const unique UML$ClearStructuralFeatureAction.result: Field ref;
const unique UML$ClearVariableAction: ClassName extends UML$VariableAction complete;
const unique UML$Collaboration: ClassName extends UML$StructuredClassifier,UML$BehavioredClassifier complete;
const unique UML$Collaboration.collaborationRole: Field ref;
const unique UML$CommunicationPath: ClassName extends UML$Association complete;
const unique UML$ConditionalNode: ClassName extends UML$StructuredActivityNode complete;
const unique UML$ConditionalNode.clause: Field ref;
const unique UML$ConditionalNode.isAssured: Field bool;
const unique UML$ConditionalNode.isDeterminate: Field bool;
const unique UML$ConditionalNode.result: Field ref;
const unique UML$CreateLinkAction: ClassName extends UML$WriteLinkAction complete;
const unique UML$CreateLinkObjectAction: ClassName extends UML$CreateLinkAction complete;
const unique UML$CreateLinkObjectAction.result: Field ref;
const unique UML$DeploymentSpecification: ClassName extends UML$Artifact complete;
const unique UML$DeploymentSpecification.deployment: Field ref;
const unique UML$DeploymentSpecification.deploymentLocation: Field String;
const unique UML$DeploymentSpecification.executionLocation: Field String;
const unique UML$DestroyLinkAction: ClassName extends UML$WriteLinkAction complete;
const unique UML$DestructionOccurrenceSpecification: ClassName extends UML$MessageOccurrenceSpecification complete;
const unique UML$DurationConstraint: ClassName extends UML$IntervalConstraint complete;
const unique UML$DurationConstraint.firstEvent: Field ref;
const unique UML$DurationInterval: ClassName extends UML$Interval complete;
const unique UML$DurationObservation: ClassName extends UML$Observation complete;
const unique UML$DurationObservation.event: Field ref;
const unique UML$DurationObservation.firstEvent: Field ref;
const unique UML$EncapsulatedClassifier: ClassName extends UML$StructuredClassifier complete;
const unique UML$EncapsulatedClassifier.ownedPort: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$EncapsulatedClassifier);
const unique UML$EnumerationLiteral: ClassName extends UML$InstanceSpecification complete;
const unique UML$EnumerationLiteral.enumeration: Field ref;
const unique UML$ExpansionRegion: ClassName extends UML$StructuredActivityNode complete;
const unique UML$ExpansionRegion.inputElement: Field ref;
const unique UML$ExpansionRegion.mode: Field ref;
const unique UML$ExpansionRegion.outputElement: Field ref;
const unique UML$Extension: ClassName extends UML$Association complete;
const unique UML$Extension.isRequired: Field bool;
const unique UML$Extension.metaclass: Field ref;
const unique UML$ExtensionEnd: ClassName extends UML$Property complete;
const unique UML$LiteralBoolean: ClassName extends UML$LiteralSpecification complete;
const unique UML$LiteralBoolean.value: Field bool;
const unique UML$LiteralInteger: ClassName extends UML$LiteralSpecification complete;
const unique UML$LiteralInteger.value: Field int;
const unique UML$LiteralNull: ClassName extends UML$LiteralSpecification complete;
const unique UML$LiteralReal: ClassName extends UML$LiteralSpecification complete;
const unique UML$LiteralReal.value: Field ref;
const unique UML$LoopNode: ClassName extends UML$StructuredActivityNode complete;
const unique UML$LoopNode.bodyOutput: Field ref;
const unique UML$LoopNode.bodyPart: Field ref;
const unique UML$LoopNode.decider: Field ref;
const unique UML$LoopNode.isTestedFirst: Field bool;
const unique UML$LoopNode.loopVariable: Field ref;
const unique UML$LoopNode.loopVariableInput: Field ref;
const unique UML$LoopNode.result: Field ref;
const unique UML$LoopNode.setupPart: Field ref;
const unique UML$LoopNode.test: Field ref;
const unique UML$Manifestation: ClassName extends UML$Abstraction complete;
const unique UML$Manifestation.utilizedElement: Field ref;
const unique UML$Model: ClassName extends UML$Package complete;
const unique UML$Model.viewpoint: Field String;
const unique UML$Port: ClassName extends UML$Property complete;
const unique UML$Port.isBehavior: Field bool;
const unique UML$Port.isConjugated: Field bool;
const unique UML$Port.isService: Field bool;
const unique UML$Port.protocol: Field ref;
const unique UML$Port.provided: Field ref;
const unique UML$Port.redefinedPort: Field ref;
const unique UML$Port.required: Field ref;
const unique UML$ReadStructuralFeatureAction: ClassName extends UML$StructuralFeatureAction complete;
const unique UML$ReadStructuralFeatureAction.result: Field ref;
const unique UML$ReadVariableAction: ClassName extends UML$VariableAction complete;
const unique UML$ReadVariableAction.result: Field ref;
const unique UML$Realization: ClassName extends UML$Abstraction complete;
const unique UML$RemoveStructuralFeatureValueAction: ClassName extends UML$WriteStructuralFeatureAction complete;
const unique UML$RemoveStructuralFeatureValueAction.isRemoveDuplicates: Field bool;
const unique UML$RemoveStructuralFeatureValueAction.removeAt: Field ref;
const unique UML$RemoveVariableValueAction: ClassName extends UML$WriteVariableAction complete;
const unique UML$RemoveVariableValueAction.isRemoveDuplicates: Field bool;
const unique UML$RemoveVariableValueAction.removeAt: Field ref;
const unique UML$SequenceNode: ClassName extends UML$StructuredActivityNode complete;
const unique UML$SequenceNode.executableNode: Field ref;
const unique UML$StartObjectBehaviorAction: ClassName extends UML$CallAction complete;
const unique UML$StartObjectBehaviorAction.object: Field ref;
const unique UML$Substitution: ClassName extends UML$Realization complete;
const unique UML$Substitution.contract: Field ref;
const unique UML$Substitution.substitutingClassifier: Field ref;
const unique UML$UseCase: ClassName extends UML$BehavioredClassifier complete;
const unique UML$UseCase.extend: Field ref;
const unique UML$UseCase.extensionPoint: Field ref;
const unique UML$UseCase.include: Field ref;
const unique UML$UseCase.subject: Field ref;
const unique UML$AcceptCallAction: ClassName extends UML$AcceptEventAction complete;
const unique UML$AcceptCallAction.returnInformation: Field ref;
const unique UML$Actor: ClassName extends UML$BehavioredClassifier complete;
const unique UML$Class: ClassName extends UML$EncapsulatedClassifier,UML$BehavioredClassifier complete;
const unique UML$Class.extension: Field ref;
const unique UML$Class.isActive: Field bool;
const unique UML$Class.nestedClassifier: Field ref;
const unique UML$Class.ownedOperation: Field ref;
const unique UML$Class.ownedReception: Field ref;
const unique UML$Class.superClass: Field ref;
const unique UML$Component: ClassName extends UML$Class complete;
const unique UML$Component.isIndirectlyInstantiated: Field bool;
const unique UML$Component.packagedElement: Field ref;
const unique UML$Component.provided: Field ref;
const unique UML$Component.realization: Field ref;
const unique UML$Component.required: Field ref;
const unique UML$ComponentRealization: ClassName extends UML$Realization complete;
const unique UML$ComponentRealization.abstraction: Field ref;
const unique UML$ComponentRealization.realizingClassifier: Field ref;
const unique UML$InterfaceRealization: ClassName extends UML$Realization complete;
const unique UML$InterfaceRealization.contract: Field ref;
const unique UML$InterfaceRealization.implementingClassifier: Field ref;
const unique UML$Node: ClassName extends UML$Class,UML$DeploymentTarget complete;
const unique UML$Node.nestedNode: Field ref;
const unique UML$Stereotype: ClassName extends UML$Class complete;
const unique UML$Stereotype.icon: Field ref;
const unique UML$Stereotype.profile: Field ref;
const unique UML$AssociationClass: ClassName extends UML$Class,UML$Association complete;
const unique UML$Behavior: ClassName extends UML$Class complete;
const unique UML$Behavior.context: Field ref;
const unique UML$Behavior.isReentrant: Field bool;
const unique UML$Behavior.ownedParameter: Field ref;
const unique UML$Behavior.ownedParameterSet: Field ref;
const unique UML$Behavior.postcondition: Field ref;
const unique UML$Behavior.precondition: Field ref;
const unique UML$Behavior.redefinedBehavior: Field ref;
const unique UML$Behavior.specification: Field ref;
   axiom (forall r: ref :: dtype(r)!= UML$Behavior);
const unique UML$Device: ClassName extends UML$Node complete;
const unique UML$ExecutionEnvironment: ClassName extends UML$Node complete;
const unique UML$Interaction: ClassName extends UML$Behavior,UML$InteractionFragment complete;
const unique UML$Interaction.action: Field ref;
const unique UML$Interaction.formalGate: Field ref;
const unique UML$Interaction.fragment: Field ref;
const unique UML$Interaction.lifeline: Field ref;
const unique UML$Interaction.message: Field ref;
const unique UML$OpaqueBehavior: ClassName extends UML$Behavior complete;
const unique UML$OpaqueBehavior.body: Field String;
const unique UML$OpaqueBehavior.language: Field String;
const unique UML$StateMachine: ClassName extends UML$Behavior complete;
const unique UML$StateMachine.connectionPoint: Field ref;
const unique UML$StateMachine.extendedStateMachine: Field ref;
const unique UML$StateMachine.region: Field ref;
const unique UML$StateMachine.submachineState: Field ref;
const unique UML$Activity: ClassName extends UML$Behavior complete;
const unique UML$Activity.edge: Field ref;
const unique UML$Activity.group: Field ref;
const unique UML$Activity.isReadOnly: Field bool;
const unique UML$Activity.isSingleExecution: Field bool;
const unique UML$Activity.node: Field ref;
const unique UML$Activity.partition: Field ref;
const unique UML$Activity.structuredNode: Field ref;
const unique UML$Activity.variable: Field ref;
const unique UML$FunctionBehavior: ClassName extends UML$OpaqueBehavior complete;
const unique UML$ProtocolStateMachine: ClassName extends UML$StateMachine complete;
const unique UML$ProtocolStateMachine.conformance: Field ref;

// print classifier table
axiom classifierTable[_UML, _Abstraction] == UML$Abstraction;
axiom classifierTable[_UML, _AcceptCallAction] == UML$AcceptCallAction;
axiom classifierTable[_UML, _AcceptEventAction] == UML$AcceptEventAction;
axiom classifierTable[_UML, _Action] == UML$Action;
axiom classifierTable[_UML, _ActionExecutionSpecification] == UML$ActionExecutionSpecification;
axiom classifierTable[_UML, _ActionInputPin] == UML$ActionInputPin;
axiom classifierTable[_UML, _Activity] == UML$Activity;
axiom classifierTable[_UML, _ActivityEdge] == UML$ActivityEdge;
axiom classifierTable[_UML, _ActivityFinalNode] == UML$ActivityFinalNode;
axiom classifierTable[_UML, _ActivityGroup] == UML$ActivityGroup;
axiom classifierTable[_UML, _ActivityNode] == UML$ActivityNode;
axiom classifierTable[_UML, _ActivityParameterNode] == UML$ActivityParameterNode;
axiom classifierTable[_UML, _ActivityPartition] == UML$ActivityPartition;
axiom classifierTable[_UML, _Actor] == UML$Actor;
axiom classifierTable[_UML, _AddStructuralFeatureValueAction] == UML$AddStructuralFeatureValueAction;
axiom classifierTable[_UML, _AddVariableValueAction] == UML$AddVariableValueAction;
axiom classifierTable[_UML, _AnyReceiveEvent] == UML$AnyReceiveEvent;
axiom classifierTable[_UML, _Artifact] == UML$Artifact;
axiom classifierTable[_UML, _Association] == UML$Association;
axiom classifierTable[_UML, _AssociationClass] == UML$AssociationClass;
axiom classifierTable[_UML, _Behavior] == UML$Behavior;
axiom classifierTable[_UML, _BehaviorExecutionSpecification] == UML$BehaviorExecutionSpecification;
axiom classifierTable[_UML, _BehavioralFeature] == UML$BehavioralFeature;
axiom classifierTable[_UML, _BehavioredClassifier] == UML$BehavioredClassifier;
axiom classifierTable[_UML, _BroadcastSignalAction] == UML$BroadcastSignalAction;
axiom classifierTable[_UML, _CallAction] == UML$CallAction;
axiom classifierTable[_UML, _CallBehaviorAction] == UML$CallBehaviorAction;
axiom classifierTable[_UML, _CallEvent] == UML$CallEvent;
axiom classifierTable[_UML, _CallOperationAction] == UML$CallOperationAction;
axiom classifierTable[_UML, _CentralBufferNode] == UML$CentralBufferNode;
axiom classifierTable[_UML, _ChangeEvent] == UML$ChangeEvent;
axiom classifierTable[_UML, _Class] == UML$Class;
axiom classifierTable[_UML, _Classifier] == UML$Classifier;
axiom classifierTable[_UML, _ClassifierTemplateParameter] == UML$ClassifierTemplateParameter;
axiom classifierTable[_UML, _Clause] == UML$Clause;
axiom classifierTable[_UML, _ClearAssociationAction] == UML$ClearAssociationAction;
axiom classifierTable[_UML, _ClearStructuralFeatureAction] == UML$ClearStructuralFeatureAction;
axiom classifierTable[_UML, _ClearVariableAction] == UML$ClearVariableAction;
axiom classifierTable[_UML, _Collaboration] == UML$Collaboration;
axiom classifierTable[_UML, _CollaborationUse] == UML$CollaborationUse;
axiom classifierTable[_UML, _CombinedFragment] == UML$CombinedFragment;
axiom classifierTable[_UML, _Comment] == UML$Comment;
axiom classifierTable[_UML, _CommunicationPath] == UML$CommunicationPath;
axiom classifierTable[_UML, _Component] == UML$Component;
axiom classifierTable[_UML, _ComponentRealization] == UML$ComponentRealization;
axiom classifierTable[_UML, _ConditionalNode] == UML$ConditionalNode;
axiom classifierTable[_UML, _ConnectableElement] == UML$ConnectableElement;
axiom classifierTable[_UML, _ConnectableElementTemplateParameter] == UML$ConnectableElementTemplateParameter;
axiom classifierTable[_UML, _ConnectionPointReference] == UML$ConnectionPointReference;
axiom classifierTable[_UML, _Connector] == UML$Connector;
axiom classifierTable[_UML, _ConnectorEnd] == UML$ConnectorEnd;
axiom classifierTable[_UML, _ConsiderIgnoreFragment] == UML$ConsiderIgnoreFragment;
axiom classifierTable[_UML, _Constraint] == UML$Constraint;
axiom classifierTable[_UML, _Continuation] == UML$Continuation;
axiom classifierTable[_UML, _ControlFlow] == UML$ControlFlow;
axiom classifierTable[_UML, _ControlNode] == UML$ControlNode;
axiom classifierTable[_UML, _CreateLinkAction] == UML$CreateLinkAction;
axiom classifierTable[_UML, _CreateLinkObjectAction] == UML$CreateLinkObjectAction;
axiom classifierTable[_UML, _CreateObjectAction] == UML$CreateObjectAction;
axiom classifierTable[_UML, _DataStoreNode] == UML$DataStoreNode;
axiom classifierTable[_UML, _DataType] == UML$DataType;
axiom classifierTable[_UML, _DecisionNode] == UML$DecisionNode;
axiom classifierTable[_UML, _Dependency] == UML$Dependency;
axiom classifierTable[_UML, _DeployedArtifact] == UML$DeployedArtifact;
axiom classifierTable[_UML, _Deployment] == UML$Deployment;
axiom classifierTable[_UML, _DeploymentSpecification] == UML$DeploymentSpecification;
axiom classifierTable[_UML, _DeploymentTarget] == UML$DeploymentTarget;
axiom classifierTable[_UML, _DestroyLinkAction] == UML$DestroyLinkAction;
axiom classifierTable[_UML, _DestroyObjectAction] == UML$DestroyObjectAction;
axiom classifierTable[_UML, _DestructionOccurrenceSpecification] == UML$DestructionOccurrenceSpecification;
axiom classifierTable[_UML, _Device] == UML$Device;
axiom classifierTable[_UML, _DirectedRelationship] == UML$DirectedRelationship;
axiom classifierTable[_UML, _Duration] == UML$Duration;
axiom classifierTable[_UML, _DurationConstraint] == UML$DurationConstraint;
axiom classifierTable[_UML, _DurationInterval] == UML$DurationInterval;
axiom classifierTable[_UML, _DurationObservation] == UML$DurationObservation;
axiom classifierTable[_UML, _Element] == UML$Element;
axiom classifierTable[_UML, _ElementImport] == UML$ElementImport;
axiom classifierTable[_UML, _EncapsulatedClassifier] == UML$EncapsulatedClassifier;
axiom classifierTable[_UML, _Enumeration] == UML$Enumeration;
axiom classifierTable[_UML, _EnumerationLiteral] == UML$EnumerationLiteral;
axiom classifierTable[_UML, _Event] == UML$Event;
axiom classifierTable[_UML, _ExceptionHandler] == UML$ExceptionHandler;
axiom classifierTable[_UML, _ExecutableNode] == UML$ExecutableNode;
axiom classifierTable[_UML, _ExecutionEnvironment] == UML$ExecutionEnvironment;
axiom classifierTable[_UML, _ExecutionOccurrenceSpecification] == UML$ExecutionOccurrenceSpecification;
axiom classifierTable[_UML, _ExecutionSpecification] == UML$ExecutionSpecification;
axiom classifierTable[_UML, _ExpansionNode] == UML$ExpansionNode;
axiom classifierTable[_UML, _ExpansionRegion] == UML$ExpansionRegion;
axiom classifierTable[_UML, _Expression] == UML$Expression;
axiom classifierTable[_UML, _Extend] == UML$Extend;
axiom classifierTable[_UML, _Extension] == UML$Extension;
axiom classifierTable[_UML, _ExtensionEnd] == UML$ExtensionEnd;
axiom classifierTable[_UML, _ExtensionPoint] == UML$ExtensionPoint;
axiom classifierTable[_UML, _Feature] == UML$Feature;
axiom classifierTable[_UML, _FinalNode] == UML$FinalNode;
axiom classifierTable[_UML, _FinalState] == UML$FinalState;
axiom classifierTable[_UML, _FlowFinalNode] == UML$FlowFinalNode;
axiom classifierTable[_UML, _ForkNode] == UML$ForkNode;
axiom classifierTable[_UML, _FunctionBehavior] == UML$FunctionBehavior;
axiom classifierTable[_UML, _Gate] == UML$Gate;
axiom classifierTable[_UML, _GeneralOrdering] == UML$GeneralOrdering;
axiom classifierTable[_UML, _Generalization] == UML$Generalization;
axiom classifierTable[_UML, _GeneralizationSet] == UML$GeneralizationSet;
axiom classifierTable[_UML, _Image] == UML$Image;
axiom classifierTable[_UML, _Include] == UML$Include;
axiom classifierTable[_UML, _InformationFlow] == UML$InformationFlow;
axiom classifierTable[_UML, _InformationItem] == UML$InformationItem;
axiom classifierTable[_UML, _InitialNode] == UML$InitialNode;
axiom classifierTable[_UML, _InputPin] == UML$InputPin;
axiom classifierTable[_UML, _InstanceSpecification] == UML$InstanceSpecification;
axiom classifierTable[_UML, _InstanceValue] == UML$InstanceValue;
axiom classifierTable[_UML, _Interaction] == UML$Interaction;
axiom classifierTable[_UML, _InteractionConstraint] == UML$InteractionConstraint;
axiom classifierTable[_UML, _InteractionFragment] == UML$InteractionFragment;
axiom classifierTable[_UML, _InteractionOperand] == UML$InteractionOperand;
axiom classifierTable[_UML, _InteractionUse] == UML$InteractionUse;
axiom classifierTable[_UML, _Interface] == UML$Interface;
axiom classifierTable[_UML, _InterfaceRealization] == UML$InterfaceRealization;
axiom classifierTable[_UML, _InterruptibleActivityRegion] == UML$InterruptibleActivityRegion;
axiom classifierTable[_UML, _Interval] == UML$Interval;
axiom classifierTable[_UML, _IntervalConstraint] == UML$IntervalConstraint;
axiom classifierTable[_UML, _InvocationAction] == UML$InvocationAction;
axiom classifierTable[_UML, _JoinNode] == UML$JoinNode;
axiom classifierTable[_UML, _Lifeline] == UML$Lifeline;
axiom classifierTable[_UML, _LinkAction] == UML$LinkAction;
axiom classifierTable[_UML, _LinkEndCreationData] == UML$LinkEndCreationData;
axiom classifierTable[_UML, _LinkEndData] == UML$LinkEndData;
axiom classifierTable[_UML, _LinkEndDestructionData] == UML$LinkEndDestructionData;
axiom classifierTable[_UML, _LiteralBoolean] == UML$LiteralBoolean;
axiom classifierTable[_UML, _LiteralInteger] == UML$LiteralInteger;
axiom classifierTable[_UML, _LiteralNull] == UML$LiteralNull;
axiom classifierTable[_UML, _LiteralReal] == UML$LiteralReal;
axiom classifierTable[_UML, _LiteralSpecification] == UML$LiteralSpecification;
axiom classifierTable[_UML, _LiteralString] == UML$LiteralString;
axiom classifierTable[_UML, _LiteralUnlimitedNatural] == UML$LiteralUnlimitedNatural;
axiom classifierTable[_UML, _LoopNode] == UML$LoopNode;
axiom classifierTable[_UML, _Manifestation] == UML$Manifestation;
axiom classifierTable[_UML, _MergeNode] == UML$MergeNode;
axiom classifierTable[_UML, _Message] == UML$Message;
axiom classifierTable[_UML, _MessageEnd] == UML$MessageEnd;
axiom classifierTable[_UML, _MessageEvent] == UML$MessageEvent;
axiom classifierTable[_UML, _MessageOccurrenceSpecification] == UML$MessageOccurrenceSpecification;
axiom classifierTable[_UML, _Model] == UML$Model;
axiom classifierTable[_UML, _MultiplicityElement] == UML$MultiplicityElement;
axiom classifierTable[_UML, _NamedElement] == UML$NamedElement;
axiom classifierTable[_UML, _Namespace] == UML$Namespace;
axiom classifierTable[_UML, _Node] == UML$Node;
axiom classifierTable[_UML, _ObjectFlow] == UML$ObjectFlow;
axiom classifierTable[_UML, _ObjectNode] == UML$ObjectNode;
axiom classifierTable[_UML, _Observation] == UML$Observation;
axiom classifierTable[_UML, _OccurrenceSpecification] == UML$OccurrenceSpecification;
axiom classifierTable[_UML, _OpaqueAction] == UML$OpaqueAction;
axiom classifierTable[_UML, _OpaqueBehavior] == UML$OpaqueBehavior;
axiom classifierTable[_UML, _OpaqueExpression] == UML$OpaqueExpression;
axiom classifierTable[_UML, _Operation] == UML$Operation;
axiom classifierTable[_UML, _OperationTemplateParameter] == UML$OperationTemplateParameter;
axiom classifierTable[_UML, _OutputPin] == UML$OutputPin;
axiom classifierTable[_UML, _Package] == UML$Package;
axiom classifierTable[_UML, _PackageImport] == UML$PackageImport;
axiom classifierTable[_UML, _PackageMerge] == UML$PackageMerge;
axiom classifierTable[_UML, _PackageableElement] == UML$PackageableElement;
axiom classifierTable[_UML, _Parameter] == UML$Parameter;
axiom classifierTable[_UML, _ParameterSet] == UML$ParameterSet;
axiom classifierTable[_UML, _ParameterableElement] == UML$ParameterableElement;
axiom classifierTable[_UML, _PartDecomposition] == UML$PartDecomposition;
axiom classifierTable[_UML, _Pin] == UML$Pin;
axiom classifierTable[_UML, _Port] == UML$Port;
axiom classifierTable[_UML, _PrimitiveType] == UML$PrimitiveType;
axiom classifierTable[_UML, _Profile] == UML$Profile;
axiom classifierTable[_UML, _ProfileApplication] == UML$ProfileApplication;
axiom classifierTable[_UML, _Property] == UML$Property;
axiom classifierTable[_UML, _ProtocolConformance] == UML$ProtocolConformance;
axiom classifierTable[_UML, _ProtocolStateMachine] == UML$ProtocolStateMachine;
axiom classifierTable[_UML, _ProtocolTransition] == UML$ProtocolTransition;
axiom classifierTable[_UML, _Pseudostate] == UML$Pseudostate;
axiom classifierTable[_UML, _QualifierValue] == UML$QualifierValue;
axiom classifierTable[_UML, _RaiseExceptionAction] == UML$RaiseExceptionAction;
axiom classifierTable[_UML, _ReadExtentAction] == UML$ReadExtentAction;
axiom classifierTable[_UML, _ReadIsClassifiedObjectAction] == UML$ReadIsClassifiedObjectAction;
axiom classifierTable[_UML, _ReadLinkAction] == UML$ReadLinkAction;
axiom classifierTable[_UML, _ReadLinkObjectEndAction] == UML$ReadLinkObjectEndAction;
axiom classifierTable[_UML, _ReadLinkObjectEndQualifierAction] == UML$ReadLinkObjectEndQualifierAction;
axiom classifierTable[_UML, _ReadSelfAction] == UML$ReadSelfAction;
axiom classifierTable[_UML, _ReadStructuralFeatureAction] == UML$ReadStructuralFeatureAction;
axiom classifierTable[_UML, _ReadVariableAction] == UML$ReadVariableAction;
axiom classifierTable[_UML, _Realization] == UML$Realization;
axiom classifierTable[_UML, _Reception] == UML$Reception;
axiom classifierTable[_UML, _ReclassifyObjectAction] == UML$ReclassifyObjectAction;
axiom classifierTable[_UML, _RedefinableElement] == UML$RedefinableElement;
axiom classifierTable[_UML, _RedefinableTemplateSignature] == UML$RedefinableTemplateSignature;
axiom classifierTable[_UML, _ReduceAction] == UML$ReduceAction;
axiom classifierTable[_UML, _Region] == UML$Region;
axiom classifierTable[_UML, _Relationship] == UML$Relationship;
axiom classifierTable[_UML, _RemoveStructuralFeatureValueAction] == UML$RemoveStructuralFeatureValueAction;
axiom classifierTable[_UML, _RemoveVariableValueAction] == UML$RemoveVariableValueAction;
axiom classifierTable[_UML, _ReplyAction] == UML$ReplyAction;
axiom classifierTable[_UML, _SendObjectAction] == UML$SendObjectAction;
axiom classifierTable[_UML, _SendSignalAction] == UML$SendSignalAction;
axiom classifierTable[_UML, _SequenceNode] == UML$SequenceNode;
axiom classifierTable[_UML, _Signal] == UML$Signal;
axiom classifierTable[_UML, _SignalEvent] == UML$SignalEvent;
axiom classifierTable[_UML, _Slot] == UML$Slot;
axiom classifierTable[_UML, _StartClassifierBehaviorAction] == UML$StartClassifierBehaviorAction;
axiom classifierTable[_UML, _StartObjectBehaviorAction] == UML$StartObjectBehaviorAction;
axiom classifierTable[_UML, _State] == UML$State;
axiom classifierTable[_UML, _StateInvariant] == UML$StateInvariant;
axiom classifierTable[_UML, _StateMachine] == UML$StateMachine;
axiom classifierTable[_UML, _Stereotype] == UML$Stereotype;
axiom classifierTable[_UML, _StringExpression] == UML$StringExpression;
axiom classifierTable[_UML, _StructuralFeature] == UML$StructuralFeature;
axiom classifierTable[_UML, _StructuralFeatureAction] == UML$StructuralFeatureAction;
axiom classifierTable[_UML, _StructuredActivityNode] == UML$StructuredActivityNode;
axiom classifierTable[_UML, _StructuredClassifier] == UML$StructuredClassifier;
axiom classifierTable[_UML, _Substitution] == UML$Substitution;
axiom classifierTable[_UML, _TemplateBinding] == UML$TemplateBinding;
axiom classifierTable[_UML, _TemplateParameter] == UML$TemplateParameter;
axiom classifierTable[_UML, _TemplateParameterSubstitution] == UML$TemplateParameterSubstitution;
axiom classifierTable[_UML, _TemplateSignature] == UML$TemplateSignature;
axiom classifierTable[_UML, _TemplateableElement] == UML$TemplateableElement;
axiom classifierTable[_UML, _TestIdentityAction] == UML$TestIdentityAction;
axiom classifierTable[_UML, _TimeConstraint] == UML$TimeConstraint;
axiom classifierTable[_UML, _TimeEvent] == UML$TimeEvent;
axiom classifierTable[_UML, _TimeExpression] == UML$TimeExpression;
axiom classifierTable[_UML, _TimeInterval] == UML$TimeInterval;
axiom classifierTable[_UML, _TimeObservation] == UML$TimeObservation;
axiom classifierTable[_UML, _Transition] == UML$Transition;
axiom classifierTable[_UML, _Trigger] == UML$Trigger;
axiom classifierTable[_UML, _Type] == UML$Type;
axiom classifierTable[_UML, _TypedElement] == UML$TypedElement;
axiom classifierTable[_UML, _UnmarshallAction] == UML$UnmarshallAction;
axiom classifierTable[_UML, _Usage] == UML$Usage;
axiom classifierTable[_UML, _UseCase] == UML$UseCase;
axiom classifierTable[_UML, _ValuePin] == UML$ValuePin;
axiom classifierTable[_UML, _ValueSpecification] == UML$ValueSpecification;
axiom classifierTable[_UML, _ValueSpecificationAction] == UML$ValueSpecificationAction;
axiom classifierTable[_UML, _Variable] == UML$Variable;
axiom classifierTable[_UML, _VariableAction] == UML$VariableAction;
axiom classifierTable[_UML, _Vertex] == UML$Vertex;
axiom classifierTable[_UML, _WriteLinkAction] == UML$WriteLinkAction;
axiom classifierTable[_UML, _WriteStructuralFeatureAction] == UML$WriteStructuralFeatureAction;
axiom classifierTable[_UML, _WriteVariableAction] == UML$WriteVariableAction;

// if src mm print valid src
function valid_src_model($h: HeapType): bool{
	true&&true&&true&&true&&true&&true&&true&&true&&true&&true&&true&&true&&true&&true&&true&&true&&true&&true&&true&&true&&true&&true&&(forall __abstraction : ref ::
	  (__abstraction!=null && read($h, __abstraction, alloc) && dtype(__abstraction) <: UML$Abstraction ==> 
	    (read($h, __abstraction, UML$Abstraction.mapping)!=null && read($h, read($h, __abstraction, UML$Abstraction.mapping) ,alloc) ==>
	       dtype(read($h, __abstraction, UML$Abstraction.mapping)) <: UML$OpaqueExpression ) 
	  )
	)
	&&(forall __acceptcallaction : ref ::
	  (__acceptcallaction!=null && read($h, __acceptcallaction, alloc) && dtype(__acceptcallaction) <: UML$AcceptCallAction ==> 
	    (read($h, __acceptcallaction, UML$AcceptCallAction.returnInformation)!=null && read($h, read($h, __acceptcallaction, UML$AcceptCallAction.returnInformation) ,alloc) ==>
	       dtype(read($h, __acceptcallaction, UML$AcceptCallAction.returnInformation)) <: UML$OutputPin ) 
	  )
	)
	&&(forall __accepteventaction : ref ::
	  (__accepteventaction!=null && read($h, __accepteventaction, alloc) && dtype(__accepteventaction) <: UML$AcceptEventAction ==> 
	 true &&
	    (read($h, __accepteventaction, UML$AcceptEventAction.result)==null || (read($h, read($h, __accepteventaction, UML$AcceptEventAction.result), alloc) && dtype(read($h, __accepteventaction, UML$AcceptEventAction.result)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __accepteventaction, UML$AcceptEventAction.result)) ==> 
	         ($Unbox(read($h, read($h, __accepteventaction, UML$AcceptEventAction.result), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __accepteventaction, UML$AcceptEventAction.result), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __accepteventaction, UML$AcceptEventAction.result), IndexField(__i))): ref)<:UML$OutputPin) ) ) )&&
	    (read($h, __accepteventaction, UML$AcceptEventAction.trigger)==null || (read($h, read($h, __accepteventaction, UML$AcceptEventAction.trigger), alloc) && dtype(read($h, __accepteventaction, UML$AcceptEventAction.trigger)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __accepteventaction, UML$AcceptEventAction.trigger)) ==> 
	         ($Unbox(read($h, read($h, __accepteventaction, UML$AcceptEventAction.trigger), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __accepteventaction, UML$AcceptEventAction.trigger), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __accepteventaction, UML$AcceptEventAction.trigger), IndexField(__i))): ref)<:UML$Trigger) ) ) )
	  )
	)
	&&(forall __action : ref ::
	  (__action!=null && read($h, __action, alloc) && dtype(__action) <: UML$Action ==> 
	    (read($h, __action, UML$Action.context)!=null && read($h, read($h, __action, UML$Action.context) ,alloc) ==>
	       dtype(read($h, __action, UML$Action.context)) <: UML$Classifier ) &&
	    (read($h, __action, UML$Action.input)==null || (read($h, read($h, __action, UML$Action.input), alloc) && dtype(read($h, __action, UML$Action.input)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __action, UML$Action.input)) ==> 
	         ($Unbox(read($h, read($h, __action, UML$Action.input), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __action, UML$Action.input), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __action, UML$Action.input), IndexField(__i))): ref)<:UML$InputPin) ) ) )&&
	 true &&
	    (read($h, __action, UML$Action.localPostcondition)==null || (read($h, read($h, __action, UML$Action.localPostcondition), alloc) && dtype(read($h, __action, UML$Action.localPostcondition)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __action, UML$Action.localPostcondition)) ==> 
	         ($Unbox(read($h, read($h, __action, UML$Action.localPostcondition), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __action, UML$Action.localPostcondition), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __action, UML$Action.localPostcondition), IndexField(__i))): ref)<:UML$Constraint) ) ) )&&
	    (read($h, __action, UML$Action.localPrecondition)==null || (read($h, read($h, __action, UML$Action.localPrecondition), alloc) && dtype(read($h, __action, UML$Action.localPrecondition)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __action, UML$Action.localPrecondition)) ==> 
	         ($Unbox(read($h, read($h, __action, UML$Action.localPrecondition), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __action, UML$Action.localPrecondition), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __action, UML$Action.localPrecondition), IndexField(__i))): ref)<:UML$Constraint) ) ) )&&
	    (read($h, __action, UML$Action.output)==null || (read($h, read($h, __action, UML$Action.output), alloc) && dtype(read($h, __action, UML$Action.output)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __action, UML$Action.output)) ==> 
	         ($Unbox(read($h, read($h, __action, UML$Action.output), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __action, UML$Action.output), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __action, UML$Action.output), IndexField(__i))): ref)<:UML$OutputPin) ) ) )
	  )
	)
	&&(forall __actionexecutionspecification : ref ::
	  (__actionexecutionspecification!=null && read($h, __actionexecutionspecification, alloc) && dtype(__actionexecutionspecification) <: UML$ActionExecutionSpecification ==> 
	    (read($h, __actionexecutionspecification, UML$ActionExecutionSpecification.action)!=null && read($h, read($h, __actionexecutionspecification, UML$ActionExecutionSpecification.action) ,alloc) ==>
	       dtype(read($h, __actionexecutionspecification, UML$ActionExecutionSpecification.action)) <: UML$Action ) 
	  )
	)
	&&(forall __actioninputpin : ref ::
	  (__actioninputpin!=null && read($h, __actioninputpin, alloc) && dtype(__actioninputpin) <: UML$ActionInputPin ==> 
	    (read($h, __actioninputpin, UML$ActionInputPin.fromAction)!=null && read($h, read($h, __actioninputpin, UML$ActionInputPin.fromAction) ,alloc) ==>
	       dtype(read($h, __actioninputpin, UML$ActionInputPin.fromAction)) <: UML$Action ) 
	  )
	)
	&&(forall __activity : ref ::
	  (__activity!=null && read($h, __activity, alloc) && dtype(__activity) <: UML$Activity ==> 
	    (read($h, __activity, UML$Activity.edge)==null || (read($h, read($h, __activity, UML$Activity.edge), alloc) && dtype(read($h, __activity, UML$Activity.edge)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activity, UML$Activity.edge)) ==> 
	         ($Unbox(read($h, read($h, __activity, UML$Activity.edge), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activity, UML$Activity.edge), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activity, UML$Activity.edge), IndexField(__i))): ref)<:UML$ActivityEdge) ) ) )&&
	    (read($h, __activity, UML$Activity.group)==null || (read($h, read($h, __activity, UML$Activity.group), alloc) && dtype(read($h, __activity, UML$Activity.group)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activity, UML$Activity.group)) ==> 
	         ($Unbox(read($h, read($h, __activity, UML$Activity.group), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activity, UML$Activity.group), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activity, UML$Activity.group), IndexField(__i))): ref)<:UML$ActivityGroup) ) ) )&&
	 true &&
	 true &&
	    (read($h, __activity, UML$Activity.node)==null || (read($h, read($h, __activity, UML$Activity.node), alloc) && dtype(read($h, __activity, UML$Activity.node)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activity, UML$Activity.node)) ==> 
	         ($Unbox(read($h, read($h, __activity, UML$Activity.node), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activity, UML$Activity.node), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activity, UML$Activity.node), IndexField(__i))): ref)<:UML$ActivityNode) ) ) )&&
	    (read($h, __activity, UML$Activity.partition)==null || (read($h, read($h, __activity, UML$Activity.partition), alloc) && dtype(read($h, __activity, UML$Activity.partition)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activity, UML$Activity.partition)) ==> 
	         ($Unbox(read($h, read($h, __activity, UML$Activity.partition), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activity, UML$Activity.partition), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activity, UML$Activity.partition), IndexField(__i))): ref)<:UML$ActivityPartition) ) ) )&&
	    (read($h, __activity, UML$Activity.structuredNode)==null || (read($h, read($h, __activity, UML$Activity.structuredNode), alloc) && dtype(read($h, __activity, UML$Activity.structuredNode)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activity, UML$Activity.structuredNode)) ==> 
	         ($Unbox(read($h, read($h, __activity, UML$Activity.structuredNode), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activity, UML$Activity.structuredNode), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activity, UML$Activity.structuredNode), IndexField(__i))): ref)<:UML$StructuredActivityNode) ) ) )&&
	    (read($h, __activity, UML$Activity.variable)==null || (read($h, read($h, __activity, UML$Activity.variable), alloc) && dtype(read($h, __activity, UML$Activity.variable)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activity, UML$Activity.variable)) ==> 
	         ($Unbox(read($h, read($h, __activity, UML$Activity.variable), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activity, UML$Activity.variable), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activity, UML$Activity.variable), IndexField(__i))): ref)<:UML$Variable) ) ) )
	  )
	)
	&&(forall __activityedge : ref ::
	  (__activityedge!=null && read($h, __activityedge, alloc) && dtype(__activityedge) <: UML$ActivityEdge ==> 
	    (read($h, __activityedge, UML$ActivityEdge.activity)!=null && read($h, read($h, __activityedge, UML$ActivityEdge.activity) ,alloc) ==>
	       dtype(read($h, __activityedge, UML$ActivityEdge.activity)) <: UML$Activity ) &&
	    (read($h, __activityedge, UML$ActivityEdge.guard)!=null && read($h, read($h, __activityedge, UML$ActivityEdge.guard) ,alloc) ==>
	       dtype(read($h, __activityedge, UML$ActivityEdge.guard)) <: UML$ValueSpecification ) &&
	    (read($h, __activityedge, UML$ActivityEdge.inGroup)==null || (read($h, read($h, __activityedge, UML$ActivityEdge.inGroup), alloc) && dtype(read($h, __activityedge, UML$ActivityEdge.inGroup)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activityedge, UML$ActivityEdge.inGroup)) ==> 
	         ($Unbox(read($h, read($h, __activityedge, UML$ActivityEdge.inGroup), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activityedge, UML$ActivityEdge.inGroup), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activityedge, UML$ActivityEdge.inGroup), IndexField(__i))): ref)<:UML$ActivityGroup) ) ) )&&
	    (read($h, __activityedge, UML$ActivityEdge.inPartition)==null || (read($h, read($h, __activityedge, UML$ActivityEdge.inPartition), alloc) && dtype(read($h, __activityedge, UML$ActivityEdge.inPartition)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activityedge, UML$ActivityEdge.inPartition)) ==> 
	         ($Unbox(read($h, read($h, __activityedge, UML$ActivityEdge.inPartition), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activityedge, UML$ActivityEdge.inPartition), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activityedge, UML$ActivityEdge.inPartition), IndexField(__i))): ref)<:UML$ActivityPartition) ) ) )&&
	    (read($h, __activityedge, UML$ActivityEdge.inStructuredNode)!=null && read($h, read($h, __activityedge, UML$ActivityEdge.inStructuredNode) ,alloc) ==>
	       dtype(read($h, __activityedge, UML$ActivityEdge.inStructuredNode)) <: UML$StructuredActivityNode ) &&
	    (read($h, __activityedge, UML$ActivityEdge.interrupts)!=null && read($h, read($h, __activityedge, UML$ActivityEdge.interrupts) ,alloc) ==>
	       dtype(read($h, __activityedge, UML$ActivityEdge.interrupts)) <: UML$InterruptibleActivityRegion ) &&
	    (read($h, __activityedge, UML$ActivityEdge.redefinedEdge)==null || (read($h, read($h, __activityedge, UML$ActivityEdge.redefinedEdge), alloc) && dtype(read($h, __activityedge, UML$ActivityEdge.redefinedEdge)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activityedge, UML$ActivityEdge.redefinedEdge)) ==> 
	         ($Unbox(read($h, read($h, __activityedge, UML$ActivityEdge.redefinedEdge), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activityedge, UML$ActivityEdge.redefinedEdge), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activityedge, UML$ActivityEdge.redefinedEdge), IndexField(__i))): ref)<:UML$ActivityEdge) ) ) )&&
	    (read($h, __activityedge, UML$ActivityEdge.source)!=null && read($h, read($h, __activityedge, UML$ActivityEdge.source) ,alloc) ==>
	       dtype(read($h, __activityedge, UML$ActivityEdge.source)) <: UML$ActivityNode ) &&
	    (read($h, __activityedge, UML$ActivityEdge.target)!=null && read($h, read($h, __activityedge, UML$ActivityEdge.target) ,alloc) ==>
	       dtype(read($h, __activityedge, UML$ActivityEdge.target)) <: UML$ActivityNode ) &&
	    (read($h, __activityedge, UML$ActivityEdge.weight)!=null && read($h, read($h, __activityedge, UML$ActivityEdge.weight) ,alloc) ==>
	       dtype(read($h, __activityedge, UML$ActivityEdge.weight)) <: UML$ValueSpecification ) 
	  )
	)
	&&(forall __activityfinalnode : ref ::
	  (__activityfinalnode!=null && read($h, __activityfinalnode, alloc) && dtype(__activityfinalnode) <: UML$ActivityFinalNode ==> true
	  )
	)
	&&(forall __activitygroup : ref ::
	  (__activitygroup!=null && read($h, __activitygroup, alloc) && dtype(__activitygroup) <: UML$ActivityGroup ==> 
	    (read($h, __activitygroup, UML$ActivityGroup.containedEdge)==null || (read($h, read($h, __activitygroup, UML$ActivityGroup.containedEdge), alloc) && dtype(read($h, __activitygroup, UML$ActivityGroup.containedEdge)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activitygroup, UML$ActivityGroup.containedEdge)) ==> 
	         ($Unbox(read($h, read($h, __activitygroup, UML$ActivityGroup.containedEdge), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activitygroup, UML$ActivityGroup.containedEdge), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activitygroup, UML$ActivityGroup.containedEdge), IndexField(__i))): ref)<:UML$ActivityEdge) ) ) )&&
	    (read($h, __activitygroup, UML$ActivityGroup.containedNode)==null || (read($h, read($h, __activitygroup, UML$ActivityGroup.containedNode), alloc) && dtype(read($h, __activitygroup, UML$ActivityGroup.containedNode)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activitygroup, UML$ActivityGroup.containedNode)) ==> 
	         ($Unbox(read($h, read($h, __activitygroup, UML$ActivityGroup.containedNode), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activitygroup, UML$ActivityGroup.containedNode), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activitygroup, UML$ActivityGroup.containedNode), IndexField(__i))): ref)<:UML$ActivityNode) ) ) )&&
	    (read($h, __activitygroup, UML$ActivityGroup.inActivity)!=null && read($h, read($h, __activitygroup, UML$ActivityGroup.inActivity) ,alloc) ==>
	       dtype(read($h, __activitygroup, UML$ActivityGroup.inActivity)) <: UML$Activity ) &&
	    (read($h, __activitygroup, UML$ActivityGroup.subgroup)==null || (read($h, read($h, __activitygroup, UML$ActivityGroup.subgroup), alloc) && dtype(read($h, __activitygroup, UML$ActivityGroup.subgroup)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activitygroup, UML$ActivityGroup.subgroup)) ==> 
	         ($Unbox(read($h, read($h, __activitygroup, UML$ActivityGroup.subgroup), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activitygroup, UML$ActivityGroup.subgroup), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activitygroup, UML$ActivityGroup.subgroup), IndexField(__i))): ref)<:UML$ActivityGroup) ) ) )&&
	    (read($h, __activitygroup, UML$ActivityGroup.superGroup)!=null && read($h, read($h, __activitygroup, UML$ActivityGroup.superGroup) ,alloc) ==>
	       dtype(read($h, __activitygroup, UML$ActivityGroup.superGroup)) <: UML$ActivityGroup ) 
	  )
	)
	&&(forall __activitynode : ref ::
	  (__activitynode!=null && read($h, __activitynode, alloc) && dtype(__activitynode) <: UML$ActivityNode ==> 
	    (read($h, __activitynode, UML$ActivityNode.activity)!=null && read($h, read($h, __activitynode, UML$ActivityNode.activity) ,alloc) ==>
	       dtype(read($h, __activitynode, UML$ActivityNode.activity)) <: UML$Activity ) &&
	    (read($h, __activitynode, UML$ActivityNode.inGroup)==null || (read($h, read($h, __activitynode, UML$ActivityNode.inGroup), alloc) && dtype(read($h, __activitynode, UML$ActivityNode.inGroup)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activitynode, UML$ActivityNode.inGroup)) ==> 
	         ($Unbox(read($h, read($h, __activitynode, UML$ActivityNode.inGroup), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activitynode, UML$ActivityNode.inGroup), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activitynode, UML$ActivityNode.inGroup), IndexField(__i))): ref)<:UML$ActivityGroup) ) ) )&&
	    (read($h, __activitynode, UML$ActivityNode.inInterruptibleRegion)==null || (read($h, read($h, __activitynode, UML$ActivityNode.inInterruptibleRegion), alloc) && dtype(read($h, __activitynode, UML$ActivityNode.inInterruptibleRegion)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activitynode, UML$ActivityNode.inInterruptibleRegion)) ==> 
	         ($Unbox(read($h, read($h, __activitynode, UML$ActivityNode.inInterruptibleRegion), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activitynode, UML$ActivityNode.inInterruptibleRegion), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activitynode, UML$ActivityNode.inInterruptibleRegion), IndexField(__i))): ref)<:UML$InterruptibleActivityRegion) ) ) )&&
	    (read($h, __activitynode, UML$ActivityNode.inPartition)==null || (read($h, read($h, __activitynode, UML$ActivityNode.inPartition), alloc) && dtype(read($h, __activitynode, UML$ActivityNode.inPartition)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activitynode, UML$ActivityNode.inPartition)) ==> 
	         ($Unbox(read($h, read($h, __activitynode, UML$ActivityNode.inPartition), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activitynode, UML$ActivityNode.inPartition), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activitynode, UML$ActivityNode.inPartition), IndexField(__i))): ref)<:UML$ActivityPartition) ) ) )&&
	    (read($h, __activitynode, UML$ActivityNode.inStructuredNode)!=null && read($h, read($h, __activitynode, UML$ActivityNode.inStructuredNode) ,alloc) ==>
	       dtype(read($h, __activitynode, UML$ActivityNode.inStructuredNode)) <: UML$StructuredActivityNode ) &&
	    (read($h, __activitynode, UML$ActivityNode.incoming)==null || (read($h, read($h, __activitynode, UML$ActivityNode.incoming), alloc) && dtype(read($h, __activitynode, UML$ActivityNode.incoming)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activitynode, UML$ActivityNode.incoming)) ==> 
	         ($Unbox(read($h, read($h, __activitynode, UML$ActivityNode.incoming), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activitynode, UML$ActivityNode.incoming), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activitynode, UML$ActivityNode.incoming), IndexField(__i))): ref)<:UML$ActivityEdge) ) ) )&&
	    (read($h, __activitynode, UML$ActivityNode.outgoing)==null || (read($h, read($h, __activitynode, UML$ActivityNode.outgoing), alloc) && dtype(read($h, __activitynode, UML$ActivityNode.outgoing)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activitynode, UML$ActivityNode.outgoing)) ==> 
	         ($Unbox(read($h, read($h, __activitynode, UML$ActivityNode.outgoing), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activitynode, UML$ActivityNode.outgoing), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activitynode, UML$ActivityNode.outgoing), IndexField(__i))): ref)<:UML$ActivityEdge) ) ) )&&
	    (read($h, __activitynode, UML$ActivityNode.redefinedNode)==null || (read($h, read($h, __activitynode, UML$ActivityNode.redefinedNode), alloc) && dtype(read($h, __activitynode, UML$ActivityNode.redefinedNode)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activitynode, UML$ActivityNode.redefinedNode)) ==> 
	         ($Unbox(read($h, read($h, __activitynode, UML$ActivityNode.redefinedNode), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activitynode, UML$ActivityNode.redefinedNode), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activitynode, UML$ActivityNode.redefinedNode), IndexField(__i))): ref)<:UML$ActivityNode) ) ) )
	  )
	)
	&&(forall __activityparameternode : ref ::
	  (__activityparameternode!=null && read($h, __activityparameternode, alloc) && dtype(__activityparameternode) <: UML$ActivityParameterNode ==> 
	    (read($h, __activityparameternode, UML$ActivityParameterNode.parameter)!=null && read($h, read($h, __activityparameternode, UML$ActivityParameterNode.parameter) ,alloc) ==>
	       dtype(read($h, __activityparameternode, UML$ActivityParameterNode.parameter)) <: UML$Parameter ) 
	  )
	)
	&&(forall __activitypartition : ref ::
	  (__activitypartition!=null && read($h, __activitypartition, alloc) && dtype(__activitypartition) <: UML$ActivityPartition ==> 
	    (read($h, __activitypartition, UML$ActivityPartition.edge)==null || (read($h, read($h, __activitypartition, UML$ActivityPartition.edge), alloc) && dtype(read($h, __activitypartition, UML$ActivityPartition.edge)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activitypartition, UML$ActivityPartition.edge)) ==> 
	         ($Unbox(read($h, read($h, __activitypartition, UML$ActivityPartition.edge), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activitypartition, UML$ActivityPartition.edge), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activitypartition, UML$ActivityPartition.edge), IndexField(__i))): ref)<:UML$ActivityEdge) ) ) )&&
	 true &&
	 true &&
	    (read($h, __activitypartition, UML$ActivityPartition.node)==null || (read($h, read($h, __activitypartition, UML$ActivityPartition.node), alloc) && dtype(read($h, __activitypartition, UML$ActivityPartition.node)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activitypartition, UML$ActivityPartition.node)) ==> 
	         ($Unbox(read($h, read($h, __activitypartition, UML$ActivityPartition.node), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activitypartition, UML$ActivityPartition.node), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activitypartition, UML$ActivityPartition.node), IndexField(__i))): ref)<:UML$ActivityNode) ) ) )&&
	    (read($h, __activitypartition, UML$ActivityPartition.represents)!=null && read($h, read($h, __activitypartition, UML$ActivityPartition.represents) ,alloc) ==>
	       dtype(read($h, __activitypartition, UML$ActivityPartition.represents)) <: UML$Element ) &&
	    (read($h, __activitypartition, UML$ActivityPartition.subpartition)==null || (read($h, read($h, __activitypartition, UML$ActivityPartition.subpartition), alloc) && dtype(read($h, __activitypartition, UML$ActivityPartition.subpartition)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __activitypartition, UML$ActivityPartition.subpartition)) ==> 
	         ($Unbox(read($h, read($h, __activitypartition, UML$ActivityPartition.subpartition), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __activitypartition, UML$ActivityPartition.subpartition), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __activitypartition, UML$ActivityPartition.subpartition), IndexField(__i))): ref)<:UML$ActivityPartition) ) ) )&&
	    (read($h, __activitypartition, UML$ActivityPartition.superPartition)!=null && read($h, read($h, __activitypartition, UML$ActivityPartition.superPartition) ,alloc) ==>
	       dtype(read($h, __activitypartition, UML$ActivityPartition.superPartition)) <: UML$ActivityPartition ) 
	  )
	)
	&&(forall __actor : ref ::
	  (__actor!=null && read($h, __actor, alloc) && dtype(__actor) <: UML$Actor ==> true
	  )
	)
	&&(forall __addstructuralfeaturevalueaction : ref ::
	  (__addstructuralfeaturevalueaction!=null && read($h, __addstructuralfeaturevalueaction, alloc) && dtype(__addstructuralfeaturevalueaction) <: UML$AddStructuralFeatureValueAction ==> 
	    (read($h, __addstructuralfeaturevalueaction, UML$AddStructuralFeatureValueAction.insertAt)!=null && read($h, read($h, __addstructuralfeaturevalueaction, UML$AddStructuralFeatureValueAction.insertAt) ,alloc) ==>
	       dtype(read($h, __addstructuralfeaturevalueaction, UML$AddStructuralFeatureValueAction.insertAt)) <: UML$InputPin ) &&
	 true 
	  )
	)
	&&(forall __addvariablevalueaction : ref ::
	  (__addvariablevalueaction!=null && read($h, __addvariablevalueaction, alloc) && dtype(__addvariablevalueaction) <: UML$AddVariableValueAction ==> 
	    (read($h, __addvariablevalueaction, UML$AddVariableValueAction.insertAt)!=null && read($h, read($h, __addvariablevalueaction, UML$AddVariableValueAction.insertAt) ,alloc) ==>
	       dtype(read($h, __addvariablevalueaction, UML$AddVariableValueAction.insertAt)) <: UML$InputPin ) &&
	 true 
	  )
	)
	&&(forall __anyreceiveevent : ref ::
	  (__anyreceiveevent!=null && read($h, __anyreceiveevent, alloc) && dtype(__anyreceiveevent) <: UML$AnyReceiveEvent ==> true
	  )
	)
	&&(forall __artifact : ref ::
	  (__artifact!=null && read($h, __artifact, alloc) && dtype(__artifact) <: UML$Artifact ==> 
	 true &&
	    (read($h, __artifact, UML$Artifact.manifestation)==null || (read($h, read($h, __artifact, UML$Artifact.manifestation), alloc) && dtype(read($h, __artifact, UML$Artifact.manifestation)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __artifact, UML$Artifact.manifestation)) ==> 
	         ($Unbox(read($h, read($h, __artifact, UML$Artifact.manifestation), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __artifact, UML$Artifact.manifestation), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __artifact, UML$Artifact.manifestation), IndexField(__i))): ref)<:UML$Manifestation) ) ) )&&
	    (read($h, __artifact, UML$Artifact.nestedArtifact)==null || (read($h, read($h, __artifact, UML$Artifact.nestedArtifact), alloc) && dtype(read($h, __artifact, UML$Artifact.nestedArtifact)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __artifact, UML$Artifact.nestedArtifact)) ==> 
	         ($Unbox(read($h, read($h, __artifact, UML$Artifact.nestedArtifact), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __artifact, UML$Artifact.nestedArtifact), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __artifact, UML$Artifact.nestedArtifact), IndexField(__i))): ref)<:UML$Artifact) ) ) )&&
	    (read($h, __artifact, UML$Artifact.ownedAttribute)==null || (read($h, read($h, __artifact, UML$Artifact.ownedAttribute), alloc) && dtype(read($h, __artifact, UML$Artifact.ownedAttribute)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __artifact, UML$Artifact.ownedAttribute)) ==> 
	         ($Unbox(read($h, read($h, __artifact, UML$Artifact.ownedAttribute), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __artifact, UML$Artifact.ownedAttribute), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __artifact, UML$Artifact.ownedAttribute), IndexField(__i))): ref)<:UML$Property) ) ) )&&
	    (read($h, __artifact, UML$Artifact.ownedOperation)==null || (read($h, read($h, __artifact, UML$Artifact.ownedOperation), alloc) && dtype(read($h, __artifact, UML$Artifact.ownedOperation)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __artifact, UML$Artifact.ownedOperation)) ==> 
	         ($Unbox(read($h, read($h, __artifact, UML$Artifact.ownedOperation), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __artifact, UML$Artifact.ownedOperation), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __artifact, UML$Artifact.ownedOperation), IndexField(__i))): ref)<:UML$Operation) ) ) )
	  )
	)
	&&(forall __association : ref ::
	  (__association!=null && read($h, __association, alloc) && dtype(__association) <: UML$Association ==> 
	    (read($h, __association, UML$Association.endType)==null || (read($h, read($h, __association, UML$Association.endType), alloc) && dtype(read($h, __association, UML$Association.endType)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __association, UML$Association.endType)) ==> 
	         ($Unbox(read($h, read($h, __association, UML$Association.endType), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __association, UML$Association.endType), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __association, UML$Association.endType), IndexField(__i))): ref)<:UML$Type) ) ) )&&
	 true &&
	    (read($h, __association, UML$Association.memberEnd)==null || (read($h, read($h, __association, UML$Association.memberEnd), alloc) && dtype(read($h, __association, UML$Association.memberEnd)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __association, UML$Association.memberEnd)) ==> 
	         ($Unbox(read($h, read($h, __association, UML$Association.memberEnd), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __association, UML$Association.memberEnd), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __association, UML$Association.memberEnd), IndexField(__i))): ref)<:UML$Property) ) ) )&&
	    (read($h, __association, UML$Association.navigableOwnedEnd)==null || (read($h, read($h, __association, UML$Association.navigableOwnedEnd), alloc) && dtype(read($h, __association, UML$Association.navigableOwnedEnd)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __association, UML$Association.navigableOwnedEnd)) ==> 
	         ($Unbox(read($h, read($h, __association, UML$Association.navigableOwnedEnd), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __association, UML$Association.navigableOwnedEnd), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __association, UML$Association.navigableOwnedEnd), IndexField(__i))): ref)<:UML$Property) ) ) )&&
	    (read($h, __association, UML$Association.ownedEnd)==null || (read($h, read($h, __association, UML$Association.ownedEnd), alloc) && dtype(read($h, __association, UML$Association.ownedEnd)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __association, UML$Association.ownedEnd)) ==> 
	         ($Unbox(read($h, read($h, __association, UML$Association.ownedEnd), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __association, UML$Association.ownedEnd), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __association, UML$Association.ownedEnd), IndexField(__i))): ref)<:UML$Property) ) ) )
	  )
	)
	&&(forall __associationclass : ref ::
	  (__associationclass!=null && read($h, __associationclass, alloc) && dtype(__associationclass) <: UML$AssociationClass ==> true
	  )
	)
	&&(forall __behavior : ref ::
	  (__behavior!=null && read($h, __behavior, alloc) && dtype(__behavior) <: UML$Behavior ==> 
	    (read($h, __behavior, UML$Behavior.context)!=null && read($h, read($h, __behavior, UML$Behavior.context) ,alloc) ==>
	       dtype(read($h, __behavior, UML$Behavior.context)) <: UML$BehavioredClassifier ) &&
	 true &&
	    (read($h, __behavior, UML$Behavior.ownedParameter)==null || (read($h, read($h, __behavior, UML$Behavior.ownedParameter), alloc) && dtype(read($h, __behavior, UML$Behavior.ownedParameter)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __behavior, UML$Behavior.ownedParameter)) ==> 
	         ($Unbox(read($h, read($h, __behavior, UML$Behavior.ownedParameter), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __behavior, UML$Behavior.ownedParameter), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __behavior, UML$Behavior.ownedParameter), IndexField(__i))): ref)<:UML$Parameter) ) ) )&&
	    (read($h, __behavior, UML$Behavior.ownedParameterSet)==null || (read($h, read($h, __behavior, UML$Behavior.ownedParameterSet), alloc) && dtype(read($h, __behavior, UML$Behavior.ownedParameterSet)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __behavior, UML$Behavior.ownedParameterSet)) ==> 
	         ($Unbox(read($h, read($h, __behavior, UML$Behavior.ownedParameterSet), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __behavior, UML$Behavior.ownedParameterSet), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __behavior, UML$Behavior.ownedParameterSet), IndexField(__i))): ref)<:UML$ParameterSet) ) ) )&&
	    (read($h, __behavior, UML$Behavior.postcondition)==null || (read($h, read($h, __behavior, UML$Behavior.postcondition), alloc) && dtype(read($h, __behavior, UML$Behavior.postcondition)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __behavior, UML$Behavior.postcondition)) ==> 
	         ($Unbox(read($h, read($h, __behavior, UML$Behavior.postcondition), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __behavior, UML$Behavior.postcondition), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __behavior, UML$Behavior.postcondition), IndexField(__i))): ref)<:UML$Constraint) ) ) )&&
	    (read($h, __behavior, UML$Behavior.precondition)==null || (read($h, read($h, __behavior, UML$Behavior.precondition), alloc) && dtype(read($h, __behavior, UML$Behavior.precondition)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __behavior, UML$Behavior.precondition)) ==> 
	         ($Unbox(read($h, read($h, __behavior, UML$Behavior.precondition), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __behavior, UML$Behavior.precondition), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __behavior, UML$Behavior.precondition), IndexField(__i))): ref)<:UML$Constraint) ) ) )&&
	    (read($h, __behavior, UML$Behavior.redefinedBehavior)==null || (read($h, read($h, __behavior, UML$Behavior.redefinedBehavior), alloc) && dtype(read($h, __behavior, UML$Behavior.redefinedBehavior)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __behavior, UML$Behavior.redefinedBehavior)) ==> 
	         ($Unbox(read($h, read($h, __behavior, UML$Behavior.redefinedBehavior), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __behavior, UML$Behavior.redefinedBehavior), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __behavior, UML$Behavior.redefinedBehavior), IndexField(__i))): ref)<:UML$Behavior) ) ) )&&
	    (read($h, __behavior, UML$Behavior.specification)!=null && read($h, read($h, __behavior, UML$Behavior.specification) ,alloc) ==>
	       dtype(read($h, __behavior, UML$Behavior.specification)) <: UML$BehavioralFeature ) 
	  )
	)
	&&(forall __behaviorexecutionspecification : ref ::
	  (__behaviorexecutionspecification!=null && read($h, __behaviorexecutionspecification, alloc) && dtype(__behaviorexecutionspecification) <: UML$BehaviorExecutionSpecification ==> 
	    (read($h, __behaviorexecutionspecification, UML$BehaviorExecutionSpecification.behavior)!=null && read($h, read($h, __behaviorexecutionspecification, UML$BehaviorExecutionSpecification.behavior) ,alloc) ==>
	       dtype(read($h, __behaviorexecutionspecification, UML$BehaviorExecutionSpecification.behavior)) <: UML$Behavior ) 
	  )
	)
	&&(forall __behavioralfeature : ref ::
	  (__behavioralfeature!=null && read($h, __behavioralfeature, alloc) && dtype(__behavioralfeature) <: UML$BehavioralFeature ==> 
	 true &&
	 true &&
	    (read($h, __behavioralfeature, UML$BehavioralFeature.method)==null || (read($h, read($h, __behavioralfeature, UML$BehavioralFeature.method), alloc) && dtype(read($h, __behavioralfeature, UML$BehavioralFeature.method)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __behavioralfeature, UML$BehavioralFeature.method)) ==> 
	         ($Unbox(read($h, read($h, __behavioralfeature, UML$BehavioralFeature.method), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __behavioralfeature, UML$BehavioralFeature.method), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __behavioralfeature, UML$BehavioralFeature.method), IndexField(__i))): ref)<:UML$Behavior) ) ) )&&
	    (read($h, __behavioralfeature, UML$BehavioralFeature.ownedParameter)==null || (read($h, read($h, __behavioralfeature, UML$BehavioralFeature.ownedParameter), alloc) && dtype(read($h, __behavioralfeature, UML$BehavioralFeature.ownedParameter)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __behavioralfeature, UML$BehavioralFeature.ownedParameter)) ==> 
	         ($Unbox(read($h, read($h, __behavioralfeature, UML$BehavioralFeature.ownedParameter), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __behavioralfeature, UML$BehavioralFeature.ownedParameter), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __behavioralfeature, UML$BehavioralFeature.ownedParameter), IndexField(__i))): ref)<:UML$Parameter) ) ) )&&
	    (read($h, __behavioralfeature, UML$BehavioralFeature.ownedParameterSet)==null || (read($h, read($h, __behavioralfeature, UML$BehavioralFeature.ownedParameterSet), alloc) && dtype(read($h, __behavioralfeature, UML$BehavioralFeature.ownedParameterSet)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __behavioralfeature, UML$BehavioralFeature.ownedParameterSet)) ==> 
	         ($Unbox(read($h, read($h, __behavioralfeature, UML$BehavioralFeature.ownedParameterSet), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __behavioralfeature, UML$BehavioralFeature.ownedParameterSet), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __behavioralfeature, UML$BehavioralFeature.ownedParameterSet), IndexField(__i))): ref)<:UML$ParameterSet) ) ) )&&
	    (read($h, __behavioralfeature, UML$BehavioralFeature.raisedException)==null || (read($h, read($h, __behavioralfeature, UML$BehavioralFeature.raisedException), alloc) && dtype(read($h, __behavioralfeature, UML$BehavioralFeature.raisedException)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __behavioralfeature, UML$BehavioralFeature.raisedException)) ==> 
	         ($Unbox(read($h, read($h, __behavioralfeature, UML$BehavioralFeature.raisedException), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __behavioralfeature, UML$BehavioralFeature.raisedException), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __behavioralfeature, UML$BehavioralFeature.raisedException), IndexField(__i))): ref)<:UML$Type) ) ) )
	  )
	)
	&&(forall __behavioredclassifier : ref ::
	  (__behavioredclassifier!=null && read($h, __behavioredclassifier, alloc) && dtype(__behavioredclassifier) <: UML$BehavioredClassifier ==> 
	    (read($h, __behavioredclassifier, UML$BehavioredClassifier.classifierBehavior)!=null && read($h, read($h, __behavioredclassifier, UML$BehavioredClassifier.classifierBehavior) ,alloc) ==>
	       dtype(read($h, __behavioredclassifier, UML$BehavioredClassifier.classifierBehavior)) <: UML$Behavior ) &&
	    (read($h, __behavioredclassifier, UML$BehavioredClassifier.interfaceRealization)==null || (read($h, read($h, __behavioredclassifier, UML$BehavioredClassifier.interfaceRealization), alloc) && dtype(read($h, __behavioredclassifier, UML$BehavioredClassifier.interfaceRealization)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __behavioredclassifier, UML$BehavioredClassifier.interfaceRealization)) ==> 
	         ($Unbox(read($h, read($h, __behavioredclassifier, UML$BehavioredClassifier.interfaceRealization), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __behavioredclassifier, UML$BehavioredClassifier.interfaceRealization), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __behavioredclassifier, UML$BehavioredClassifier.interfaceRealization), IndexField(__i))): ref)<:UML$InterfaceRealization) ) ) )&&
	    (read($h, __behavioredclassifier, UML$BehavioredClassifier.ownedBehavior)==null || (read($h, read($h, __behavioredclassifier, UML$BehavioredClassifier.ownedBehavior), alloc) && dtype(read($h, __behavioredclassifier, UML$BehavioredClassifier.ownedBehavior)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __behavioredclassifier, UML$BehavioredClassifier.ownedBehavior)) ==> 
	         ($Unbox(read($h, read($h, __behavioredclassifier, UML$BehavioredClassifier.ownedBehavior), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __behavioredclassifier, UML$BehavioredClassifier.ownedBehavior), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __behavioredclassifier, UML$BehavioredClassifier.ownedBehavior), IndexField(__i))): ref)<:UML$Behavior) ) ) )
	  )
	)
	&&(forall __broadcastsignalaction : ref ::
	  (__broadcastsignalaction!=null && read($h, __broadcastsignalaction, alloc) && dtype(__broadcastsignalaction) <: UML$BroadcastSignalAction ==> 
	    (read($h, __broadcastsignalaction, UML$BroadcastSignalAction.signal)!=null && read($h, read($h, __broadcastsignalaction, UML$BroadcastSignalAction.signal) ,alloc) ==>
	       dtype(read($h, __broadcastsignalaction, UML$BroadcastSignalAction.signal)) <: UML$Signal ) 
	  )
	)
	&&(forall __callaction : ref ::
	  (__callaction!=null && read($h, __callaction, alloc) && dtype(__callaction) <: UML$CallAction ==> 
	 true &&
	    (read($h, __callaction, UML$CallAction.result)==null || (read($h, read($h, __callaction, UML$CallAction.result), alloc) && dtype(read($h, __callaction, UML$CallAction.result)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __callaction, UML$CallAction.result)) ==> 
	         ($Unbox(read($h, read($h, __callaction, UML$CallAction.result), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __callaction, UML$CallAction.result), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __callaction, UML$CallAction.result), IndexField(__i))): ref)<:UML$OutputPin) ) ) )
	  )
	)
	&&(forall __callbehavioraction : ref ::
	  (__callbehavioraction!=null && read($h, __callbehavioraction, alloc) && dtype(__callbehavioraction) <: UML$CallBehaviorAction ==> 
	    (read($h, __callbehavioraction, UML$CallBehaviorAction.behavior)!=null && read($h, read($h, __callbehavioraction, UML$CallBehaviorAction.behavior) ,alloc) ==>
	       dtype(read($h, __callbehavioraction, UML$CallBehaviorAction.behavior)) <: UML$Behavior ) 
	  )
	)
	&&(forall __callevent : ref ::
	  (__callevent!=null && read($h, __callevent, alloc) && dtype(__callevent) <: UML$CallEvent ==> 
	    (read($h, __callevent, UML$CallEvent.operation)!=null && read($h, read($h, __callevent, UML$CallEvent.operation) ,alloc) ==>
	       dtype(read($h, __callevent, UML$CallEvent.operation)) <: UML$Operation ) 
	  )
	)
	&&(forall __calloperationaction : ref ::
	  (__calloperationaction!=null && read($h, __calloperationaction, alloc) && dtype(__calloperationaction) <: UML$CallOperationAction ==> 
	    (read($h, __calloperationaction, UML$CallOperationAction.operation)!=null && read($h, read($h, __calloperationaction, UML$CallOperationAction.operation) ,alloc) ==>
	       dtype(read($h, __calloperationaction, UML$CallOperationAction.operation)) <: UML$Operation ) &&
	    (read($h, __calloperationaction, UML$CallOperationAction.target)!=null && read($h, read($h, __calloperationaction, UML$CallOperationAction.target) ,alloc) ==>
	       dtype(read($h, __calloperationaction, UML$CallOperationAction.target)) <: UML$InputPin ) 
	  )
	)
	&&(forall __centralbuffernode : ref ::
	  (__centralbuffernode!=null && read($h, __centralbuffernode, alloc) && dtype(__centralbuffernode) <: UML$CentralBufferNode ==> true
	  )
	)
	&&(forall __changeevent : ref ::
	  (__changeevent!=null && read($h, __changeevent, alloc) && dtype(__changeevent) <: UML$ChangeEvent ==> 
	    (read($h, __changeevent, UML$ChangeEvent.changeExpression)!=null && read($h, read($h, __changeevent, UML$ChangeEvent.changeExpression) ,alloc) ==>
	       dtype(read($h, __changeevent, UML$ChangeEvent.changeExpression)) <: UML$ValueSpecification ) 
	  )
	)
	&&(forall __class : ref ::
	  (__class!=null && read($h, __class, alloc) && dtype(__class) <: UML$Class ==> 
	    (read($h, __class, UML$Class.extension)==null || (read($h, read($h, __class, UML$Class.extension), alloc) && dtype(read($h, __class, UML$Class.extension)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __class, UML$Class.extension)) ==> 
	         ($Unbox(read($h, read($h, __class, UML$Class.extension), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __class, UML$Class.extension), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __class, UML$Class.extension), IndexField(__i))): ref)<:UML$Extension) ) ) )&&
	 true &&
	    (read($h, __class, UML$Class.nestedClassifier)==null || (read($h, read($h, __class, UML$Class.nestedClassifier), alloc) && dtype(read($h, __class, UML$Class.nestedClassifier)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __class, UML$Class.nestedClassifier)) ==> 
	         ($Unbox(read($h, read($h, __class, UML$Class.nestedClassifier), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __class, UML$Class.nestedClassifier), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __class, UML$Class.nestedClassifier), IndexField(__i))): ref)<:UML$Classifier) ) ) )&&
	    (read($h, __class, UML$Class.ownedOperation)==null || (read($h, read($h, __class, UML$Class.ownedOperation), alloc) && dtype(read($h, __class, UML$Class.ownedOperation)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __class, UML$Class.ownedOperation)) ==> 
	         ($Unbox(read($h, read($h, __class, UML$Class.ownedOperation), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __class, UML$Class.ownedOperation), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __class, UML$Class.ownedOperation), IndexField(__i))): ref)<:UML$Operation) ) ) )&&
	    (read($h, __class, UML$Class.ownedReception)==null || (read($h, read($h, __class, UML$Class.ownedReception), alloc) && dtype(read($h, __class, UML$Class.ownedReception)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __class, UML$Class.ownedReception)) ==> 
	         ($Unbox(read($h, read($h, __class, UML$Class.ownedReception), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __class, UML$Class.ownedReception), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __class, UML$Class.ownedReception), IndexField(__i))): ref)<:UML$Reception) ) ) )&&
	    (read($h, __class, UML$Class.superClass)==null || (read($h, read($h, __class, UML$Class.superClass), alloc) && dtype(read($h, __class, UML$Class.superClass)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __class, UML$Class.superClass)) ==> 
	         ($Unbox(read($h, read($h, __class, UML$Class.superClass), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __class, UML$Class.superClass), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __class, UML$Class.superClass), IndexField(__i))): ref)<:UML$Class) ) ) )
	  )
	)
	&&(forall __classifier : ref ::
	  (__classifier!=null && read($h, __classifier, alloc) && dtype(__classifier) <: UML$Classifier ==> 
	    (read($h, __classifier, UML$Classifier.attribute)==null || (read($h, read($h, __classifier, UML$Classifier.attribute), alloc) && dtype(read($h, __classifier, UML$Classifier.attribute)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __classifier, UML$Classifier.attribute)) ==> 
	         ($Unbox(read($h, read($h, __classifier, UML$Classifier.attribute), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __classifier, UML$Classifier.attribute), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __classifier, UML$Classifier.attribute), IndexField(__i))): ref)<:UML$Property) ) ) )&&
	    (read($h, __classifier, UML$Classifier.collaborationUse)==null || (read($h, read($h, __classifier, UML$Classifier.collaborationUse), alloc) && dtype(read($h, __classifier, UML$Classifier.collaborationUse)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __classifier, UML$Classifier.collaborationUse)) ==> 
	         ($Unbox(read($h, read($h, __classifier, UML$Classifier.collaborationUse), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __classifier, UML$Classifier.collaborationUse), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __classifier, UML$Classifier.collaborationUse), IndexField(__i))): ref)<:UML$CollaborationUse) ) ) )&&
	    (read($h, __classifier, UML$Classifier.feature)==null || (read($h, read($h, __classifier, UML$Classifier.feature), alloc) && dtype(read($h, __classifier, UML$Classifier.feature)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __classifier, UML$Classifier.feature)) ==> 
	         ($Unbox(read($h, read($h, __classifier, UML$Classifier.feature), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __classifier, UML$Classifier.feature), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __classifier, UML$Classifier.feature), IndexField(__i))): ref)<:UML$Feature) ) ) )&&
	    (read($h, __classifier, UML$Classifier.general)==null || (read($h, read($h, __classifier, UML$Classifier.general), alloc) && dtype(read($h, __classifier, UML$Classifier.general)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __classifier, UML$Classifier.general)) ==> 
	         ($Unbox(read($h, read($h, __classifier, UML$Classifier.general), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __classifier, UML$Classifier.general), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __classifier, UML$Classifier.general), IndexField(__i))): ref)<:UML$Classifier) ) ) )&&
	    (read($h, __classifier, UML$Classifier.generalization)==null || (read($h, read($h, __classifier, UML$Classifier.generalization), alloc) && dtype(read($h, __classifier, UML$Classifier.generalization)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __classifier, UML$Classifier.generalization)) ==> 
	         ($Unbox(read($h, read($h, __classifier, UML$Classifier.generalization), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __classifier, UML$Classifier.generalization), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __classifier, UML$Classifier.generalization), IndexField(__i))): ref)<:UML$Generalization) ) ) )&&
	    (read($h, __classifier, UML$Classifier.inheritedMember)==null || (read($h, read($h, __classifier, UML$Classifier.inheritedMember), alloc) && dtype(read($h, __classifier, UML$Classifier.inheritedMember)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __classifier, UML$Classifier.inheritedMember)) ==> 
	         ($Unbox(read($h, read($h, __classifier, UML$Classifier.inheritedMember), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __classifier, UML$Classifier.inheritedMember), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __classifier, UML$Classifier.inheritedMember), IndexField(__i))): ref)<:UML$NamedElement) ) ) )&&
	 true &&
	 true &&
	    (read($h, __classifier, UML$Classifier.ownedUseCase)==null || (read($h, read($h, __classifier, UML$Classifier.ownedUseCase), alloc) && dtype(read($h, __classifier, UML$Classifier.ownedUseCase)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __classifier, UML$Classifier.ownedUseCase)) ==> 
	         ($Unbox(read($h, read($h, __classifier, UML$Classifier.ownedUseCase), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __classifier, UML$Classifier.ownedUseCase), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __classifier, UML$Classifier.ownedUseCase), IndexField(__i))): ref)<:UML$UseCase) ) ) )&&
	    (read($h, __classifier, UML$Classifier.powertypeExtent)==null || (read($h, read($h, __classifier, UML$Classifier.powertypeExtent), alloc) && dtype(read($h, __classifier, UML$Classifier.powertypeExtent)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __classifier, UML$Classifier.powertypeExtent)) ==> 
	         ($Unbox(read($h, read($h, __classifier, UML$Classifier.powertypeExtent), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __classifier, UML$Classifier.powertypeExtent), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __classifier, UML$Classifier.powertypeExtent), IndexField(__i))): ref)<:UML$GeneralizationSet) ) ) )&&
	    (read($h, __classifier, UML$Classifier.redefinedClassifier)==null || (read($h, read($h, __classifier, UML$Classifier.redefinedClassifier), alloc) && dtype(read($h, __classifier, UML$Classifier.redefinedClassifier)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __classifier, UML$Classifier.redefinedClassifier)) ==> 
	         ($Unbox(read($h, read($h, __classifier, UML$Classifier.redefinedClassifier), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __classifier, UML$Classifier.redefinedClassifier), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __classifier, UML$Classifier.redefinedClassifier), IndexField(__i))): ref)<:UML$Classifier) ) ) )&&
	    (read($h, __classifier, UML$Classifier.representation)!=null && read($h, read($h, __classifier, UML$Classifier.representation) ,alloc) ==>
	       dtype(read($h, __classifier, UML$Classifier.representation)) <: UML$CollaborationUse ) &&
	    (read($h, __classifier, UML$Classifier.substitution)==null || (read($h, read($h, __classifier, UML$Classifier.substitution), alloc) && dtype(read($h, __classifier, UML$Classifier.substitution)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __classifier, UML$Classifier.substitution)) ==> 
	         ($Unbox(read($h, read($h, __classifier, UML$Classifier.substitution), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __classifier, UML$Classifier.substitution), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __classifier, UML$Classifier.substitution), IndexField(__i))): ref)<:UML$Substitution) ) ) )&&
	    (read($h, __classifier, UML$Classifier.useCase)==null || (read($h, read($h, __classifier, UML$Classifier.useCase), alloc) && dtype(read($h, __classifier, UML$Classifier.useCase)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __classifier, UML$Classifier.useCase)) ==> 
	         ($Unbox(read($h, read($h, __classifier, UML$Classifier.useCase), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __classifier, UML$Classifier.useCase), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __classifier, UML$Classifier.useCase), IndexField(__i))): ref)<:UML$UseCase) ) ) )
	  )
	)
	&&(forall __classifiertemplateparameter : ref ::
	  (__classifiertemplateparameter!=null && read($h, __classifiertemplateparameter, alloc) && dtype(__classifiertemplateparameter) <: UML$ClassifierTemplateParameter ==> 
	 true &&
	    (read($h, __classifiertemplateparameter, UML$ClassifierTemplateParameter.constrainingClassifier)==null || (read($h, read($h, __classifiertemplateparameter, UML$ClassifierTemplateParameter.constrainingClassifier), alloc) && dtype(read($h, __classifiertemplateparameter, UML$ClassifierTemplateParameter.constrainingClassifier)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __classifiertemplateparameter, UML$ClassifierTemplateParameter.constrainingClassifier)) ==> 
	         ($Unbox(read($h, read($h, __classifiertemplateparameter, UML$ClassifierTemplateParameter.constrainingClassifier), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __classifiertemplateparameter, UML$ClassifierTemplateParameter.constrainingClassifier), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __classifiertemplateparameter, UML$ClassifierTemplateParameter.constrainingClassifier), IndexField(__i))): ref)<:UML$Classifier) ) ) )
	  )
	)
	&&(forall __clause : ref ::
	  (__clause!=null && read($h, __clause, alloc) && dtype(__clause) <: UML$Clause ==> 
	    (read($h, __clause, UML$Clause.body)==null || (read($h, read($h, __clause, UML$Clause.body), alloc) && dtype(read($h, __clause, UML$Clause.body)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __clause, UML$Clause.body)) ==> 
	         ($Unbox(read($h, read($h, __clause, UML$Clause.body), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __clause, UML$Clause.body), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __clause, UML$Clause.body), IndexField(__i))): ref)<:UML$ExecutableNode) ) ) )&&
	    (read($h, __clause, UML$Clause.bodyOutput)==null || (read($h, read($h, __clause, UML$Clause.bodyOutput), alloc) && dtype(read($h, __clause, UML$Clause.bodyOutput)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __clause, UML$Clause.bodyOutput)) ==> 
	         ($Unbox(read($h, read($h, __clause, UML$Clause.bodyOutput), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __clause, UML$Clause.bodyOutput), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __clause, UML$Clause.bodyOutput), IndexField(__i))): ref)<:UML$OutputPin) ) ) )&&
	    (read($h, __clause, UML$Clause.decider)!=null && read($h, read($h, __clause, UML$Clause.decider) ,alloc) ==>
	       dtype(read($h, __clause, UML$Clause.decider)) <: UML$OutputPin ) &&
	    (read($h, __clause, UML$Clause.predecessorClause)==null || (read($h, read($h, __clause, UML$Clause.predecessorClause), alloc) && dtype(read($h, __clause, UML$Clause.predecessorClause)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __clause, UML$Clause.predecessorClause)) ==> 
	         ($Unbox(read($h, read($h, __clause, UML$Clause.predecessorClause), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __clause, UML$Clause.predecessorClause), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __clause, UML$Clause.predecessorClause), IndexField(__i))): ref)<:UML$Clause) ) ) )&&
	    (read($h, __clause, UML$Clause.successorClause)==null || (read($h, read($h, __clause, UML$Clause.successorClause), alloc) && dtype(read($h, __clause, UML$Clause.successorClause)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __clause, UML$Clause.successorClause)) ==> 
	         ($Unbox(read($h, read($h, __clause, UML$Clause.successorClause), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __clause, UML$Clause.successorClause), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __clause, UML$Clause.successorClause), IndexField(__i))): ref)<:UML$Clause) ) ) )&&
	    (read($h, __clause, UML$Clause.test)==null || (read($h, read($h, __clause, UML$Clause.test), alloc) && dtype(read($h, __clause, UML$Clause.test)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __clause, UML$Clause.test)) ==> 
	         ($Unbox(read($h, read($h, __clause, UML$Clause.test), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __clause, UML$Clause.test), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __clause, UML$Clause.test), IndexField(__i))): ref)<:UML$ExecutableNode) ) ) )
	  )
	)
	&&(forall __clearassociationaction : ref ::
	  (__clearassociationaction!=null && read($h, __clearassociationaction, alloc) && dtype(__clearassociationaction) <: UML$ClearAssociationAction ==> 
	    (read($h, __clearassociationaction, UML$ClearAssociationAction.association)!=null && read($h, read($h, __clearassociationaction, UML$ClearAssociationAction.association) ,alloc) ==>
	       dtype(read($h, __clearassociationaction, UML$ClearAssociationAction.association)) <: UML$Association ) &&
	    (read($h, __clearassociationaction, UML$ClearAssociationAction.object)!=null && read($h, read($h, __clearassociationaction, UML$ClearAssociationAction.object) ,alloc) ==>
	       dtype(read($h, __clearassociationaction, UML$ClearAssociationAction.object)) <: UML$InputPin ) 
	  )
	)
	&&(forall __clearstructuralfeatureaction : ref ::
	  (__clearstructuralfeatureaction!=null && read($h, __clearstructuralfeatureaction, alloc) && dtype(__clearstructuralfeatureaction) <: UML$ClearStructuralFeatureAction ==> 
	    (read($h, __clearstructuralfeatureaction, UML$ClearStructuralFeatureAction.result)!=null && read($h, read($h, __clearstructuralfeatureaction, UML$ClearStructuralFeatureAction.result) ,alloc) ==>
	       dtype(read($h, __clearstructuralfeatureaction, UML$ClearStructuralFeatureAction.result)) <: UML$OutputPin ) 
	  )
	)
	&&(forall __clearvariableaction : ref ::
	  (__clearvariableaction!=null && read($h, __clearvariableaction, alloc) && dtype(__clearvariableaction) <: UML$ClearVariableAction ==> true
	  )
	)
	&&(forall __collaboration : ref ::
	  (__collaboration!=null && read($h, __collaboration, alloc) && dtype(__collaboration) <: UML$Collaboration ==> 
	    (read($h, __collaboration, UML$Collaboration.collaborationRole)==null || (read($h, read($h, __collaboration, UML$Collaboration.collaborationRole), alloc) && dtype(read($h, __collaboration, UML$Collaboration.collaborationRole)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __collaboration, UML$Collaboration.collaborationRole)) ==> 
	         ($Unbox(read($h, read($h, __collaboration, UML$Collaboration.collaborationRole), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __collaboration, UML$Collaboration.collaborationRole), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __collaboration, UML$Collaboration.collaborationRole), IndexField(__i))): ref)<:UML$ConnectableElement) ) ) )
	  )
	)
	&&(forall __collaborationuse : ref ::
	  (__collaborationuse!=null && read($h, __collaborationuse, alloc) && dtype(__collaborationuse) <: UML$CollaborationUse ==> 
	    (read($h, __collaborationuse, UML$CollaborationUse.roleBinding)==null || (read($h, read($h, __collaborationuse, UML$CollaborationUse.roleBinding), alloc) && dtype(read($h, __collaborationuse, UML$CollaborationUse.roleBinding)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __collaborationuse, UML$CollaborationUse.roleBinding)) ==> 
	         ($Unbox(read($h, read($h, __collaborationuse, UML$CollaborationUse.roleBinding), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __collaborationuse, UML$CollaborationUse.roleBinding), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __collaborationuse, UML$CollaborationUse.roleBinding), IndexField(__i))): ref)<:UML$Dependency) ) ) )&&
	    (read($h, __collaborationuse, UML$CollaborationUse.type)!=null && read($h, read($h, __collaborationuse, UML$CollaborationUse.type) ,alloc) ==>
	       dtype(read($h, __collaborationuse, UML$CollaborationUse.type)) <: UML$Collaboration ) 
	  )
	)
	&&(forall __combinedfragment : ref ::
	  (__combinedfragment!=null && read($h, __combinedfragment, alloc) && dtype(__combinedfragment) <: UML$CombinedFragment ==> 
	    (read($h, __combinedfragment, UML$CombinedFragment.cfragmentGate)==null || (read($h, read($h, __combinedfragment, UML$CombinedFragment.cfragmentGate), alloc) && dtype(read($h, __combinedfragment, UML$CombinedFragment.cfragmentGate)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __combinedfragment, UML$CombinedFragment.cfragmentGate)) ==> 
	         ($Unbox(read($h, read($h, __combinedfragment, UML$CombinedFragment.cfragmentGate), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __combinedfragment, UML$CombinedFragment.cfragmentGate), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __combinedfragment, UML$CombinedFragment.cfragmentGate), IndexField(__i))): ref)<:UML$Gate) ) ) )&&
	 true &&
	    (read($h, __combinedfragment, UML$CombinedFragment.operand)==null || (read($h, read($h, __combinedfragment, UML$CombinedFragment.operand), alloc) && dtype(read($h, __combinedfragment, UML$CombinedFragment.operand)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __combinedfragment, UML$CombinedFragment.operand)) ==> 
	         ($Unbox(read($h, read($h, __combinedfragment, UML$CombinedFragment.operand), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __combinedfragment, UML$CombinedFragment.operand), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __combinedfragment, UML$CombinedFragment.operand), IndexField(__i))): ref)<:UML$InteractionOperand) ) ) )
	  )
	)
	&&(forall __comment : ref ::
	  (__comment!=null && read($h, __comment, alloc) && dtype(__comment) <: UML$Comment ==> 
	    (read($h, __comment, UML$Comment.annotatedElement)==null || (read($h, read($h, __comment, UML$Comment.annotatedElement), alloc) && dtype(read($h, __comment, UML$Comment.annotatedElement)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __comment, UML$Comment.annotatedElement)) ==> 
	         ($Unbox(read($h, read($h, __comment, UML$Comment.annotatedElement), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __comment, UML$Comment.annotatedElement), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __comment, UML$Comment.annotatedElement), IndexField(__i))): ref)<:UML$Element) ) ) )&&
	 true 
	  )
	)
	&&(forall __communicationpath : ref ::
	  (__communicationpath!=null && read($h, __communicationpath, alloc) && dtype(__communicationpath) <: UML$CommunicationPath ==> true
	  )
	)
	&&(forall __component : ref ::
	  (__component!=null && read($h, __component, alloc) && dtype(__component) <: UML$Component ==> 
	 true &&
	    (read($h, __component, UML$Component.packagedElement)==null || (read($h, read($h, __component, UML$Component.packagedElement), alloc) && dtype(read($h, __component, UML$Component.packagedElement)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __component, UML$Component.packagedElement)) ==> 
	         ($Unbox(read($h, read($h, __component, UML$Component.packagedElement), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __component, UML$Component.packagedElement), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __component, UML$Component.packagedElement), IndexField(__i))): ref)<:UML$PackageableElement) ) ) )&&
	    (read($h, __component, UML$Component.provided)==null || (read($h, read($h, __component, UML$Component.provided), alloc) && dtype(read($h, __component, UML$Component.provided)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __component, UML$Component.provided)) ==> 
	         ($Unbox(read($h, read($h, __component, UML$Component.provided), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __component, UML$Component.provided), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __component, UML$Component.provided), IndexField(__i))): ref)<:UML$Interface) ) ) )&&
	    (read($h, __component, UML$Component.realization)==null || (read($h, read($h, __component, UML$Component.realization), alloc) && dtype(read($h, __component, UML$Component.realization)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __component, UML$Component.realization)) ==> 
	         ($Unbox(read($h, read($h, __component, UML$Component.realization), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __component, UML$Component.realization), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __component, UML$Component.realization), IndexField(__i))): ref)<:UML$ComponentRealization) ) ) )&&
	    (read($h, __component, UML$Component.required)==null || (read($h, read($h, __component, UML$Component.required), alloc) && dtype(read($h, __component, UML$Component.required)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __component, UML$Component.required)) ==> 
	         ($Unbox(read($h, read($h, __component, UML$Component.required), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __component, UML$Component.required), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __component, UML$Component.required), IndexField(__i))): ref)<:UML$Interface) ) ) )
	  )
	)
	&&(forall __componentrealization : ref ::
	  (__componentrealization!=null && read($h, __componentrealization, alloc) && dtype(__componentrealization) <: UML$ComponentRealization ==> 
	    (read($h, __componentrealization, UML$ComponentRealization.abstraction)!=null && read($h, read($h, __componentrealization, UML$ComponentRealization.abstraction) ,alloc) ==>
	       dtype(read($h, __componentrealization, UML$ComponentRealization.abstraction)) <: UML$Component ) &&
	    (read($h, __componentrealization, UML$ComponentRealization.realizingClassifier)==null || (read($h, read($h, __componentrealization, UML$ComponentRealization.realizingClassifier), alloc) && dtype(read($h, __componentrealization, UML$ComponentRealization.realizingClassifier)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __componentrealization, UML$ComponentRealization.realizingClassifier)) ==> 
	         ($Unbox(read($h, read($h, __componentrealization, UML$ComponentRealization.realizingClassifier), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __componentrealization, UML$ComponentRealization.realizingClassifier), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __componentrealization, UML$ComponentRealization.realizingClassifier), IndexField(__i))): ref)<:UML$Classifier) ) ) )
	  )
	)
	&&(forall __conditionalnode : ref ::
	  (__conditionalnode!=null && read($h, __conditionalnode, alloc) && dtype(__conditionalnode) <: UML$ConditionalNode ==> 
	    (read($h, __conditionalnode, UML$ConditionalNode.clause)==null || (read($h, read($h, __conditionalnode, UML$ConditionalNode.clause), alloc) && dtype(read($h, __conditionalnode, UML$ConditionalNode.clause)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __conditionalnode, UML$ConditionalNode.clause)) ==> 
	         ($Unbox(read($h, read($h, __conditionalnode, UML$ConditionalNode.clause), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __conditionalnode, UML$ConditionalNode.clause), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __conditionalnode, UML$ConditionalNode.clause), IndexField(__i))): ref)<:UML$Clause) ) ) )&&
	 true &&
	 true &&
	    (read($h, __conditionalnode, UML$ConditionalNode.result)==null || (read($h, read($h, __conditionalnode, UML$ConditionalNode.result), alloc) && dtype(read($h, __conditionalnode, UML$ConditionalNode.result)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __conditionalnode, UML$ConditionalNode.result)) ==> 
	         ($Unbox(read($h, read($h, __conditionalnode, UML$ConditionalNode.result), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __conditionalnode, UML$ConditionalNode.result), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __conditionalnode, UML$ConditionalNode.result), IndexField(__i))): ref)<:UML$OutputPin) ) ) )
	  )
	)
	&&(forall __connectableelement : ref ::
	  (__connectableelement!=null && read($h, __connectableelement, alloc) && dtype(__connectableelement) <: UML$ConnectableElement ==> 
	    (read($h, __connectableelement, UML$ConnectableElement.end)==null || (read($h, read($h, __connectableelement, UML$ConnectableElement.end), alloc) && dtype(read($h, __connectableelement, UML$ConnectableElement.end)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __connectableelement, UML$ConnectableElement.end)) ==> 
	         ($Unbox(read($h, read($h, __connectableelement, UML$ConnectableElement.end), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __connectableelement, UML$ConnectableElement.end), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __connectableelement, UML$ConnectableElement.end), IndexField(__i))): ref)<:UML$ConnectorEnd) ) ) )
	  )
	)
	&&(forall __connectableelementtemplateparameter : ref ::
	  (__connectableelementtemplateparameter!=null && read($h, __connectableelementtemplateparameter, alloc) && dtype(__connectableelementtemplateparameter) <: UML$ConnectableElementTemplateParameter ==> true
	  )
	)
	&&(forall __connectionpointreference : ref ::
	  (__connectionpointreference!=null && read($h, __connectionpointreference, alloc) && dtype(__connectionpointreference) <: UML$ConnectionPointReference ==> 
	    (read($h, __connectionpointreference, UML$ConnectionPointReference.entry)==null || (read($h, read($h, __connectionpointreference, UML$ConnectionPointReference.entry), alloc) && dtype(read($h, __connectionpointreference, UML$ConnectionPointReference.entry)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __connectionpointreference, UML$ConnectionPointReference.entry)) ==> 
	         ($Unbox(read($h, read($h, __connectionpointreference, UML$ConnectionPointReference.entry), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __connectionpointreference, UML$ConnectionPointReference.entry), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __connectionpointreference, UML$ConnectionPointReference.entry), IndexField(__i))): ref)<:UML$Pseudostate) ) ) )&&
	    (read($h, __connectionpointreference, UML$ConnectionPointReference.exit)==null || (read($h, read($h, __connectionpointreference, UML$ConnectionPointReference.exit), alloc) && dtype(read($h, __connectionpointreference, UML$ConnectionPointReference.exit)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __connectionpointreference, UML$ConnectionPointReference.exit)) ==> 
	         ($Unbox(read($h, read($h, __connectionpointreference, UML$ConnectionPointReference.exit), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __connectionpointreference, UML$ConnectionPointReference.exit), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __connectionpointreference, UML$ConnectionPointReference.exit), IndexField(__i))): ref)<:UML$Pseudostate) ) ) )&&
	    (read($h, __connectionpointreference, UML$ConnectionPointReference.state)!=null && read($h, read($h, __connectionpointreference, UML$ConnectionPointReference.state) ,alloc) ==>
	       dtype(read($h, __connectionpointreference, UML$ConnectionPointReference.state)) <: UML$State ) 
	  )
	)
	&&(forall __connector : ref ::
	  (__connector!=null && read($h, __connector, alloc) && dtype(__connector) <: UML$Connector ==> 
	    (read($h, __connector, UML$Connector.contract)==null || (read($h, read($h, __connector, UML$Connector.contract), alloc) && dtype(read($h, __connector, UML$Connector.contract)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __connector, UML$Connector.contract)) ==> 
	         ($Unbox(read($h, read($h, __connector, UML$Connector.contract), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __connector, UML$Connector.contract), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __connector, UML$Connector.contract), IndexField(__i))): ref)<:UML$Behavior) ) ) )&&
	    (read($h, __connector, UML$Connector.end)==null || (read($h, read($h, __connector, UML$Connector.end), alloc) && dtype(read($h, __connector, UML$Connector.end)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __connector, UML$Connector.end)) ==> 
	         ($Unbox(read($h, read($h, __connector, UML$Connector.end), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __connector, UML$Connector.end), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __connector, UML$Connector.end), IndexField(__i))): ref)<:UML$ConnectorEnd) ) ) )&&
	 true &&
	    (read($h, __connector, UML$Connector.redefinedConnector)==null || (read($h, read($h, __connector, UML$Connector.redefinedConnector), alloc) && dtype(read($h, __connector, UML$Connector.redefinedConnector)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __connector, UML$Connector.redefinedConnector)) ==> 
	         ($Unbox(read($h, read($h, __connector, UML$Connector.redefinedConnector), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __connector, UML$Connector.redefinedConnector), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __connector, UML$Connector.redefinedConnector), IndexField(__i))): ref)<:UML$Connector) ) ) )&&
	    (read($h, __connector, UML$Connector.type)!=null && read($h, read($h, __connector, UML$Connector.type) ,alloc) ==>
	       dtype(read($h, __connector, UML$Connector.type)) <: UML$Association ) 
	  )
	)
	&&(forall __connectorend : ref ::
	  (__connectorend!=null && read($h, __connectorend, alloc) && dtype(__connectorend) <: UML$ConnectorEnd ==> 
	    (read($h, __connectorend, UML$ConnectorEnd.definingEnd)!=null && read($h, read($h, __connectorend, UML$ConnectorEnd.definingEnd) ,alloc) ==>
	       dtype(read($h, __connectorend, UML$ConnectorEnd.definingEnd)) <: UML$Property ) &&
	    (read($h, __connectorend, UML$ConnectorEnd.partWithPort)!=null && read($h, read($h, __connectorend, UML$ConnectorEnd.partWithPort) ,alloc) ==>
	       dtype(read($h, __connectorend, UML$ConnectorEnd.partWithPort)) <: UML$Property ) &&
	    (read($h, __connectorend, UML$ConnectorEnd.role)!=null && read($h, read($h, __connectorend, UML$ConnectorEnd.role) ,alloc) ==>
	       dtype(read($h, __connectorend, UML$ConnectorEnd.role)) <: UML$ConnectableElement ) 
	  )
	)
	&&(forall __considerignorefragment : ref ::
	  (__considerignorefragment!=null && read($h, __considerignorefragment, alloc) && dtype(__considerignorefragment) <: UML$ConsiderIgnoreFragment ==> 
	    (read($h, __considerignorefragment, UML$ConsiderIgnoreFragment.message)==null || (read($h, read($h, __considerignorefragment, UML$ConsiderIgnoreFragment.message), alloc) && dtype(read($h, __considerignorefragment, UML$ConsiderIgnoreFragment.message)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __considerignorefragment, UML$ConsiderIgnoreFragment.message)) ==> 
	         ($Unbox(read($h, read($h, __considerignorefragment, UML$ConsiderIgnoreFragment.message), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __considerignorefragment, UML$ConsiderIgnoreFragment.message), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __considerignorefragment, UML$ConsiderIgnoreFragment.message), IndexField(__i))): ref)<:UML$NamedElement) ) ) )
	  )
	)
	&&(forall __constraint : ref ::
	  (__constraint!=null && read($h, __constraint, alloc) && dtype(__constraint) <: UML$Constraint ==> 
	    (read($h, __constraint, UML$Constraint.constrainedElement)==null || (read($h, read($h, __constraint, UML$Constraint.constrainedElement), alloc) && dtype(read($h, __constraint, UML$Constraint.constrainedElement)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __constraint, UML$Constraint.constrainedElement)) ==> 
	         ($Unbox(read($h, read($h, __constraint, UML$Constraint.constrainedElement), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __constraint, UML$Constraint.constrainedElement), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __constraint, UML$Constraint.constrainedElement), IndexField(__i))): ref)<:UML$Element) ) ) )&&
	    (read($h, __constraint, UML$Constraint.context)!=null && read($h, read($h, __constraint, UML$Constraint.context) ,alloc) ==>
	       dtype(read($h, __constraint, UML$Constraint.context)) <: UML$Namespace ) &&
	    (read($h, __constraint, UML$Constraint.specification)!=null && read($h, read($h, __constraint, UML$Constraint.specification) ,alloc) ==>
	       dtype(read($h, __constraint, UML$Constraint.specification)) <: UML$ValueSpecification ) 
	  )
	)
	&&(forall __continuation : ref ::
	  (__continuation!=null && read($h, __continuation, alloc) && dtype(__continuation) <: UML$Continuation ==> 
	 true 
	  )
	)
	&&(forall __controlflow : ref ::
	  (__controlflow!=null && read($h, __controlflow, alloc) && dtype(__controlflow) <: UML$ControlFlow ==> true
	  )
	)
	&&(forall __controlnode : ref ::
	  (__controlnode!=null && read($h, __controlnode, alloc) && dtype(__controlnode) <: UML$ControlNode ==> true
	  )
	)
	&&(forall __createlinkaction : ref ::
	  (__createlinkaction!=null && read($h, __createlinkaction, alloc) && dtype(__createlinkaction) <: UML$CreateLinkAction ==> true
	  )
	)
	&&(forall __createlinkobjectaction : ref ::
	  (__createlinkobjectaction!=null && read($h, __createlinkobjectaction, alloc) && dtype(__createlinkobjectaction) <: UML$CreateLinkObjectAction ==> 
	    (read($h, __createlinkobjectaction, UML$CreateLinkObjectAction.result)!=null && read($h, read($h, __createlinkobjectaction, UML$CreateLinkObjectAction.result) ,alloc) ==>
	       dtype(read($h, __createlinkobjectaction, UML$CreateLinkObjectAction.result)) <: UML$OutputPin ) 
	  )
	)
	&&(forall __createobjectaction : ref ::
	  (__createobjectaction!=null && read($h, __createobjectaction, alloc) && dtype(__createobjectaction) <: UML$CreateObjectAction ==> 
	    (read($h, __createobjectaction, UML$CreateObjectAction.classifier)!=null && read($h, read($h, __createobjectaction, UML$CreateObjectAction.classifier) ,alloc) ==>
	       dtype(read($h, __createobjectaction, UML$CreateObjectAction.classifier)) <: UML$Classifier ) &&
	    (read($h, __createobjectaction, UML$CreateObjectAction.result)!=null && read($h, read($h, __createobjectaction, UML$CreateObjectAction.result) ,alloc) ==>
	       dtype(read($h, __createobjectaction, UML$CreateObjectAction.result)) <: UML$OutputPin ) 
	  )
	)
	&&(forall __datastorenode : ref ::
	  (__datastorenode!=null && read($h, __datastorenode, alloc) && dtype(__datastorenode) <: UML$DataStoreNode ==> true
	  )
	)
	&&(forall __datatype : ref ::
	  (__datatype!=null && read($h, __datatype, alloc) && dtype(__datatype) <: UML$DataType ==> 
	    (read($h, __datatype, UML$DataType.ownedAttribute)==null || (read($h, read($h, __datatype, UML$DataType.ownedAttribute), alloc) && dtype(read($h, __datatype, UML$DataType.ownedAttribute)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __datatype, UML$DataType.ownedAttribute)) ==> 
	         ($Unbox(read($h, read($h, __datatype, UML$DataType.ownedAttribute), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __datatype, UML$DataType.ownedAttribute), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __datatype, UML$DataType.ownedAttribute), IndexField(__i))): ref)<:UML$Property) ) ) )&&
	    (read($h, __datatype, UML$DataType.ownedOperation)==null || (read($h, read($h, __datatype, UML$DataType.ownedOperation), alloc) && dtype(read($h, __datatype, UML$DataType.ownedOperation)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __datatype, UML$DataType.ownedOperation)) ==> 
	         ($Unbox(read($h, read($h, __datatype, UML$DataType.ownedOperation), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __datatype, UML$DataType.ownedOperation), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __datatype, UML$DataType.ownedOperation), IndexField(__i))): ref)<:UML$Operation) ) ) )
	  )
	)
	&&(forall __decisionnode : ref ::
	  (__decisionnode!=null && read($h, __decisionnode, alloc) && dtype(__decisionnode) <: UML$DecisionNode ==> 
	    (read($h, __decisionnode, UML$DecisionNode.decisionInput)!=null && read($h, read($h, __decisionnode, UML$DecisionNode.decisionInput) ,alloc) ==>
	       dtype(read($h, __decisionnode, UML$DecisionNode.decisionInput)) <: UML$Behavior ) &&
	    (read($h, __decisionnode, UML$DecisionNode.decisionInputFlow)!=null && read($h, read($h, __decisionnode, UML$DecisionNode.decisionInputFlow) ,alloc) ==>
	       dtype(read($h, __decisionnode, UML$DecisionNode.decisionInputFlow)) <: UML$ObjectFlow ) 
	  )
	)
	&&(forall __dependency : ref ::
	  (__dependency!=null && read($h, __dependency, alloc) && dtype(__dependency) <: UML$Dependency ==> 
	    (read($h, __dependency, UML$Dependency.client)==null || (read($h, read($h, __dependency, UML$Dependency.client), alloc) && dtype(read($h, __dependency, UML$Dependency.client)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __dependency, UML$Dependency.client)) ==> 
	         ($Unbox(read($h, read($h, __dependency, UML$Dependency.client), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __dependency, UML$Dependency.client), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __dependency, UML$Dependency.client), IndexField(__i))): ref)<:UML$NamedElement) ) ) )&&
	    (read($h, __dependency, UML$Dependency.supplier)==null || (read($h, read($h, __dependency, UML$Dependency.supplier), alloc) && dtype(read($h, __dependency, UML$Dependency.supplier)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __dependency, UML$Dependency.supplier)) ==> 
	         ($Unbox(read($h, read($h, __dependency, UML$Dependency.supplier), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __dependency, UML$Dependency.supplier), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __dependency, UML$Dependency.supplier), IndexField(__i))): ref)<:UML$NamedElement) ) ) )
	  )
	)
	&&(forall __deployedartifact : ref ::
	  (__deployedartifact!=null && read($h, __deployedartifact, alloc) && dtype(__deployedartifact) <: UML$DeployedArtifact ==> true
	  )
	)
	&&(forall __deployment : ref ::
	  (__deployment!=null && read($h, __deployment, alloc) && dtype(__deployment) <: UML$Deployment ==> 
	    (read($h, __deployment, UML$Deployment.configuration)==null || (read($h, read($h, __deployment, UML$Deployment.configuration), alloc) && dtype(read($h, __deployment, UML$Deployment.configuration)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __deployment, UML$Deployment.configuration)) ==> 
	         ($Unbox(read($h, read($h, __deployment, UML$Deployment.configuration), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __deployment, UML$Deployment.configuration), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __deployment, UML$Deployment.configuration), IndexField(__i))): ref)<:UML$DeploymentSpecification) ) ) )&&
	    (read($h, __deployment, UML$Deployment.deployedArtifact)==null || (read($h, read($h, __deployment, UML$Deployment.deployedArtifact), alloc) && dtype(read($h, __deployment, UML$Deployment.deployedArtifact)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __deployment, UML$Deployment.deployedArtifact)) ==> 
	         ($Unbox(read($h, read($h, __deployment, UML$Deployment.deployedArtifact), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __deployment, UML$Deployment.deployedArtifact), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __deployment, UML$Deployment.deployedArtifact), IndexField(__i))): ref)<:UML$DeployedArtifact) ) ) )&&
	    (read($h, __deployment, UML$Deployment.location)!=null && read($h, read($h, __deployment, UML$Deployment.location) ,alloc) ==>
	       dtype(read($h, __deployment, UML$Deployment.location)) <: UML$DeploymentTarget ) 
	  )
	)
	&&(forall __deploymentspecification : ref ::
	  (__deploymentspecification!=null && read($h, __deploymentspecification, alloc) && dtype(__deploymentspecification) <: UML$DeploymentSpecification ==> 
	    (read($h, __deploymentspecification, UML$DeploymentSpecification.deployment)!=null && read($h, read($h, __deploymentspecification, UML$DeploymentSpecification.deployment) ,alloc) ==>
	       dtype(read($h, __deploymentspecification, UML$DeploymentSpecification.deployment)) <: UML$Deployment ) &&
	 true &&
	 true 
	  )
	)
	&&(forall __deploymenttarget : ref ::
	  (__deploymenttarget!=null && read($h, __deploymenttarget, alloc) && dtype(__deploymenttarget) <: UML$DeploymentTarget ==> 
	    (read($h, __deploymenttarget, UML$DeploymentTarget.deployedElement)==null || (read($h, read($h, __deploymenttarget, UML$DeploymentTarget.deployedElement), alloc) && dtype(read($h, __deploymenttarget, UML$DeploymentTarget.deployedElement)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __deploymenttarget, UML$DeploymentTarget.deployedElement)) ==> 
	         ($Unbox(read($h, read($h, __deploymenttarget, UML$DeploymentTarget.deployedElement), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __deploymenttarget, UML$DeploymentTarget.deployedElement), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __deploymenttarget, UML$DeploymentTarget.deployedElement), IndexField(__i))): ref)<:UML$PackageableElement) ) ) )&&
	    (read($h, __deploymenttarget, UML$DeploymentTarget.deployment)==null || (read($h, read($h, __deploymenttarget, UML$DeploymentTarget.deployment), alloc) && dtype(read($h, __deploymenttarget, UML$DeploymentTarget.deployment)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __deploymenttarget, UML$DeploymentTarget.deployment)) ==> 
	         ($Unbox(read($h, read($h, __deploymenttarget, UML$DeploymentTarget.deployment), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __deploymenttarget, UML$DeploymentTarget.deployment), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __deploymenttarget, UML$DeploymentTarget.deployment), IndexField(__i))): ref)<:UML$Deployment) ) ) )
	  )
	)
	&&(forall __destroylinkaction : ref ::
	  (__destroylinkaction!=null && read($h, __destroylinkaction, alloc) && dtype(__destroylinkaction) <: UML$DestroyLinkAction ==> true
	  )
	)
	&&(forall __destroyobjectaction : ref ::
	  (__destroyobjectaction!=null && read($h, __destroyobjectaction, alloc) && dtype(__destroyobjectaction) <: UML$DestroyObjectAction ==> 
	 true &&
	 true &&
	    (read($h, __destroyobjectaction, UML$DestroyObjectAction.target)!=null && read($h, read($h, __destroyobjectaction, UML$DestroyObjectAction.target) ,alloc) ==>
	       dtype(read($h, __destroyobjectaction, UML$DestroyObjectAction.target)) <: UML$InputPin ) 
	  )
	)
	&&(forall __destructionoccurrencespecification : ref ::
	  (__destructionoccurrencespecification!=null && read($h, __destructionoccurrencespecification, alloc) && dtype(__destructionoccurrencespecification) <: UML$DestructionOccurrenceSpecification ==> true
	  )
	)
	&&(forall __device : ref ::
	  (__device!=null && read($h, __device, alloc) && dtype(__device) <: UML$Device ==> true
	  )
	)
	&&(forall __directedrelationship : ref ::
	  (__directedrelationship!=null && read($h, __directedrelationship, alloc) && dtype(__directedrelationship) <: UML$DirectedRelationship ==> 
	    (read($h, __directedrelationship, UML$DirectedRelationship.source)==null || (read($h, read($h, __directedrelationship, UML$DirectedRelationship.source), alloc) && dtype(read($h, __directedrelationship, UML$DirectedRelationship.source)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __directedrelationship, UML$DirectedRelationship.source)) ==> 
	         ($Unbox(read($h, read($h, __directedrelationship, UML$DirectedRelationship.source), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __directedrelationship, UML$DirectedRelationship.source), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __directedrelationship, UML$DirectedRelationship.source), IndexField(__i))): ref)<:UML$Element) ) ) )&&
	    (read($h, __directedrelationship, UML$DirectedRelationship.target)==null || (read($h, read($h, __directedrelationship, UML$DirectedRelationship.target), alloc) && dtype(read($h, __directedrelationship, UML$DirectedRelationship.target)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __directedrelationship, UML$DirectedRelationship.target)) ==> 
	         ($Unbox(read($h, read($h, __directedrelationship, UML$DirectedRelationship.target), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __directedrelationship, UML$DirectedRelationship.target), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __directedrelationship, UML$DirectedRelationship.target), IndexField(__i))): ref)<:UML$Element) ) ) )
	  )
	)
	&&(forall __duration : ref ::
	  (__duration!=null && read($h, __duration, alloc) && dtype(__duration) <: UML$Duration ==> 
	    (read($h, __duration, UML$Duration.expr)!=null && read($h, read($h, __duration, UML$Duration.expr) ,alloc) ==>
	       dtype(read($h, __duration, UML$Duration.expr)) <: UML$ValueSpecification ) &&
	    (read($h, __duration, UML$Duration.observation)==null || (read($h, read($h, __duration, UML$Duration.observation), alloc) && dtype(read($h, __duration, UML$Duration.observation)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __duration, UML$Duration.observation)) ==> 
	         ($Unbox(read($h, read($h, __duration, UML$Duration.observation), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __duration, UML$Duration.observation), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __duration, UML$Duration.observation), IndexField(__i))): ref)<:UML$Observation) ) ) )
	  )
	)
	&&(forall __durationconstraint : ref ::
	  (__durationconstraint!=null && read($h, __durationconstraint, alloc) && dtype(__durationconstraint) <: UML$DurationConstraint ==> 
	 true 
	  )
	)
	&&(forall __durationinterval : ref ::
	  (__durationinterval!=null && read($h, __durationinterval, alloc) && dtype(__durationinterval) <: UML$DurationInterval ==> true
	  )
	)
	&&(forall __durationobservation : ref ::
	  (__durationobservation!=null && read($h, __durationobservation, alloc) && dtype(__durationobservation) <: UML$DurationObservation ==> 
	    (read($h, __durationobservation, UML$DurationObservation.event)==null || (read($h, read($h, __durationobservation, UML$DurationObservation.event), alloc) && dtype(read($h, __durationobservation, UML$DurationObservation.event)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __durationobservation, UML$DurationObservation.event)) ==> 
	         ($Unbox(read($h, read($h, __durationobservation, UML$DurationObservation.event), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __durationobservation, UML$DurationObservation.event), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __durationobservation, UML$DurationObservation.event), IndexField(__i))): ref)<:UML$NamedElement) ) ) )&&
	 true 
	  )
	)
	&&(forall __element : ref ::
	  (__element!=null && read($h, __element, alloc) && dtype(__element) <: UML$Element ==> 
	    (read($h, __element, UML$Element.ownedComment)==null || (read($h, read($h, __element, UML$Element.ownedComment), alloc) && dtype(read($h, __element, UML$Element.ownedComment)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __element, UML$Element.ownedComment)) ==> 
	         ($Unbox(read($h, read($h, __element, UML$Element.ownedComment), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __element, UML$Element.ownedComment), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __element, UML$Element.ownedComment), IndexField(__i))): ref)<:UML$Comment) ) ) )&&
	    (read($h, __element, UML$Element.ownedElement)==null || (read($h, read($h, __element, UML$Element.ownedElement), alloc) && dtype(read($h, __element, UML$Element.ownedElement)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __element, UML$Element.ownedElement)) ==> 
	         ($Unbox(read($h, read($h, __element, UML$Element.ownedElement), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __element, UML$Element.ownedElement), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __element, UML$Element.ownedElement), IndexField(__i))): ref)<:UML$Element) ) ) )&&
	    (read($h, __element, UML$Element.owner)!=null && read($h, read($h, __element, UML$Element.owner) ,alloc) ==>
	       dtype(read($h, __element, UML$Element.owner)) <: UML$Element ) 
	  )
	)
	&&(forall __elementimport : ref ::
	  (__elementimport!=null && read($h, __elementimport, alloc) && dtype(__elementimport) <: UML$ElementImport ==> 
	 true &&
	    (read($h, __elementimport, UML$ElementImport.importedElement)!=null && read($h, read($h, __elementimport, UML$ElementImport.importedElement) ,alloc) ==>
	       dtype(read($h, __elementimport, UML$ElementImport.importedElement)) <: UML$PackageableElement ) &&
	    (read($h, __elementimport, UML$ElementImport.importingNamespace)!=null && read($h, read($h, __elementimport, UML$ElementImport.importingNamespace) ,alloc) ==>
	       dtype(read($h, __elementimport, UML$ElementImport.importingNamespace)) <: UML$Namespace ) &&
	 true 
	  )
	)
	&&(forall __encapsulatedclassifier : ref ::
	  (__encapsulatedclassifier!=null && read($h, __encapsulatedclassifier, alloc) && dtype(__encapsulatedclassifier) <: UML$EncapsulatedClassifier ==> 
	    (read($h, __encapsulatedclassifier, UML$EncapsulatedClassifier.ownedPort)==null || (read($h, read($h, __encapsulatedclassifier, UML$EncapsulatedClassifier.ownedPort), alloc) && dtype(read($h, __encapsulatedclassifier, UML$EncapsulatedClassifier.ownedPort)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __encapsulatedclassifier, UML$EncapsulatedClassifier.ownedPort)) ==> 
	         ($Unbox(read($h, read($h, __encapsulatedclassifier, UML$EncapsulatedClassifier.ownedPort), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __encapsulatedclassifier, UML$EncapsulatedClassifier.ownedPort), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __encapsulatedclassifier, UML$EncapsulatedClassifier.ownedPort), IndexField(__i))): ref)<:UML$Port) ) ) )
	  )
	)
	&&(forall __enumeration : ref ::
	  (__enumeration!=null && read($h, __enumeration, alloc) && dtype(__enumeration) <: UML$Enumeration ==> 
	    (read($h, __enumeration, UML$Enumeration.ownedLiteral)==null || (read($h, read($h, __enumeration, UML$Enumeration.ownedLiteral), alloc) && dtype(read($h, __enumeration, UML$Enumeration.ownedLiteral)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __enumeration, UML$Enumeration.ownedLiteral)) ==> 
	         ($Unbox(read($h, read($h, __enumeration, UML$Enumeration.ownedLiteral), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __enumeration, UML$Enumeration.ownedLiteral), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __enumeration, UML$Enumeration.ownedLiteral), IndexField(__i))): ref)<:UML$EnumerationLiteral) ) ) )
	  )
	)
	&&(forall __enumerationliteral : ref ::
	  (__enumerationliteral!=null && read($h, __enumerationliteral, alloc) && dtype(__enumerationliteral) <: UML$EnumerationLiteral ==> 
	    (read($h, __enumerationliteral, UML$EnumerationLiteral.enumeration)!=null && read($h, read($h, __enumerationliteral, UML$EnumerationLiteral.enumeration) ,alloc) ==>
	       dtype(read($h, __enumerationliteral, UML$EnumerationLiteral.enumeration)) <: UML$Enumeration ) 
	  )
	)
	&&(forall __event : ref ::
	  (__event!=null && read($h, __event, alloc) && dtype(__event) <: UML$Event ==> true
	  )
	)
	&&(forall __exceptionhandler : ref ::
	  (__exceptionhandler!=null && read($h, __exceptionhandler, alloc) && dtype(__exceptionhandler) <: UML$ExceptionHandler ==> 
	    (read($h, __exceptionhandler, UML$ExceptionHandler.exceptionInput)!=null && read($h, read($h, __exceptionhandler, UML$ExceptionHandler.exceptionInput) ,alloc) ==>
	       dtype(read($h, __exceptionhandler, UML$ExceptionHandler.exceptionInput)) <: UML$ObjectNode ) &&
	    (read($h, __exceptionhandler, UML$ExceptionHandler.exceptionType)==null || (read($h, read($h, __exceptionhandler, UML$ExceptionHandler.exceptionType), alloc) && dtype(read($h, __exceptionhandler, UML$ExceptionHandler.exceptionType)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __exceptionhandler, UML$ExceptionHandler.exceptionType)) ==> 
	         ($Unbox(read($h, read($h, __exceptionhandler, UML$ExceptionHandler.exceptionType), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __exceptionhandler, UML$ExceptionHandler.exceptionType), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __exceptionhandler, UML$ExceptionHandler.exceptionType), IndexField(__i))): ref)<:UML$Classifier) ) ) )&&
	    (read($h, __exceptionhandler, UML$ExceptionHandler.handlerBody)!=null && read($h, read($h, __exceptionhandler, UML$ExceptionHandler.handlerBody) ,alloc) ==>
	       dtype(read($h, __exceptionhandler, UML$ExceptionHandler.handlerBody)) <: UML$ExecutableNode ) &&
	    (read($h, __exceptionhandler, UML$ExceptionHandler.protectedNode)!=null && read($h, read($h, __exceptionhandler, UML$ExceptionHandler.protectedNode) ,alloc) ==>
	       dtype(read($h, __exceptionhandler, UML$ExceptionHandler.protectedNode)) <: UML$ExecutableNode ) 
	  )
	)
	&&(forall __executablenode : ref ::
	  (__executablenode!=null && read($h, __executablenode, alloc) && dtype(__executablenode) <: UML$ExecutableNode ==> 
	    (read($h, __executablenode, UML$ExecutableNode.handler)==null || (read($h, read($h, __executablenode, UML$ExecutableNode.handler), alloc) && dtype(read($h, __executablenode, UML$ExecutableNode.handler)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __executablenode, UML$ExecutableNode.handler)) ==> 
	         ($Unbox(read($h, read($h, __executablenode, UML$ExecutableNode.handler), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __executablenode, UML$ExecutableNode.handler), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __executablenode, UML$ExecutableNode.handler), IndexField(__i))): ref)<:UML$ExceptionHandler) ) ) )
	  )
	)
	&&(forall __executionenvironment : ref ::
	  (__executionenvironment!=null && read($h, __executionenvironment, alloc) && dtype(__executionenvironment) <: UML$ExecutionEnvironment ==> true
	  )
	)
	&&(forall __executionoccurrencespecification : ref ::
	  (__executionoccurrencespecification!=null && read($h, __executionoccurrencespecification, alloc) && dtype(__executionoccurrencespecification) <: UML$ExecutionOccurrenceSpecification ==> 
	    (read($h, __executionoccurrencespecification, UML$ExecutionOccurrenceSpecification.execution)!=null && read($h, read($h, __executionoccurrencespecification, UML$ExecutionOccurrenceSpecification.execution) ,alloc) ==>
	       dtype(read($h, __executionoccurrencespecification, UML$ExecutionOccurrenceSpecification.execution)) <: UML$ExecutionSpecification ) 
	  )
	)
	&&(forall __executionspecification : ref ::
	  (__executionspecification!=null && read($h, __executionspecification, alloc) && dtype(__executionspecification) <: UML$ExecutionSpecification ==> 
	    (read($h, __executionspecification, UML$ExecutionSpecification.finish)!=null && read($h, read($h, __executionspecification, UML$ExecutionSpecification.finish) ,alloc) ==>
	       dtype(read($h, __executionspecification, UML$ExecutionSpecification.finish)) <: UML$OccurrenceSpecification ) &&
	    (read($h, __executionspecification, UML$ExecutionSpecification.start)!=null && read($h, read($h, __executionspecification, UML$ExecutionSpecification.start) ,alloc) ==>
	       dtype(read($h, __executionspecification, UML$ExecutionSpecification.start)) <: UML$OccurrenceSpecification ) 
	  )
	)
	&&(forall __expansionnode : ref ::
	  (__expansionnode!=null && read($h, __expansionnode, alloc) && dtype(__expansionnode) <: UML$ExpansionNode ==> 
	    (read($h, __expansionnode, UML$ExpansionNode.regionAsInput)!=null && read($h, read($h, __expansionnode, UML$ExpansionNode.regionAsInput) ,alloc) ==>
	       dtype(read($h, __expansionnode, UML$ExpansionNode.regionAsInput)) <: UML$ExpansionRegion ) &&
	    (read($h, __expansionnode, UML$ExpansionNode.regionAsOutput)!=null && read($h, read($h, __expansionnode, UML$ExpansionNode.regionAsOutput) ,alloc) ==>
	       dtype(read($h, __expansionnode, UML$ExpansionNode.regionAsOutput)) <: UML$ExpansionRegion ) 
	  )
	)
	&&(forall __expansionregion : ref ::
	  (__expansionregion!=null && read($h, __expansionregion, alloc) && dtype(__expansionregion) <: UML$ExpansionRegion ==> 
	    (read($h, __expansionregion, UML$ExpansionRegion.inputElement)==null || (read($h, read($h, __expansionregion, UML$ExpansionRegion.inputElement), alloc) && dtype(read($h, __expansionregion, UML$ExpansionRegion.inputElement)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __expansionregion, UML$ExpansionRegion.inputElement)) ==> 
	         ($Unbox(read($h, read($h, __expansionregion, UML$ExpansionRegion.inputElement), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __expansionregion, UML$ExpansionRegion.inputElement), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __expansionregion, UML$ExpansionRegion.inputElement), IndexField(__i))): ref)<:UML$ExpansionNode) ) ) )&&
	 true &&
	    (read($h, __expansionregion, UML$ExpansionRegion.outputElement)==null || (read($h, read($h, __expansionregion, UML$ExpansionRegion.outputElement), alloc) && dtype(read($h, __expansionregion, UML$ExpansionRegion.outputElement)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __expansionregion, UML$ExpansionRegion.outputElement)) ==> 
	         ($Unbox(read($h, read($h, __expansionregion, UML$ExpansionRegion.outputElement), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __expansionregion, UML$ExpansionRegion.outputElement), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __expansionregion, UML$ExpansionRegion.outputElement), IndexField(__i))): ref)<:UML$ExpansionNode) ) ) )
	  )
	)
	&&(forall __expression : ref ::
	  (__expression!=null && read($h, __expression, alloc) && dtype(__expression) <: UML$Expression ==> 
	    (read($h, __expression, UML$Expression.operand)==null || (read($h, read($h, __expression, UML$Expression.operand), alloc) && dtype(read($h, __expression, UML$Expression.operand)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __expression, UML$Expression.operand)) ==> 
	         ($Unbox(read($h, read($h, __expression, UML$Expression.operand), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __expression, UML$Expression.operand), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __expression, UML$Expression.operand), IndexField(__i))): ref)<:UML$ValueSpecification) ) ) )&&
	 true 
	  )
	)
	&&(forall __extend : ref ::
	  (__extend!=null && read($h, __extend, alloc) && dtype(__extend) <: UML$Extend ==> 
	    (read($h, __extend, UML$Extend.condition)!=null && read($h, read($h, __extend, UML$Extend.condition) ,alloc) ==>
	       dtype(read($h, __extend, UML$Extend.condition)) <: UML$Constraint ) &&
	    (read($h, __extend, UML$Extend.extendedCase)!=null && read($h, read($h, __extend, UML$Extend.extendedCase) ,alloc) ==>
	       dtype(read($h, __extend, UML$Extend.extendedCase)) <: UML$UseCase ) &&
	    (read($h, __extend, UML$Extend.extension)!=null && read($h, read($h, __extend, UML$Extend.extension) ,alloc) ==>
	       dtype(read($h, __extend, UML$Extend.extension)) <: UML$UseCase ) &&
	    (read($h, __extend, UML$Extend.extensionLocation)==null || (read($h, read($h, __extend, UML$Extend.extensionLocation), alloc) && dtype(read($h, __extend, UML$Extend.extensionLocation)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __extend, UML$Extend.extensionLocation)) ==> 
	         ($Unbox(read($h, read($h, __extend, UML$Extend.extensionLocation), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __extend, UML$Extend.extensionLocation), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __extend, UML$Extend.extensionLocation), IndexField(__i))): ref)<:UML$ExtensionPoint) ) ) )
	  )
	)
	&&(forall __extension : ref ::
	  (__extension!=null && read($h, __extension, alloc) && dtype(__extension) <: UML$Extension ==> 
	 true &&
	    (read($h, __extension, UML$Extension.metaclass)!=null && read($h, read($h, __extension, UML$Extension.metaclass) ,alloc) ==>
	       dtype(read($h, __extension, UML$Extension.metaclass)) <: UML$Class ) 
	  )
	)
	&&(forall __extensionend : ref ::
	  (__extensionend!=null && read($h, __extensionend, alloc) && dtype(__extensionend) <: UML$ExtensionEnd ==> true
	  )
	)
	&&(forall __extensionpoint : ref ::
	  (__extensionpoint!=null && read($h, __extensionpoint, alloc) && dtype(__extensionpoint) <: UML$ExtensionPoint ==> 
	    (read($h, __extensionpoint, UML$ExtensionPoint.useCase)!=null && read($h, read($h, __extensionpoint, UML$ExtensionPoint.useCase) ,alloc) ==>
	       dtype(read($h, __extensionpoint, UML$ExtensionPoint.useCase)) <: UML$UseCase ) 
	  )
	)
	&&(forall __feature : ref ::
	  (__feature!=null && read($h, __feature, alloc) && dtype(__feature) <: UML$Feature ==> 
	    (read($h, __feature, UML$Feature.featuringClassifier)!=null && read($h, read($h, __feature, UML$Feature.featuringClassifier) ,alloc) ==>
	       dtype(read($h, __feature, UML$Feature.featuringClassifier)) <: UML$Classifier ) &&
	 true 
	  )
	)
	&&(forall __finalnode : ref ::
	  (__finalnode!=null && read($h, __finalnode, alloc) && dtype(__finalnode) <: UML$FinalNode ==> true
	  )
	)
	&&(forall __finalstate : ref ::
	  (__finalstate!=null && read($h, __finalstate, alloc) && dtype(__finalstate) <: UML$FinalState ==> true
	  )
	)
	&&(forall __flowfinalnode : ref ::
	  (__flowfinalnode!=null && read($h, __flowfinalnode, alloc) && dtype(__flowfinalnode) <: UML$FlowFinalNode ==> true
	  )
	)
	&&(forall __forknode : ref ::
	  (__forknode!=null && read($h, __forknode, alloc) && dtype(__forknode) <: UML$ForkNode ==> true
	  )
	)
	&&(forall __functionbehavior : ref ::
	  (__functionbehavior!=null && read($h, __functionbehavior, alloc) && dtype(__functionbehavior) <: UML$FunctionBehavior ==> true
	  )
	)
	&&(forall __gate : ref ::
	  (__gate!=null && read($h, __gate, alloc) && dtype(__gate) <: UML$Gate ==> true
	  )
	)
	&&(forall __generalordering : ref ::
	  (__generalordering!=null && read($h, __generalordering, alloc) && dtype(__generalordering) <: UML$GeneralOrdering ==> 
	    (read($h, __generalordering, UML$GeneralOrdering.after)!=null && read($h, read($h, __generalordering, UML$GeneralOrdering.after) ,alloc) ==>
	       dtype(read($h, __generalordering, UML$GeneralOrdering.after)) <: UML$OccurrenceSpecification ) &&
	    (read($h, __generalordering, UML$GeneralOrdering.before)!=null && read($h, read($h, __generalordering, UML$GeneralOrdering.before) ,alloc) ==>
	       dtype(read($h, __generalordering, UML$GeneralOrdering.before)) <: UML$OccurrenceSpecification ) 
	  )
	)
	&&(forall __generalization : ref ::
	  (__generalization!=null && read($h, __generalization, alloc) && dtype(__generalization) <: UML$Generalization ==> 
	    (read($h, __generalization, UML$Generalization.general)!=null && read($h, read($h, __generalization, UML$Generalization.general) ,alloc) ==>
	       dtype(read($h, __generalization, UML$Generalization.general)) <: UML$Classifier ) &&
	    (read($h, __generalization, UML$Generalization.generalizationSet)==null || (read($h, read($h, __generalization, UML$Generalization.generalizationSet), alloc) && dtype(read($h, __generalization, UML$Generalization.generalizationSet)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __generalization, UML$Generalization.generalizationSet)) ==> 
	         ($Unbox(read($h, read($h, __generalization, UML$Generalization.generalizationSet), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __generalization, UML$Generalization.generalizationSet), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __generalization, UML$Generalization.generalizationSet), IndexField(__i))): ref)<:UML$GeneralizationSet) ) ) )&&
	 true &&
	    (read($h, __generalization, UML$Generalization.specific)!=null && read($h, read($h, __generalization, UML$Generalization.specific) ,alloc) ==>
	       dtype(read($h, __generalization, UML$Generalization.specific)) <: UML$Classifier ) 
	  )
	)
	&&(forall __generalizationset : ref ::
	  (__generalizationset!=null && read($h, __generalizationset, alloc) && dtype(__generalizationset) <: UML$GeneralizationSet ==> 
	    (read($h, __generalizationset, UML$GeneralizationSet.generalization)==null || (read($h, read($h, __generalizationset, UML$GeneralizationSet.generalization), alloc) && dtype(read($h, __generalizationset, UML$GeneralizationSet.generalization)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __generalizationset, UML$GeneralizationSet.generalization)) ==> 
	         ($Unbox(read($h, read($h, __generalizationset, UML$GeneralizationSet.generalization), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __generalizationset, UML$GeneralizationSet.generalization), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __generalizationset, UML$GeneralizationSet.generalization), IndexField(__i))): ref)<:UML$Generalization) ) ) )&&
	 true &&
	 true &&
	    (read($h, __generalizationset, UML$GeneralizationSet.powertype)!=null && read($h, read($h, __generalizationset, UML$GeneralizationSet.powertype) ,alloc) ==>
	       dtype(read($h, __generalizationset, UML$GeneralizationSet.powertype)) <: UML$Classifier ) 
	  )
	)
	&&(forall __image : ref ::
	  (__image!=null && read($h, __image, alloc) && dtype(__image) <: UML$Image ==> 
	 true &&
	 true &&
	 true 
	  )
	)
	&&(forall __include : ref ::
	  (__include!=null && read($h, __include, alloc) && dtype(__include) <: UML$Include ==> 
	    (read($h, __include, UML$Include.addition)!=null && read($h, read($h, __include, UML$Include.addition) ,alloc) ==>
	       dtype(read($h, __include, UML$Include.addition)) <: UML$UseCase ) &&
	    (read($h, __include, UML$Include.includingCase)!=null && read($h, read($h, __include, UML$Include.includingCase) ,alloc) ==>
	       dtype(read($h, __include, UML$Include.includingCase)) <: UML$UseCase ) 
	  )
	)
	&&(forall __informationflow : ref ::
	  (__informationflow!=null && read($h, __informationflow, alloc) && dtype(__informationflow) <: UML$InformationFlow ==> 
	    (read($h, __informationflow, UML$InformationFlow.conveyed)==null || (read($h, read($h, __informationflow, UML$InformationFlow.conveyed), alloc) && dtype(read($h, __informationflow, UML$InformationFlow.conveyed)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __informationflow, UML$InformationFlow.conveyed)) ==> 
	         ($Unbox(read($h, read($h, __informationflow, UML$InformationFlow.conveyed), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __informationflow, UML$InformationFlow.conveyed), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __informationflow, UML$InformationFlow.conveyed), IndexField(__i))): ref)<:UML$Classifier) ) ) )&&
	    (read($h, __informationflow, UML$InformationFlow.informationSource)==null || (read($h, read($h, __informationflow, UML$InformationFlow.informationSource), alloc) && dtype(read($h, __informationflow, UML$InformationFlow.informationSource)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __informationflow, UML$InformationFlow.informationSource)) ==> 
	         ($Unbox(read($h, read($h, __informationflow, UML$InformationFlow.informationSource), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __informationflow, UML$InformationFlow.informationSource), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __informationflow, UML$InformationFlow.informationSource), IndexField(__i))): ref)<:UML$NamedElement) ) ) )&&
	    (read($h, __informationflow, UML$InformationFlow.informationTarget)==null || (read($h, read($h, __informationflow, UML$InformationFlow.informationTarget), alloc) && dtype(read($h, __informationflow, UML$InformationFlow.informationTarget)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __informationflow, UML$InformationFlow.informationTarget)) ==> 
	         ($Unbox(read($h, read($h, __informationflow, UML$InformationFlow.informationTarget), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __informationflow, UML$InformationFlow.informationTarget), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __informationflow, UML$InformationFlow.informationTarget), IndexField(__i))): ref)<:UML$NamedElement) ) ) )&&
	    (read($h, __informationflow, UML$InformationFlow.realization)==null || (read($h, read($h, __informationflow, UML$InformationFlow.realization), alloc) && dtype(read($h, __informationflow, UML$InformationFlow.realization)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __informationflow, UML$InformationFlow.realization)) ==> 
	         ($Unbox(read($h, read($h, __informationflow, UML$InformationFlow.realization), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __informationflow, UML$InformationFlow.realization), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __informationflow, UML$InformationFlow.realization), IndexField(__i))): ref)<:UML$Relationship) ) ) )&&
	    (read($h, __informationflow, UML$InformationFlow.realizingActivityEdge)==null || (read($h, read($h, __informationflow, UML$InformationFlow.realizingActivityEdge), alloc) && dtype(read($h, __informationflow, UML$InformationFlow.realizingActivityEdge)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __informationflow, UML$InformationFlow.realizingActivityEdge)) ==> 
	         ($Unbox(read($h, read($h, __informationflow, UML$InformationFlow.realizingActivityEdge), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __informationflow, UML$InformationFlow.realizingActivityEdge), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __informationflow, UML$InformationFlow.realizingActivityEdge), IndexField(__i))): ref)<:UML$ActivityEdge) ) ) )&&
	    (read($h, __informationflow, UML$InformationFlow.realizingConnector)==null || (read($h, read($h, __informationflow, UML$InformationFlow.realizingConnector), alloc) && dtype(read($h, __informationflow, UML$InformationFlow.realizingConnector)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __informationflow, UML$InformationFlow.realizingConnector)) ==> 
	         ($Unbox(read($h, read($h, __informationflow, UML$InformationFlow.realizingConnector), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __informationflow, UML$InformationFlow.realizingConnector), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __informationflow, UML$InformationFlow.realizingConnector), IndexField(__i))): ref)<:UML$Connector) ) ) )&&
	    (read($h, __informationflow, UML$InformationFlow.realizingMessage)==null || (read($h, read($h, __informationflow, UML$InformationFlow.realizingMessage), alloc) && dtype(read($h, __informationflow, UML$InformationFlow.realizingMessage)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __informationflow, UML$InformationFlow.realizingMessage)) ==> 
	         ($Unbox(read($h, read($h, __informationflow, UML$InformationFlow.realizingMessage), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __informationflow, UML$InformationFlow.realizingMessage), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __informationflow, UML$InformationFlow.realizingMessage), IndexField(__i))): ref)<:UML$Message) ) ) )
	  )
	)
	&&(forall __informationitem : ref ::
	  (__informationitem!=null && read($h, __informationitem, alloc) && dtype(__informationitem) <: UML$InformationItem ==> 
	    (read($h, __informationitem, UML$InformationItem.represented)==null || (read($h, read($h, __informationitem, UML$InformationItem.represented), alloc) && dtype(read($h, __informationitem, UML$InformationItem.represented)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __informationitem, UML$InformationItem.represented)) ==> 
	         ($Unbox(read($h, read($h, __informationitem, UML$InformationItem.represented), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __informationitem, UML$InformationItem.represented), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __informationitem, UML$InformationItem.represented), IndexField(__i))): ref)<:UML$Classifier) ) ) )
	  )
	)
	&&(forall __initialnode : ref ::
	  (__initialnode!=null && read($h, __initialnode, alloc) && dtype(__initialnode) <: UML$InitialNode ==> true
	  )
	)
	&&(forall __inputpin : ref ::
	  (__inputpin!=null && read($h, __inputpin, alloc) && dtype(__inputpin) <: UML$InputPin ==> true
	  )
	)
	&&(forall __instancespecification : ref ::
	  (__instancespecification!=null && read($h, __instancespecification, alloc) && dtype(__instancespecification) <: UML$InstanceSpecification ==> 
	    (read($h, __instancespecification, UML$InstanceSpecification.classifier)==null || (read($h, read($h, __instancespecification, UML$InstanceSpecification.classifier), alloc) && dtype(read($h, __instancespecification, UML$InstanceSpecification.classifier)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __instancespecification, UML$InstanceSpecification.classifier)) ==> 
	         ($Unbox(read($h, read($h, __instancespecification, UML$InstanceSpecification.classifier), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __instancespecification, UML$InstanceSpecification.classifier), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __instancespecification, UML$InstanceSpecification.classifier), IndexField(__i))): ref)<:UML$Classifier) ) ) )&&
	    (read($h, __instancespecification, UML$InstanceSpecification.slot)==null || (read($h, read($h, __instancespecification, UML$InstanceSpecification.slot), alloc) && dtype(read($h, __instancespecification, UML$InstanceSpecification.slot)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __instancespecification, UML$InstanceSpecification.slot)) ==> 
	         ($Unbox(read($h, read($h, __instancespecification, UML$InstanceSpecification.slot), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __instancespecification, UML$InstanceSpecification.slot), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __instancespecification, UML$InstanceSpecification.slot), IndexField(__i))): ref)<:UML$Slot) ) ) )&&
	    (read($h, __instancespecification, UML$InstanceSpecification.specification)!=null && read($h, read($h, __instancespecification, UML$InstanceSpecification.specification) ,alloc) ==>
	       dtype(read($h, __instancespecification, UML$InstanceSpecification.specification)) <: UML$ValueSpecification ) 
	  )
	)
	&&(forall __instancevalue : ref ::
	  (__instancevalue!=null && read($h, __instancevalue, alloc) && dtype(__instancevalue) <: UML$InstanceValue ==> 
	    (read($h, __instancevalue, UML$InstanceValue.instance)!=null && read($h, read($h, __instancevalue, UML$InstanceValue.instance) ,alloc) ==>
	       dtype(read($h, __instancevalue, UML$InstanceValue.instance)) <: UML$InstanceSpecification ) 
	  )
	)
	&&(forall __interaction : ref ::
	  (__interaction!=null && read($h, __interaction, alloc) && dtype(__interaction) <: UML$Interaction ==> 
	    (read($h, __interaction, UML$Interaction.action)==null || (read($h, read($h, __interaction, UML$Interaction.action), alloc) && dtype(read($h, __interaction, UML$Interaction.action)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __interaction, UML$Interaction.action)) ==> 
	         ($Unbox(read($h, read($h, __interaction, UML$Interaction.action), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __interaction, UML$Interaction.action), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __interaction, UML$Interaction.action), IndexField(__i))): ref)<:UML$Action) ) ) )&&
	    (read($h, __interaction, UML$Interaction.formalGate)==null || (read($h, read($h, __interaction, UML$Interaction.formalGate), alloc) && dtype(read($h, __interaction, UML$Interaction.formalGate)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __interaction, UML$Interaction.formalGate)) ==> 
	         ($Unbox(read($h, read($h, __interaction, UML$Interaction.formalGate), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __interaction, UML$Interaction.formalGate), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __interaction, UML$Interaction.formalGate), IndexField(__i))): ref)<:UML$Gate) ) ) )&&
	    (read($h, __interaction, UML$Interaction.fragment)==null || (read($h, read($h, __interaction, UML$Interaction.fragment), alloc) && dtype(read($h, __interaction, UML$Interaction.fragment)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __interaction, UML$Interaction.fragment)) ==> 
	         ($Unbox(read($h, read($h, __interaction, UML$Interaction.fragment), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __interaction, UML$Interaction.fragment), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __interaction, UML$Interaction.fragment), IndexField(__i))): ref)<:UML$InteractionFragment) ) ) )&&
	    (read($h, __interaction, UML$Interaction.lifeline)==null || (read($h, read($h, __interaction, UML$Interaction.lifeline), alloc) && dtype(read($h, __interaction, UML$Interaction.lifeline)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __interaction, UML$Interaction.lifeline)) ==> 
	         ($Unbox(read($h, read($h, __interaction, UML$Interaction.lifeline), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __interaction, UML$Interaction.lifeline), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __interaction, UML$Interaction.lifeline), IndexField(__i))): ref)<:UML$Lifeline) ) ) )&&
	    (read($h, __interaction, UML$Interaction.message)==null || (read($h, read($h, __interaction, UML$Interaction.message), alloc) && dtype(read($h, __interaction, UML$Interaction.message)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __interaction, UML$Interaction.message)) ==> 
	         ($Unbox(read($h, read($h, __interaction, UML$Interaction.message), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __interaction, UML$Interaction.message), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __interaction, UML$Interaction.message), IndexField(__i))): ref)<:UML$Message) ) ) )
	  )
	)
	&&(forall __interactionconstraint : ref ::
	  (__interactionconstraint!=null && read($h, __interactionconstraint, alloc) && dtype(__interactionconstraint) <: UML$InteractionConstraint ==> 
	    (read($h, __interactionconstraint, UML$InteractionConstraint.maxint)!=null && read($h, read($h, __interactionconstraint, UML$InteractionConstraint.maxint) ,alloc) ==>
	       dtype(read($h, __interactionconstraint, UML$InteractionConstraint.maxint)) <: UML$ValueSpecification ) &&
	    (read($h, __interactionconstraint, UML$InteractionConstraint.minint)!=null && read($h, read($h, __interactionconstraint, UML$InteractionConstraint.minint) ,alloc) ==>
	       dtype(read($h, __interactionconstraint, UML$InteractionConstraint.minint)) <: UML$ValueSpecification ) 
	  )
	)
	&&(forall __interactionfragment : ref ::
	  (__interactionfragment!=null && read($h, __interactionfragment, alloc) && dtype(__interactionfragment) <: UML$InteractionFragment ==> 
	    (read($h, __interactionfragment, UML$InteractionFragment.covered)==null || (read($h, read($h, __interactionfragment, UML$InteractionFragment.covered), alloc) && dtype(read($h, __interactionfragment, UML$InteractionFragment.covered)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __interactionfragment, UML$InteractionFragment.covered)) ==> 
	         ($Unbox(read($h, read($h, __interactionfragment, UML$InteractionFragment.covered), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __interactionfragment, UML$InteractionFragment.covered), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __interactionfragment, UML$InteractionFragment.covered), IndexField(__i))): ref)<:UML$Lifeline) ) ) )&&
	    (read($h, __interactionfragment, UML$InteractionFragment.enclosingInteraction)!=null && read($h, read($h, __interactionfragment, UML$InteractionFragment.enclosingInteraction) ,alloc) ==>
	       dtype(read($h, __interactionfragment, UML$InteractionFragment.enclosingInteraction)) <: UML$Interaction ) &&
	    (read($h, __interactionfragment, UML$InteractionFragment.enclosingOperand)!=null && read($h, read($h, __interactionfragment, UML$InteractionFragment.enclosingOperand) ,alloc) ==>
	       dtype(read($h, __interactionfragment, UML$InteractionFragment.enclosingOperand)) <: UML$InteractionOperand ) &&
	    (read($h, __interactionfragment, UML$InteractionFragment.generalOrdering)==null || (read($h, read($h, __interactionfragment, UML$InteractionFragment.generalOrdering), alloc) && dtype(read($h, __interactionfragment, UML$InteractionFragment.generalOrdering)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __interactionfragment, UML$InteractionFragment.generalOrdering)) ==> 
	         ($Unbox(read($h, read($h, __interactionfragment, UML$InteractionFragment.generalOrdering), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __interactionfragment, UML$InteractionFragment.generalOrdering), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __interactionfragment, UML$InteractionFragment.generalOrdering), IndexField(__i))): ref)<:UML$GeneralOrdering) ) ) )
	  )
	)
	&&(forall __interactionoperand : ref ::
	  (__interactionoperand!=null && read($h, __interactionoperand, alloc) && dtype(__interactionoperand) <: UML$InteractionOperand ==> 
	    (read($h, __interactionoperand, UML$InteractionOperand.fragment)==null || (read($h, read($h, __interactionoperand, UML$InteractionOperand.fragment), alloc) && dtype(read($h, __interactionoperand, UML$InteractionOperand.fragment)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __interactionoperand, UML$InteractionOperand.fragment)) ==> 
	         ($Unbox(read($h, read($h, __interactionoperand, UML$InteractionOperand.fragment), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __interactionoperand, UML$InteractionOperand.fragment), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __interactionoperand, UML$InteractionOperand.fragment), IndexField(__i))): ref)<:UML$InteractionFragment) ) ) )&&
	    (read($h, __interactionoperand, UML$InteractionOperand.guard)!=null && read($h, read($h, __interactionoperand, UML$InteractionOperand.guard) ,alloc) ==>
	       dtype(read($h, __interactionoperand, UML$InteractionOperand.guard)) <: UML$InteractionConstraint ) 
	  )
	)
	&&(forall __interactionuse : ref ::
	  (__interactionuse!=null && read($h, __interactionuse, alloc) && dtype(__interactionuse) <: UML$InteractionUse ==> 
	    (read($h, __interactionuse, UML$InteractionUse.actualGate)==null || (read($h, read($h, __interactionuse, UML$InteractionUse.actualGate), alloc) && dtype(read($h, __interactionuse, UML$InteractionUse.actualGate)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __interactionuse, UML$InteractionUse.actualGate)) ==> 
	         ($Unbox(read($h, read($h, __interactionuse, UML$InteractionUse.actualGate), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __interactionuse, UML$InteractionUse.actualGate), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __interactionuse, UML$InteractionUse.actualGate), IndexField(__i))): ref)<:UML$Gate) ) ) )&&
	    (read($h, __interactionuse, UML$InteractionUse.argument)==null || (read($h, read($h, __interactionuse, UML$InteractionUse.argument), alloc) && dtype(read($h, __interactionuse, UML$InteractionUse.argument)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __interactionuse, UML$InteractionUse.argument)) ==> 
	         ($Unbox(read($h, read($h, __interactionuse, UML$InteractionUse.argument), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __interactionuse, UML$InteractionUse.argument), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __interactionuse, UML$InteractionUse.argument), IndexField(__i))): ref)<:UML$ValueSpecification) ) ) )&&
	    (read($h, __interactionuse, UML$InteractionUse.refersTo)!=null && read($h, read($h, __interactionuse, UML$InteractionUse.refersTo) ,alloc) ==>
	       dtype(read($h, __interactionuse, UML$InteractionUse.refersTo)) <: UML$Interaction ) &&
	    (read($h, __interactionuse, UML$InteractionUse.returnValue)!=null && read($h, read($h, __interactionuse, UML$InteractionUse.returnValue) ,alloc) ==>
	       dtype(read($h, __interactionuse, UML$InteractionUse.returnValue)) <: UML$ValueSpecification ) &&
	    (read($h, __interactionuse, UML$InteractionUse.returnValueRecipient)!=null && read($h, read($h, __interactionuse, UML$InteractionUse.returnValueRecipient) ,alloc) ==>
	       dtype(read($h, __interactionuse, UML$InteractionUse.returnValueRecipient)) <: UML$Property ) 
	  )
	)
	&&(forall __interface : ref ::
	  (__interface!=null && read($h, __interface, alloc) && dtype(__interface) <: UML$Interface ==> 
	    (read($h, __interface, UML$Interface.nestedClassifier)==null || (read($h, read($h, __interface, UML$Interface.nestedClassifier), alloc) && dtype(read($h, __interface, UML$Interface.nestedClassifier)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __interface, UML$Interface.nestedClassifier)) ==> 
	         ($Unbox(read($h, read($h, __interface, UML$Interface.nestedClassifier), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __interface, UML$Interface.nestedClassifier), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __interface, UML$Interface.nestedClassifier), IndexField(__i))): ref)<:UML$Classifier) ) ) )&&
	    (read($h, __interface, UML$Interface.ownedAttribute)==null || (read($h, read($h, __interface, UML$Interface.ownedAttribute), alloc) && dtype(read($h, __interface, UML$Interface.ownedAttribute)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __interface, UML$Interface.ownedAttribute)) ==> 
	         ($Unbox(read($h, read($h, __interface, UML$Interface.ownedAttribute), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __interface, UML$Interface.ownedAttribute), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __interface, UML$Interface.ownedAttribute), IndexField(__i))): ref)<:UML$Property) ) ) )&&
	    (read($h, __interface, UML$Interface.ownedOperation)==null || (read($h, read($h, __interface, UML$Interface.ownedOperation), alloc) && dtype(read($h, __interface, UML$Interface.ownedOperation)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __interface, UML$Interface.ownedOperation)) ==> 
	         ($Unbox(read($h, read($h, __interface, UML$Interface.ownedOperation), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __interface, UML$Interface.ownedOperation), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __interface, UML$Interface.ownedOperation), IndexField(__i))): ref)<:UML$Operation) ) ) )&&
	    (read($h, __interface, UML$Interface.ownedReception)==null || (read($h, read($h, __interface, UML$Interface.ownedReception), alloc) && dtype(read($h, __interface, UML$Interface.ownedReception)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __interface, UML$Interface.ownedReception)) ==> 
	         ($Unbox(read($h, read($h, __interface, UML$Interface.ownedReception), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __interface, UML$Interface.ownedReception), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __interface, UML$Interface.ownedReception), IndexField(__i))): ref)<:UML$Reception) ) ) )&&
	    (read($h, __interface, UML$Interface.protocol)!=null && read($h, read($h, __interface, UML$Interface.protocol) ,alloc) ==>
	       dtype(read($h, __interface, UML$Interface.protocol)) <: UML$ProtocolStateMachine ) &&
	    (read($h, __interface, UML$Interface.redefinedInterface)==null || (read($h, read($h, __interface, UML$Interface.redefinedInterface), alloc) && dtype(read($h, __interface, UML$Interface.redefinedInterface)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __interface, UML$Interface.redefinedInterface)) ==> 
	         ($Unbox(read($h, read($h, __interface, UML$Interface.redefinedInterface), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __interface, UML$Interface.redefinedInterface), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __interface, UML$Interface.redefinedInterface), IndexField(__i))): ref)<:UML$Interface) ) ) )
	  )
	)
	&&(forall __interfacerealization : ref ::
	  (__interfacerealization!=null && read($h, __interfacerealization, alloc) && dtype(__interfacerealization) <: UML$InterfaceRealization ==> 
	    (read($h, __interfacerealization, UML$InterfaceRealization.contract)!=null && read($h, read($h, __interfacerealization, UML$InterfaceRealization.contract) ,alloc) ==>
	       dtype(read($h, __interfacerealization, UML$InterfaceRealization.contract)) <: UML$Interface ) &&
	    (read($h, __interfacerealization, UML$InterfaceRealization.implementingClassifier)!=null && read($h, read($h, __interfacerealization, UML$InterfaceRealization.implementingClassifier) ,alloc) ==>
	       dtype(read($h, __interfacerealization, UML$InterfaceRealization.implementingClassifier)) <: UML$BehavioredClassifier ) 
	  )
	)
	&&(forall __interruptibleactivityregion : ref ::
	  (__interruptibleactivityregion!=null && read($h, __interruptibleactivityregion, alloc) && dtype(__interruptibleactivityregion) <: UML$InterruptibleActivityRegion ==> 
	    (read($h, __interruptibleactivityregion, UML$InterruptibleActivityRegion.interruptingEdge)==null || (read($h, read($h, __interruptibleactivityregion, UML$InterruptibleActivityRegion.interruptingEdge), alloc) && dtype(read($h, __interruptibleactivityregion, UML$InterruptibleActivityRegion.interruptingEdge)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __interruptibleactivityregion, UML$InterruptibleActivityRegion.interruptingEdge)) ==> 
	         ($Unbox(read($h, read($h, __interruptibleactivityregion, UML$InterruptibleActivityRegion.interruptingEdge), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __interruptibleactivityregion, UML$InterruptibleActivityRegion.interruptingEdge), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __interruptibleactivityregion, UML$InterruptibleActivityRegion.interruptingEdge), IndexField(__i))): ref)<:UML$ActivityEdge) ) ) )&&
	    (read($h, __interruptibleactivityregion, UML$InterruptibleActivityRegion.node)==null || (read($h, read($h, __interruptibleactivityregion, UML$InterruptibleActivityRegion.node), alloc) && dtype(read($h, __interruptibleactivityregion, UML$InterruptibleActivityRegion.node)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __interruptibleactivityregion, UML$InterruptibleActivityRegion.node)) ==> 
	         ($Unbox(read($h, read($h, __interruptibleactivityregion, UML$InterruptibleActivityRegion.node), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __interruptibleactivityregion, UML$InterruptibleActivityRegion.node), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __interruptibleactivityregion, UML$InterruptibleActivityRegion.node), IndexField(__i))): ref)<:UML$ActivityNode) ) ) )
	  )
	)
	&&(forall __interval : ref ::
	  (__interval!=null && read($h, __interval, alloc) && dtype(__interval) <: UML$Interval ==> 
	    (read($h, __interval, UML$Interval.max)!=null && read($h, read($h, __interval, UML$Interval.max) ,alloc) ==>
	       dtype(read($h, __interval, UML$Interval.max)) <: UML$ValueSpecification ) &&
	    (read($h, __interval, UML$Interval.min)!=null && read($h, read($h, __interval, UML$Interval.min) ,alloc) ==>
	       dtype(read($h, __interval, UML$Interval.min)) <: UML$ValueSpecification ) 
	  )
	)
	&&(forall __intervalconstraint : ref ::
	  (__intervalconstraint!=null && read($h, __intervalconstraint, alloc) && dtype(__intervalconstraint) <: UML$IntervalConstraint ==> true
	  )
	)
	&&(forall __invocationaction : ref ::
	  (__invocationaction!=null && read($h, __invocationaction, alloc) && dtype(__invocationaction) <: UML$InvocationAction ==> 
	    (read($h, __invocationaction, UML$InvocationAction.argument)==null || (read($h, read($h, __invocationaction, UML$InvocationAction.argument), alloc) && dtype(read($h, __invocationaction, UML$InvocationAction.argument)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __invocationaction, UML$InvocationAction.argument)) ==> 
	         ($Unbox(read($h, read($h, __invocationaction, UML$InvocationAction.argument), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __invocationaction, UML$InvocationAction.argument), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __invocationaction, UML$InvocationAction.argument), IndexField(__i))): ref)<:UML$InputPin) ) ) )&&
	    (read($h, __invocationaction, UML$InvocationAction.onPort)!=null && read($h, read($h, __invocationaction, UML$InvocationAction.onPort) ,alloc) ==>
	       dtype(read($h, __invocationaction, UML$InvocationAction.onPort)) <: UML$Port ) 
	  )
	)
	&&(forall __joinnode : ref ::
	  (__joinnode!=null && read($h, __joinnode, alloc) && dtype(__joinnode) <: UML$JoinNode ==> 
	 true &&
	    (read($h, __joinnode, UML$JoinNode.joinSpec)!=null && read($h, read($h, __joinnode, UML$JoinNode.joinSpec) ,alloc) ==>
	       dtype(read($h, __joinnode, UML$JoinNode.joinSpec)) <: UML$ValueSpecification ) 
	  )
	)
	&&(forall __lifeline : ref ::
	  (__lifeline!=null && read($h, __lifeline, alloc) && dtype(__lifeline) <: UML$Lifeline ==> 
	    (read($h, __lifeline, UML$Lifeline.coveredBy)==null || (read($h, read($h, __lifeline, UML$Lifeline.coveredBy), alloc) && dtype(read($h, __lifeline, UML$Lifeline.coveredBy)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __lifeline, UML$Lifeline.coveredBy)) ==> 
	         ($Unbox(read($h, read($h, __lifeline, UML$Lifeline.coveredBy), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __lifeline, UML$Lifeline.coveredBy), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __lifeline, UML$Lifeline.coveredBy), IndexField(__i))): ref)<:UML$InteractionFragment) ) ) )&&
	    (read($h, __lifeline, UML$Lifeline.decomposedAs)!=null && read($h, read($h, __lifeline, UML$Lifeline.decomposedAs) ,alloc) ==>
	       dtype(read($h, __lifeline, UML$Lifeline.decomposedAs)) <: UML$PartDecomposition ) &&
	    (read($h, __lifeline, UML$Lifeline.interaction)!=null && read($h, read($h, __lifeline, UML$Lifeline.interaction) ,alloc) ==>
	       dtype(read($h, __lifeline, UML$Lifeline.interaction)) <: UML$Interaction ) &&
	    (read($h, __lifeline, UML$Lifeline.represents)!=null && read($h, read($h, __lifeline, UML$Lifeline.represents) ,alloc) ==>
	       dtype(read($h, __lifeline, UML$Lifeline.represents)) <: UML$ConnectableElement ) &&
	    (read($h, __lifeline, UML$Lifeline.selector)!=null && read($h, read($h, __lifeline, UML$Lifeline.selector) ,alloc) ==>
	       dtype(read($h, __lifeline, UML$Lifeline.selector)) <: UML$ValueSpecification ) 
	  )
	)
	&&(forall __linkaction : ref ::
	  (__linkaction!=null && read($h, __linkaction, alloc) && dtype(__linkaction) <: UML$LinkAction ==> 
	    (read($h, __linkaction, UML$LinkAction.endData)==null || (read($h, read($h, __linkaction, UML$LinkAction.endData), alloc) && dtype(read($h, __linkaction, UML$LinkAction.endData)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __linkaction, UML$LinkAction.endData)) ==> 
	         ($Unbox(read($h, read($h, __linkaction, UML$LinkAction.endData), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __linkaction, UML$LinkAction.endData), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __linkaction, UML$LinkAction.endData), IndexField(__i))): ref)<:UML$LinkEndData) ) ) )&&
	    (read($h, __linkaction, UML$LinkAction.inputValue)==null || (read($h, read($h, __linkaction, UML$LinkAction.inputValue), alloc) && dtype(read($h, __linkaction, UML$LinkAction.inputValue)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __linkaction, UML$LinkAction.inputValue)) ==> 
	         ($Unbox(read($h, read($h, __linkaction, UML$LinkAction.inputValue), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __linkaction, UML$LinkAction.inputValue), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __linkaction, UML$LinkAction.inputValue), IndexField(__i))): ref)<:UML$InputPin) ) ) )
	  )
	)
	&&(forall __linkendcreationdata : ref ::
	  (__linkendcreationdata!=null && read($h, __linkendcreationdata, alloc) && dtype(__linkendcreationdata) <: UML$LinkEndCreationData ==> 
	    (read($h, __linkendcreationdata, UML$LinkEndCreationData.insertAt)!=null && read($h, read($h, __linkendcreationdata, UML$LinkEndCreationData.insertAt) ,alloc) ==>
	       dtype(read($h, __linkendcreationdata, UML$LinkEndCreationData.insertAt)) <: UML$InputPin ) &&
	 true 
	  )
	)
	&&(forall __linkenddata : ref ::
	  (__linkenddata!=null && read($h, __linkenddata, alloc) && dtype(__linkenddata) <: UML$LinkEndData ==> 
	    (read($h, __linkenddata, UML$LinkEndData.end)!=null && read($h, read($h, __linkenddata, UML$LinkEndData.end) ,alloc) ==>
	       dtype(read($h, __linkenddata, UML$LinkEndData.end)) <: UML$Property ) &&
	    (read($h, __linkenddata, UML$LinkEndData.qualifier)==null || (read($h, read($h, __linkenddata, UML$LinkEndData.qualifier), alloc) && dtype(read($h, __linkenddata, UML$LinkEndData.qualifier)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __linkenddata, UML$LinkEndData.qualifier)) ==> 
	         ($Unbox(read($h, read($h, __linkenddata, UML$LinkEndData.qualifier), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __linkenddata, UML$LinkEndData.qualifier), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __linkenddata, UML$LinkEndData.qualifier), IndexField(__i))): ref)<:UML$QualifierValue) ) ) )&&
	    (read($h, __linkenddata, UML$LinkEndData.value)!=null && read($h, read($h, __linkenddata, UML$LinkEndData.value) ,alloc) ==>
	       dtype(read($h, __linkenddata, UML$LinkEndData.value)) <: UML$InputPin ) 
	  )
	)
	&&(forall __linkenddestructiondata : ref ::
	  (__linkenddestructiondata!=null && read($h, __linkenddestructiondata, alloc) && dtype(__linkenddestructiondata) <: UML$LinkEndDestructionData ==> 
	    (read($h, __linkenddestructiondata, UML$LinkEndDestructionData.destroyAt)!=null && read($h, read($h, __linkenddestructiondata, UML$LinkEndDestructionData.destroyAt) ,alloc) ==>
	       dtype(read($h, __linkenddestructiondata, UML$LinkEndDestructionData.destroyAt)) <: UML$InputPin ) &&
	 true 
	  )
	)
	&&(forall __literalboolean : ref ::
	  (__literalboolean!=null && read($h, __literalboolean, alloc) && dtype(__literalboolean) <: UML$LiteralBoolean ==> 
	 true 
	  )
	)
	&&(forall __literalinteger : ref ::
	  (__literalinteger!=null && read($h, __literalinteger, alloc) && dtype(__literalinteger) <: UML$LiteralInteger ==> 
	 true 
	  )
	)
	&&(forall __literalnull : ref ::
	  (__literalnull!=null && read($h, __literalnull, alloc) && dtype(__literalnull) <: UML$LiteralNull ==> true
	  )
	)
	&&(forall __literalreal : ref ::
	  (__literalreal!=null && read($h, __literalreal, alloc) && dtype(__literalreal) <: UML$LiteralReal ==> 
	 true 
	  )
	)
	&&(forall __literalspecification : ref ::
	  (__literalspecification!=null && read($h, __literalspecification, alloc) && dtype(__literalspecification) <: UML$LiteralSpecification ==> true
	  )
	)
	&&(forall __literalstring : ref ::
	  (__literalstring!=null && read($h, __literalstring, alloc) && dtype(__literalstring) <: UML$LiteralString ==> 
	 true 
	  )
	)
	&&(forall __literalunlimitednatural : ref ::
	  (__literalunlimitednatural!=null && read($h, __literalunlimitednatural, alloc) && dtype(__literalunlimitednatural) <: UML$LiteralUnlimitedNatural ==> 
	 true 
	  )
	)
	&&(forall __loopnode : ref ::
	  (__loopnode!=null && read($h, __loopnode, alloc) && dtype(__loopnode) <: UML$LoopNode ==> 
	    (read($h, __loopnode, UML$LoopNode.bodyOutput)==null || (read($h, read($h, __loopnode, UML$LoopNode.bodyOutput), alloc) && dtype(read($h, __loopnode, UML$LoopNode.bodyOutput)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __loopnode, UML$LoopNode.bodyOutput)) ==> 
	         ($Unbox(read($h, read($h, __loopnode, UML$LoopNode.bodyOutput), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __loopnode, UML$LoopNode.bodyOutput), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __loopnode, UML$LoopNode.bodyOutput), IndexField(__i))): ref)<:UML$OutputPin) ) ) )&&
	    (read($h, __loopnode, UML$LoopNode.bodyPart)==null || (read($h, read($h, __loopnode, UML$LoopNode.bodyPart), alloc) && dtype(read($h, __loopnode, UML$LoopNode.bodyPart)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __loopnode, UML$LoopNode.bodyPart)) ==> 
	         ($Unbox(read($h, read($h, __loopnode, UML$LoopNode.bodyPart), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __loopnode, UML$LoopNode.bodyPart), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __loopnode, UML$LoopNode.bodyPart), IndexField(__i))): ref)<:UML$ExecutableNode) ) ) )&&
	    (read($h, __loopnode, UML$LoopNode.decider)!=null && read($h, read($h, __loopnode, UML$LoopNode.decider) ,alloc) ==>
	       dtype(read($h, __loopnode, UML$LoopNode.decider)) <: UML$OutputPin ) &&
	 true &&
	    (read($h, __loopnode, UML$LoopNode.loopVariable)==null || (read($h, read($h, __loopnode, UML$LoopNode.loopVariable), alloc) && dtype(read($h, __loopnode, UML$LoopNode.loopVariable)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __loopnode, UML$LoopNode.loopVariable)) ==> 
	         ($Unbox(read($h, read($h, __loopnode, UML$LoopNode.loopVariable), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __loopnode, UML$LoopNode.loopVariable), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __loopnode, UML$LoopNode.loopVariable), IndexField(__i))): ref)<:UML$OutputPin) ) ) )&&
	    (read($h, __loopnode, UML$LoopNode.loopVariableInput)==null || (read($h, read($h, __loopnode, UML$LoopNode.loopVariableInput), alloc) && dtype(read($h, __loopnode, UML$LoopNode.loopVariableInput)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __loopnode, UML$LoopNode.loopVariableInput)) ==> 
	         ($Unbox(read($h, read($h, __loopnode, UML$LoopNode.loopVariableInput), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __loopnode, UML$LoopNode.loopVariableInput), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __loopnode, UML$LoopNode.loopVariableInput), IndexField(__i))): ref)<:UML$InputPin) ) ) )&&
	    (read($h, __loopnode, UML$LoopNode.result)==null || (read($h, read($h, __loopnode, UML$LoopNode.result), alloc) && dtype(read($h, __loopnode, UML$LoopNode.result)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __loopnode, UML$LoopNode.result)) ==> 
	         ($Unbox(read($h, read($h, __loopnode, UML$LoopNode.result), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __loopnode, UML$LoopNode.result), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __loopnode, UML$LoopNode.result), IndexField(__i))): ref)<:UML$OutputPin) ) ) )&&
	    (read($h, __loopnode, UML$LoopNode.setupPart)==null || (read($h, read($h, __loopnode, UML$LoopNode.setupPart), alloc) && dtype(read($h, __loopnode, UML$LoopNode.setupPart)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __loopnode, UML$LoopNode.setupPart)) ==> 
	         ($Unbox(read($h, read($h, __loopnode, UML$LoopNode.setupPart), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __loopnode, UML$LoopNode.setupPart), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __loopnode, UML$LoopNode.setupPart), IndexField(__i))): ref)<:UML$ExecutableNode) ) ) )&&
	    (read($h, __loopnode, UML$LoopNode.test)==null || (read($h, read($h, __loopnode, UML$LoopNode.test), alloc) && dtype(read($h, __loopnode, UML$LoopNode.test)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __loopnode, UML$LoopNode.test)) ==> 
	         ($Unbox(read($h, read($h, __loopnode, UML$LoopNode.test), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __loopnode, UML$LoopNode.test), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __loopnode, UML$LoopNode.test), IndexField(__i))): ref)<:UML$ExecutableNode) ) ) )
	  )
	)
	&&(forall __manifestation : ref ::
	  (__manifestation!=null && read($h, __manifestation, alloc) && dtype(__manifestation) <: UML$Manifestation ==> 
	    (read($h, __manifestation, UML$Manifestation.utilizedElement)!=null && read($h, read($h, __manifestation, UML$Manifestation.utilizedElement) ,alloc) ==>
	       dtype(read($h, __manifestation, UML$Manifestation.utilizedElement)) <: UML$PackageableElement ) 
	  )
	)
	&&(forall __mergenode : ref ::
	  (__mergenode!=null && read($h, __mergenode, alloc) && dtype(__mergenode) <: UML$MergeNode ==> true
	  )
	)
	&&(forall __message : ref ::
	  (__message!=null && read($h, __message, alloc) && dtype(__message) <: UML$Message ==> 
	    (read($h, __message, UML$Message.argument)==null || (read($h, read($h, __message, UML$Message.argument), alloc) && dtype(read($h, __message, UML$Message.argument)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __message, UML$Message.argument)) ==> 
	         ($Unbox(read($h, read($h, __message, UML$Message.argument), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __message, UML$Message.argument), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __message, UML$Message.argument), IndexField(__i))): ref)<:UML$ValueSpecification) ) ) )&&
	    (read($h, __message, UML$Message.connector)!=null && read($h, read($h, __message, UML$Message.connector) ,alloc) ==>
	       dtype(read($h, __message, UML$Message.connector)) <: UML$Connector ) &&
	    (read($h, __message, UML$Message.interaction)!=null && read($h, read($h, __message, UML$Message.interaction) ,alloc) ==>
	       dtype(read($h, __message, UML$Message.interaction)) <: UML$Interaction ) &&
	 true &&
	 true &&
	    (read($h, __message, UML$Message.receiveEvent)!=null && read($h, read($h, __message, UML$Message.receiveEvent) ,alloc) ==>
	       dtype(read($h, __message, UML$Message.receiveEvent)) <: UML$MessageEnd ) &&
	    (read($h, __message, UML$Message.sendEvent)!=null && read($h, read($h, __message, UML$Message.sendEvent) ,alloc) ==>
	       dtype(read($h, __message, UML$Message.sendEvent)) <: UML$MessageEnd ) &&
	    (read($h, __message, UML$Message.signature)!=null && read($h, read($h, __message, UML$Message.signature) ,alloc) ==>
	       dtype(read($h, __message, UML$Message.signature)) <: UML$NamedElement ) 
	  )
	)
	&&(forall __messageend : ref ::
	  (__messageend!=null && read($h, __messageend, alloc) && dtype(__messageend) <: UML$MessageEnd ==> 
	    (read($h, __messageend, UML$MessageEnd.message)!=null && read($h, read($h, __messageend, UML$MessageEnd.message) ,alloc) ==>
	       dtype(read($h, __messageend, UML$MessageEnd.message)) <: UML$Message ) 
	  )
	)
	&&(forall __messageevent : ref ::
	  (__messageevent!=null && read($h, __messageevent, alloc) && dtype(__messageevent) <: UML$MessageEvent ==> true
	  )
	)
	&&(forall __messageoccurrencespecification : ref ::
	  (__messageoccurrencespecification!=null && read($h, __messageoccurrencespecification, alloc) && dtype(__messageoccurrencespecification) <: UML$MessageOccurrenceSpecification ==> true
	  )
	)
	&&(forall __model : ref ::
	  (__model!=null && read($h, __model, alloc) && dtype(__model) <: UML$Model ==> 
	 true 
	  )
	)
	&&(forall __multiplicityelement : ref ::
	  (__multiplicityelement!=null && read($h, __multiplicityelement, alloc) && dtype(__multiplicityelement) <: UML$MultiplicityElement ==> 
	 true &&
	 true &&
	 true &&
	    (read($h, __multiplicityelement, UML$MultiplicityElement.lowerValue)!=null && read($h, read($h, __multiplicityelement, UML$MultiplicityElement.lowerValue) ,alloc) ==>
	       dtype(read($h, __multiplicityelement, UML$MultiplicityElement.lowerValue)) <: UML$ValueSpecification ) &&
	 true &&
	    (read($h, __multiplicityelement, UML$MultiplicityElement.upperValue)!=null && read($h, read($h, __multiplicityelement, UML$MultiplicityElement.upperValue) ,alloc) ==>
	       dtype(read($h, __multiplicityelement, UML$MultiplicityElement.upperValue)) <: UML$ValueSpecification ) 
	  )
	)
	&&(forall __namedelement : ref ::
	  (__namedelement!=null && read($h, __namedelement, alloc) && dtype(__namedelement) <: UML$NamedElement ==> 
	    (read($h, __namedelement, UML$NamedElement.clientDependency)==null || (read($h, read($h, __namedelement, UML$NamedElement.clientDependency), alloc) && dtype(read($h, __namedelement, UML$NamedElement.clientDependency)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __namedelement, UML$NamedElement.clientDependency)) ==> 
	         ($Unbox(read($h, read($h, __namedelement, UML$NamedElement.clientDependency), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __namedelement, UML$NamedElement.clientDependency), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __namedelement, UML$NamedElement.clientDependency), IndexField(__i))): ref)<:UML$Dependency) ) ) )&&
	 true &&
	    (read($h, __namedelement, UML$NamedElement.nameExpression)!=null && read($h, read($h, __namedelement, UML$NamedElement.nameExpression) ,alloc) ==>
	       dtype(read($h, __namedelement, UML$NamedElement.nameExpression)) <: UML$StringExpression ) &&
	    (read($h, __namedelement, UML$NamedElement.namespace)!=null && read($h, read($h, __namedelement, UML$NamedElement.namespace) ,alloc) ==>
	       dtype(read($h, __namedelement, UML$NamedElement.namespace)) <: UML$Namespace ) &&
	 true &&
	 true 
	  )
	)
	&&(forall __namespace : ref ::
	  (__namespace!=null && read($h, __namespace, alloc) && dtype(__namespace) <: UML$Namespace ==> 
	    (read($h, __namespace, UML$Namespace.elementImport)==null || (read($h, read($h, __namespace, UML$Namespace.elementImport), alloc) && dtype(read($h, __namespace, UML$Namespace.elementImport)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __namespace, UML$Namespace.elementImport)) ==> 
	         ($Unbox(read($h, read($h, __namespace, UML$Namespace.elementImport), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __namespace, UML$Namespace.elementImport), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __namespace, UML$Namespace.elementImport), IndexField(__i))): ref)<:UML$ElementImport) ) ) )&&
	    (read($h, __namespace, UML$Namespace.importedMember)==null || (read($h, read($h, __namespace, UML$Namespace.importedMember), alloc) && dtype(read($h, __namespace, UML$Namespace.importedMember)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __namespace, UML$Namespace.importedMember)) ==> 
	         ($Unbox(read($h, read($h, __namespace, UML$Namespace.importedMember), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __namespace, UML$Namespace.importedMember), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __namespace, UML$Namespace.importedMember), IndexField(__i))): ref)<:UML$PackageableElement) ) ) )&&
	    (read($h, __namespace, UML$Namespace.member)==null || (read($h, read($h, __namespace, UML$Namespace.member), alloc) && dtype(read($h, __namespace, UML$Namespace.member)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __namespace, UML$Namespace.member)) ==> 
	         ($Unbox(read($h, read($h, __namespace, UML$Namespace.member), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __namespace, UML$Namespace.member), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __namespace, UML$Namespace.member), IndexField(__i))): ref)<:UML$NamedElement) ) ) )&&
	    (read($h, __namespace, UML$Namespace.ownedMember)==null || (read($h, read($h, __namespace, UML$Namespace.ownedMember), alloc) && dtype(read($h, __namespace, UML$Namespace.ownedMember)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __namespace, UML$Namespace.ownedMember)) ==> 
	         ($Unbox(read($h, read($h, __namespace, UML$Namespace.ownedMember), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __namespace, UML$Namespace.ownedMember), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __namespace, UML$Namespace.ownedMember), IndexField(__i))): ref)<:UML$NamedElement) ) ) )&&
	    (read($h, __namespace, UML$Namespace.ownedRule)==null || (read($h, read($h, __namespace, UML$Namespace.ownedRule), alloc) && dtype(read($h, __namespace, UML$Namespace.ownedRule)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __namespace, UML$Namespace.ownedRule)) ==> 
	         ($Unbox(read($h, read($h, __namespace, UML$Namespace.ownedRule), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __namespace, UML$Namespace.ownedRule), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __namespace, UML$Namespace.ownedRule), IndexField(__i))): ref)<:UML$Constraint) ) ) )&&
	    (read($h, __namespace, UML$Namespace.packageImport)==null || (read($h, read($h, __namespace, UML$Namespace.packageImport), alloc) && dtype(read($h, __namespace, UML$Namespace.packageImport)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __namespace, UML$Namespace.packageImport)) ==> 
	         ($Unbox(read($h, read($h, __namespace, UML$Namespace.packageImport), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __namespace, UML$Namespace.packageImport), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __namespace, UML$Namespace.packageImport), IndexField(__i))): ref)<:UML$PackageImport) ) ) )
	  )
	)
	&&(forall __node : ref ::
	  (__node!=null && read($h, __node, alloc) && dtype(__node) <: UML$Node ==> 
	    (read($h, __node, UML$Node.nestedNode)==null || (read($h, read($h, __node, UML$Node.nestedNode), alloc) && dtype(read($h, __node, UML$Node.nestedNode)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __node, UML$Node.nestedNode)) ==> 
	         ($Unbox(read($h, read($h, __node, UML$Node.nestedNode), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __node, UML$Node.nestedNode), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __node, UML$Node.nestedNode), IndexField(__i))): ref)<:UML$Node) ) ) )
	  )
	)
	&&(forall __objectflow : ref ::
	  (__objectflow!=null && read($h, __objectflow, alloc) && dtype(__objectflow) <: UML$ObjectFlow ==> 
	 true &&
	 true &&
	    (read($h, __objectflow, UML$ObjectFlow.selection)!=null && read($h, read($h, __objectflow, UML$ObjectFlow.selection) ,alloc) ==>
	       dtype(read($h, __objectflow, UML$ObjectFlow.selection)) <: UML$Behavior ) &&
	    (read($h, __objectflow, UML$ObjectFlow.transformation)!=null && read($h, read($h, __objectflow, UML$ObjectFlow.transformation) ,alloc) ==>
	       dtype(read($h, __objectflow, UML$ObjectFlow.transformation)) <: UML$Behavior ) 
	  )
	)
	&&(forall __objectnode : ref ::
	  (__objectnode!=null && read($h, __objectnode, alloc) && dtype(__objectnode) <: UML$ObjectNode ==> 
	    (read($h, __objectnode, UML$ObjectNode.inState)==null || (read($h, read($h, __objectnode, UML$ObjectNode.inState), alloc) && dtype(read($h, __objectnode, UML$ObjectNode.inState)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __objectnode, UML$ObjectNode.inState)) ==> 
	         ($Unbox(read($h, read($h, __objectnode, UML$ObjectNode.inState), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __objectnode, UML$ObjectNode.inState), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __objectnode, UML$ObjectNode.inState), IndexField(__i))): ref)<:UML$State) ) ) )&&
	 true &&
	 true &&
	    (read($h, __objectnode, UML$ObjectNode.selection)!=null && read($h, read($h, __objectnode, UML$ObjectNode.selection) ,alloc) ==>
	       dtype(read($h, __objectnode, UML$ObjectNode.selection)) <: UML$Behavior ) &&
	    (read($h, __objectnode, UML$ObjectNode.upperBound)!=null && read($h, read($h, __objectnode, UML$ObjectNode.upperBound) ,alloc) ==>
	       dtype(read($h, __objectnode, UML$ObjectNode.upperBound)) <: UML$ValueSpecification ) 
	  )
	)
	&&(forall __observation : ref ::
	  (__observation!=null && read($h, __observation, alloc) && dtype(__observation) <: UML$Observation ==> true
	  )
	)
	&&(forall __occurrencespecification : ref ::
	  (__occurrencespecification!=null && read($h, __occurrencespecification, alloc) && dtype(__occurrencespecification) <: UML$OccurrenceSpecification ==> 
	    (read($h, __occurrencespecification, UML$OccurrenceSpecification.toAfter)==null || (read($h, read($h, __occurrencespecification, UML$OccurrenceSpecification.toAfter), alloc) && dtype(read($h, __occurrencespecification, UML$OccurrenceSpecification.toAfter)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __occurrencespecification, UML$OccurrenceSpecification.toAfter)) ==> 
	         ($Unbox(read($h, read($h, __occurrencespecification, UML$OccurrenceSpecification.toAfter), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __occurrencespecification, UML$OccurrenceSpecification.toAfter), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __occurrencespecification, UML$OccurrenceSpecification.toAfter), IndexField(__i))): ref)<:UML$GeneralOrdering) ) ) )&&
	    (read($h, __occurrencespecification, UML$OccurrenceSpecification.toBefore)==null || (read($h, read($h, __occurrencespecification, UML$OccurrenceSpecification.toBefore), alloc) && dtype(read($h, __occurrencespecification, UML$OccurrenceSpecification.toBefore)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __occurrencespecification, UML$OccurrenceSpecification.toBefore)) ==> 
	         ($Unbox(read($h, read($h, __occurrencespecification, UML$OccurrenceSpecification.toBefore), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __occurrencespecification, UML$OccurrenceSpecification.toBefore), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __occurrencespecification, UML$OccurrenceSpecification.toBefore), IndexField(__i))): ref)<:UML$GeneralOrdering) ) ) )
	  )
	)
	&&(forall __opaqueaction : ref ::
	  (__opaqueaction!=null && read($h, __opaqueaction, alloc) && dtype(__opaqueaction) <: UML$OpaqueAction ==> 
	 true &&
	    (read($h, __opaqueaction, UML$OpaqueAction.inputValue)==null || (read($h, read($h, __opaqueaction, UML$OpaqueAction.inputValue), alloc) && dtype(read($h, __opaqueaction, UML$OpaqueAction.inputValue)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __opaqueaction, UML$OpaqueAction.inputValue)) ==> 
	         ($Unbox(read($h, read($h, __opaqueaction, UML$OpaqueAction.inputValue), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __opaqueaction, UML$OpaqueAction.inputValue), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __opaqueaction, UML$OpaqueAction.inputValue), IndexField(__i))): ref)<:UML$InputPin) ) ) )&&
	 true &&
	    (read($h, __opaqueaction, UML$OpaqueAction.outputValue)==null || (read($h, read($h, __opaqueaction, UML$OpaqueAction.outputValue), alloc) && dtype(read($h, __opaqueaction, UML$OpaqueAction.outputValue)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __opaqueaction, UML$OpaqueAction.outputValue)) ==> 
	         ($Unbox(read($h, read($h, __opaqueaction, UML$OpaqueAction.outputValue), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __opaqueaction, UML$OpaqueAction.outputValue), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __opaqueaction, UML$OpaqueAction.outputValue), IndexField(__i))): ref)<:UML$OutputPin) ) ) )
	  )
	)
	&&(forall __opaquebehavior : ref ::
	  (__opaquebehavior!=null && read($h, __opaquebehavior, alloc) && dtype(__opaquebehavior) <: UML$OpaqueBehavior ==> 
	 true &&
	 true 
	  )
	)
	&&(forall __opaqueexpression : ref ::
	  (__opaqueexpression!=null && read($h, __opaqueexpression, alloc) && dtype(__opaqueexpression) <: UML$OpaqueExpression ==> 
	    (read($h, __opaqueexpression, UML$OpaqueExpression.behavior)!=null && read($h, read($h, __opaqueexpression, UML$OpaqueExpression.behavior) ,alloc) ==>
	       dtype(read($h, __opaqueexpression, UML$OpaqueExpression.behavior)) <: UML$Behavior ) &&
	 true &&
	 true &&
	    (read($h, __opaqueexpression, UML$OpaqueExpression.result)!=null && read($h, read($h, __opaqueexpression, UML$OpaqueExpression.result) ,alloc) ==>
	       dtype(read($h, __opaqueexpression, UML$OpaqueExpression.result)) <: UML$Parameter ) 
	  )
	)
	&&(forall __operation : ref ::
	  (__operation!=null && read($h, __operation, alloc) && dtype(__operation) <: UML$Operation ==> 
	    (read($h, __operation, UML$Operation.bodyCondition)!=null && read($h, read($h, __operation, UML$Operation.bodyCondition) ,alloc) ==>
	       dtype(read($h, __operation, UML$Operation.bodyCondition)) <: UML$Constraint ) &&
	    (read($h, __operation, UML$Operation.class)!=null && read($h, read($h, __operation, UML$Operation.class) ,alloc) ==>
	       dtype(read($h, __operation, UML$Operation.class)) <: UML$Class ) &&
	    (read($h, __operation, UML$Operation.datatype)!=null && read($h, read($h, __operation, UML$Operation.datatype) ,alloc) ==>
	       dtype(read($h, __operation, UML$Operation.datatype)) <: UML$DataType ) &&
	    (read($h, __operation, UML$Operation.interface)!=null && read($h, read($h, __operation, UML$Operation.interface) ,alloc) ==>
	       dtype(read($h, __operation, UML$Operation.interface)) <: UML$Interface ) &&
	 true &&
	 true &&
	 true &&
	 true &&
	    (read($h, __operation, UML$Operation.postcondition)==null || (read($h, read($h, __operation, UML$Operation.postcondition), alloc) && dtype(read($h, __operation, UML$Operation.postcondition)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __operation, UML$Operation.postcondition)) ==> 
	         ($Unbox(read($h, read($h, __operation, UML$Operation.postcondition), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __operation, UML$Operation.postcondition), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __operation, UML$Operation.postcondition), IndexField(__i))): ref)<:UML$Constraint) ) ) )&&
	    (read($h, __operation, UML$Operation.precondition)==null || (read($h, read($h, __operation, UML$Operation.precondition), alloc) && dtype(read($h, __operation, UML$Operation.precondition)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __operation, UML$Operation.precondition)) ==> 
	         ($Unbox(read($h, read($h, __operation, UML$Operation.precondition), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __operation, UML$Operation.precondition), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __operation, UML$Operation.precondition), IndexField(__i))): ref)<:UML$Constraint) ) ) )&&
	    (read($h, __operation, UML$Operation.redefinedOperation)==null || (read($h, read($h, __operation, UML$Operation.redefinedOperation), alloc) && dtype(read($h, __operation, UML$Operation.redefinedOperation)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __operation, UML$Operation.redefinedOperation)) ==> 
	         ($Unbox(read($h, read($h, __operation, UML$Operation.redefinedOperation), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __operation, UML$Operation.redefinedOperation), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __operation, UML$Operation.redefinedOperation), IndexField(__i))): ref)<:UML$Operation) ) ) )&&
	    (read($h, __operation, UML$Operation.type)!=null && read($h, read($h, __operation, UML$Operation.type) ,alloc) ==>
	       dtype(read($h, __operation, UML$Operation.type)) <: UML$Type ) &&
	 true 
	  )
	)
	&&(forall __operationtemplateparameter : ref ::
	  (__operationtemplateparameter!=null && read($h, __operationtemplateparameter, alloc) && dtype(__operationtemplateparameter) <: UML$OperationTemplateParameter ==> true
	  )
	)
	&&(forall __outputpin : ref ::
	  (__outputpin!=null && read($h, __outputpin, alloc) && dtype(__outputpin) <: UML$OutputPin ==> true
	  )
	)
	&&(forall __package : ref ::
	  (__package!=null && read($h, __package, alloc) && dtype(__package) <: UML$Package ==> 
	 true &&
	    (read($h, __package, UML$Package.nestedPackage)==null || (read($h, read($h, __package, UML$Package.nestedPackage), alloc) && dtype(read($h, __package, UML$Package.nestedPackage)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __package, UML$Package.nestedPackage)) ==> 
	         ($Unbox(read($h, read($h, __package, UML$Package.nestedPackage), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __package, UML$Package.nestedPackage), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __package, UML$Package.nestedPackage), IndexField(__i))): ref)<:UML$Package) ) ) )&&
	    (read($h, __package, UML$Package.nestingPackage)!=null && read($h, read($h, __package, UML$Package.nestingPackage) ,alloc) ==>
	       dtype(read($h, __package, UML$Package.nestingPackage)) <: UML$Package ) &&
	    (read($h, __package, UML$Package.ownedStereotype)==null || (read($h, read($h, __package, UML$Package.ownedStereotype), alloc) && dtype(read($h, __package, UML$Package.ownedStereotype)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __package, UML$Package.ownedStereotype)) ==> 
	         ($Unbox(read($h, read($h, __package, UML$Package.ownedStereotype), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __package, UML$Package.ownedStereotype), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __package, UML$Package.ownedStereotype), IndexField(__i))): ref)<:UML$Stereotype) ) ) )&&
	    (read($h, __package, UML$Package.ownedType)==null || (read($h, read($h, __package, UML$Package.ownedType), alloc) && dtype(read($h, __package, UML$Package.ownedType)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __package, UML$Package.ownedType)) ==> 
	         ($Unbox(read($h, read($h, __package, UML$Package.ownedType), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __package, UML$Package.ownedType), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __package, UML$Package.ownedType), IndexField(__i))): ref)<:UML$Type) ) ) )&&
	    (read($h, __package, UML$Package.packageMerge)==null || (read($h, read($h, __package, UML$Package.packageMerge), alloc) && dtype(read($h, __package, UML$Package.packageMerge)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __package, UML$Package.packageMerge)) ==> 
	         ($Unbox(read($h, read($h, __package, UML$Package.packageMerge), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __package, UML$Package.packageMerge), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __package, UML$Package.packageMerge), IndexField(__i))): ref)<:UML$PackageMerge) ) ) )&&
	    (read($h, __package, UML$Package.packagedElement)==null || (read($h, read($h, __package, UML$Package.packagedElement), alloc) && dtype(read($h, __package, UML$Package.packagedElement)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __package, UML$Package.packagedElement)) ==> 
	         ($Unbox(read($h, read($h, __package, UML$Package.packagedElement), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __package, UML$Package.packagedElement), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __package, UML$Package.packagedElement), IndexField(__i))): ref)<:UML$PackageableElement) ) ) )&&
	    (read($h, __package, UML$Package.profileApplication)==null || (read($h, read($h, __package, UML$Package.profileApplication), alloc) && dtype(read($h, __package, UML$Package.profileApplication)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __package, UML$Package.profileApplication)) ==> 
	         ($Unbox(read($h, read($h, __package, UML$Package.profileApplication), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __package, UML$Package.profileApplication), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __package, UML$Package.profileApplication), IndexField(__i))): ref)<:UML$ProfileApplication) ) ) )
	  )
	)
	&&(forall __packageimport : ref ::
	  (__packageimport!=null && read($h, __packageimport, alloc) && dtype(__packageimport) <: UML$PackageImport ==> 
	    (read($h, __packageimport, UML$PackageImport.importedPackage)!=null && read($h, read($h, __packageimport, UML$PackageImport.importedPackage) ,alloc) ==>
	       dtype(read($h, __packageimport, UML$PackageImport.importedPackage)) <: UML$Package ) &&
	    (read($h, __packageimport, UML$PackageImport.importingNamespace)!=null && read($h, read($h, __packageimport, UML$PackageImport.importingNamespace) ,alloc) ==>
	       dtype(read($h, __packageimport, UML$PackageImport.importingNamespace)) <: UML$Namespace ) &&
	 true 
	  )
	)
	&&(forall __packagemerge : ref ::
	  (__packagemerge!=null && read($h, __packagemerge, alloc) && dtype(__packagemerge) <: UML$PackageMerge ==> 
	    (read($h, __packagemerge, UML$PackageMerge.mergedPackage)!=null && read($h, read($h, __packagemerge, UML$PackageMerge.mergedPackage) ,alloc) ==>
	       dtype(read($h, __packagemerge, UML$PackageMerge.mergedPackage)) <: UML$Package ) &&
	    (read($h, __packagemerge, UML$PackageMerge.receivingPackage)!=null && read($h, read($h, __packagemerge, UML$PackageMerge.receivingPackage) ,alloc) ==>
	       dtype(read($h, __packagemerge, UML$PackageMerge.receivingPackage)) <: UML$Package ) 
	  )
	)
	&&(forall __packageableelement : ref ::
	  (__packageableelement!=null && read($h, __packageableelement, alloc) && dtype(__packageableelement) <: UML$PackageableElement ==> true
	  )
	)
	&&(forall __parameter : ref ::
	  (__parameter!=null && read($h, __parameter, alloc) && dtype(__parameter) <: UML$Parameter ==> 
	 true &&
	    (read($h, __parameter, UML$Parameter.defaultValue)!=null && read($h, read($h, __parameter, UML$Parameter.defaultValue) ,alloc) ==>
	       dtype(read($h, __parameter, UML$Parameter.defaultValue)) <: UML$ValueSpecification ) &&
	 true &&
	 true &&
	 true &&
	 true &&
	    (read($h, __parameter, UML$Parameter.operation)!=null && read($h, read($h, __parameter, UML$Parameter.operation) ,alloc) ==>
	       dtype(read($h, __parameter, UML$Parameter.operation)) <: UML$Operation ) &&
	    (read($h, __parameter, UML$Parameter.parameterSet)==null || (read($h, read($h, __parameter, UML$Parameter.parameterSet), alloc) && dtype(read($h, __parameter, UML$Parameter.parameterSet)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __parameter, UML$Parameter.parameterSet)) ==> 
	         ($Unbox(read($h, read($h, __parameter, UML$Parameter.parameterSet), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __parameter, UML$Parameter.parameterSet), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __parameter, UML$Parameter.parameterSet), IndexField(__i))): ref)<:UML$ParameterSet) ) ) )
	  )
	)
	&&(forall __parameterset : ref ::
	  (__parameterset!=null && read($h, __parameterset, alloc) && dtype(__parameterset) <: UML$ParameterSet ==> 
	    (read($h, __parameterset, UML$ParameterSet.condition)==null || (read($h, read($h, __parameterset, UML$ParameterSet.condition), alloc) && dtype(read($h, __parameterset, UML$ParameterSet.condition)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __parameterset, UML$ParameterSet.condition)) ==> 
	         ($Unbox(read($h, read($h, __parameterset, UML$ParameterSet.condition), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __parameterset, UML$ParameterSet.condition), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __parameterset, UML$ParameterSet.condition), IndexField(__i))): ref)<:UML$Constraint) ) ) )&&
	    (read($h, __parameterset, UML$ParameterSet.parameter)==null || (read($h, read($h, __parameterset, UML$ParameterSet.parameter), alloc) && dtype(read($h, __parameterset, UML$ParameterSet.parameter)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __parameterset, UML$ParameterSet.parameter)) ==> 
	         ($Unbox(read($h, read($h, __parameterset, UML$ParameterSet.parameter), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __parameterset, UML$ParameterSet.parameter), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __parameterset, UML$ParameterSet.parameter), IndexField(__i))): ref)<:UML$Parameter) ) ) )
	  )
	)
	&&(forall __parameterableelement : ref ::
	  (__parameterableelement!=null && read($h, __parameterableelement, alloc) && dtype(__parameterableelement) <: UML$ParameterableElement ==> 
	    (read($h, __parameterableelement, UML$ParameterableElement.owningTemplateParameter)!=null && read($h, read($h, __parameterableelement, UML$ParameterableElement.owningTemplateParameter) ,alloc) ==>
	       dtype(read($h, __parameterableelement, UML$ParameterableElement.owningTemplateParameter)) <: UML$TemplateParameter ) &&
	    (read($h, __parameterableelement, UML$ParameterableElement.templateParameter)!=null && read($h, read($h, __parameterableelement, UML$ParameterableElement.templateParameter) ,alloc) ==>
	       dtype(read($h, __parameterableelement, UML$ParameterableElement.templateParameter)) <: UML$TemplateParameter ) 
	  )
	)
	&&(forall __partdecomposition : ref ::
	  (__partdecomposition!=null && read($h, __partdecomposition, alloc) && dtype(__partdecomposition) <: UML$PartDecomposition ==> true
	  )
	)
	&&(forall __pin : ref ::
	  (__pin!=null && read($h, __pin, alloc) && dtype(__pin) <: UML$Pin ==> 
	 true 
	  )
	)
	&&(forall __port : ref ::
	  (__port!=null && read($h, __port, alloc) && dtype(__port) <: UML$Port ==> 
	 true &&
	 true &&
	 true &&
	    (read($h, __port, UML$Port.protocol)!=null && read($h, read($h, __port, UML$Port.protocol) ,alloc) ==>
	       dtype(read($h, __port, UML$Port.protocol)) <: UML$ProtocolStateMachine ) &&
	    (read($h, __port, UML$Port.provided)==null || (read($h, read($h, __port, UML$Port.provided), alloc) && dtype(read($h, __port, UML$Port.provided)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __port, UML$Port.provided)) ==> 
	         ($Unbox(read($h, read($h, __port, UML$Port.provided), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __port, UML$Port.provided), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __port, UML$Port.provided), IndexField(__i))): ref)<:UML$Interface) ) ) )&&
	    (read($h, __port, UML$Port.redefinedPort)==null || (read($h, read($h, __port, UML$Port.redefinedPort), alloc) && dtype(read($h, __port, UML$Port.redefinedPort)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __port, UML$Port.redefinedPort)) ==> 
	         ($Unbox(read($h, read($h, __port, UML$Port.redefinedPort), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __port, UML$Port.redefinedPort), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __port, UML$Port.redefinedPort), IndexField(__i))): ref)<:UML$Port) ) ) )&&
	    (read($h, __port, UML$Port.required)==null || (read($h, read($h, __port, UML$Port.required), alloc) && dtype(read($h, __port, UML$Port.required)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __port, UML$Port.required)) ==> 
	         ($Unbox(read($h, read($h, __port, UML$Port.required), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __port, UML$Port.required), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __port, UML$Port.required), IndexField(__i))): ref)<:UML$Interface) ) ) )
	  )
	)
	&&(forall __primitivetype : ref ::
	  (__primitivetype!=null && read($h, __primitivetype, alloc) && dtype(__primitivetype) <: UML$PrimitiveType ==> true
	  )
	)
	&&(forall __profile : ref ::
	  (__profile!=null && read($h, __profile, alloc) && dtype(__profile) <: UML$Profile ==> 
	    (read($h, __profile, UML$Profile.metaclassReference)==null || (read($h, read($h, __profile, UML$Profile.metaclassReference), alloc) && dtype(read($h, __profile, UML$Profile.metaclassReference)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __profile, UML$Profile.metaclassReference)) ==> 
	         ($Unbox(read($h, read($h, __profile, UML$Profile.metaclassReference), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __profile, UML$Profile.metaclassReference), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __profile, UML$Profile.metaclassReference), IndexField(__i))): ref)<:UML$ElementImport) ) ) )&&
	    (read($h, __profile, UML$Profile.metamodelReference)==null || (read($h, read($h, __profile, UML$Profile.metamodelReference), alloc) && dtype(read($h, __profile, UML$Profile.metamodelReference)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __profile, UML$Profile.metamodelReference)) ==> 
	         ($Unbox(read($h, read($h, __profile, UML$Profile.metamodelReference), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __profile, UML$Profile.metamodelReference), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __profile, UML$Profile.metamodelReference), IndexField(__i))): ref)<:UML$PackageImport) ) ) )
	  )
	)
	&&(forall __profileapplication : ref ::
	  (__profileapplication!=null && read($h, __profileapplication, alloc) && dtype(__profileapplication) <: UML$ProfileApplication ==> 
	    (read($h, __profileapplication, UML$ProfileApplication.appliedProfile)!=null && read($h, read($h, __profileapplication, UML$ProfileApplication.appliedProfile) ,alloc) ==>
	       dtype(read($h, __profileapplication, UML$ProfileApplication.appliedProfile)) <: UML$Profile ) &&
	    (read($h, __profileapplication, UML$ProfileApplication.applyingPackage)!=null && read($h, read($h, __profileapplication, UML$ProfileApplication.applyingPackage) ,alloc) ==>
	       dtype(read($h, __profileapplication, UML$ProfileApplication.applyingPackage)) <: UML$Package ) &&
	 true 
	  )
	)
	&&(forall __property : ref ::
	  (__property!=null && read($h, __property, alloc) && dtype(__property) <: UML$Property ==> 
	 true &&
	    (read($h, __property, UML$Property.association)!=null && read($h, read($h, __property, UML$Property.association) ,alloc) ==>
	       dtype(read($h, __property, UML$Property.association)) <: UML$Association ) &&
	    (read($h, __property, UML$Property.associationEnd)!=null && read($h, read($h, __property, UML$Property.associationEnd) ,alloc) ==>
	       dtype(read($h, __property, UML$Property.associationEnd)) <: UML$Property ) &&
	    (read($h, __property, UML$Property.class)!=null && read($h, read($h, __property, UML$Property.class) ,alloc) ==>
	       dtype(read($h, __property, UML$Property.class)) <: UML$Class ) &&
	    (read($h, __property, UML$Property.datatype)!=null && read($h, read($h, __property, UML$Property.datatype) ,alloc) ==>
	       dtype(read($h, __property, UML$Property.datatype)) <: UML$DataType ) &&
	    (read($h, __property, UML$Property.defaultValue)!=null && read($h, read($h, __property, UML$Property.defaultValue) ,alloc) ==>
	       dtype(read($h, __property, UML$Property.defaultValue)) <: UML$ValueSpecification ) &&
	    (read($h, __property, UML$Property.interface)!=null && read($h, read($h, __property, UML$Property.interface) ,alloc) ==>
	       dtype(read($h, __property, UML$Property.interface)) <: UML$Interface ) &&
	 true &&
	 true &&
	 true &&
	 true &&
	    (read($h, __property, UML$Property.opposite)!=null && read($h, read($h, __property, UML$Property.opposite) ,alloc) ==>
	       dtype(read($h, __property, UML$Property.opposite)) <: UML$Property ) &&
	    (read($h, __property, UML$Property.owningAssociation)!=null && read($h, read($h, __property, UML$Property.owningAssociation) ,alloc) ==>
	       dtype(read($h, __property, UML$Property.owningAssociation)) <: UML$Association ) &&
	    (read($h, __property, UML$Property.qualifier)==null || (read($h, read($h, __property, UML$Property.qualifier), alloc) && dtype(read($h, __property, UML$Property.qualifier)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __property, UML$Property.qualifier)) ==> 
	         ($Unbox(read($h, read($h, __property, UML$Property.qualifier), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __property, UML$Property.qualifier), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __property, UML$Property.qualifier), IndexField(__i))): ref)<:UML$Property) ) ) )&&
	    (read($h, __property, UML$Property.redefinedProperty)==null || (read($h, read($h, __property, UML$Property.redefinedProperty), alloc) && dtype(read($h, __property, UML$Property.redefinedProperty)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __property, UML$Property.redefinedProperty)) ==> 
	         ($Unbox(read($h, read($h, __property, UML$Property.redefinedProperty), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __property, UML$Property.redefinedProperty), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __property, UML$Property.redefinedProperty), IndexField(__i))): ref)<:UML$Property) ) ) )&&
	    (read($h, __property, UML$Property.subsettedProperty)==null || (read($h, read($h, __property, UML$Property.subsettedProperty), alloc) && dtype(read($h, __property, UML$Property.subsettedProperty)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __property, UML$Property.subsettedProperty)) ==> 
	         ($Unbox(read($h, read($h, __property, UML$Property.subsettedProperty), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __property, UML$Property.subsettedProperty), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __property, UML$Property.subsettedProperty), IndexField(__i))): ref)<:UML$Property) ) ) )
	  )
	)
	&&(forall __protocolconformance : ref ::
	  (__protocolconformance!=null && read($h, __protocolconformance, alloc) && dtype(__protocolconformance) <: UML$ProtocolConformance ==> 
	    (read($h, __protocolconformance, UML$ProtocolConformance.generalMachine)!=null && read($h, read($h, __protocolconformance, UML$ProtocolConformance.generalMachine) ,alloc) ==>
	       dtype(read($h, __protocolconformance, UML$ProtocolConformance.generalMachine)) <: UML$ProtocolStateMachine ) &&
	    (read($h, __protocolconformance, UML$ProtocolConformance.specificMachine)!=null && read($h, read($h, __protocolconformance, UML$ProtocolConformance.specificMachine) ,alloc) ==>
	       dtype(read($h, __protocolconformance, UML$ProtocolConformance.specificMachine)) <: UML$ProtocolStateMachine ) 
	  )
	)
	&&(forall __protocolstatemachine : ref ::
	  (__protocolstatemachine!=null && read($h, __protocolstatemachine, alloc) && dtype(__protocolstatemachine) <: UML$ProtocolStateMachine ==> 
	    (read($h, __protocolstatemachine, UML$ProtocolStateMachine.conformance)==null || (read($h, read($h, __protocolstatemachine, UML$ProtocolStateMachine.conformance), alloc) && dtype(read($h, __protocolstatemachine, UML$ProtocolStateMachine.conformance)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __protocolstatemachine, UML$ProtocolStateMachine.conformance)) ==> 
	         ($Unbox(read($h, read($h, __protocolstatemachine, UML$ProtocolStateMachine.conformance), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __protocolstatemachine, UML$ProtocolStateMachine.conformance), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __protocolstatemachine, UML$ProtocolStateMachine.conformance), IndexField(__i))): ref)<:UML$ProtocolConformance) ) ) )
	  )
	)
	&&(forall __protocoltransition : ref ::
	  (__protocoltransition!=null && read($h, __protocoltransition, alloc) && dtype(__protocoltransition) <: UML$ProtocolTransition ==> 
	    (read($h, __protocoltransition, UML$ProtocolTransition.postCondition)!=null && read($h, read($h, __protocoltransition, UML$ProtocolTransition.postCondition) ,alloc) ==>
	       dtype(read($h, __protocoltransition, UML$ProtocolTransition.postCondition)) <: UML$Constraint ) &&
	    (read($h, __protocoltransition, UML$ProtocolTransition.preCondition)!=null && read($h, read($h, __protocoltransition, UML$ProtocolTransition.preCondition) ,alloc) ==>
	       dtype(read($h, __protocoltransition, UML$ProtocolTransition.preCondition)) <: UML$Constraint ) &&
	    (read($h, __protocoltransition, UML$ProtocolTransition.referred)==null || (read($h, read($h, __protocoltransition, UML$ProtocolTransition.referred), alloc) && dtype(read($h, __protocoltransition, UML$ProtocolTransition.referred)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __protocoltransition, UML$ProtocolTransition.referred)) ==> 
	         ($Unbox(read($h, read($h, __protocoltransition, UML$ProtocolTransition.referred), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __protocoltransition, UML$ProtocolTransition.referred), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __protocoltransition, UML$ProtocolTransition.referred), IndexField(__i))): ref)<:UML$Operation) ) ) )
	  )
	)
	&&(forall __pseudostate : ref ::
	  (__pseudostate!=null && read($h, __pseudostate, alloc) && dtype(__pseudostate) <: UML$Pseudostate ==> 
	 true &&
	    (read($h, __pseudostate, UML$Pseudostate.state)!=null && read($h, read($h, __pseudostate, UML$Pseudostate.state) ,alloc) ==>
	       dtype(read($h, __pseudostate, UML$Pseudostate.state)) <: UML$State ) &&
	    (read($h, __pseudostate, UML$Pseudostate.stateMachine)!=null && read($h, read($h, __pseudostate, UML$Pseudostate.stateMachine) ,alloc) ==>
	       dtype(read($h, __pseudostate, UML$Pseudostate.stateMachine)) <: UML$StateMachine ) 
	  )
	)
	&&(forall __qualifiervalue : ref ::
	  (__qualifiervalue!=null && read($h, __qualifiervalue, alloc) && dtype(__qualifiervalue) <: UML$QualifierValue ==> 
	    (read($h, __qualifiervalue, UML$QualifierValue.qualifier)!=null && read($h, read($h, __qualifiervalue, UML$QualifierValue.qualifier) ,alloc) ==>
	       dtype(read($h, __qualifiervalue, UML$QualifierValue.qualifier)) <: UML$Property ) &&
	    (read($h, __qualifiervalue, UML$QualifierValue.value)!=null && read($h, read($h, __qualifiervalue, UML$QualifierValue.value) ,alloc) ==>
	       dtype(read($h, __qualifiervalue, UML$QualifierValue.value)) <: UML$InputPin ) 
	  )
	)
	&&(forall __raiseexceptionaction : ref ::
	  (__raiseexceptionaction!=null && read($h, __raiseexceptionaction, alloc) && dtype(__raiseexceptionaction) <: UML$RaiseExceptionAction ==> 
	    (read($h, __raiseexceptionaction, UML$RaiseExceptionAction.exception)!=null && read($h, read($h, __raiseexceptionaction, UML$RaiseExceptionAction.exception) ,alloc) ==>
	       dtype(read($h, __raiseexceptionaction, UML$RaiseExceptionAction.exception)) <: UML$InputPin ) 
	  )
	)
	&&(forall __readextentaction : ref ::
	  (__readextentaction!=null && read($h, __readextentaction, alloc) && dtype(__readextentaction) <: UML$ReadExtentAction ==> 
	    (read($h, __readextentaction, UML$ReadExtentAction.classifier)!=null && read($h, read($h, __readextentaction, UML$ReadExtentAction.classifier) ,alloc) ==>
	       dtype(read($h, __readextentaction, UML$ReadExtentAction.classifier)) <: UML$Classifier ) &&
	    (read($h, __readextentaction, UML$ReadExtentAction.result)!=null && read($h, read($h, __readextentaction, UML$ReadExtentAction.result) ,alloc) ==>
	       dtype(read($h, __readextentaction, UML$ReadExtentAction.result)) <: UML$OutputPin ) 
	  )
	)
	&&(forall __readisclassifiedobjectaction : ref ::
	  (__readisclassifiedobjectaction!=null && read($h, __readisclassifiedobjectaction, alloc) && dtype(__readisclassifiedobjectaction) <: UML$ReadIsClassifiedObjectAction ==> 
	    (read($h, __readisclassifiedobjectaction, UML$ReadIsClassifiedObjectAction.classifier)!=null && read($h, read($h, __readisclassifiedobjectaction, UML$ReadIsClassifiedObjectAction.classifier) ,alloc) ==>
	       dtype(read($h, __readisclassifiedobjectaction, UML$ReadIsClassifiedObjectAction.classifier)) <: UML$Classifier ) &&
	 true &&
	    (read($h, __readisclassifiedobjectaction, UML$ReadIsClassifiedObjectAction.object)!=null && read($h, read($h, __readisclassifiedobjectaction, UML$ReadIsClassifiedObjectAction.object) ,alloc) ==>
	       dtype(read($h, __readisclassifiedobjectaction, UML$ReadIsClassifiedObjectAction.object)) <: UML$InputPin ) &&
	    (read($h, __readisclassifiedobjectaction, UML$ReadIsClassifiedObjectAction.result)!=null && read($h, read($h, __readisclassifiedobjectaction, UML$ReadIsClassifiedObjectAction.result) ,alloc) ==>
	       dtype(read($h, __readisclassifiedobjectaction, UML$ReadIsClassifiedObjectAction.result)) <: UML$OutputPin ) 
	  )
	)
	&&(forall __readlinkaction : ref ::
	  (__readlinkaction!=null && read($h, __readlinkaction, alloc) && dtype(__readlinkaction) <: UML$ReadLinkAction ==> 
	    (read($h, __readlinkaction, UML$ReadLinkAction.result)!=null && read($h, read($h, __readlinkaction, UML$ReadLinkAction.result) ,alloc) ==>
	       dtype(read($h, __readlinkaction, UML$ReadLinkAction.result)) <: UML$OutputPin ) 
	  )
	)
	&&(forall __readlinkobjectendaction : ref ::
	  (__readlinkobjectendaction!=null && read($h, __readlinkobjectendaction, alloc) && dtype(__readlinkobjectendaction) <: UML$ReadLinkObjectEndAction ==> 
	    (read($h, __readlinkobjectendaction, UML$ReadLinkObjectEndAction.end)!=null && read($h, read($h, __readlinkobjectendaction, UML$ReadLinkObjectEndAction.end) ,alloc) ==>
	       dtype(read($h, __readlinkobjectendaction, UML$ReadLinkObjectEndAction.end)) <: UML$Property ) &&
	    (read($h, __readlinkobjectendaction, UML$ReadLinkObjectEndAction.object)!=null && read($h, read($h, __readlinkobjectendaction, UML$ReadLinkObjectEndAction.object) ,alloc) ==>
	       dtype(read($h, __readlinkobjectendaction, UML$ReadLinkObjectEndAction.object)) <: UML$InputPin ) &&
	    (read($h, __readlinkobjectendaction, UML$ReadLinkObjectEndAction.result)!=null && read($h, read($h, __readlinkobjectendaction, UML$ReadLinkObjectEndAction.result) ,alloc) ==>
	       dtype(read($h, __readlinkobjectendaction, UML$ReadLinkObjectEndAction.result)) <: UML$OutputPin ) 
	  )
	)
	&&(forall __readlinkobjectendqualifieraction : ref ::
	  (__readlinkobjectendqualifieraction!=null && read($h, __readlinkobjectendqualifieraction, alloc) && dtype(__readlinkobjectendqualifieraction) <: UML$ReadLinkObjectEndQualifierAction ==> 
	    (read($h, __readlinkobjectendqualifieraction, UML$ReadLinkObjectEndQualifierAction.object)!=null && read($h, read($h, __readlinkobjectendqualifieraction, UML$ReadLinkObjectEndQualifierAction.object) ,alloc) ==>
	       dtype(read($h, __readlinkobjectendqualifieraction, UML$ReadLinkObjectEndQualifierAction.object)) <: UML$InputPin ) &&
	    (read($h, __readlinkobjectendqualifieraction, UML$ReadLinkObjectEndQualifierAction.qualifier)!=null && read($h, read($h, __readlinkobjectendqualifieraction, UML$ReadLinkObjectEndQualifierAction.qualifier) ,alloc) ==>
	       dtype(read($h, __readlinkobjectendqualifieraction, UML$ReadLinkObjectEndQualifierAction.qualifier)) <: UML$Property ) &&
	    (read($h, __readlinkobjectendqualifieraction, UML$ReadLinkObjectEndQualifierAction.result)!=null && read($h, read($h, __readlinkobjectendqualifieraction, UML$ReadLinkObjectEndQualifierAction.result) ,alloc) ==>
	       dtype(read($h, __readlinkobjectendqualifieraction, UML$ReadLinkObjectEndQualifierAction.result)) <: UML$OutputPin ) 
	  )
	)
	&&(forall __readselfaction : ref ::
	  (__readselfaction!=null && read($h, __readselfaction, alloc) && dtype(__readselfaction) <: UML$ReadSelfAction ==> 
	    (read($h, __readselfaction, UML$ReadSelfAction.result)!=null && read($h, read($h, __readselfaction, UML$ReadSelfAction.result) ,alloc) ==>
	       dtype(read($h, __readselfaction, UML$ReadSelfAction.result)) <: UML$OutputPin ) 
	  )
	)
	&&(forall __readstructuralfeatureaction : ref ::
	  (__readstructuralfeatureaction!=null && read($h, __readstructuralfeatureaction, alloc) && dtype(__readstructuralfeatureaction) <: UML$ReadStructuralFeatureAction ==> 
	    (read($h, __readstructuralfeatureaction, UML$ReadStructuralFeatureAction.result)!=null && read($h, read($h, __readstructuralfeatureaction, UML$ReadStructuralFeatureAction.result) ,alloc) ==>
	       dtype(read($h, __readstructuralfeatureaction, UML$ReadStructuralFeatureAction.result)) <: UML$OutputPin ) 
	  )
	)
	&&(forall __readvariableaction : ref ::
	  (__readvariableaction!=null && read($h, __readvariableaction, alloc) && dtype(__readvariableaction) <: UML$ReadVariableAction ==> 
	    (read($h, __readvariableaction, UML$ReadVariableAction.result)!=null && read($h, read($h, __readvariableaction, UML$ReadVariableAction.result) ,alloc) ==>
	       dtype(read($h, __readvariableaction, UML$ReadVariableAction.result)) <: UML$OutputPin ) 
	  )
	)
	&&(forall __realization : ref ::
	  (__realization!=null && read($h, __realization, alloc) && dtype(__realization) <: UML$Realization ==> true
	  )
	)
	&&(forall __reception : ref ::
	  (__reception!=null && read($h, __reception, alloc) && dtype(__reception) <: UML$Reception ==> 
	    (read($h, __reception, UML$Reception.signal)!=null && read($h, read($h, __reception, UML$Reception.signal) ,alloc) ==>
	       dtype(read($h, __reception, UML$Reception.signal)) <: UML$Signal ) 
	  )
	)
	&&(forall __reclassifyobjectaction : ref ::
	  (__reclassifyobjectaction!=null && read($h, __reclassifyobjectaction, alloc) && dtype(__reclassifyobjectaction) <: UML$ReclassifyObjectAction ==> 
	 true &&
	    (read($h, __reclassifyobjectaction, UML$ReclassifyObjectAction.newClassifier)==null || (read($h, read($h, __reclassifyobjectaction, UML$ReclassifyObjectAction.newClassifier), alloc) && dtype(read($h, __reclassifyobjectaction, UML$ReclassifyObjectAction.newClassifier)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __reclassifyobjectaction, UML$ReclassifyObjectAction.newClassifier)) ==> 
	         ($Unbox(read($h, read($h, __reclassifyobjectaction, UML$ReclassifyObjectAction.newClassifier), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __reclassifyobjectaction, UML$ReclassifyObjectAction.newClassifier), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __reclassifyobjectaction, UML$ReclassifyObjectAction.newClassifier), IndexField(__i))): ref)<:UML$Classifier) ) ) )&&
	    (read($h, __reclassifyobjectaction, UML$ReclassifyObjectAction.object)!=null && read($h, read($h, __reclassifyobjectaction, UML$ReclassifyObjectAction.object) ,alloc) ==>
	       dtype(read($h, __reclassifyobjectaction, UML$ReclassifyObjectAction.object)) <: UML$InputPin ) &&
	    (read($h, __reclassifyobjectaction, UML$ReclassifyObjectAction.oldClassifier)==null || (read($h, read($h, __reclassifyobjectaction, UML$ReclassifyObjectAction.oldClassifier), alloc) && dtype(read($h, __reclassifyobjectaction, UML$ReclassifyObjectAction.oldClassifier)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __reclassifyobjectaction, UML$ReclassifyObjectAction.oldClassifier)) ==> 
	         ($Unbox(read($h, read($h, __reclassifyobjectaction, UML$ReclassifyObjectAction.oldClassifier), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __reclassifyobjectaction, UML$ReclassifyObjectAction.oldClassifier), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __reclassifyobjectaction, UML$ReclassifyObjectAction.oldClassifier), IndexField(__i))): ref)<:UML$Classifier) ) ) )
	  )
	)
	&&(forall __redefinableelement : ref ::
	  (__redefinableelement!=null && read($h, __redefinableelement, alloc) && dtype(__redefinableelement) <: UML$RedefinableElement ==> 
	 true &&
	    (read($h, __redefinableelement, UML$RedefinableElement.redefinedElement)==null || (read($h, read($h, __redefinableelement, UML$RedefinableElement.redefinedElement), alloc) && dtype(read($h, __redefinableelement, UML$RedefinableElement.redefinedElement)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __redefinableelement, UML$RedefinableElement.redefinedElement)) ==> 
	         ($Unbox(read($h, read($h, __redefinableelement, UML$RedefinableElement.redefinedElement), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __redefinableelement, UML$RedefinableElement.redefinedElement), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __redefinableelement, UML$RedefinableElement.redefinedElement), IndexField(__i))): ref)<:UML$RedefinableElement) ) ) )&&
	    (read($h, __redefinableelement, UML$RedefinableElement.redefinitionContext)==null || (read($h, read($h, __redefinableelement, UML$RedefinableElement.redefinitionContext), alloc) && dtype(read($h, __redefinableelement, UML$RedefinableElement.redefinitionContext)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __redefinableelement, UML$RedefinableElement.redefinitionContext)) ==> 
	         ($Unbox(read($h, read($h, __redefinableelement, UML$RedefinableElement.redefinitionContext), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __redefinableelement, UML$RedefinableElement.redefinitionContext), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __redefinableelement, UML$RedefinableElement.redefinitionContext), IndexField(__i))): ref)<:UML$Classifier) ) ) )
	  )
	)
	&&(forall __redefinabletemplatesignature : ref ::
	  (__redefinabletemplatesignature!=null && read($h, __redefinabletemplatesignature, alloc) && dtype(__redefinabletemplatesignature) <: UML$RedefinableTemplateSignature ==> 
	    (read($h, __redefinabletemplatesignature, UML$RedefinableTemplateSignature.classifier)!=null && read($h, read($h, __redefinabletemplatesignature, UML$RedefinableTemplateSignature.classifier) ,alloc) ==>
	       dtype(read($h, __redefinabletemplatesignature, UML$RedefinableTemplateSignature.classifier)) <: UML$Classifier ) &&
	    (read($h, __redefinabletemplatesignature, UML$RedefinableTemplateSignature.extendedSignature)==null || (read($h, read($h, __redefinabletemplatesignature, UML$RedefinableTemplateSignature.extendedSignature), alloc) && dtype(read($h, __redefinabletemplatesignature, UML$RedefinableTemplateSignature.extendedSignature)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __redefinabletemplatesignature, UML$RedefinableTemplateSignature.extendedSignature)) ==> 
	         ($Unbox(read($h, read($h, __redefinabletemplatesignature, UML$RedefinableTemplateSignature.extendedSignature), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __redefinabletemplatesignature, UML$RedefinableTemplateSignature.extendedSignature), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __redefinabletemplatesignature, UML$RedefinableTemplateSignature.extendedSignature), IndexField(__i))): ref)<:UML$RedefinableTemplateSignature) ) ) )&&
	    (read($h, __redefinabletemplatesignature, UML$RedefinableTemplateSignature.inheritedParameter)==null || (read($h, read($h, __redefinabletemplatesignature, UML$RedefinableTemplateSignature.inheritedParameter), alloc) && dtype(read($h, __redefinabletemplatesignature, UML$RedefinableTemplateSignature.inheritedParameter)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __redefinabletemplatesignature, UML$RedefinableTemplateSignature.inheritedParameter)) ==> 
	         ($Unbox(read($h, read($h, __redefinabletemplatesignature, UML$RedefinableTemplateSignature.inheritedParameter), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __redefinabletemplatesignature, UML$RedefinableTemplateSignature.inheritedParameter), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __redefinabletemplatesignature, UML$RedefinableTemplateSignature.inheritedParameter), IndexField(__i))): ref)<:UML$TemplateParameter) ) ) )
	  )
	)
	&&(forall __reduceaction : ref ::
	  (__reduceaction!=null && read($h, __reduceaction, alloc) && dtype(__reduceaction) <: UML$ReduceAction ==> 
	    (read($h, __reduceaction, UML$ReduceAction.collection)!=null && read($h, read($h, __reduceaction, UML$ReduceAction.collection) ,alloc) ==>
	       dtype(read($h, __reduceaction, UML$ReduceAction.collection)) <: UML$InputPin ) &&
	 true &&
	    (read($h, __reduceaction, UML$ReduceAction.reducer)!=null && read($h, read($h, __reduceaction, UML$ReduceAction.reducer) ,alloc) ==>
	       dtype(read($h, __reduceaction, UML$ReduceAction.reducer)) <: UML$Behavior ) &&
	    (read($h, __reduceaction, UML$ReduceAction.result)!=null && read($h, read($h, __reduceaction, UML$ReduceAction.result) ,alloc) ==>
	       dtype(read($h, __reduceaction, UML$ReduceAction.result)) <: UML$OutputPin ) 
	  )
	)
	&&(forall __region : ref ::
	  (__region!=null && read($h, __region, alloc) && dtype(__region) <: UML$Region ==> 
	    (read($h, __region, UML$Region.extendedRegion)!=null && read($h, read($h, __region, UML$Region.extendedRegion) ,alloc) ==>
	       dtype(read($h, __region, UML$Region.extendedRegion)) <: UML$Region ) &&
	    (read($h, __region, UML$Region.state)!=null && read($h, read($h, __region, UML$Region.state) ,alloc) ==>
	       dtype(read($h, __region, UML$Region.state)) <: UML$State ) &&
	    (read($h, __region, UML$Region.stateMachine)!=null && read($h, read($h, __region, UML$Region.stateMachine) ,alloc) ==>
	       dtype(read($h, __region, UML$Region.stateMachine)) <: UML$StateMachine ) &&
	    (read($h, __region, UML$Region.subvertex)==null || (read($h, read($h, __region, UML$Region.subvertex), alloc) && dtype(read($h, __region, UML$Region.subvertex)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __region, UML$Region.subvertex)) ==> 
	         ($Unbox(read($h, read($h, __region, UML$Region.subvertex), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __region, UML$Region.subvertex), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __region, UML$Region.subvertex), IndexField(__i))): ref)<:UML$Vertex) ) ) )&&
	    (read($h, __region, UML$Region.transition)==null || (read($h, read($h, __region, UML$Region.transition), alloc) && dtype(read($h, __region, UML$Region.transition)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __region, UML$Region.transition)) ==> 
	         ($Unbox(read($h, read($h, __region, UML$Region.transition), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __region, UML$Region.transition), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __region, UML$Region.transition), IndexField(__i))): ref)<:UML$Transition) ) ) )
	  )
	)
	&&(forall __relationship : ref ::
	  (__relationship!=null && read($h, __relationship, alloc) && dtype(__relationship) <: UML$Relationship ==> 
	    (read($h, __relationship, UML$Relationship.relatedElement)==null || (read($h, read($h, __relationship, UML$Relationship.relatedElement), alloc) && dtype(read($h, __relationship, UML$Relationship.relatedElement)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __relationship, UML$Relationship.relatedElement)) ==> 
	         ($Unbox(read($h, read($h, __relationship, UML$Relationship.relatedElement), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __relationship, UML$Relationship.relatedElement), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __relationship, UML$Relationship.relatedElement), IndexField(__i))): ref)<:UML$Element) ) ) )
	  )
	)
	&&(forall __removestructuralfeaturevalueaction : ref ::
	  (__removestructuralfeaturevalueaction!=null && read($h, __removestructuralfeaturevalueaction, alloc) && dtype(__removestructuralfeaturevalueaction) <: UML$RemoveStructuralFeatureValueAction ==> 
	 true &&
	    (read($h, __removestructuralfeaturevalueaction, UML$RemoveStructuralFeatureValueAction.removeAt)!=null && read($h, read($h, __removestructuralfeaturevalueaction, UML$RemoveStructuralFeatureValueAction.removeAt) ,alloc) ==>
	       dtype(read($h, __removestructuralfeaturevalueaction, UML$RemoveStructuralFeatureValueAction.removeAt)) <: UML$InputPin ) 
	  )
	)
	&&(forall __removevariablevalueaction : ref ::
	  (__removevariablevalueaction!=null && read($h, __removevariablevalueaction, alloc) && dtype(__removevariablevalueaction) <: UML$RemoveVariableValueAction ==> 
	 true &&
	    (read($h, __removevariablevalueaction, UML$RemoveVariableValueAction.removeAt)!=null && read($h, read($h, __removevariablevalueaction, UML$RemoveVariableValueAction.removeAt) ,alloc) ==>
	       dtype(read($h, __removevariablevalueaction, UML$RemoveVariableValueAction.removeAt)) <: UML$InputPin ) 
	  )
	)
	&&(forall __replyaction : ref ::
	  (__replyaction!=null && read($h, __replyaction, alloc) && dtype(__replyaction) <: UML$ReplyAction ==> 
	    (read($h, __replyaction, UML$ReplyAction.replyToCall)!=null && read($h, read($h, __replyaction, UML$ReplyAction.replyToCall) ,alloc) ==>
	       dtype(read($h, __replyaction, UML$ReplyAction.replyToCall)) <: UML$Trigger ) &&
	    (read($h, __replyaction, UML$ReplyAction.replyValue)==null || (read($h, read($h, __replyaction, UML$ReplyAction.replyValue), alloc) && dtype(read($h, __replyaction, UML$ReplyAction.replyValue)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __replyaction, UML$ReplyAction.replyValue)) ==> 
	         ($Unbox(read($h, read($h, __replyaction, UML$ReplyAction.replyValue), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __replyaction, UML$ReplyAction.replyValue), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __replyaction, UML$ReplyAction.replyValue), IndexField(__i))): ref)<:UML$InputPin) ) ) )&&
	    (read($h, __replyaction, UML$ReplyAction.returnInformation)!=null && read($h, read($h, __replyaction, UML$ReplyAction.returnInformation) ,alloc) ==>
	       dtype(read($h, __replyaction, UML$ReplyAction.returnInformation)) <: UML$InputPin ) 
	  )
	)
	&&(forall __sendobjectaction : ref ::
	  (__sendobjectaction!=null && read($h, __sendobjectaction, alloc) && dtype(__sendobjectaction) <: UML$SendObjectAction ==> 
	    (read($h, __sendobjectaction, UML$SendObjectAction.request)!=null && read($h, read($h, __sendobjectaction, UML$SendObjectAction.request) ,alloc) ==>
	       dtype(read($h, __sendobjectaction, UML$SendObjectAction.request)) <: UML$InputPin ) &&
	    (read($h, __sendobjectaction, UML$SendObjectAction.target)!=null && read($h, read($h, __sendobjectaction, UML$SendObjectAction.target) ,alloc) ==>
	       dtype(read($h, __sendobjectaction, UML$SendObjectAction.target)) <: UML$InputPin ) 
	  )
	)
	&&(forall __sendsignalaction : ref ::
	  (__sendsignalaction!=null && read($h, __sendsignalaction, alloc) && dtype(__sendsignalaction) <: UML$SendSignalAction ==> 
	    (read($h, __sendsignalaction, UML$SendSignalAction.signal)!=null && read($h, read($h, __sendsignalaction, UML$SendSignalAction.signal) ,alloc) ==>
	       dtype(read($h, __sendsignalaction, UML$SendSignalAction.signal)) <: UML$Signal ) &&
	    (read($h, __sendsignalaction, UML$SendSignalAction.target)!=null && read($h, read($h, __sendsignalaction, UML$SendSignalAction.target) ,alloc) ==>
	       dtype(read($h, __sendsignalaction, UML$SendSignalAction.target)) <: UML$InputPin ) 
	  )
	)
	&&(forall __sequencenode : ref ::
	  (__sequencenode!=null && read($h, __sequencenode, alloc) && dtype(__sequencenode) <: UML$SequenceNode ==> 
	    (read($h, __sequencenode, UML$SequenceNode.executableNode)==null || (read($h, read($h, __sequencenode, UML$SequenceNode.executableNode), alloc) && dtype(read($h, __sequencenode, UML$SequenceNode.executableNode)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __sequencenode, UML$SequenceNode.executableNode)) ==> 
	         ($Unbox(read($h, read($h, __sequencenode, UML$SequenceNode.executableNode), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __sequencenode, UML$SequenceNode.executableNode), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __sequencenode, UML$SequenceNode.executableNode), IndexField(__i))): ref)<:UML$ExecutableNode) ) ) )
	  )
	)
	&&(forall __signal : ref ::
	  (__signal!=null && read($h, __signal, alloc) && dtype(__signal) <: UML$Signal ==> 
	    (read($h, __signal, UML$Signal.ownedAttribute)==null || (read($h, read($h, __signal, UML$Signal.ownedAttribute), alloc) && dtype(read($h, __signal, UML$Signal.ownedAttribute)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __signal, UML$Signal.ownedAttribute)) ==> 
	         ($Unbox(read($h, read($h, __signal, UML$Signal.ownedAttribute), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __signal, UML$Signal.ownedAttribute), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __signal, UML$Signal.ownedAttribute), IndexField(__i))): ref)<:UML$Property) ) ) )
	  )
	)
	&&(forall __signalevent : ref ::
	  (__signalevent!=null && read($h, __signalevent, alloc) && dtype(__signalevent) <: UML$SignalEvent ==> 
	    (read($h, __signalevent, UML$SignalEvent.signal)!=null && read($h, read($h, __signalevent, UML$SignalEvent.signal) ,alloc) ==>
	       dtype(read($h, __signalevent, UML$SignalEvent.signal)) <: UML$Signal ) 
	  )
	)
	&&(forall __slot : ref ::
	  (__slot!=null && read($h, __slot, alloc) && dtype(__slot) <: UML$Slot ==> 
	    (read($h, __slot, UML$Slot.definingFeature)!=null && read($h, read($h, __slot, UML$Slot.definingFeature) ,alloc) ==>
	       dtype(read($h, __slot, UML$Slot.definingFeature)) <: UML$StructuralFeature ) &&
	    (read($h, __slot, UML$Slot.owningInstance)!=null && read($h, read($h, __slot, UML$Slot.owningInstance) ,alloc) ==>
	       dtype(read($h, __slot, UML$Slot.owningInstance)) <: UML$InstanceSpecification ) &&
	    (read($h, __slot, UML$Slot.value)==null || (read($h, read($h, __slot, UML$Slot.value), alloc) && dtype(read($h, __slot, UML$Slot.value)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __slot, UML$Slot.value)) ==> 
	         ($Unbox(read($h, read($h, __slot, UML$Slot.value), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __slot, UML$Slot.value), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __slot, UML$Slot.value), IndexField(__i))): ref)<:UML$ValueSpecification) ) ) )
	  )
	)
	&&(forall __startclassifierbehavioraction : ref ::
	  (__startclassifierbehavioraction!=null && read($h, __startclassifierbehavioraction, alloc) && dtype(__startclassifierbehavioraction) <: UML$StartClassifierBehaviorAction ==> 
	    (read($h, __startclassifierbehavioraction, UML$StartClassifierBehaviorAction.object)!=null && read($h, read($h, __startclassifierbehavioraction, UML$StartClassifierBehaviorAction.object) ,alloc) ==>
	       dtype(read($h, __startclassifierbehavioraction, UML$StartClassifierBehaviorAction.object)) <: UML$InputPin ) 
	  )
	)
	&&(forall __startobjectbehavioraction : ref ::
	  (__startobjectbehavioraction!=null && read($h, __startobjectbehavioraction, alloc) && dtype(__startobjectbehavioraction) <: UML$StartObjectBehaviorAction ==> 
	    (read($h, __startobjectbehavioraction, UML$StartObjectBehaviorAction.object)!=null && read($h, read($h, __startobjectbehavioraction, UML$StartObjectBehaviorAction.object) ,alloc) ==>
	       dtype(read($h, __startobjectbehavioraction, UML$StartObjectBehaviorAction.object)) <: UML$InputPin ) 
	  )
	)
	&&(forall __state : ref ::
	  (__state!=null && read($h, __state, alloc) && dtype(__state) <: UML$State ==> 
	    (read($h, __state, UML$State.connection)==null || (read($h, read($h, __state, UML$State.connection), alloc) && dtype(read($h, __state, UML$State.connection)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __state, UML$State.connection)) ==> 
	         ($Unbox(read($h, read($h, __state, UML$State.connection), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __state, UML$State.connection), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __state, UML$State.connection), IndexField(__i))): ref)<:UML$ConnectionPointReference) ) ) )&&
	    (read($h, __state, UML$State.connectionPoint)==null || (read($h, read($h, __state, UML$State.connectionPoint), alloc) && dtype(read($h, __state, UML$State.connectionPoint)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __state, UML$State.connectionPoint)) ==> 
	         ($Unbox(read($h, read($h, __state, UML$State.connectionPoint), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __state, UML$State.connectionPoint), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __state, UML$State.connectionPoint), IndexField(__i))): ref)<:UML$Pseudostate) ) ) )&&
	    (read($h, __state, UML$State.deferrableTrigger)==null || (read($h, read($h, __state, UML$State.deferrableTrigger), alloc) && dtype(read($h, __state, UML$State.deferrableTrigger)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __state, UML$State.deferrableTrigger)) ==> 
	         ($Unbox(read($h, read($h, __state, UML$State.deferrableTrigger), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __state, UML$State.deferrableTrigger), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __state, UML$State.deferrableTrigger), IndexField(__i))): ref)<:UML$Trigger) ) ) )&&
	    (read($h, __state, UML$State.doActivity)!=null && read($h, read($h, __state, UML$State.doActivity) ,alloc) ==>
	       dtype(read($h, __state, UML$State.doActivity)) <: UML$Behavior ) &&
	    (read($h, __state, UML$State.entry)!=null && read($h, read($h, __state, UML$State.entry) ,alloc) ==>
	       dtype(read($h, __state, UML$State.entry)) <: UML$Behavior ) &&
	    (read($h, __state, UML$State.exit)!=null && read($h, read($h, __state, UML$State.exit) ,alloc) ==>
	       dtype(read($h, __state, UML$State.exit)) <: UML$Behavior ) &&
	 true &&
	 true &&
	 true &&
	 true &&
	    (read($h, __state, UML$State.redefinedState)!=null && read($h, read($h, __state, UML$State.redefinedState) ,alloc) ==>
	       dtype(read($h, __state, UML$State.redefinedState)) <: UML$State ) &&
	    (read($h, __state, UML$State.region)==null || (read($h, read($h, __state, UML$State.region), alloc) && dtype(read($h, __state, UML$State.region)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __state, UML$State.region)) ==> 
	         ($Unbox(read($h, read($h, __state, UML$State.region), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __state, UML$State.region), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __state, UML$State.region), IndexField(__i))): ref)<:UML$Region) ) ) )&&
	    (read($h, __state, UML$State.stateInvariant)!=null && read($h, read($h, __state, UML$State.stateInvariant) ,alloc) ==>
	       dtype(read($h, __state, UML$State.stateInvariant)) <: UML$Constraint ) &&
	    (read($h, __state, UML$State.submachine)!=null && read($h, read($h, __state, UML$State.submachine) ,alloc) ==>
	       dtype(read($h, __state, UML$State.submachine)) <: UML$StateMachine ) 
	  )
	)
	&&(forall __stateinvariant : ref ::
	  (__stateinvariant!=null && read($h, __stateinvariant, alloc) && dtype(__stateinvariant) <: UML$StateInvariant ==> 
	    (read($h, __stateinvariant, UML$StateInvariant.invariant)!=null && read($h, read($h, __stateinvariant, UML$StateInvariant.invariant) ,alloc) ==>
	       dtype(read($h, __stateinvariant, UML$StateInvariant.invariant)) <: UML$Constraint ) 
	  )
	)
	&&(forall __statemachine : ref ::
	  (__statemachine!=null && read($h, __statemachine, alloc) && dtype(__statemachine) <: UML$StateMachine ==> 
	    (read($h, __statemachine, UML$StateMachine.connectionPoint)==null || (read($h, read($h, __statemachine, UML$StateMachine.connectionPoint), alloc) && dtype(read($h, __statemachine, UML$StateMachine.connectionPoint)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __statemachine, UML$StateMachine.connectionPoint)) ==> 
	         ($Unbox(read($h, read($h, __statemachine, UML$StateMachine.connectionPoint), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __statemachine, UML$StateMachine.connectionPoint), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __statemachine, UML$StateMachine.connectionPoint), IndexField(__i))): ref)<:UML$Pseudostate) ) ) )&&
	    (read($h, __statemachine, UML$StateMachine.extendedStateMachine)==null || (read($h, read($h, __statemachine, UML$StateMachine.extendedStateMachine), alloc) && dtype(read($h, __statemachine, UML$StateMachine.extendedStateMachine)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __statemachine, UML$StateMachine.extendedStateMachine)) ==> 
	         ($Unbox(read($h, read($h, __statemachine, UML$StateMachine.extendedStateMachine), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __statemachine, UML$StateMachine.extendedStateMachine), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __statemachine, UML$StateMachine.extendedStateMachine), IndexField(__i))): ref)<:UML$StateMachine) ) ) )&&
	    (read($h, __statemachine, UML$StateMachine.region)==null || (read($h, read($h, __statemachine, UML$StateMachine.region), alloc) && dtype(read($h, __statemachine, UML$StateMachine.region)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __statemachine, UML$StateMachine.region)) ==> 
	         ($Unbox(read($h, read($h, __statemachine, UML$StateMachine.region), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __statemachine, UML$StateMachine.region), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __statemachine, UML$StateMachine.region), IndexField(__i))): ref)<:UML$Region) ) ) )&&
	    (read($h, __statemachine, UML$StateMachine.submachineState)==null || (read($h, read($h, __statemachine, UML$StateMachine.submachineState), alloc) && dtype(read($h, __statemachine, UML$StateMachine.submachineState)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __statemachine, UML$StateMachine.submachineState)) ==> 
	         ($Unbox(read($h, read($h, __statemachine, UML$StateMachine.submachineState), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __statemachine, UML$StateMachine.submachineState), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __statemachine, UML$StateMachine.submachineState), IndexField(__i))): ref)<:UML$State) ) ) )
	  )
	)
	&&(forall __stereotype : ref ::
	  (__stereotype!=null && read($h, __stereotype, alloc) && dtype(__stereotype) <: UML$Stereotype ==> 
	    (read($h, __stereotype, UML$Stereotype.icon)==null || (read($h, read($h, __stereotype, UML$Stereotype.icon), alloc) && dtype(read($h, __stereotype, UML$Stereotype.icon)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __stereotype, UML$Stereotype.icon)) ==> 
	         ($Unbox(read($h, read($h, __stereotype, UML$Stereotype.icon), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __stereotype, UML$Stereotype.icon), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __stereotype, UML$Stereotype.icon), IndexField(__i))): ref)<:UML$Image) ) ) )&&
	    (read($h, __stereotype, UML$Stereotype.profile)!=null && read($h, read($h, __stereotype, UML$Stereotype.profile) ,alloc) ==>
	       dtype(read($h, __stereotype, UML$Stereotype.profile)) <: UML$Profile ) 
	  )
	)
	&&(forall __stringexpression : ref ::
	  (__stringexpression!=null && read($h, __stringexpression, alloc) && dtype(__stringexpression) <: UML$StringExpression ==> 
	    (read($h, __stringexpression, UML$StringExpression.owningExpression)!=null && read($h, read($h, __stringexpression, UML$StringExpression.owningExpression) ,alloc) ==>
	       dtype(read($h, __stringexpression, UML$StringExpression.owningExpression)) <: UML$StringExpression ) &&
	    (read($h, __stringexpression, UML$StringExpression.subExpression)==null || (read($h, read($h, __stringexpression, UML$StringExpression.subExpression), alloc) && dtype(read($h, __stringexpression, UML$StringExpression.subExpression)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __stringexpression, UML$StringExpression.subExpression)) ==> 
	         ($Unbox(read($h, read($h, __stringexpression, UML$StringExpression.subExpression), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __stringexpression, UML$StringExpression.subExpression), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __stringexpression, UML$StringExpression.subExpression), IndexField(__i))): ref)<:UML$StringExpression) ) ) )
	  )
	)
	&&(forall __structuralfeature : ref ::
	  (__structuralfeature!=null && read($h, __structuralfeature, alloc) && dtype(__structuralfeature) <: UML$StructuralFeature ==> 
	 true 
	  )
	)
	&&(forall __structuralfeatureaction : ref ::
	  (__structuralfeatureaction!=null && read($h, __structuralfeatureaction, alloc) && dtype(__structuralfeatureaction) <: UML$StructuralFeatureAction ==> 
	    (read($h, __structuralfeatureaction, UML$StructuralFeatureAction.object)!=null && read($h, read($h, __structuralfeatureaction, UML$StructuralFeatureAction.object) ,alloc) ==>
	       dtype(read($h, __structuralfeatureaction, UML$StructuralFeatureAction.object)) <: UML$InputPin ) &&
	    (read($h, __structuralfeatureaction, UML$StructuralFeatureAction.structuralFeature)!=null && read($h, read($h, __structuralfeatureaction, UML$StructuralFeatureAction.structuralFeature) ,alloc) ==>
	       dtype(read($h, __structuralfeatureaction, UML$StructuralFeatureAction.structuralFeature)) <: UML$StructuralFeature ) 
	  )
	)
	&&(forall __structuredactivitynode : ref ::
	  (__structuredactivitynode!=null && read($h, __structuredactivitynode, alloc) && dtype(__structuredactivitynode) <: UML$StructuredActivityNode ==> 
	    (read($h, __structuredactivitynode, UML$StructuredActivityNode.edge)==null || (read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.edge), alloc) && dtype(read($h, __structuredactivitynode, UML$StructuredActivityNode.edge)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __structuredactivitynode, UML$StructuredActivityNode.edge)) ==> 
	         ($Unbox(read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.edge), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.edge), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.edge), IndexField(__i))): ref)<:UML$ActivityEdge) ) ) )&&
	 true &&
	    (read($h, __structuredactivitynode, UML$StructuredActivityNode.node)==null || (read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.node), alloc) && dtype(read($h, __structuredactivitynode, UML$StructuredActivityNode.node)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __structuredactivitynode, UML$StructuredActivityNode.node)) ==> 
	         ($Unbox(read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.node), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.node), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.node), IndexField(__i))): ref)<:UML$ActivityNode) ) ) )&&
	    (read($h, __structuredactivitynode, UML$StructuredActivityNode.structuredNodeInput)==null || (read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.structuredNodeInput), alloc) && dtype(read($h, __structuredactivitynode, UML$StructuredActivityNode.structuredNodeInput)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __structuredactivitynode, UML$StructuredActivityNode.structuredNodeInput)) ==> 
	         ($Unbox(read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.structuredNodeInput), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.structuredNodeInput), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.structuredNodeInput), IndexField(__i))): ref)<:UML$InputPin) ) ) )&&
	    (read($h, __structuredactivitynode, UML$StructuredActivityNode.structuredNodeOutput)==null || (read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.structuredNodeOutput), alloc) && dtype(read($h, __structuredactivitynode, UML$StructuredActivityNode.structuredNodeOutput)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __structuredactivitynode, UML$StructuredActivityNode.structuredNodeOutput)) ==> 
	         ($Unbox(read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.structuredNodeOutput), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.structuredNodeOutput), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.structuredNodeOutput), IndexField(__i))): ref)<:UML$OutputPin) ) ) )&&
	    (read($h, __structuredactivitynode, UML$StructuredActivityNode.variable)==null || (read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.variable), alloc) && dtype(read($h, __structuredactivitynode, UML$StructuredActivityNode.variable)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __structuredactivitynode, UML$StructuredActivityNode.variable)) ==> 
	         ($Unbox(read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.variable), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.variable), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __structuredactivitynode, UML$StructuredActivityNode.variable), IndexField(__i))): ref)<:UML$Variable) ) ) )
	  )
	)
	&&(forall __structuredclassifier : ref ::
	  (__structuredclassifier!=null && read($h, __structuredclassifier, alloc) && dtype(__structuredclassifier) <: UML$StructuredClassifier ==> 
	    (read($h, __structuredclassifier, UML$StructuredClassifier.ownedAttribute)==null || (read($h, read($h, __structuredclassifier, UML$StructuredClassifier.ownedAttribute), alloc) && dtype(read($h, __structuredclassifier, UML$StructuredClassifier.ownedAttribute)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __structuredclassifier, UML$StructuredClassifier.ownedAttribute)) ==> 
	         ($Unbox(read($h, read($h, __structuredclassifier, UML$StructuredClassifier.ownedAttribute), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __structuredclassifier, UML$StructuredClassifier.ownedAttribute), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __structuredclassifier, UML$StructuredClassifier.ownedAttribute), IndexField(__i))): ref)<:UML$Property) ) ) )&&
	    (read($h, __structuredclassifier, UML$StructuredClassifier.ownedConnector)==null || (read($h, read($h, __structuredclassifier, UML$StructuredClassifier.ownedConnector), alloc) && dtype(read($h, __structuredclassifier, UML$StructuredClassifier.ownedConnector)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __structuredclassifier, UML$StructuredClassifier.ownedConnector)) ==> 
	         ($Unbox(read($h, read($h, __structuredclassifier, UML$StructuredClassifier.ownedConnector), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __structuredclassifier, UML$StructuredClassifier.ownedConnector), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __structuredclassifier, UML$StructuredClassifier.ownedConnector), IndexField(__i))): ref)<:UML$Connector) ) ) )&&
	    (read($h, __structuredclassifier, UML$StructuredClassifier.part)==null || (read($h, read($h, __structuredclassifier, UML$StructuredClassifier.part), alloc) && dtype(read($h, __structuredclassifier, UML$StructuredClassifier.part)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __structuredclassifier, UML$StructuredClassifier.part)) ==> 
	         ($Unbox(read($h, read($h, __structuredclassifier, UML$StructuredClassifier.part), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __structuredclassifier, UML$StructuredClassifier.part), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __structuredclassifier, UML$StructuredClassifier.part), IndexField(__i))): ref)<:UML$Property) ) ) )&&
	    (read($h, __structuredclassifier, UML$StructuredClassifier.role)==null || (read($h, read($h, __structuredclassifier, UML$StructuredClassifier.role), alloc) && dtype(read($h, __structuredclassifier, UML$StructuredClassifier.role)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __structuredclassifier, UML$StructuredClassifier.role)) ==> 
	         ($Unbox(read($h, read($h, __structuredclassifier, UML$StructuredClassifier.role), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __structuredclassifier, UML$StructuredClassifier.role), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __structuredclassifier, UML$StructuredClassifier.role), IndexField(__i))): ref)<:UML$ConnectableElement) ) ) )
	  )
	)
	&&(forall __substitution : ref ::
	  (__substitution!=null && read($h, __substitution, alloc) && dtype(__substitution) <: UML$Substitution ==> 
	    (read($h, __substitution, UML$Substitution.contract)!=null && read($h, read($h, __substitution, UML$Substitution.contract) ,alloc) ==>
	       dtype(read($h, __substitution, UML$Substitution.contract)) <: UML$Classifier ) &&
	    (read($h, __substitution, UML$Substitution.substitutingClassifier)!=null && read($h, read($h, __substitution, UML$Substitution.substitutingClassifier) ,alloc) ==>
	       dtype(read($h, __substitution, UML$Substitution.substitutingClassifier)) <: UML$Classifier ) 
	  )
	)
	&&(forall __templatebinding : ref ::
	  (__templatebinding!=null && read($h, __templatebinding, alloc) && dtype(__templatebinding) <: UML$TemplateBinding ==> 
	    (read($h, __templatebinding, UML$TemplateBinding.boundElement)!=null && read($h, read($h, __templatebinding, UML$TemplateBinding.boundElement) ,alloc) ==>
	       dtype(read($h, __templatebinding, UML$TemplateBinding.boundElement)) <: UML$TemplateableElement ) &&
	    (read($h, __templatebinding, UML$TemplateBinding.parameterSubstitution)==null || (read($h, read($h, __templatebinding, UML$TemplateBinding.parameterSubstitution), alloc) && dtype(read($h, __templatebinding, UML$TemplateBinding.parameterSubstitution)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __templatebinding, UML$TemplateBinding.parameterSubstitution)) ==> 
	         ($Unbox(read($h, read($h, __templatebinding, UML$TemplateBinding.parameterSubstitution), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __templatebinding, UML$TemplateBinding.parameterSubstitution), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __templatebinding, UML$TemplateBinding.parameterSubstitution), IndexField(__i))): ref)<:UML$TemplateParameterSubstitution) ) ) )&&
	    (read($h, __templatebinding, UML$TemplateBinding.signature)!=null && read($h, read($h, __templatebinding, UML$TemplateBinding.signature) ,alloc) ==>
	       dtype(read($h, __templatebinding, UML$TemplateBinding.signature)) <: UML$TemplateSignature ) 
	  )
	)
	&&(forall __templateparameter : ref ::
	  (__templateparameter!=null && read($h, __templateparameter, alloc) && dtype(__templateparameter) <: UML$TemplateParameter ==> 
	    (read($h, __templateparameter, UML$TemplateParameter.default)!=null && read($h, read($h, __templateparameter, UML$TemplateParameter.default) ,alloc) ==>
	       dtype(read($h, __templateparameter, UML$TemplateParameter.default)) <: UML$ParameterableElement ) &&
	    (read($h, __templateparameter, UML$TemplateParameter.ownedDefault)!=null && read($h, read($h, __templateparameter, UML$TemplateParameter.ownedDefault) ,alloc) ==>
	       dtype(read($h, __templateparameter, UML$TemplateParameter.ownedDefault)) <: UML$ParameterableElement ) &&
	    (read($h, __templateparameter, UML$TemplateParameter.ownedParameteredElement)!=null && read($h, read($h, __templateparameter, UML$TemplateParameter.ownedParameteredElement) ,alloc) ==>
	       dtype(read($h, __templateparameter, UML$TemplateParameter.ownedParameteredElement)) <: UML$ParameterableElement ) &&
	    (read($h, __templateparameter, UML$TemplateParameter.parameteredElement)!=null && read($h, read($h, __templateparameter, UML$TemplateParameter.parameteredElement) ,alloc) ==>
	       dtype(read($h, __templateparameter, UML$TemplateParameter.parameteredElement)) <: UML$ParameterableElement ) &&
	    (read($h, __templateparameter, UML$TemplateParameter.signature)!=null && read($h, read($h, __templateparameter, UML$TemplateParameter.signature) ,alloc) ==>
	       dtype(read($h, __templateparameter, UML$TemplateParameter.signature)) <: UML$TemplateSignature ) 
	  )
	)
	&&(forall __templateparametersubstitution : ref ::
	  (__templateparametersubstitution!=null && read($h, __templateparametersubstitution, alloc) && dtype(__templateparametersubstitution) <: UML$TemplateParameterSubstitution ==> 
	    (read($h, __templateparametersubstitution, UML$TemplateParameterSubstitution.actual)!=null && read($h, read($h, __templateparametersubstitution, UML$TemplateParameterSubstitution.actual) ,alloc) ==>
	       dtype(read($h, __templateparametersubstitution, UML$TemplateParameterSubstitution.actual)) <: UML$ParameterableElement ) &&
	    (read($h, __templateparametersubstitution, UML$TemplateParameterSubstitution.formal)!=null && read($h, read($h, __templateparametersubstitution, UML$TemplateParameterSubstitution.formal) ,alloc) ==>
	       dtype(read($h, __templateparametersubstitution, UML$TemplateParameterSubstitution.formal)) <: UML$TemplateParameter ) &&
	    (read($h, __templateparametersubstitution, UML$TemplateParameterSubstitution.ownedActual)!=null && read($h, read($h, __templateparametersubstitution, UML$TemplateParameterSubstitution.ownedActual) ,alloc) ==>
	       dtype(read($h, __templateparametersubstitution, UML$TemplateParameterSubstitution.ownedActual)) <: UML$ParameterableElement ) &&
	    (read($h, __templateparametersubstitution, UML$TemplateParameterSubstitution.templateBinding)!=null && read($h, read($h, __templateparametersubstitution, UML$TemplateParameterSubstitution.templateBinding) ,alloc) ==>
	       dtype(read($h, __templateparametersubstitution, UML$TemplateParameterSubstitution.templateBinding)) <: UML$TemplateBinding ) 
	  )
	)
	&&(forall __templatesignature : ref ::
	  (__templatesignature!=null && read($h, __templatesignature, alloc) && dtype(__templatesignature) <: UML$TemplateSignature ==> 
	    (read($h, __templatesignature, UML$TemplateSignature.ownedParameter)==null || (read($h, read($h, __templatesignature, UML$TemplateSignature.ownedParameter), alloc) && dtype(read($h, __templatesignature, UML$TemplateSignature.ownedParameter)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __templatesignature, UML$TemplateSignature.ownedParameter)) ==> 
	         ($Unbox(read($h, read($h, __templatesignature, UML$TemplateSignature.ownedParameter), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __templatesignature, UML$TemplateSignature.ownedParameter), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __templatesignature, UML$TemplateSignature.ownedParameter), IndexField(__i))): ref)<:UML$TemplateParameter) ) ) )&&
	    (read($h, __templatesignature, UML$TemplateSignature.parameter)==null || (read($h, read($h, __templatesignature, UML$TemplateSignature.parameter), alloc) && dtype(read($h, __templatesignature, UML$TemplateSignature.parameter)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __templatesignature, UML$TemplateSignature.parameter)) ==> 
	         ($Unbox(read($h, read($h, __templatesignature, UML$TemplateSignature.parameter), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __templatesignature, UML$TemplateSignature.parameter), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __templatesignature, UML$TemplateSignature.parameter), IndexField(__i))): ref)<:UML$TemplateParameter) ) ) )&&
	    (read($h, __templatesignature, UML$TemplateSignature.template)!=null && read($h, read($h, __templatesignature, UML$TemplateSignature.template) ,alloc) ==>
	       dtype(read($h, __templatesignature, UML$TemplateSignature.template)) <: UML$TemplateableElement ) 
	  )
	)
	&&(forall __templateableelement : ref ::
	  (__templateableelement!=null && read($h, __templateableelement, alloc) && dtype(__templateableelement) <: UML$TemplateableElement ==> 
	    (read($h, __templateableelement, UML$TemplateableElement.ownedTemplateSignature)!=null && read($h, read($h, __templateableelement, UML$TemplateableElement.ownedTemplateSignature) ,alloc) ==>
	       dtype(read($h, __templateableelement, UML$TemplateableElement.ownedTemplateSignature)) <: UML$TemplateSignature ) &&
	    (read($h, __templateableelement, UML$TemplateableElement.templateBinding)==null || (read($h, read($h, __templateableelement, UML$TemplateableElement.templateBinding), alloc) && dtype(read($h, __templateableelement, UML$TemplateableElement.templateBinding)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __templateableelement, UML$TemplateableElement.templateBinding)) ==> 
	         ($Unbox(read($h, read($h, __templateableelement, UML$TemplateableElement.templateBinding), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __templateableelement, UML$TemplateableElement.templateBinding), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __templateableelement, UML$TemplateableElement.templateBinding), IndexField(__i))): ref)<:UML$TemplateBinding) ) ) )
	  )
	)
	&&(forall __testidentityaction : ref ::
	  (__testidentityaction!=null && read($h, __testidentityaction, alloc) && dtype(__testidentityaction) <: UML$TestIdentityAction ==> 
	    (read($h, __testidentityaction, UML$TestIdentityAction.first)!=null && read($h, read($h, __testidentityaction, UML$TestIdentityAction.first) ,alloc) ==>
	       dtype(read($h, __testidentityaction, UML$TestIdentityAction.first)) <: UML$InputPin ) &&
	    (read($h, __testidentityaction, UML$TestIdentityAction.result)!=null && read($h, read($h, __testidentityaction, UML$TestIdentityAction.result) ,alloc) ==>
	       dtype(read($h, __testidentityaction, UML$TestIdentityAction.result)) <: UML$OutputPin ) &&
	    (read($h, __testidentityaction, UML$TestIdentityAction.second)!=null && read($h, read($h, __testidentityaction, UML$TestIdentityAction.second) ,alloc) ==>
	       dtype(read($h, __testidentityaction, UML$TestIdentityAction.second)) <: UML$InputPin ) 
	  )
	)
	&&(forall __timeconstraint : ref ::
	  (__timeconstraint!=null && read($h, __timeconstraint, alloc) && dtype(__timeconstraint) <: UML$TimeConstraint ==> 
	 true 
	  )
	)
	&&(forall __timeevent : ref ::
	  (__timeevent!=null && read($h, __timeevent, alloc) && dtype(__timeevent) <: UML$TimeEvent ==> 
	 true &&
	    (read($h, __timeevent, UML$TimeEvent.when)!=null && read($h, read($h, __timeevent, UML$TimeEvent.when) ,alloc) ==>
	       dtype(read($h, __timeevent, UML$TimeEvent.when)) <: UML$TimeExpression ) 
	  )
	)
	&&(forall __timeexpression : ref ::
	  (__timeexpression!=null && read($h, __timeexpression, alloc) && dtype(__timeexpression) <: UML$TimeExpression ==> 
	    (read($h, __timeexpression, UML$TimeExpression.expr)!=null && read($h, read($h, __timeexpression, UML$TimeExpression.expr) ,alloc) ==>
	       dtype(read($h, __timeexpression, UML$TimeExpression.expr)) <: UML$ValueSpecification ) &&
	    (read($h, __timeexpression, UML$TimeExpression.observation)==null || (read($h, read($h, __timeexpression, UML$TimeExpression.observation), alloc) && dtype(read($h, __timeexpression, UML$TimeExpression.observation)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __timeexpression, UML$TimeExpression.observation)) ==> 
	         ($Unbox(read($h, read($h, __timeexpression, UML$TimeExpression.observation), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __timeexpression, UML$TimeExpression.observation), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __timeexpression, UML$TimeExpression.observation), IndexField(__i))): ref)<:UML$Observation) ) ) )
	  )
	)
	&&(forall __timeinterval : ref ::
	  (__timeinterval!=null && read($h, __timeinterval, alloc) && dtype(__timeinterval) <: UML$TimeInterval ==> true
	  )
	)
	&&(forall __timeobservation : ref ::
	  (__timeobservation!=null && read($h, __timeobservation, alloc) && dtype(__timeobservation) <: UML$TimeObservation ==> 
	    (read($h, __timeobservation, UML$TimeObservation.event)!=null && read($h, read($h, __timeobservation, UML$TimeObservation.event) ,alloc) ==>
	       dtype(read($h, __timeobservation, UML$TimeObservation.event)) <: UML$NamedElement ) &&
	 true 
	  )
	)
	&&(forall __transition : ref ::
	  (__transition!=null && read($h, __transition, alloc) && dtype(__transition) <: UML$Transition ==> 
	    (read($h, __transition, UML$Transition.container)!=null && read($h, read($h, __transition, UML$Transition.container) ,alloc) ==>
	       dtype(read($h, __transition, UML$Transition.container)) <: UML$Region ) &&
	    (read($h, __transition, UML$Transition.effect)!=null && read($h, read($h, __transition, UML$Transition.effect) ,alloc) ==>
	       dtype(read($h, __transition, UML$Transition.effect)) <: UML$Behavior ) &&
	    (read($h, __transition, UML$Transition.guard)!=null && read($h, read($h, __transition, UML$Transition.guard) ,alloc) ==>
	       dtype(read($h, __transition, UML$Transition.guard)) <: UML$Constraint ) &&
	 true &&
	    (read($h, __transition, UML$Transition.redefinedTransition)!=null && read($h, read($h, __transition, UML$Transition.redefinedTransition) ,alloc) ==>
	       dtype(read($h, __transition, UML$Transition.redefinedTransition)) <: UML$Transition ) &&
	    (read($h, __transition, UML$Transition.source)!=null && read($h, read($h, __transition, UML$Transition.source) ,alloc) ==>
	       dtype(read($h, __transition, UML$Transition.source)) <: UML$Vertex ) &&
	    (read($h, __transition, UML$Transition.target)!=null && read($h, read($h, __transition, UML$Transition.target) ,alloc) ==>
	       dtype(read($h, __transition, UML$Transition.target)) <: UML$Vertex ) &&
	    (read($h, __transition, UML$Transition.trigger)==null || (read($h, read($h, __transition, UML$Transition.trigger), alloc) && dtype(read($h, __transition, UML$Transition.trigger)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __transition, UML$Transition.trigger)) ==> 
	         ($Unbox(read($h, read($h, __transition, UML$Transition.trigger), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __transition, UML$Transition.trigger), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __transition, UML$Transition.trigger), IndexField(__i))): ref)<:UML$Trigger) ) ) )
	  )
	)
	&&(forall __trigger : ref ::
	  (__trigger!=null && read($h, __trigger, alloc) && dtype(__trigger) <: UML$Trigger ==> 
	    (read($h, __trigger, UML$Trigger.event)!=null && read($h, read($h, __trigger, UML$Trigger.event) ,alloc) ==>
	       dtype(read($h, __trigger, UML$Trigger.event)) <: UML$Event ) &&
	    (read($h, __trigger, UML$Trigger.port)==null || (read($h, read($h, __trigger, UML$Trigger.port), alloc) && dtype(read($h, __trigger, UML$Trigger.port)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __trigger, UML$Trigger.port)) ==> 
	         ($Unbox(read($h, read($h, __trigger, UML$Trigger.port), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __trigger, UML$Trigger.port), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __trigger, UML$Trigger.port), IndexField(__i))): ref)<:UML$Port) ) ) )
	  )
	)
	&&(forall __type : ref ::
	  (__type!=null && read($h, __type, alloc) && dtype(__type) <: UML$Type ==> 
	    (read($h, __type, UML$Type.package)!=null && read($h, read($h, __type, UML$Type.package) ,alloc) ==>
	       dtype(read($h, __type, UML$Type.package)) <: UML$Package ) 
	  )
	)
	&&(forall __typedelement : ref ::
	  (__typedelement!=null && read($h, __typedelement, alloc) && dtype(__typedelement) <: UML$TypedElement ==> 
	    (read($h, __typedelement, UML$TypedElement.type)!=null && read($h, read($h, __typedelement, UML$TypedElement.type) ,alloc) ==>
	       dtype(read($h, __typedelement, UML$TypedElement.type)) <: UML$Type ) 
	  )
	)
	&&(forall __unmarshallaction : ref ::
	  (__unmarshallaction!=null && read($h, __unmarshallaction, alloc) && dtype(__unmarshallaction) <: UML$UnmarshallAction ==> 
	    (read($h, __unmarshallaction, UML$UnmarshallAction.object)!=null && read($h, read($h, __unmarshallaction, UML$UnmarshallAction.object) ,alloc) ==>
	       dtype(read($h, __unmarshallaction, UML$UnmarshallAction.object)) <: UML$InputPin ) &&
	    (read($h, __unmarshallaction, UML$UnmarshallAction.result)==null || (read($h, read($h, __unmarshallaction, UML$UnmarshallAction.result), alloc) && dtype(read($h, __unmarshallaction, UML$UnmarshallAction.result)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __unmarshallaction, UML$UnmarshallAction.result)) ==> 
	         ($Unbox(read($h, read($h, __unmarshallaction, UML$UnmarshallAction.result), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __unmarshallaction, UML$UnmarshallAction.result), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __unmarshallaction, UML$UnmarshallAction.result), IndexField(__i))): ref)<:UML$OutputPin) ) ) )&&
	    (read($h, __unmarshallaction, UML$UnmarshallAction.unmarshallType)!=null && read($h, read($h, __unmarshallaction, UML$UnmarshallAction.unmarshallType) ,alloc) ==>
	       dtype(read($h, __unmarshallaction, UML$UnmarshallAction.unmarshallType)) <: UML$Classifier ) 
	  )
	)
	&&(forall __usage : ref ::
	  (__usage!=null && read($h, __usage, alloc) && dtype(__usage) <: UML$Usage ==> true
	  )
	)
	&&(forall __usecase : ref ::
	  (__usecase!=null && read($h, __usecase, alloc) && dtype(__usecase) <: UML$UseCase ==> 
	    (read($h, __usecase, UML$UseCase.extend)==null || (read($h, read($h, __usecase, UML$UseCase.extend), alloc) && dtype(read($h, __usecase, UML$UseCase.extend)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __usecase, UML$UseCase.extend)) ==> 
	         ($Unbox(read($h, read($h, __usecase, UML$UseCase.extend), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __usecase, UML$UseCase.extend), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __usecase, UML$UseCase.extend), IndexField(__i))): ref)<:UML$Extend) ) ) )&&
	    (read($h, __usecase, UML$UseCase.extensionPoint)==null || (read($h, read($h, __usecase, UML$UseCase.extensionPoint), alloc) && dtype(read($h, __usecase, UML$UseCase.extensionPoint)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __usecase, UML$UseCase.extensionPoint)) ==> 
	         ($Unbox(read($h, read($h, __usecase, UML$UseCase.extensionPoint), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __usecase, UML$UseCase.extensionPoint), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __usecase, UML$UseCase.extensionPoint), IndexField(__i))): ref)<:UML$ExtensionPoint) ) ) )&&
	    (read($h, __usecase, UML$UseCase.include)==null || (read($h, read($h, __usecase, UML$UseCase.include), alloc) && dtype(read($h, __usecase, UML$UseCase.include)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __usecase, UML$UseCase.include)) ==> 
	         ($Unbox(read($h, read($h, __usecase, UML$UseCase.include), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __usecase, UML$UseCase.include), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __usecase, UML$UseCase.include), IndexField(__i))): ref)<:UML$Include) ) ) )&&
	    (read($h, __usecase, UML$UseCase.subject)==null || (read($h, read($h, __usecase, UML$UseCase.subject), alloc) && dtype(read($h, __usecase, UML$UseCase.subject)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __usecase, UML$UseCase.subject)) ==> 
	         ($Unbox(read($h, read($h, __usecase, UML$UseCase.subject), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __usecase, UML$UseCase.subject), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __usecase, UML$UseCase.subject), IndexField(__i))): ref)<:UML$Classifier) ) ) )
	  )
	)
	&&(forall __valuepin : ref ::
	  (__valuepin!=null && read($h, __valuepin, alloc) && dtype(__valuepin) <: UML$ValuePin ==> 
	    (read($h, __valuepin, UML$ValuePin.value)!=null && read($h, read($h, __valuepin, UML$ValuePin.value) ,alloc) ==>
	       dtype(read($h, __valuepin, UML$ValuePin.value)) <: UML$ValueSpecification ) 
	  )
	)
	&&(forall __valuespecification : ref ::
	  (__valuespecification!=null && read($h, __valuespecification, alloc) && dtype(__valuespecification) <: UML$ValueSpecification ==> true
	  )
	)
	&&(forall __valuespecificationaction : ref ::
	  (__valuespecificationaction!=null && read($h, __valuespecificationaction, alloc) && dtype(__valuespecificationaction) <: UML$ValueSpecificationAction ==> 
	    (read($h, __valuespecificationaction, UML$ValueSpecificationAction.result)!=null && read($h, read($h, __valuespecificationaction, UML$ValueSpecificationAction.result) ,alloc) ==>
	       dtype(read($h, __valuespecificationaction, UML$ValueSpecificationAction.result)) <: UML$OutputPin ) &&
	    (read($h, __valuespecificationaction, UML$ValueSpecificationAction.value)!=null && read($h, read($h, __valuespecificationaction, UML$ValueSpecificationAction.value) ,alloc) ==>
	       dtype(read($h, __valuespecificationaction, UML$ValueSpecificationAction.value)) <: UML$ValueSpecification ) 
	  )
	)
	&&(forall __variable : ref ::
	  (__variable!=null && read($h, __variable, alloc) && dtype(__variable) <: UML$Variable ==> 
	    (read($h, __variable, UML$Variable.activityScope)!=null && read($h, read($h, __variable, UML$Variable.activityScope) ,alloc) ==>
	       dtype(read($h, __variable, UML$Variable.activityScope)) <: UML$Activity ) &&
	    (read($h, __variable, UML$Variable.scope)!=null && read($h, read($h, __variable, UML$Variable.scope) ,alloc) ==>
	       dtype(read($h, __variable, UML$Variable.scope)) <: UML$StructuredActivityNode ) 
	  )
	)
	&&(forall __variableaction : ref ::
	  (__variableaction!=null && read($h, __variableaction, alloc) && dtype(__variableaction) <: UML$VariableAction ==> 
	    (read($h, __variableaction, UML$VariableAction.variable)!=null && read($h, read($h, __variableaction, UML$VariableAction.variable) ,alloc) ==>
	       dtype(read($h, __variableaction, UML$VariableAction.variable)) <: UML$Variable ) 
	  )
	)
	&&(forall __vertex : ref ::
	  (__vertex!=null && read($h, __vertex, alloc) && dtype(__vertex) <: UML$Vertex ==> 
	    (read($h, __vertex, UML$Vertex.container)!=null && read($h, read($h, __vertex, UML$Vertex.container) ,alloc) ==>
	       dtype(read($h, __vertex, UML$Vertex.container)) <: UML$Region ) &&
	    (read($h, __vertex, UML$Vertex.incoming)==null || (read($h, read($h, __vertex, UML$Vertex.incoming), alloc) && dtype(read($h, __vertex, UML$Vertex.incoming)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __vertex, UML$Vertex.incoming)) ==> 
	         ($Unbox(read($h, read($h, __vertex, UML$Vertex.incoming), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __vertex, UML$Vertex.incoming), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __vertex, UML$Vertex.incoming), IndexField(__i))): ref)<:UML$Transition) ) ) )&&
	    (read($h, __vertex, UML$Vertex.outgoing)==null || (read($h, read($h, __vertex, UML$Vertex.outgoing), alloc) && dtype(read($h, __vertex, UML$Vertex.outgoing)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __vertex, UML$Vertex.outgoing)) ==> 
	         ($Unbox(read($h, read($h, __vertex, UML$Vertex.outgoing), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __vertex, UML$Vertex.outgoing), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __vertex, UML$Vertex.outgoing), IndexField(__i))): ref)<:UML$Transition) ) ) )
	  )
	)
	&&(forall __writelinkaction : ref ::
	  (__writelinkaction!=null && read($h, __writelinkaction, alloc) && dtype(__writelinkaction) <: UML$WriteLinkAction ==> true
	  )
	)
	&&(forall __writestructuralfeatureaction : ref ::
	  (__writestructuralfeatureaction!=null && read($h, __writestructuralfeatureaction, alloc) && dtype(__writestructuralfeatureaction) <: UML$WriteStructuralFeatureAction ==> 
	    (read($h, __writestructuralfeatureaction, UML$WriteStructuralFeatureAction.result)!=null && read($h, read($h, __writestructuralfeatureaction, UML$WriteStructuralFeatureAction.result) ,alloc) ==>
	       dtype(read($h, __writestructuralfeatureaction, UML$WriteStructuralFeatureAction.result)) <: UML$OutputPin ) &&
	    (read($h, __writestructuralfeatureaction, UML$WriteStructuralFeatureAction.value)!=null && read($h, read($h, __writestructuralfeatureaction, UML$WriteStructuralFeatureAction.value) ,alloc) ==>
	       dtype(read($h, __writestructuralfeatureaction, UML$WriteStructuralFeatureAction.value)) <: UML$InputPin ) 
	  )
	)
	&&(forall __writevariableaction : ref ::
	  (__writevariableaction!=null && read($h, __writevariableaction, alloc) && dtype(__writevariableaction) <: UML$WriteVariableAction ==> 
	    (read($h, __writevariableaction, UML$WriteVariableAction.value)!=null && read($h, read($h, __writevariableaction, UML$WriteVariableAction.value) ,alloc) ==>
	       dtype(read($h, __writevariableaction, UML$WriteVariableAction.value)) <: UML$InputPin ) 
	  )
	)
} 
