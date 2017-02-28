procedure driver();
  modifies $tarHeap, $linkHeap;
  free requires valid_src_model($srcHeap);
  //pre_unmarshall
    free requires (forall aca:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$AcceptCallAction), aca) ==>
  	     read( $srcHeap , aca, UML$AcceptEventAction.isUnmarshall) == true)
  ;
  //pre_no_input_pins
    free requires (forall aea:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$AcceptEventAction), aea) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , aea, UML$Action.input))) > 0 ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , aea, UML$Action.input))) == 0)
  ;
  //pre_no_output_pins
    free requires (forall aea:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$AcceptEventAction), aea) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , aea, UML$AcceptEventAction.trigger))) > 0 ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , aea, UML$Action.output))) > 0 ==> dtype(aea) == UML$AcceptEventAction  &&  (forall t1_:ref :: // [UML$Trigger]
  	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , aea, UML$AcceptEventAction.trigger)), $Box(t1_)) ==>
  	     	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Event), read( $srcHeap , t1_, UML$Trigger.event)) ==> dtype(read( $srcHeap , t1_, UML$Trigger.event)) <: UML$ChangeEvent  ||  dtype(read( $srcHeap , t1_, UML$Trigger.event)) <: UML$CallEvent)
  	      ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , aea, UML$Action.output))) == 0)
  ;
  //pre_input_pin
    free requires (forall aip:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ActionInputPin), aip) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , aip, UML$ActionInputPin.fromAction), UML$Action.input))) > 0 ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Action), read( $srcHeap , aip, UML$ActionInputPin.fromAction)) ==> (forall ip1_:ref :: // [null]
  	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , aip, UML$ActionInputPin.fromAction), UML$Action.input)), $Box(ip1_)) ==>
  	     	     dtype(ip1_) <: UML$ActionInputPin)
  	     )
  ;
  //pre_one_output_pin
    free requires (forall aip:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ActionInputPin), aip) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Action), read( $srcHeap , aip, UML$ActionInputPin.fromAction)) ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , aip, UML$ActionInputPin.fromAction), UML$Action.output))) > 0 ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , aip, UML$ActionInputPin.fromAction), UML$Action.output))) == 1)
  ;
  //pre_has_parameters
    free requires (forall apn:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ActivityParameterNode), apn) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , apn, UML$ActivityNode.activity), UML$Behavior.ownedParameter))) > 0 ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Activity), read( $srcHeap , apn, UML$ActivityNode.activity)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Parameter), read( $srcHeap , apn, UML$ActivityParameterNode.parameter)) ==> Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , apn, UML$ActivityNode.activity), UML$Behavior.ownedParameter)), $Box(read( $srcHeap , apn, UML$ActivityParameterNode.parameter))))
  ;
  //pre_same_type
    free requires (forall apn:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ActivityParameterNode), apn) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Parameter), read( $srcHeap , apn, UML$ActivityParameterNode.parameter)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Type), read( $srcHeap , apn, UML$TypedElement.type)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Type), read( $srcHeap , read( $srcHeap , apn, UML$ActivityParameterNode.parameter), UML$TypedElement.type)) ==> read( $srcHeap , apn, UML$TypedElement.type) == read( $srcHeap , read( $srcHeap , apn, UML$ActivityParameterNode.parameter), UML$TypedElement.type))
  ;
  //pre_no_edges
    free requires (forall apn:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ActivityParameterNode), apn) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , apn, UML$ActivityNode.incoming))) > 0 ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , apn, UML$ActivityNode.outgoing))) > 0 ==> Seq#IsEmpty(Seq#FromArray( $srcHeap , read( $srcHeap , apn, UML$ActivityNode.incoming)))  ||  Seq#IsEmpty(Seq#FromArray( $srcHeap , read( $srcHeap , apn, UML$ActivityNode.outgoing))))
  ;
  //pre_feature_of_context_classifier
    free requires (forall b:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Behavior), b) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$BehavioredClassifier), read( $srcHeap , b, UML$Behavior.context)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$BehavioralFeature), read( $srcHeap , b, UML$Behavior.specification)) ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , b, UML$Behavior.context), UML$Classifier.feature))) > 0 ==> Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , b, UML$Behavior.context), UML$Classifier.feature)), $Box(read( $srcHeap , b, UML$Behavior.specification))))
  ;
  //pre_abstract_no_method
    free requires (forall bf:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$BehavioralFeature), bf) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , bf, UML$BehavioralFeature.method))) > 0 ==> read( $srcHeap , bf, UML$BehavioralFeature.isAbstract) ==> Seq#IsEmpty(Seq#FromArray( $srcHeap , read( $srcHeap , bf, UML$BehavioralFeature.method))))
  ;
  //pre_synchronous_call
    free requires (forall ca:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$CallAction), ca) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , ca, UML$CallAction.result))) > 0 ==> Seq#NotEmpty(Seq#FromArray( $srcHeap , read( $srcHeap , ca, UML$CallAction.result))) ==> read( $srcHeap , ca, UML$CallAction.isSynchronous))
  ;
  //pre_has_constraining_classifier
    free requires (forall ctp:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ClassifierTemplateParameter), ctp) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , ctp, UML$ClassifierTemplateParameter.constrainingClassifier))) > 0 ==> read( $srcHeap , ctp, UML$ClassifierTemplateParameter.allowSubstitutable) ==> Seq#NotEmpty(Seq#FromArray( $srcHeap , read( $srcHeap , ctp, UML$ClassifierTemplateParameter.constrainingClassifier))))
  ;
  //pre_association_ends
    free requires (forall cp:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$CommunicationPath), cp) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , cp, UML$Association.endType))) > 0 ==> (forall t1_:ref :: // [null]
  	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , cp, UML$Association.endType)), $Box(t1_)) ==>
  	     	     dtype(t1_) <: UML$DeploymentTarget)
  	     )
  ;
  //pre_no_nested_classifiers
    free requires (forall c:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Component), c) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , c, UML$Class.nestedClassifier))) > 0 ==> Seq#IsEmpty(Seq#FromArray( $srcHeap , read( $srcHeap , c, UML$Class.nestedClassifier))))
  ;
  //pre_no_input_pins
    free requires (forall cn:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ConditionalNode), cn) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , cn, UML$Action.input))) > 0 ==> Seq#IsEmpty(Seq#FromArray( $srcHeap , read( $srcHeap , cn, UML$Action.input))))
  ;
  //pre_type
    free requires (forall cif:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ConsiderIgnoreFragment), cif) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , cif, UML$ConsiderIgnoreFragment.message))) > 0 ==> (forall nem:ref :: // [null]
  	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , cif, UML$ConsiderIgnoreFragment.message)), $Box(nem)) ==>
  	     	     dtype(nem) <: UML$Operation  ||  dtype(nem) <: UML$Signal)
  	     )
  ;
  //pre_not_apply_to_self
    free requires (forall c:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Constraint), c) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , c, UML$Constraint.constrainedElement))) > 0 ==> !(Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , c, UML$Constraint.constrainedElement)), $Box(c))))
  ;
  //pre_classifier_not_abstract
    free requires (forall coa:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$CreateObjectAction), coa) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Classifier), read( $srcHeap , coa, UML$CreateObjectAction.classifier)) ==> !(read( $srcHeap , read( $srcHeap , coa, UML$CreateObjectAction.classifier), UML$Classifier.isAbstract)))
  ;
  //pre_classifier_not_association_class
    free requires (forall coa:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$CreateObjectAction), coa) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Classifier), read( $srcHeap , coa, UML$CreateObjectAction.classifier)) ==> !(dtype(read( $srcHeap , coa, UML$CreateObjectAction.classifier)) <: UML$AssociationClass))
  ;
  //pre_same_type
    free requires (forall coa:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$CreateObjectAction), coa) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Type), read( $srcHeap , read( $srcHeap , coa, UML$CreateObjectAction.result), UML$TypedElement.type)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$OutputPin), read( $srcHeap , coa, UML$CreateObjectAction.result)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Classifier), read( $srcHeap , coa, UML$CreateObjectAction.classifier)) ==> read( $srcHeap , read( $srcHeap , coa, UML$CreateObjectAction.result), UML$TypedElement.type) == read( $srcHeap , coa, UML$CreateObjectAction.classifier))
  ;
  //pre_decision_input_flow_incoming
    free requires (forall dn:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$DecisionNode), dn) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ObjectFlow), read( $srcHeap , dn, UML$DecisionNode.decisionInputFlow)) ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , dn, UML$ActivityNode.incoming))) > 0 ==> Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , dn, UML$ActivityNode.incoming)), $Box(read( $srcHeap , dn, UML$DecisionNode.decisionInputFlow))))
  ;
  //pre_has_one_or_two_constrainedElements
    free requires (forall dc:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$DurationConstraint), dc) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , dc, UML$Constraint.constrainedElement))) > 0 ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , dc, UML$Constraint.constrainedElement))) == 1  ||  Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , dc, UML$Constraint.constrainedElement))) == 2)
  ;
  //pre_immutable
    free requires (forall e:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Enumeration), e) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , e, UML$DataType.ownedAttribute))) > 0 ==> (forall p1_:ref :: // [null]
  	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , e, UML$DataType.ownedAttribute)), $Box(p1_)) ==>
  	     	     read( $srcHeap , p1_, UML$StructuralFeature.isReadOnly))
  	     )
  ;
  //pre_handler_body_edges
    free requires (forall eh:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ExceptionHandler), eh) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , eh, UML$ExceptionHandler.exceptionInput), UML$ActivityNode.incoming))) > 0 ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ExecutableNode), read( $srcHeap , eh, UML$ExceptionHandler.handlerBody)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ObjectNode), read( $srcHeap , eh, UML$ExceptionHandler.exceptionInput)) ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , eh, UML$ExceptionHandler.handlerBody), UML$ActivityNode.incoming))) > 0 ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , eh, UML$ExceptionHandler.handlerBody), UML$ActivityNode.outgoing))) > 0 ==> Seq#IsEmpty(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , eh, UML$ExceptionHandler.handlerBody), UML$ActivityNode.incoming)))  &&  Seq#IsEmpty(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , eh, UML$ExceptionHandler.handlerBody), UML$ActivityNode.outgoing)))  &&  Seq#IsEmpty(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , eh, UML$ExceptionHandler.exceptionInput), UML$ActivityNode.incoming))))
  ;
  //pre_handler_body_owner
    free requires (forall eh:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ExceptionHandler), eh) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ExecutableNode), read( $srcHeap , eh, UML$ExceptionHandler.protectedNode)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Element), read( $srcHeap , read( $srcHeap , eh, UML$ExceptionHandler.protectedNode), UML$Element.owner)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ExecutableNode), read( $srcHeap , eh, UML$ExceptionHandler.handlerBody)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Element), read( $srcHeap , read( $srcHeap , eh, UML$ExceptionHandler.handlerBody), UML$Element.owner)) ==> read( $srcHeap , read( $srcHeap , eh, UML$ExceptionHandler.handlerBody), UML$Element.owner) == read( $srcHeap , read( $srcHeap , eh, UML$ExceptionHandler.protectedNode), UML$Element.owner))
  ;
  //pre_same_lifeline
    free requires (forall es:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ExecutionSpecification), es) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$OccurrenceSpecification), read( $srcHeap , es, UML$ExecutionSpecification.start)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Lifeline), read( $srcHeap , read( $srcHeap , es, UML$ExecutionSpecification.finish), UML$InteractionFragment.covered)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Lifeline), read( $srcHeap , read( $srcHeap , es, UML$ExecutionSpecification.start), UML$InteractionFragment.covered)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$OccurrenceSpecification), read( $srcHeap , es, UML$ExecutionSpecification.finish)) ==> read( $srcHeap , read( $srcHeap , es, UML$ExecutionSpecification.start), UML$InteractionFragment.covered) == read( $srcHeap , read( $srcHeap , es, UML$ExecutionSpecification.finish), UML$InteractionFragment.covered))
  ;
  //pre_extension_points
    free requires (forall e:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Extend), e) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$UseCase), read( $srcHeap , e, UML$Extend.extendedCase)) ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , e, UML$Extend.extensionLocation))) > 0 ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , e, UML$Extend.extendedCase), UML$UseCase.extensionPoint))) > 0 ==> (forall epxp:ref :: // [null]
  	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , e, UML$Extend.extensionLocation)), $Box(epxp)) ==>
  	     	     Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , e, UML$Extend.extendedCase), UML$UseCase.extensionPoint)), $Box(epxp)))
  	     )
  ;
  //pre_is_binary
    free requires (forall e:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Extension), e) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , e, UML$Association.memberEnd))) > 0 ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , e, UML$Association.memberEnd))) == 2)
  ;
  //pre_no_outgoing_edges
    free requires (forall fn:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$FinalNode), fn) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , fn, UML$ActivityNode.outgoing))) > 0 ==> Seq#IsEmpty(Seq#FromArray( $srcHeap , read( $srcHeap , fn, UML$ActivityNode.outgoing))))
  ;
  //pre_no_outgoing_transitions
    free requires (forall fs:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$FinalState), fs) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , fs, UML$Vertex.outgoing))) > 0 ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , fs, UML$Vertex.outgoing))) == 0)
  ;
  //pre_no_regions
    free requires (forall fs:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$FinalState), fs) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , fs, UML$State.region))) > 0 ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , fs, UML$State.region))) == 0)
  ;
  //pre_one_incoming_edge
    free requires (forall fn:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ForkNode), fn) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , fn, UML$ActivityNode.incoming))) > 0 ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , fn, UML$ActivityNode.incoming))) == 1)
  ;
  //pre_convey_classifiers
    free requires (forall _if:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$InformationFlow), _if) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , _if, UML$InformationFlow.conveyed))) > 0 ==> (forall c1_:ref :: // [null]
  	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , _if, UML$InformationFlow.conveyed)), $Box(c1_)) ==>
  	     	     dtype(c1_) <: UML$Class  ||  dtype(c1_) <: UML$Interface  ||  dtype(c1_) <: UML$InformationItem  ||  dtype(c1_) <: UML$Signal  ||  dtype(c1_) <: UML$Component)
  	     )
  ;
  //pre_has_no
    free requires (forall ii:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$InformationItem), ii) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , ii, UML$Classifier.generalization))) > 0 ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , ii, UML$Classifier.feature))) > 0 ==> Seq#IsEmpty(Seq#FromArray( $srcHeap , read( $srcHeap , ii, UML$Classifier.generalization)))  &&  Seq#IsEmpty(Seq#FromArray( $srcHeap , read( $srcHeap , ii, UML$Classifier.feature))))
  ;
  //pre_not_instantiable
    free requires (forall ii:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$InformationItem), ii) ==>
  	     read( $srcHeap , ii, UML$Classifier.isAbstract))
  ;
  //pre_no_incoming_edges
    free requires (forall _in:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$InitialNode), _in) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , _in, UML$ActivityNode.incoming))) > 0 ==> Seq#IsEmpty(Seq#FromArray( $srcHeap , read( $srcHeap , _in, UML$ActivityNode.incoming))))
  ;
  //pre_control_edges
    free requires (forall _in:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$InitialNode), _in) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , _in, UML$ActivityNode.outgoing))) > 0 ==> (forall ae1_:ref :: // [null]
  	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , _in, UML$ActivityNode.outgoing)), $Box(ae1_)) ==>
  	     	     dtype(ae1_) <: UML$ControlFlow)
  	     )
  ;
  //pre_one_outgoing_edge
    free requires (forall jn:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$JoinNode), jn) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , jn, UML$ActivityNode.outgoing))) > 0 ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , jn, UML$ActivityNode.outgoing))) == 1)
  ;
  //pre_not_static
    free requires (forall la:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$LinkAction), la) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , la, UML$LinkAction.endData))) > 0 ==> (forall led1_:ref :: // [null]
  	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , la, UML$LinkAction.endData)), $Box(led1_)) ==>
  	     	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Property), read( $srcHeap , led1_, UML$LinkEndData.end)) ==> !(read( $srcHeap , read( $srcHeap , led1_, UML$LinkEndData.end), UML$Feature.isStatic)))
  	     )
  ;
  //pre_one_outgoing_edge
    free requires (forall mn:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$MergeNode), mn) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , mn, UML$ActivityNode.outgoing))) > 0 ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , mn, UML$ActivityNode.outgoing))) == 1)
  ;
  //pre_internal_structure
    free requires (forall n:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Node), n) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , n, UML$StructuredClassifier.part))) > 0 ==> (forall p1_:ref :: // [null]
  	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , n, UML$StructuredClassifier.part)), $Box(p1_)) ==>
  	     	     dtype(p1_) <: UML$Node)
  	     )
  ;
  //pre_no_executable_nodes
    free requires (forall of:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ObjectFlow), of) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ActivityNode), read( $srcHeap , of, UML$ActivityEdge.target)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ActivityNode), read( $srcHeap , of, UML$ActivityEdge.source)) ==> !(dtype(read( $srcHeap , of, UML$ActivityEdge.source)) <: UML$ExecutableNode  ||  dtype(read( $srcHeap , of, UML$ActivityEdge.target)) <: UML$ExecutableNode))
  ;
  //pre_is_multicast_or_is_multireceive
    free requires (forall of:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ObjectFlow), of) ==>
  	     !(read( $srcHeap , of, UML$ObjectFlow.isMulticast)  &&  read( $srcHeap , of, UML$ObjectFlow.isMultireceive)))
  ;
  //pre_stream_and_exception
    free requires (forall p:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Parameter), p) ==>
  	     !(read( $srcHeap , p, UML$Parameter.isException)  &&  read( $srcHeap , p, UML$Parameter.isStream)))
  ;
  //pre_same_parameterized_entity
    free requires (forall ps:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ParameterSet), ps) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Element), read( $srcHeap , ps, UML$Element.owner)) ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , ps, UML$ParameterSet.parameter))) > 0 ==> (forall pp1:ref,pp2:ref :: // [null, null]
  	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , ps, UML$ParameterSet.parameter)), $Box(pp1))&&Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , ps, UML$ParameterSet.parameter)), $Box(pp2)) ==>
  	     	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Element), read( $srcHeap , pp1, UML$Element.owner)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Element), read( $srcHeap , pp2, UML$Element.owner)) ==> read( $srcHeap , ps, UML$Element.owner) == read( $srcHeap , pp1, UML$Element.owner)  &&  read( $srcHeap , ps, UML$Element.owner) == read( $srcHeap , pp2, UML$Element.owner)  &&  read( $srcHeap , pp1, UML$Parameter.direction) == read( $srcHeap , pp2, UML$Parameter.direction))
  	     )
  ;
  //pre_control_pins
    free requires (forall p:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Pin), p) ==>
  	     read( $srcHeap , p, UML$Pin.isControl) ==> read( $srcHeap , p, UML$ObjectNode.isControlType))
  ;
  //pre_not_unique
    free requires (forall p:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Pin), p) ==>
  	     !(read( $srcHeap , p, UML$MultiplicityElement.isUnique)))
  ;
  //pre_derived_union_is_read_only
    free requires (forall p:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Property), p) ==>
  	     read( $srcHeap , p, UML$Property.isDerivedUnion) ==> read( $srcHeap , p, UML$StructuralFeature.isReadOnly))
  ;
  //pre_derived_union_is_derived
    free requires (forall p:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Property), p) ==>
  	     read( $srcHeap , p, UML$Property.isDerivedUnion) ==> read( $srcHeap , p, UML$Property.isDerived))
  ;
  //pre_subsetted_property_names
    free requires (forall p:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Property), p) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , p, UML$Property.subsettedProperty))) > 0 ==> (forall psp:ref :: // [null]
  	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , p, UML$Property.subsettedProperty)), $Box(psp)) ==>
  	     	     read( $srcHeap , psp, UML$NamedElement.name) != read( $srcHeap , p, UML$NamedElement.name)
  	     	     )
  	     )
  ;
  //pre_protocol_transitions
    free requires (forall psm:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ProtocolStateMachine), psm) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , psm, UML$StateMachine.region))) > 0 ==> (forall rr:ref :: // [null]
  	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , psm, UML$StateMachine.region)), $Box(rr)) ==>
  	     	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , rr, UML$Region.transition))) > 0 ==> (forall tt:ref :: // [null]
  	     	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , rr, UML$Region.transition)), $Box(tt)) ==>
  	     	     	     dtype(tt) == UML$ProtocolTransition)
  	     	     )
  	     )
  ;
  //pre_type_is_classifier
    free requires (forall rea:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ReadExtentAction), rea) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Classifier), read( $srcHeap , rea, UML$ReadExtentAction.classifier)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$OutputPin), read( $srcHeap , rea, UML$ReadExtentAction.result)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Type), read( $srcHeap , read( $srcHeap , rea, UML$ReadExtentAction.result), UML$TypedElement.type)) ==> read( $srcHeap , read( $srcHeap , rea, UML$ReadExtentAction.result), UML$TypedElement.type) == read( $srcHeap , rea, UML$ReadExtentAction.classifier))
  ;
  //pre_ends_of_association
    free requires (forall rloea:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ReadLinkObjectEndAction), rloea) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Property), read( $srcHeap , rloea, UML$ReadLinkObjectEndAction.end)) ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , read( $srcHeap , rloea, UML$ReadLinkObjectEndAction.end), UML$Property.association), UML$Association.memberEnd))) > 0 ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Association), read( $srcHeap , read( $srcHeap , rloea, UML$ReadLinkObjectEndAction.end), UML$Property.association)) ==> (forall pe:ref :: // [null]
  	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , read( $srcHeap , rloea, UML$ReadLinkObjectEndAction.end), UML$Property.association), UML$Association.memberEnd)), $Box(pe)) ==>
  	     	     !(read( $srcHeap , pe, UML$Feature.isStatic)))
  	     )
  ;
  //pre_type_of_result
    free requires (forall rloea:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ReadLinkObjectEndAction), rloea) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$OutputPin), read( $srcHeap , rloea, UML$ReadLinkObjectEndAction.result)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Property), read( $srcHeap , rloea, UML$ReadLinkObjectEndAction.end)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Type), read( $srcHeap , read( $srcHeap , rloea, UML$ReadLinkObjectEndAction.end), UML$TypedElement.type)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Type), read( $srcHeap , read( $srcHeap , rloea, UML$ReadLinkObjectEndAction.result), UML$TypedElement.type)) ==> read( $srcHeap , read( $srcHeap , rloea, UML$ReadLinkObjectEndAction.result), UML$TypedElement.type) == read( $srcHeap , read( $srcHeap , rloea, UML$ReadLinkObjectEndAction.end), UML$TypedElement.type))
  ;
  //pre_type_of_object
    free requires (forall rloea:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ReadLinkObjectEndAction), rloea) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Association), read( $srcHeap , read( $srcHeap , rloea, UML$ReadLinkObjectEndAction.end), UML$Property.association)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$InputPin), read( $srcHeap , rloea, UML$ReadLinkObjectEndAction.object)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Property), read( $srcHeap , rloea, UML$ReadLinkObjectEndAction.end)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Type), read( $srcHeap , read( $srcHeap , rloea, UML$ReadLinkObjectEndAction.object), UML$TypedElement.type)) ==> read( $srcHeap , read( $srcHeap , rloea, UML$ReadLinkObjectEndAction.object), UML$TypedElement.type) == read( $srcHeap , read( $srcHeap , rloea, UML$ReadLinkObjectEndAction.end), UML$Property.association))
  ;
  //pre_association_of_association
    free requires (forall rloea:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ReadLinkObjectEndAction), rloea) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Association), read( $srcHeap , read( $srcHeap , rloea, UML$ReadLinkObjectEndAction.end), UML$Property.association)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Property), read( $srcHeap , rloea, UML$ReadLinkObjectEndAction.end)) ==> dtype(read( $srcHeap , read( $srcHeap , rloea, UML$ReadLinkObjectEndAction.end), UML$Property.association)) <: UML$AssociationClass)
  ;
  //pre_type_of_object
    free requires (forall rloeqa:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ReadLinkObjectEndQualifierAction), rloeqa) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Type), read( $srcHeap , read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.object), UML$TypedElement.type)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$InputPin), read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.object)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Property), read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.qualifier)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Association), read( $srcHeap , read( $srcHeap , read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.qualifier), UML$Property.associationEnd), UML$Property.association)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Property), read( $srcHeap , read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.qualifier), UML$Property.associationEnd)) ==> read( $srcHeap , read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.object), UML$TypedElement.type) == read( $srcHeap , read( $srcHeap , read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.qualifier), UML$Property.associationEnd), UML$Property.association))
  ;
  //pre_ends_of_association
    free requires (forall rloeqa:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ReadLinkObjectEndQualifierAction), rloeqa) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Association), read( $srcHeap , read( $srcHeap , read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.qualifier), UML$Property.associationEnd), UML$Property.association)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Property), read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.qualifier)) ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , read( $srcHeap , read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.qualifier), UML$Property.associationEnd), UML$Property.association), UML$Association.memberEnd))) > 0 ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Property), read( $srcHeap , read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.qualifier), UML$Property.associationEnd)) ==> (forall pe:ref :: // [null]
  	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , read( $srcHeap , read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.qualifier), UML$Property.associationEnd), UML$Property.association), UML$Association.memberEnd)), $Box(pe)) ==>
  	     	     !(read( $srcHeap , pe, UML$Feature.isStatic)))
  	     )
  ;
  //pre_same_type
    free requires (forall rloeqa:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ReadLinkObjectEndQualifierAction), rloeqa) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Type), read( $srcHeap , read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.result), UML$TypedElement.type)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Property), read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.qualifier)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Type), read( $srcHeap , read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.qualifier), UML$TypedElement.type)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$OutputPin), read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.result)) ==> read( $srcHeap , read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.result), UML$TypedElement.type) == read( $srcHeap , read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.qualifier), UML$TypedElement.type))
  ;
  //pre_association_of_association
    free requires (forall rloeqa:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ReadLinkObjectEndQualifierAction), rloeqa) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Property), read( $srcHeap , read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.qualifier), UML$Property.associationEnd)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Association), read( $srcHeap , read( $srcHeap , read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.qualifier), UML$Property.associationEnd), UML$Property.association)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Property), read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.qualifier)) ==> dtype(read( $srcHeap , read( $srcHeap , read( $srcHeap , rloeqa, UML$ReadLinkObjectEndQualifierAction.qualifier), UML$Property.associationEnd), UML$Property.association)) <: UML$AssociationClass)
  ;
  //pre_type
    free requires (forall rsa:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ReadSelfAction), rsa) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$OutputPin), read( $srcHeap , rsa, UML$ReadSelfAction.result)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Type), read( $srcHeap , read( $srcHeap , rsa, UML$ReadSelfAction.result), UML$TypedElement.type)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Classifier), read( $srcHeap , rsa, UML$Action.context)) ==> read( $srcHeap , read( $srcHeap , rsa, UML$ReadSelfAction.result), UML$TypedElement.type) == read( $srcHeap , rsa, UML$Action.context))
  ;
  //pre_type_and_ordering
    free requires (forall rsfa:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ReadStructuralFeatureAction), rsfa) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$StructuralFeature), read( $srcHeap , rsfa, UML$StructuralFeatureAction.structuralFeature)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Type), read( $srcHeap , read( $srcHeap , rsfa, UML$ReadStructuralFeatureAction.result), UML$TypedElement.type)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$OutputPin), read( $srcHeap , rsfa, UML$ReadStructuralFeatureAction.result)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Type), read( $srcHeap , read( $srcHeap , rsfa, UML$StructuralFeatureAction.structuralFeature), UML$TypedElement.type)) ==> read( $srcHeap , read( $srcHeap , rsfa, UML$ReadStructuralFeatureAction.result), UML$TypedElement.type) == read( $srcHeap , read( $srcHeap , rsfa, UML$StructuralFeatureAction.structuralFeature), UML$TypedElement.type)  &&  read( $srcHeap , read( $srcHeap , rsfa, UML$ReadStructuralFeatureAction.result), UML$MultiplicityElement.isOrdered) == read( $srcHeap , read( $srcHeap , rsfa, UML$StructuralFeatureAction.structuralFeature), UML$MultiplicityElement.isOrdered))
  ;
  //pre_type_and_ordering
    free requires (forall rva:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ReadVariableAction), rva) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$OutputPin), read( $srcHeap , rva, UML$ReadVariableAction.result)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Variable), read( $srcHeap , rva, UML$VariableAction.variable)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Type), read( $srcHeap , read( $srcHeap , rva, UML$ReadVariableAction.result), UML$TypedElement.type)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Type), read( $srcHeap , read( $srcHeap , rva, UML$VariableAction.variable), UML$TypedElement.type)) ==> read( $srcHeap , read( $srcHeap , rva, UML$ReadVariableAction.result), UML$TypedElement.type) == read( $srcHeap , read( $srcHeap , rva, UML$VariableAction.variable), UML$TypedElement.type)  &&  read( $srcHeap , read( $srcHeap , rva, UML$ReadVariableAction.result), UML$MultiplicityElement.isOrdered) == read( $srcHeap , read( $srcHeap , rva, UML$VariableAction.variable), UML$MultiplicityElement.isOrdered))
  ;
  //pre_same_name_as_signal
    free requires (forall r:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Reception), r) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Signal), read( $srcHeap , r, UML$Reception.signal)) ==> read( $srcHeap , r, UML$NamedElement.name) == read( $srcHeap , read( $srcHeap , r, UML$Reception.signal), UML$NamedElement.name)
  	     )
  ;
  //pre_non_leaf_redefinition
    free requires (forall re:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$RedefinableElement), re) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , re, UML$RedefinableElement.redefinedElement))) > 0 ==> (forall rere:ref :: // [null]
  	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , re, UML$RedefinableElement.redefinedElement)), $Box(rere)) ==>
  	     	     !(read( $srcHeap , rere, UML$RedefinableElement.isLeaf)))
  	     )
  ;
  //pre_event_on_reply_to_call_trigger
    free requires (forall ra:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ReplyAction), ra) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Trigger), read( $srcHeap , ra, UML$ReplyAction.replyToCall)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Event), read( $srcHeap , read( $srcHeap , ra, UML$ReplyAction.replyToCall), UML$Trigger.event)) ==> dtype(read( $srcHeap , read( $srcHeap , ra, UML$ReplyAction.replyToCall), UML$Trigger.event)) <: UML$CallEvent)
  ;
  //pre_submachine_states
    free requires (forall s:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$State), s) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , s, UML$State.connection))) > 0 ==> read( $srcHeap , s, UML$State.isSubmachineState) ==> Seq#NotEmpty(Seq#FromArray( $srcHeap , read( $srcHeap , s, UML$State.connection))))
  ;
  //pre_composite_states
    free requires (forall s:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$State), s) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , s, UML$State.connectionPoint))) > 0 ==> Seq#NotEmpty(Seq#FromArray( $srcHeap , read( $srcHeap , s, UML$State.connectionPoint))) ==> read( $srcHeap , s, UML$State.isComposite))
  ;
  //pre_destinations_or_sources_of_transitions
    free requires (forall s:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$State), s) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , s, UML$State.connection))) > 0 ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$StateMachine), read( $srcHeap , s, UML$State.submachine)) ==> read( $srcHeap , s, UML$State.isSubmachineState) ==> (forall cprcp:ref :: // [null]
  	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , s, UML$State.connection)), $Box(cprcp)) ==>
  	     	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , cprcp, UML$ConnectionPointReference.exit))) > 0 ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , cprcp, UML$ConnectionPointReference.entry))) > 0 ==> (forall pps:ref :: // [UML$Pseudostate]
  	     	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , cprcp, UML$ConnectionPointReference.entry)), $Box(pps)) ==>
  	     	     	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$StateMachine), read( $srcHeap , pps, UML$Pseudostate.stateMachine)) ==> read( $srcHeap , pps, UML$Pseudostate.stateMachine) == read( $srcHeap , s, UML$State.submachine))
  	     	       &&  (forall ppps1750120280:ref :: // [UML$Pseudostate]
  	     	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , cprcp, UML$ConnectionPointReference.exit)), $Box(ppps1750120280)) ==>
  	     	     	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$StateMachine), read( $srcHeap , ppps1750120280, UML$Pseudostate.stateMachine)) ==> read( $srcHeap , ppps1750120280, UML$Pseudostate.stateMachine) == read( $srcHeap , s, UML$State.submachine))
  	     	     )
  	     )
  ;
  //pre_submachine_or_regions
    free requires (forall s:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$State), s) ==>
  	     read( $srcHeap , s, UML$State.isComposite) ==> !(read( $srcHeap , s, UML$State.isSubmachineState)))
  ;
  //pre_operands
    free requires (forall se:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$StringExpression), se) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , se, UML$Expression.operand))) > 0 ==> (forall vs1_:ref :: // [null]
  	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , se, UML$Expression.operand)), $Box(vs1_)) ==>
  	     	     dtype(vs1_) <: UML$LiteralString)
  	     )
  ;
  //pre_not_static
    free requires (forall sfa:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$StructuralFeatureAction), sfa) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$StructuralFeature), read( $srcHeap , sfa, UML$StructuralFeatureAction.structuralFeature)) ==> !(read( $srcHeap , read( $srcHeap , sfa, UML$StructuralFeatureAction.structuralFeature), UML$Feature.isStatic)))
  ;
  //pre_parameter_substitution_formal
    free requires (forall tb:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$TemplateBinding), tb) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$TemplateSignature), read( $srcHeap , tb, UML$TemplateBinding.signature)) ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , tb, UML$TemplateBinding.signature), UML$TemplateSignature.parameter))) > 0 ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , tb, UML$TemplateBinding.parameterSubstitution))) > 0 ==> (forall tpsb:ref :: // [null]
  	     	   Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , tb, UML$TemplateBinding.parameterSubstitution)), $Box(tpsb)) ==>
  	     	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$TemplateParameter), read( $srcHeap , tpsb, UML$TemplateParameterSubstitution.formal)) ==> Seq#Contains(Seq#FromArray( $srcHeap , read( $srcHeap , read( $srcHeap , tb, UML$TemplateBinding.signature), UML$TemplateSignature.parameter)), $Box(read( $srcHeap , tpsb, UML$TemplateParameterSubstitution.formal))))
  	     )
  ;
  //pre_has_one_constrainedElement
    free requires (forall tc:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$TimeConstraint), tc) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , tc, UML$Constraint.constrainedElement))) > 0 ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , tc, UML$Constraint.constrainedElement))) == 1)
  ;
  //pre_trigger_with_ports
    free requires (forall t:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Trigger), t) ==>
  	     Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$Event), read( $srcHeap , t, UML$Trigger.event)) ==> Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , t, UML$Trigger.port))) > 0 ==> Seq#NotEmpty(Seq#FromArray( $srcHeap , read( $srcHeap , t, UML$Trigger.port))) ==> dtype(read( $srcHeap , t, UML$Trigger.event)) <: UML$MessageEvent)
  ;
  //pre_no_incoming_edges
    free requires (forall vp:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , UML$ValuePin), vp) ==>
  	     Seq#Length(Seq#FromArray( $srcHeap , read( $srcHeap , vp, UML$ActivityNode.incoming))) > 0 ==> Seq#IsEmpty(Seq#FromArray( $srcHeap , read( $srcHeap , vp, UML$ActivityNode.incoming))))
  ;
  