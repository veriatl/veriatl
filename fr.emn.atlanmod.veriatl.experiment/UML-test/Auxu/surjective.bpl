// Eval: 
// calculate module depth : 1

// gen functions: getTarsBySrcs and its inverse
function getTarsBySrcs(Seq ref): ref;
function getTarsBySrcs_inverse(ref): Seq ref;
axiom (forall __refs: Seq ref :: { getTarsBySrcs(__refs) } getTarsBySrcs_inverse(getTarsBySrcs(__refs)) == __refs);
axiom getTarsBySrcs( Seq#Singleton(null) ) == null;


function surj_tar_model($s: HeapType, $t: HeapType): bool{		

(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Abstraction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Abstraction  &&
       printGuard_CopyAbstraction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$AcceptCallAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$AcceptCallAction  &&
       printGuard_CopyAcceptCallAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$AcceptEventAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$AcceptEventAction  &&
       printGuard_CopyAcceptEventAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ActionExecutionSpecification ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ActionExecutionSpecification  &&
       printGuard_CopyActionExecutionSpecification($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ActionInputPin ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ActionInputPin  &&
       printGuard_CopyActionInputPin($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Activity ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Activity  &&
       printGuard_CopyActivity($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ActivityFinalNode ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ActivityFinalNode  &&
       printGuard_CopyActivityFinalNode($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ActivityParameterNode ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ActivityParameterNode  &&
       printGuard_CopyActivityParameterNode($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ActivityPartition ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ActivityPartition  &&
       printGuard_CopyActivityPartition($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Actor ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Actor  &&
       printGuard_CopyActor($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$AddStructuralFeatureValueAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$AddStructuralFeatureValueAction  &&
       printGuard_CopyAddStructuralFeatureValueAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$AddVariableValueAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$AddVariableValueAction  &&
       printGuard_CopyAddVariableValueAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$AnyReceiveEvent ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$AnyReceiveEvent  &&
       printGuard_CopyAnyReceiveEvent($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Artifact ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Artifact  &&
       printGuard_CopyArtifact($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Association ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Association  &&
       printGuard_CopyAssociation($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$AssociationClass ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$AssociationClass  &&
       printGuard_CopyAssociationClass($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$BehaviorExecutionSpecification ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$BehaviorExecutionSpecification  &&
       printGuard_CopyBehaviorExecutionSpecification($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$BroadcastSignalAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$BroadcastSignalAction  &&
       printGuard_CopyBroadcastSignalAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$CallBehaviorAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$CallBehaviorAction  &&
       printGuard_CopyCallBehaviorAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$CallEvent ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$CallEvent  &&
       printGuard_CopyCallEvent($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$CallOperationAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$CallOperationAction  &&
       printGuard_CopyCallOperationAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$CentralBufferNode ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$CentralBufferNode  &&
       printGuard_CopyCentralBufferNode($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ChangeEvent ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ChangeEvent  &&
       printGuard_CopyChangeEvent($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Class ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Class  &&
       printGuard_CopyClass($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ClassifierTemplateParameter ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ClassifierTemplateParameter  &&
       printGuard_CopyClassifierTemplateParameter($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Clause ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Clause  &&
       printGuard_CopyClause($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ClearAssociationAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ClearAssociationAction  &&
       printGuard_CopyClearAssociationAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ClearStructuralFeatureAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ClearStructuralFeatureAction  &&
       printGuard_CopyClearStructuralFeatureAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ClearVariableAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ClearVariableAction  &&
       printGuard_CopyClearVariableAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Collaboration ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Collaboration  &&
       printGuard_CopyCollaboration($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$CollaborationUse ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$CollaborationUse  &&
       printGuard_CopyCollaborationUse($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$CombinedFragment ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$CombinedFragment  &&
       printGuard_CopyCombinedFragment($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Comment ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Comment  &&
       printGuard_CopyComment($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$CommunicationPath ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$CommunicationPath  &&
       printGuard_CopyCommunicationPath($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Component ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Component  &&
       printGuard_CopyComponent($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ComponentRealization ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ComponentRealization  &&
       printGuard_CopyComponentRealization($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ConditionalNode ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ConditionalNode  &&
       printGuard_CopyConditionalNode($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ConnectableElementTemplateParameter ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ConnectableElementTemplateParameter  &&
       printGuard_CopyConnectableElementTemplateParameter($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ConnectionPointReference ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ConnectionPointReference  &&
       printGuard_CopyConnectionPointReference($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Connector ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Connector  &&
       printGuard_CopyConnector($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ConnectorEnd ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ConnectorEnd  &&
       printGuard_CopyConnectorEnd($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ConsiderIgnoreFragment ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ConsiderIgnoreFragment  &&
       printGuard_CopyConsiderIgnoreFragment($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Constraint ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Constraint  &&
       printGuard_CopyConstraint($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Continuation ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Continuation  &&
       printGuard_CopyContinuation($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ControlFlow ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ControlFlow  &&
       printGuard_CopyControlFlow($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$CreateLinkAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$CreateLinkAction  &&
       printGuard_CopyCreateLinkAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$CreateLinkObjectAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$CreateLinkObjectAction  &&
       printGuard_CopyCreateLinkObjectAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$CreateObjectAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$CreateObjectAction  &&
       printGuard_CopyCreateObjectAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$DataStoreNode ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$DataStoreNode  &&
       printGuard_CopyDataStoreNode($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$DataType ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$DataType  &&
       printGuard_CopyDataType($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$DecisionNode ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$DecisionNode  &&
       printGuard_CopyDecisionNode($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Dependency ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Dependency  &&
       printGuard_CopyDependency($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Deployment ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Deployment  &&
       printGuard_CopyDeployment($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$DeploymentSpecification ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$DeploymentSpecification  &&
       printGuard_CopyDeploymentSpecification($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$DestroyLinkAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$DestroyLinkAction  &&
       printGuard_CopyDestroyLinkAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$DestroyObjectAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$DestroyObjectAction  &&
       printGuard_CopyDestroyObjectAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$DestructionOccurrenceSpecification ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$DestructionOccurrenceSpecification  &&
       printGuard_CopyDestructionOccurrenceSpecification($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Device ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Device  &&
       printGuard_CopyDevice($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Duration ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Duration  &&
       printGuard_CopyDuration($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$DurationConstraint ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$DurationConstraint  &&
       printGuard_CopyDurationConstraint($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$DurationInterval ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$DurationInterval  &&
       printGuard_CopyDurationInterval($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$DurationObservation ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$DurationObservation  &&
       printGuard_CopyDurationObservation($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ElementImport ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ElementImport  &&
       printGuard_CopyElementImport($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Enumeration ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Enumeration  &&
       printGuard_CopyEnumeration($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$EnumerationLiteral ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$EnumerationLiteral  &&
       printGuard_CopyEnumerationLiteral($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ExceptionHandler ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ExceptionHandler  &&
       printGuard_CopyExceptionHandler($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ExecutionEnvironment ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ExecutionEnvironment  &&
       printGuard_CopyExecutionEnvironment($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ExecutionOccurrenceSpecification ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ExecutionOccurrenceSpecification  &&
       printGuard_CopyExecutionOccurrenceSpecification($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ExpansionNode ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ExpansionNode  &&
       printGuard_CopyExpansionNode($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ExpansionRegion ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ExpansionRegion  &&
       printGuard_CopyExpansionRegion($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Expression ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Expression  &&
       printGuard_CopyExpression($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Extend ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Extend  &&
       printGuard_CopyExtend($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Extension ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Extension  &&
       printGuard_CopyExtension($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ExtensionEnd ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ExtensionEnd  &&
       printGuard_CopyExtensionEnd($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ExtensionPoint ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ExtensionPoint  &&
       printGuard_CopyExtensionPoint($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$FinalState ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$FinalState  &&
       printGuard_CopyFinalState($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$FlowFinalNode ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$FlowFinalNode  &&
       printGuard_CopyFlowFinalNode($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ForkNode ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ForkNode  &&
       printGuard_CopyForkNode($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$FunctionBehavior ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$FunctionBehavior  &&
       printGuard_CopyFunctionBehavior($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Gate ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Gate  &&
       printGuard_CopyGate($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$GeneralOrdering ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$GeneralOrdering  &&
       printGuard_CopyGeneralOrdering($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Generalization ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Generalization  &&
       printGuard_CopyGeneralization($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$GeneralizationSet ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$GeneralizationSet  &&
       printGuard_CopyGeneralizationSet($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Image ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Image  &&
       printGuard_CopyImage($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Include ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Include  &&
       printGuard_CopyInclude($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$InformationFlow ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$InformationFlow  &&
       printGuard_CopyInformationFlow($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$InformationItem ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$InformationItem  &&
       printGuard_CopyInformationItem($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$InitialNode ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$InitialNode  &&
       printGuard_CopyInitialNode($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$InputPin ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$InputPin  &&
       printGuard_CopyInputPin($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$InstanceSpecification ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$InstanceSpecification  &&
       printGuard_CopyInstanceSpecification($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$InstanceValue ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$InstanceValue  &&
       printGuard_CopyInstanceValue($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Interaction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Interaction  &&
       printGuard_CopyInteraction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$InteractionConstraint ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$InteractionConstraint  &&
       printGuard_CopyInteractionConstraint($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$InteractionOperand ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$InteractionOperand  &&
       printGuard_CopyInteractionOperand($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$InteractionUse ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$InteractionUse  &&
       printGuard_CopyInteractionUse($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Interface ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Interface  &&
       printGuard_CopyInterface($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$InterfaceRealization ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$InterfaceRealization  &&
       printGuard_CopyInterfaceRealization($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$InterruptibleActivityRegion ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$InterruptibleActivityRegion  &&
       printGuard_CopyInterruptibleActivityRegion($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Interval ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Interval  &&
       printGuard_CopyInterval($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$IntervalConstraint ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$IntervalConstraint  &&
       printGuard_CopyIntervalConstraint($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$JoinNode ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$JoinNode  &&
       printGuard_CopyJoinNode($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Lifeline ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Lifeline  &&
       printGuard_CopyLifeline($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$LinkEndCreationData ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$LinkEndCreationData  &&
       printGuard_CopyLinkEndCreationData($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$LinkEndData ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$LinkEndData  &&
       printGuard_CopyLinkEndData($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$LinkEndDestructionData ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$LinkEndDestructionData  &&
       printGuard_CopyLinkEndDestructionData($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$LiteralBoolean ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$LiteralBoolean  &&
       printGuard_CopyLiteralBoolean($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$LiteralInteger ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$LiteralInteger  &&
       printGuard_CopyLiteralInteger($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$LiteralNull ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$LiteralNull  &&
       printGuard_CopyLiteralNull($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$LiteralReal ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$LiteralReal  &&
       printGuard_CopyLiteralReal($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$LiteralString ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$LiteralString  &&
       printGuard_CopyLiteralString($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$LiteralUnlimitedNatural ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$LiteralUnlimitedNatural  &&
       printGuard_CopyLiteralUnlimitedNatural($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$LoopNode ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$LoopNode  &&
       printGuard_CopyLoopNode($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Manifestation ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Manifestation  &&
       printGuard_CopyManifestation($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$MergeNode ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$MergeNode  &&
       printGuard_CopyMergeNode($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Message ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Message  &&
       printGuard_CopyMessage($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$MessageOccurrenceSpecification ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$MessageOccurrenceSpecification  &&
       printGuard_CopyMessageOccurrenceSpecification($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Model ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Model  &&
       printGuard_CopyModel($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Node ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Node  &&
       printGuard_CopyNode($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ObjectFlow ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ObjectFlow  &&
       printGuard_CopyObjectFlow($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$OccurrenceSpecification ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$OccurrenceSpecification  &&
       printGuard_CopyOccurrenceSpecification($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$OpaqueAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$OpaqueAction  &&
       printGuard_CopyOpaqueAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$OpaqueBehavior ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$OpaqueBehavior  &&
       printGuard_CopyOpaqueBehavior($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$OpaqueExpression ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$OpaqueExpression  &&
       printGuard_CopyOpaqueExpression($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Operation ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Operation  &&
       printGuard_CopyOperation($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$OperationTemplateParameter ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$OperationTemplateParameter  &&
       printGuard_CopyOperationTemplateParameter($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$OutputPin ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$OutputPin  &&
       printGuard_CopyOutputPin($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Package ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Package  &&
       printGuard_CopyPackage($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$PackageImport ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$PackageImport  &&
       printGuard_CopyPackageImport($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$PackageMerge ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$PackageMerge  &&
       printGuard_CopyPackageMerge($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Parameter ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Parameter  &&
       printGuard_CopyParameter($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ParameterSet ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ParameterSet  &&
       printGuard_CopyParameterSet($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$PartDecomposition ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$PartDecomposition  &&
       printGuard_CopyPartDecomposition($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Port ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Port  &&
       printGuard_CopyPort($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$PrimitiveType ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$PrimitiveType  &&
       printGuard_CopyPrimitiveType($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Profile ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Profile  &&
       printGuard_CopyProfile($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ProfileApplication ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ProfileApplication  &&
       printGuard_CopyProfileApplication($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Property ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Property  &&
       printGuard_CopyProperty($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ProtocolConformance ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ProtocolConformance  &&
       printGuard_CopyProtocolConformance($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ProtocolStateMachine ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ProtocolStateMachine  &&
       printGuard_CopyProtocolStateMachine($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ProtocolTransition ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ProtocolTransition  &&
       printGuard_CopyProtocolTransition($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Pseudostate ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Pseudostate  &&
       printGuard_CopyPseudostate($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$QualifierValue ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$QualifierValue  &&
       printGuard_CopyQualifierValue($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$RaiseExceptionAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$RaiseExceptionAction  &&
       printGuard_CopyRaiseExceptionAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ReadExtentAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ReadExtentAction  &&
       printGuard_CopyReadExtentAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ReadIsClassifiedObjectAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ReadIsClassifiedObjectAction  &&
       printGuard_CopyReadIsClassifiedObjectAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ReadLinkAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ReadLinkAction  &&
       printGuard_CopyReadLinkAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ReadLinkObjectEndAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ReadLinkObjectEndAction  &&
       printGuard_CopyReadLinkObjectEndAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ReadLinkObjectEndQualifierAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ReadLinkObjectEndQualifierAction  &&
       printGuard_CopyReadLinkObjectEndQualifierAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ReadSelfAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ReadSelfAction  &&
       printGuard_CopyReadSelfAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ReadStructuralFeatureAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ReadStructuralFeatureAction  &&
       printGuard_CopyReadStructuralFeatureAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ReadVariableAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ReadVariableAction  &&
       printGuard_CopyReadVariableAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Realization ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Realization  &&
       printGuard_CopyRealization($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Reception ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Reception  &&
       printGuard_CopyReception($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ReclassifyObjectAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ReclassifyObjectAction  &&
       printGuard_CopyReclassifyObjectAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$RedefinableTemplateSignature ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$RedefinableTemplateSignature  &&
       printGuard_CopyRedefinableTemplateSignature($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ReduceAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ReduceAction  &&
       printGuard_CopyReduceAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Region ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Region  &&
       printGuard_CopyRegion($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$RemoveStructuralFeatureValueAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$RemoveStructuralFeatureValueAction  &&
       printGuard_CopyRemoveStructuralFeatureValueAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$RemoveVariableValueAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$RemoveVariableValueAction  &&
       printGuard_CopyRemoveVariableValueAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ReplyAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ReplyAction  &&
       printGuard_CopyReplyAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$SendObjectAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$SendObjectAction  &&
       printGuard_CopySendObjectAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$SendSignalAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$SendSignalAction  &&
       printGuard_CopySendSignalAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$SequenceNode ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$SequenceNode  &&
       printGuard_CopySequenceNode($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Signal ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Signal  &&
       printGuard_CopySignal($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$SignalEvent ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$SignalEvent  &&
       printGuard_CopySignalEvent($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Slot ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Slot  &&
       printGuard_CopySlot($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$StartClassifierBehaviorAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$StartClassifierBehaviorAction  &&
       printGuard_CopyStartClassifierBehaviorAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$StartObjectBehaviorAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$StartObjectBehaviorAction  &&
       printGuard_CopyStartObjectBehaviorAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$State ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$State  &&
       printGuard_CopyState($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$StateInvariant ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$StateInvariant  &&
       printGuard_CopyStateInvariant($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$StateMachine ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$StateMachine  &&
       printGuard_CopyStateMachine($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Stereotype ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Stereotype  &&
       printGuard_CopyStereotype($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$StringExpression ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$StringExpression  &&
       printGuard_CopyStringExpression($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$StructuredActivityNode ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$StructuredActivityNode  &&
       printGuard_CopyStructuredActivityNode($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Substitution ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Substitution  &&
       printGuard_CopySubstitution($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$TemplateBinding ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$TemplateBinding  &&
       printGuard_CopyTemplateBinding($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$TemplateParameter ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$TemplateParameter  &&
       printGuard_CopyTemplateParameter($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$TemplateParameterSubstitution ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$TemplateParameterSubstitution  &&
       printGuard_CopyTemplateParameterSubstitution($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$TemplateSignature ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$TemplateSignature  &&
       printGuard_CopyTemplateSignature($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$TestIdentityAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$TestIdentityAction  &&
       printGuard_CopyTestIdentityAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$TimeConstraint ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$TimeConstraint  &&
       printGuard_CopyTimeConstraint($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$TimeEvent ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$TimeEvent  &&
       printGuard_CopyTimeEvent($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$TimeExpression ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$TimeExpression  &&
       printGuard_CopyTimeExpression($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$TimeInterval ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$TimeInterval  &&
       printGuard_CopyTimeInterval($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$TimeObservation ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$TimeObservation  &&
       printGuard_CopyTimeObservation($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Transition ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Transition  &&
       printGuard_CopyTransition($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Trigger ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Trigger  &&
       printGuard_CopyTrigger($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$UnmarshallAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$UnmarshallAction  &&
       printGuard_CopyUnmarshallAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Usage ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Usage  &&
       printGuard_CopyUsage($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$UseCase ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$UseCase  &&
       printGuard_CopyUseCase($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ValuePin ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ValuePin  &&
       printGuard_CopyValuePin($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$ValueSpecificationAction ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$ValueSpecificationAction  &&
       printGuard_CopyValueSpecificationAction($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == UMLs$Variable ==>
    
    (exists  s: ref  ::
       s!=null && read($s, s, alloc) && dtype(s) <: UML$Variable  &&
       printGuard_CopyVariable($s,  s ) && 
      	 getTarsBySrcs(Seq#Singleton( s  ))  == t )
)
}
