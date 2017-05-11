package experiment;

import java.util.HashMap;
import java.util.HashSet;

public class PreloadData {
	static String[] excludes = new String[] { 
			"Behavior_feature_of_context_classifier", //Solved
			"CommunicationPath_association_ends", //Solved
			"ConsiderIgnoreFragment_type",	
			"Constraint_not_apply_to_self",
			"CreateObjectAction_classifier_not_abstract",
			"DurationConstraint_has_one_or_two_constrainedElements",
			"ReadLinkObjectEndAction_ends_of_association",
			"TimeConstraint_has_one_constrainedElement",
			"InformationFlow_convey_classifiers",
			"State_destinations_or_sources_of_transitions"
	};
	
	
	public static HashMap<String, Integer> initPostTime() {
		HashMap<String, Integer> result = new HashMap<String, Integer>();
	       
		result.put("Parameter_stream_and_exception",7871);
		result.put("ObjectFlow_is_multicast_or_is_multireceive",8261);
		result.put("InformationItem_not_instantiable",8283);
		result.put("AcceptCallAction_unmarshall",8665);
		result.put("InitialNode_no_incoming_edges",9087);
		result.put("ActivityParameterNode_no_edges",9099);
		result.put("FinalState_no_regions",9209);
		result.put("ForkNode_one_incoming_edge",9369);
		result.put("ValuePin_no_incoming_edges",9483);
		result.put("InitialNode_control_edges",9606);
		result.put("MergeNode_one_outgoing_edge",9612);
		result.put("JoinNode_one_outgoing_edge",9615);
		result.put("FinalState_no_outgoing_transitions",9802);
		result.put("AcceptEventAction_no_output_pins",10286);
		result.put("State_submachine_or_regions",10489);
		result.put("Extension_is_binary",10632);
		result.put("ConditionalNode_no_input_pins",10693);
		result.put("Reception_same_name_as_signal",10755);
		result.put("Property_derived_union_is_read_only",10798);
		result.put("FinalNode_no_outgoing_edges",10893);
		result.put("Property_derived_union_is_derived",11250);
		result.put("Property_subsetted_property_names",11304);
		result.put("State_composite_states",11710);
		result.put("State_submachine_states",11727);
		result.put("InformationItem_has_no",11769);
		result.put("Enumeration_immutable",12075);
		result.put("Pin_not_unique",12851);
		result.put("AcceptEventAction_no_input_pins",13143);
		result.put("CallAction_synchronous_call",13167);
		result.put("Pin_control_pins",13351);
		result.put("DecisionNode_decision_input_flow_incoming",14336);
		result.put("ActivityParameterNode_has_parameters",17710);
		result.put("StringExpression_operands",19240);
		result.put("Component_no_nested_classifiers",24370);
		result.put("BehavioralFeature_abstract_no_method",34790);
		result.put("Extend_extension_points",35007);
		result.put("LinkAction_not_static",46661);
		result.put("ExecutionSpecification_same_lifeline",52077);
		result.put("CreateObjectAction_classifier_not_association_class",52166);
		result.put("ClassifierTemplateParameter_has_constraining_classifier",60942);
		result.put("Node_internal_structure",70589);
		result.put("StructuralFeatureAction_not_static",86122);
		result.put("InformationFlow_convey_classifiers",95438);
		result.put("ReadLinkObjectEndAction_ends_of_association",103533);
		result.put("CommunicationPath_association_ends",144433);
		result.put("ActionInputPin_input_pin",172388);
		result.put("State_destinations_or_sources_of_transitions",187639);
		result.put("Behavior_feature_of_context_classifier",190763);
		result.put("ActionInputPin_one_output_pin",194871);
		result.put("CreateObjectAction_classifier_not_abstract",199816);

		return result;
	}

	
	public static HashMap<String, Integer> initPostTimeSep() {
		HashMap<String, Integer> result = new HashMap<String, Integer>();
	       
		result.put("Parameter_stream_and_exception",180000);
		result.put("ObjectFlow_is_multicast_or_is_multireceive",180000);
		result.put("InformationItem_not_instantiable",180000);
		result.put("AcceptCallAction_unmarshall",139891);
		result.put("InitialNode_no_incoming_edges",180000);
		result.put("ActivityParameterNode_no_edges",180000);
		result.put("FinalState_no_regions",180000);
		result.put("ForkNode_one_incoming_edge",180000);
		result.put("ValuePin_no_incoming_edges",64055);
		result.put("InitialNode_control_edges",180000);
		result.put("MergeNode_one_outgoing_edge",180000);
		result.put("JoinNode_one_outgoing_edge",180000);
		result.put("FinalState_no_outgoing_transitions",180000);
		result.put("AcceptEventAction_no_output_pins",180000);
		result.put("State_submachine_or_regions",180000);
		result.put("Extension_is_binary",180000);
		result.put("ConditionalNode_no_input_pins",180000);
		result.put("Reception_same_name_as_signal",180000);
		result.put("Property_derived_union_is_read_only",180000);
		result.put("FinalNode_no_outgoing_edges",180000);
		result.put("Property_derived_union_is_derived",180000);
		result.put("Property_subsetted_property_names",180000);
		result.put("State_composite_states",180000);
		result.put("State_submachine_states",180000);
		result.put("InformationItem_has_no",180000);
		result.put("Enumeration_immutable",180000);
		result.put("Pin_not_unique",180000);
		result.put("AcceptEventAction_no_input_pins",180000);
		result.put("CallAction_synchronous_call",180000);
		result.put("Pin_control_pins",180000);
		result.put("DecisionNode_decision_input_flow_incoming",180000);
		result.put("ActivityParameterNode_has_parameters",180000);
		result.put("StringExpression_operands",180000);
		result.put("Component_no_nested_classifiers",93588);
		result.put("BehavioralFeature_abstract_no_method",180000);
		result.put("Extend_extension_points",180000);
		result.put("LinkAction_not_static",180000);
		result.put("ExecutionSpecification_same_lifeline",180000);
		result.put("CreateObjectAction_classifier_not_association_class",180000);
		result.put("ClassifierTemplateParameter_has_constraining_classifier",180000);
		result.put("Node_internal_structure",180000);
		result.put("StructuralFeatureAction_not_static",180000);
		result.put("InformationFlow_convey_classifiers",180000);
		result.put("ReadLinkObjectEndAction_ends_of_association",180000);
		result.put("CommunicationPath_association_ends",180000);
		result.put("ActionInputPin_input_pin",180000);
		result.put("State_destinations_or_sources_of_transitions",180000);
		result.put("Behavior_feature_of_context_classifier",180000);
		result.put("ActionInputPin_one_output_pin",180000);
		result.put("CreateObjectAction_classifier_not_abstract",180000);

		return result;
	}
	
	
	public static HashMap<String, HashSet<String>> refactor() {
		HashMap<String, HashSet<String>> result = new HashMap<String, HashSet<String>>();
	    
		HashSet<String> UML2Singleton = new HashSet<String>();
		UML2Singleton.add("CopyClass");
		//UML2Singleton.add("CopyProperty");
		//UML2Singleton.add("CopyOperation");
		//UML2Singleton.add("CopyParameter");
		//UML2Singleton.add("CopyOpaqueBehavior");
		result.put("UML2Singleton", UML2Singleton);
		
		HashSet<String> UML2DataTypes = new HashSet<String>();
		//UML2DataTypes.add("CopyProperty");
		UML2DataTypes.add("CopyOpaqueExpression");
		//UML2DataTypes.add("CopyParameter");
		UML2DataTypes.add("CopyOperation");
		result.put("UML2DataTypes", UML2DataTypes);
		

		HashSet<String> UML2MIDlet = new HashSet<String>();
		UML2MIDlet.add("CopyClass");
		//UML2MIDlet.add("CopyGeneralization");
		//UML2MIDlet.add("CopyOperation");
		UML2MIDlet.add("CopyOpaqueBehavior");
		result.put("UML2MIDlet", UML2MIDlet);
		
		
		HashSet<String> UML2Profiles = new HashSet<String>();
		UML2Profiles.add("CopyModel");
		result.put("UML2Profiles", UML2Profiles);
		
		HashSet<String> Java2UML = new HashSet<String>();
		Java2UML.add("CopyClass");
		Java2UML.add("CopyOperation");
		//Java2UML.add("CopyParameter");
		//Java2UML.add("CopyOpaqueBehavior");
		result.put("Java2UML", Java2UML);
		
		HashSet<String> UML2AbstractFactory = new HashSet<String>();
		UML2AbstractFactory.add("CopyClass");
		UML2AbstractFactory.add("CopyInterface");
		UML2AbstractFactory.add("CopyDependency");

		//UML2AbstractFactory.add("CopyOperation");
		//UML2AbstractFactory.add("CopyParameter");
		//UML2AbstractFactory.add("CopyOpaqueBehavior");
		result.put("UML2AbstractFactory", UML2AbstractFactory);
		
		HashSet<String> UML2Accessors = new HashSet<String>();
		UML2Accessors.add("CopyPackage");
		UML2Accessors.add("CopyClass");
		//UML2Accessors.add("CopyProperty");
		//UML2Accessors.add("CopyOperation");
		//UML2Accessors.add("CopyParameter");
		//UML2Accessors.add("CopyOpaqueBehavior");
		//UML2Accessors.add("CopyLiteralInteger");
		//UML2Accessors.add("CopyLiteralUnlimitedNatural");
		//UML2Accessors.add("CopyDependency");
		result.put("UML2Accessors", UML2Accessors);
		
		HashSet<String> UML2Applet = new HashSet<String>();
		UML2Applet.add("CopyClass");
		//UML2Applet.add("CopyGeneralization");
		//UML2Applet.add("CopyOpaqueBehavior");
		//UML2Applet.add("CopyOperation");
		//UML2Applet.add("CopyParameter");
		result.put("UML2Applet", UML2Applet);
		
		HashSet<String> UML2AsyncMethods = new HashSet<String>();
		UML2AsyncMethods.add("CopyOpaqueBehavior");
		result.put("UML2AsyncMethods", UML2AsyncMethods);
		
		HashSet<String> UML2JavaObserver = new HashSet<String>();
		UML2JavaObserver.add("CopyClass");
		//UML2JavaObserver.add("CopyGeneralization");
		//UML2JavaObserver.add("CopyInterfaceRealization");
		//UML2JavaObserver.add("CopyOperation");
		//UML2JavaObserver.add("CopyParameter");
		UML2JavaObserver.add("CopyOpaqueBehavior");
		result.put("UML2JavaObserver", UML2JavaObserver);
		
		HashSet<String> UML2Observer = new HashSet<String>();
		UML2Observer.add("CopyPackage");
		UML2Observer.add("CopyClass");
		//UML2Observer.add("CopyProperty");
		//UML2Observer.add("CopyOperation");
		//UML2Observer.add("CopyParameter");
		UML2Observer.add("CopyOpaqueBehavior");
		//UML2Observer.add("CopyLiteralInteger");
		//UML2Observer.add("CopyLiteralUnlimitedNatural");
		//UML2Observer.add("CopyInterfaceRealization");
		result.put("UML2Observer", UML2Observer);
		
		HashSet<String> UML2SWTApplication = new HashSet<String>();
		UML2SWTApplication.add("CopyClass");
		//UML2SWTApplication.add("CopyGeneralization");
		//UML2SWTApplication.add("CopyOperation");
		//UML2SWTApplication.add("CopyParameter");
		UML2SWTApplication.add("CopyOpaqueBehavior");
		result.put("UML2SWTApplication", UML2SWTApplication);
		return result;
	}
}
