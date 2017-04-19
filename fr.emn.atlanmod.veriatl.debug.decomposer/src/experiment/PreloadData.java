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
}
