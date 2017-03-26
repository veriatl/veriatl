package fr.emn.atlanmod.veriatl.experiment.standalone;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class CreateMap {
	
	public static String[] AddMutants() {
		return new String[] {
				"AR016","AR017","AR018","AR019","AR020","AR021","AR022","AR023","AR024","AR025","AR026","AR027","AR028","AR029","AR030","AR031","AR032","AR033","AR034","AR035","AR036","AR037","AR038","AR039","AR040","AR041","AR042","AR043","AR044","AR045","AR046","AR047","AR048","AR049"
				
		};
	}
	
	
	public static String[] DelMutants() {
		return new String[] {
				"DR050","DR051","DR052","DR053","DR054","DR055","DR056","DR057","DR058","DR059","DR060","DR061","DR062","DR063","DR064","DR065","DR066","DR067","DR068","DR069","DR070","DR071","DR072","DR073","DR074","DR075","DR076","DR077","DR078","DR079","DR080","DR081","DR082","DR083","DR084","DR085","DR086","DR087","DR088","DR089","DR090","DR091","DR092","DR093","DR094","DR095","DR096","DR097","DR098","DR099"	
		};
	}
	
	public static String[] FilterMutants() {
		return new String[] {
				"MF100_000","MF102_000","MF104_000","MF105_000","MF111_000","MF113_000","MF117_000","MF118_000","MF120_000","MF121_000","MF123_000","MF125_000","MF129_000","MF132_000","MF133_000","MF135_000","MF136_000","MF138_000","MF139_000","MF142_000","MF143_000","MF144_000","MF145_000","MF146_000","MF147_000","MF148_000","MF149_000"
		};
		
	}
	
	public static String[] BindMutants() {
		return new String[] {
				"MB150_000","MB151_000","MB152_000","MB153_000","MB154_000","MB155_000","MB156_000","MB157_000","MB158_000","MB159_000","MB160_000","MB161_000","MB162_000","MB163_000","MB164_000","MB165_000","MB166_000","MB167_000","MB168_000","MB169_000","MB170_000","MB171_000","MB172_000","MB173_000","MB174_000","MB175_000","MB176_000","MB177_000","MB178_000","MB179_000","MB180_000","MB181_000","MB182_000","MB183_000","MB184_000","MB185_000","MB186_000","MB187_000","MB188_000","MB189_000","MB190_000","MB191_000","MB192_000"	
		};
		
	}
	
    public static Map<String, String> Add() {
    	Map<String, String> result = new HashMap<String, String>();
       
        result.put("AR016", "CopyBehaviorExecutionSpecification_mutated");
        result.put("AR017", "CopyBroadcastSignalAction_mutated");
        result.put("AR018", "CopyCallBehaviorAction_mutated");
        result.put("AR019", "CopyCallEvent_mutated");
        result.put("AR020", "CopyCallOperationAction_mutated");
        result.put("AR021", "CopyCentralBufferNode_mutated");
        result.put("AR022", "CopyChangeEvent_mutated");
        result.put("AR023", "CopyClass_mutated");
        result.put("AR024", "CopyClassifierTemplateParameter_mutated");
        result.put("AR025", "CopyClause_mutated");
        result.put("AR026", "CopyClearAssociationAction_mutated");
        result.put("AR027", "CopyClearStructuralFeatureAction_mutated");
        result.put("AR028", "CopyClearVariableAction_mutated");
        result.put("AR029", "CopyCollaboration_mutated");
        result.put("AR030", "CopyCollaborationUse_mutated");
        result.put("AR031", "CopyCombinedFragment_mutated");
        result.put("AR032", "CopyComment_mutated");
        result.put("AR033", "CopyCommunicationPath_mutated");
        result.put("AR034", "CopyComponent_mutated");
        result.put("AR035", "CopyComponentRealization_mutated");
        result.put("AR036", "CopyConditionalNode_mutated");
        result.put("AR037", "CopyConnectableElementTemplateParameter_mutated");
        result.put("AR038", "CopyConnectionPointReference_mutated");
        result.put("AR039", "CopyConnector_mutated");
        result.put("AR040", "CopyConnectorEnd_mutated");
        result.put("AR041", "CopyConsiderIgnoreFragment_mutated");
        result.put("AR042", "CopyConstraint_mutated");
        result.put("AR043", "CopyContinuation_mutated");
        result.put("AR044", "CopyControlFlow_mutated");
        result.put("AR045", "CopyCreateLinkAction_mutated");
        result.put("AR046", "CopyCreateLinkObjectAction_mutated");
        result.put("AR047", "CopyCreateObjectAction_mutated");
        result.put("AR048", "CopyDataStoreNode_mutated");
        result.put("AR049", "CopyDataType_mutated");
  
        return Collections.unmodifiableMap(result);
    }
    
    public static Map<String, String> Del() {
    	Map<String, String> result = new HashMap<String, String>();
    	result.put("DR050", "CopyDecisionNode");
    	result.put("DR051", "CopyDependency");
    	result.put("DR052", "CopyDeployment");
    	result.put("DR053", "CopyDeploymentSpecification");
    	result.put("DR054", "CopyDestroyLinkAction");
    	result.put("DR055", "CopyDestroyObjectAction");
    	result.put("DR056", "CopyDestructionOccurrenceSpecification");
    	result.put("DR057", "CopyDevice");
    	result.put("DR058", "CopyDuration");
    	result.put("DR059", "CopyDurationConstraint");
    	result.put("DR060", "CopyDurationInterval");
    	result.put("DR061", "CopyDurationObservation");
    	result.put("DR062", "CopyElementImport");
    	result.put("DR063", "CopyEnumeration");
    	result.put("DR064", "CopyEnumerationLiteral");
    	result.put("DR065", "CopyExceptionHandler");
    	result.put("DR066", "CopyExecutionEnvironment");
    	result.put("DR067", "CopyExecutionOccurrenceSpecification");
    	result.put("DR068", "CopyExpansionNode");
    	result.put("DR069", "CopyExpansionRegion");
    	result.put("DR070", "CopyExpression");
    	result.put("DR071", "CopyExtend");
    	result.put("DR072", "CopyExtension");
    	result.put("DR073", "CopyExtensionEnd");
    	result.put("DR074", "CopyExtensionPoint");
    	result.put("DR075", "CopyFinalState");
    	result.put("DR076", "CopyFlowFinalNode");
    	result.put("DR077", "CopyForkNode");
    	result.put("DR078", "CopyFunctionBehavior");
    	result.put("DR079", "CopyGate");
    	result.put("DR080", "CopyGeneralOrdering");
    	result.put("DR081", "CopyGeneralization");
    	result.put("DR082", "CopyGeneralizationSet");
    	result.put("DR083", "CopyImage");
    	result.put("DR084", "CopyInclude");
    	result.put("DR085", "CopyInformationFlow");
    	result.put("DR086", "CopyInformationItem");
    	result.put("DR087", "CopyInitialNode");
    	result.put("DR088", "CopyInputPin");
    	result.put("DR089", "CopyInstanceSpecification");
    	result.put("DR090", "CopyInstanceValue");
    	result.put("DR091", "CopyInteraction");
    	result.put("DR092", "CopyInteractionConstraint");
    	result.put("DR093", "CopyInteractionOperand");
    	result.put("DR094", "CopyInteractionUse");
    	result.put("DR095", "CopyInterface");
    	result.put("DR096", "CopyInterfaceRealization");
    	result.put("DR097", "CopyInterruptibleActivityRegion");
    	result.put("DR098", "CopyInterval");
    	result.put("DR099", "CopyIntervalConstraint");

        
        return Collections.unmodifiableMap(result);
    }
    
    public static Map<String, String> Filter() {
    	Map<String, String> result = new HashMap<String, String>();
    	result.put("MF100_000", "CopyJoinNode");
    	result.put("MF102_000", "CopyLinkEndCreationData");
    	result.put("MF104_000", "CopyLinkEndDestructionData");
    	result.put("MF105_000", "CopyLiteralBoolean");
    	result.put("MF111_000", "CopyLoopNode");
    	result.put("MF113_000", "CopyMergeNode");
    	result.put("MF117_000", "CopyNode");
    	result.put("MF118_000", "CopyObjectFlow");
    	result.put("MF120_000", "CopyOpaqueAction");
    	result.put("MF121_000", "CopyOpaqueBehavior");
    	result.put("MF123_000", "CopyOperation");
    	result.put("MF125_000", "CopyOutputPin");
    	result.put("MF129_000", "CopyParameter");
    	result.put("MF132_000", "CopyPort");
    	result.put("MF133_000", "CopyPrimitiveType");
    	result.put("MF135_000", "CopyProfileApplication");
    	result.put("MF136_000", "CopyProperty");
    	result.put("MF138_000", "CopyProtocolStateMachine");
    	result.put("MF139_000", "CopyProtocolTransition");
    	result.put("MF142_000", "CopyRaiseExceptionAction");
    	result.put("MF143_000", "CopyReadExtentAction");
    	result.put("MF144_000", "CopyReadIsClassifiedObjectAction");
    	result.put("MF145_000", "CopyReadLinkAction");
    	result.put("MF146_000", "CopyReadLinkObjectEndAction");
    	result.put("MF147_000", "CopyReadLinkObjectEndQualifierAction");
    	result.put("MF148_000", "CopyReadSelfAction");
    	result.put("MF149_000", "CopyReadStructuralFeatureAction");

        
        return Collections.unmodifiableMap(result);
    }
    
    public static Map<String, String> Bind() {
    	Map<String, String> result = new HashMap<String, String>();
    	result.put("MB150_000", "CopyReadVariableAction");
    	result.put("MB151_000", "CopyRealization");
    	result.put("MB152_000", "CopyReception");
    	result.put("MB153_000", "CopyReclassifyObjectAction");
    	result.put("MB154_000", "CopyRedefinableTemplateSignature");
    	result.put("MB155_000", "CopyReduceAction");
    	result.put("MB156_000", "CopyRegion");
    	result.put("MB157_000", "CopyRemoveStructuralFeatureValueAction");
    	result.put("MB158_000", "CopyRemoveVariableValueAction");
    	result.put("MB159_000", "CopyReplyAction");
    	result.put("MB160_000", "CopySendObjectAction");
    	result.put("MB161_000", "CopySendSignalAction");
    	result.put("MB162_000", "CopySequenceNode");
    	result.put("MB163_000", "CopySignal");
    	result.put("MB164_000", "CopySignalEvent");
    	result.put("MB165_000", "CopySlot");
    	result.put("MB166_000", "CopyStartClassifierBehaviorAction");
    	result.put("MB167_000", "CopyStartObjectBehaviorAction");
    	result.put("MB168_000", "CopyState");
    	result.put("MB169_000", "CopyStateInvariant");
    	result.put("MB170_000", "CopyStateMachine");
    	result.put("MB171_000", "CopyStereotype");
    	result.put("MB172_000", "CopyStringExpression");
    	result.put("MB173_000", "CopyStructuredActivityNode");
    	result.put("MB174_000", "CopySubstitution");
    	result.put("MB175_000", "CopyTemplateBinding");
    	result.put("MB176_000", "CopyTemplateParameter");
    	result.put("MB177_000", "CopyTemplateParameterSubstitution");
    	result.put("MB178_000", "CopyTemplateSignature");
    	result.put("MB179_000", "CopyTestIdentityAction");
    	result.put("MB180_000", "CopyTimeConstraint");
    	result.put("MB181_000", "CopyTimeEvent");
    	result.put("MB182_000", "CopyTimeExpression");
    	result.put("MB183_000", "CopyTimeInterval");
    	result.put("MB184_000", "CopyTimeObservation");
    	result.put("MB185_000", "CopyTransition");
    	result.put("MB186_000", "CopyTrigger");
    	result.put("MB187_000", "CopyUnmarshallAction");
    	result.put("MB188_000", "CopyUsage");
    	result.put("MB189_000", "CopyUseCase");
    	result.put("MB190_000", "CopyValuePin");
    	result.put("MB191_000", "CopyValueSpecificationAction");
    	result.put("MB192_000", "CopyVariable");

        
        return Collections.unmodifiableMap(result);
    }

	
}
