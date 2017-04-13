package experiment;

import java.util.HashMap;

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
	       
		result.put("Parameter_stream_and_exception", 7215);
		result.put("ObjectFlow_is_multicast_or_is_multireceive", 7586);
		result.put("InformationItem_not_instantiable", 7947);
		result.put("AcceptCallAction_unmarshall", 8921);
		result.put("FinalState_no_regions", 8056);
		result.put("State_submachine_or_regions", 8641);
		result.put("Reception_same_name_as_signal", 9218);
		result.put("State_submachine_states", 7393);
		result.put("ForkNode_one_incoming_edge", 7965);
		result.put("ValuePin_no_incoming_edges", 8093);
		result.put("MergeNode_one_outgoing_edge", 8526);
		result.put("ActivityParameterNode_no_edges", 8553);
		result.put("JoinNode_one_outgoing_edge", 8622);
		result.put("FinalState_no_outgoing_transitions", 8628);
		result.put("InitialNode_no_incoming_edges", 8744);
		result.put("Property_derived_union_is_derived", 9084);
		result.put("Property_derived_union_is_read_only", 9123);
		result.put("InitialNode_control_edges", 9577);
		result.put("State_composite_states", 10134);
		result.put("DecisionNode_decision_input_flow_incoming", 10725);
		result.put("Property_subsetted_property_names", 11045);
		result.put("ActivityParameterNode_has_parameters", 13183);
		result.put("Extend_extension_points", 51244);
		result.put("Extension_is_binary", 9244);
		result.put("FinalNode_no_outgoing_edges", 9302);
		result.put("ConditionalNode_no_input_pins", 9753);
		result.put("Pin_not_unique", 10350);
		result.put("Pin_control_pins", 10406);
		result.put("CallAction_synchronous_call", 11453);
		result.put("AcceptEventAction_no_output_pins", 11518);
		result.put("Enumeration_immutable", 13353);
		result.put("ProtocolStateMachine_protocol_transitions", 15934);
		result.put("AcceptEventAction_no_input_pins", 10895);
		result.put("Node_internal_structure", 56151);
		result.put("State_destinations_or_sources_of_transitions", 158468);
		result.put("ExecutionSpecification_same_lifeline", 38078);
		result.put("StructuralFeatureAction_not_static", 61213);
		result.put("InformationItem_has_no", 12774);
		result.put("TemplateBinding_parameter_substitution_formal", 16504);
		result.put("BehavioralFeature_abstract_no_method", 21157);
		result.put("ReadLinkObjectEndAction_ends_of_association", 71088);
		result.put("LinkAction_not_static", 45850);
		result.put("StringExpression_operands", 13217);
		result.put("Behavior_feature_of_context_classifier", 160679);
		result.put("Component_no_nested_classifiers", 20714);
		result.put("CommunicationPath_association_ends", 160972);
		result.put("ClassifierTemplateParameter_has_constraining_classifier", 10157);
		result.put("CreateObjectAction_classifier_not_association_class", 41661);
		result.put("InformationFlow_convey_classifiers", 82296);
		result.put("CreateObjectAction_classifier_not_abstract", 161742);
		result.put("ActivityParameterNode_same_type", 159682);
		result.put("ReadExtentAction_type_is_classifier", 160481);
		result.put("CreateObjectAction_same_type", 160805);
		result.put("ReadLinkObjectEndAction_type_of_result", 160836);
		result.put("ReadLinkObjectEndQualifierAction_same_type", 161469);
		result.put("ReadLinkObjectEndAction_type_of_object", 161662);
		result.put("ActionInputPin_one_output_pin", 162506);
		result.put("ActionInputPin_input_pin", 135583);
		result.put("ExceptionHandler_handler_body_edges", 163047);
		result.put("ObjectFlow_no_executable_nodes", 161000);
		result.put("ConsiderIgnoreFragment_type", 166010);
		result.put("DurationConstraint_has_one_or_two_constrainedElements", 166572);
		result.put("TimeConstraint_has_one_constrainedElement", 168093);
		result.put("Constraint_not_apply_to_self", 185639);

		return result;
	}
}
