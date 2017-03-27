package fr.emn.atlanmod.veriatl.experiment.standalone;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class CreateMap {
	
	public static String[] AddMutants() {
		return new String[] {
				//"AR000","AR001","AR002","AR003","AR004","AR005","AR006","AR007","AR008","AR009","AR010","AR011","AR012","AR013","AR014","AR015","AR016","AR017","AR018","AR019","AR020","AR021","AR022","AR023","AR024","AR025","AR026","AR027","AR028","AR029",
				//"AR030","AR031","AR032","AR033","AR034","AR035","AR036","AR037","AR038","AR039","AR040","AR041","AR042","AR043","AR044","AR045","AR046","AR047","AR048","AR049",
				//"AR062","AR063","AR064","AR065","AR066","AR067","AR068","AR069","AR070","AR071","AR072","AR073","AR074","AR075","AR076","AR077","AR078","AR079","AR080","AR081","AR082","AR083",
				//"AR084","AR085","AR086","AR087","AR088","AR089","AR090","AR091","AR092","AR093","AR094","AR095","AR096","AR097","AR098","AR099","AR100","AR101","AR102","AR103","AR104","AR105","AR106","AR107","AR108","AR109","AR110","AR111","AR112","AR113","AR114","AR115","AR116","AR117",
				//"AR118","AR119","AR120","AR121","AR122","AR123","AR124","AR125","AR126","AR127","AR128","AR129","AR130","AR131","AR132","AR133","AR134","AR135","AR136","AR137","AR138","AR139","AR140","AR141","AR142","AR143","AR144","AR145","AR146","AR147","AR148","AR149","AR150",
				//"AR151","AR152","AR153","AR154","AR155","AR156","AR157","AR158","AR159","AR160","AR161","AR162","AR163","AR164","AR165","AR166","AR167","AR168","AR169","AR170","AR171","AR172","AR173","AR174","AR175","AR176","AR177","AR178","AR179","AR180","AR181","AR182","AR183","AR184","AR185",
				//"AR186","AR187","AR188","AR189","AR190","AR191","AR192"
		};
	}
	
	
	public static String[] DelMutants() {
		return new String[] {
		
				"DR000","DR001","DR002","DR003","DR004","DR005","DR006","DR007","DR008","DR009","DR010","DR011","DR012","DR013","DR014","DR015","DR016","DR017","DR018","DR019","DR020","DR021","DR022","DR023","DR024","DR025","DR026","DR027","DR028","DR029","DR030","DR031","DR032","DR033","DR034","DR035","DR036","DR037","DR038","DR039","DR040","DR041","DR042","DR043","DR044","DR045","DR046","DR047","DR048","DR049",
				"DR050","DR051","DR052","DR053","DR054","DR055","DR056","DR057","DR058","DR059","DR060","DR061","DR062","DR063","DR064","DR065","DR066","DR067","DR068","DR069","DR070","DR071","DR072","DR073","DR074","DR075","DR076","DR077","DR078","DR079","DR080","DR081","DR082","DR083","DR084","DR085","DR086","DR087","DR088","DR089","DR090","DR091","DR092","DR093","DR094","DR095","DR096","DR097","DR098","DR099",
				"DR100","DR101","DR102","DR103","DR104","DR105","DR106","DR107","DR108","DR109","DR110","DR111","DR112","DR113","DR114","DR115","DR116","DR117","DR118","DR119","DR120","DR121","DR122","DR123","DR124","DR125","DR126","DR127","DR128","DR129","DR130","DR131","DR132","DR133","DR134","DR135","DR136","DR137","DR138","DR139","DR140","DR141","DR142","DR143","DR144","DR145","DR146","DR147","DR148","DR149",
				"DR150","DR151","DR152","DR153","DR154","DR155","DR156","DR157","DR158","DR159","DR160","DR161","DR162","DR163","DR164","DR165","DR166","DR167","DR168","DR169","DR170","DR171","DR172","DR173","DR174","DR175","DR176","DR177","DR178","DR179","DR180","DR181","DR182","DR183","DR184","DR185","DR186","DR187","DR188","DR189","DR190","DR191","DR192"
		
		};
	}
	
	public static String[] FilterMutants() {
		return new String[] {
				//"MF100_000","MF102_000","MF104_000","MF105_000","MF111_000","MF113_000","MF117_000","MF118_000","MF120_000","MF121_000",
				//"MF123_000","MF125_000","MF129_000","MF132_000","MF133_000","MF135_000","MF136_000","MF138_000","MF139_000",
				//"MF142_000","MF143_000","MF144_000","MF145_000","MF146_000","MF147_000","MF148_000","MF149_000"
		};
		
	}
	
	public static String[] BindMutants() {
		return new String[] {
				"MB150_000","MB151_000","MB152_000","MB153_000","MB154_000","MB155_000","MB156_000","MB157_000","MB158_000","MB159_000","MB160_000","MB161_000","MB162_000","MB163_000","MB164_000","MB165_000","MB166_000","MB167_000","MB168_000","MB169_000","MB170_000","MB171_000","MB172_000","MB173_000","MB174_000","MB175_000","MB176_000","MB177_000","MB178_000","MB179_000","MB180_000","MB181_000","MB182_000","MB183_000","MB184_000","MB185_000","MB186_000","MB187_000","MB188_000","MB189_000","MB190_000","MB191_000","MB192_000"	
		};
		
	}
	
    public static Map<String, String> Add() {
    	Map<String, String> result = new HashMap<String, String>();
       
    	result.put("AR000", "CopyAbstraction_mutated");
    	result.put("AR001", "CopyAcceptCallAction_mutated");
    	result.put("AR002", "CopyAcceptEventAction_mutated");
    	result.put("AR003", "CopyActionExecutionSpecification_mutated");
    	result.put("AR004", "CopyActionInputPin_mutated");
    	result.put("AR005", "CopyActivity_mutated");
    	result.put("AR006", "CopyActivityFinalNode_mutated");
    	result.put("AR007", "CopyActivityParameterNode_mutated");
    	result.put("AR008", "CopyActivityPartition_mutated");
    	result.put("AR009", "CopyActor_mutated");
    	result.put("AR010", "CopyAddStructuralFeatureValueAction_mutated");
    	result.put("AR011", "CopyAddVariableValueAction_mutated");
    	result.put("AR012", "CopyAnyReceiveEvent_mutated");
    	result.put("AR013", "CopyArtifact_mutated");
    	result.put("AR014", "CopyAssociation_mutated");
    	result.put("AR015", "CopyAssociationClass_mutated");
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
    	result.put("AR050", "CopyDecisionNode_mutated");
    	result.put("AR051", "CopyDependency_mutated");
    	result.put("AR052", "CopyDeployment_mutated");
    	result.put("AR053", "CopyDeploymentSpecification_mutated");
    	result.put("AR054", "CopyDestroyLinkAction_mutated");
    	result.put("AR055", "CopyDestroyObjectAction_mutated");
    	result.put("AR056", "CopyDestructionOccurrenceSpecification_mutated");
    	result.put("AR057", "CopyDevice_mutated");
    	result.put("AR058", "CopyDuration_mutated");
    	result.put("AR059", "CopyDurationConstraint_mutated");
    	result.put("AR060", "CopyDurationInterval_mutated");
    	result.put("AR061", "CopyDurationObservation_mutated");
    	result.put("AR062", "CopyElementImport_mutated");
    	result.put("AR063", "CopyEnumeration_mutated");
    	result.put("AR064", "CopyEnumerationLiteral_mutated");
    	result.put("AR065", "CopyExceptionHandler_mutated");
    	result.put("AR066", "CopyExecutionEnvironment_mutated");
    	result.put("AR067", "CopyExecutionOccurrenceSpecification_mutated");
    	result.put("AR068", "CopyExpansionNode_mutated");
    	result.put("AR069", "CopyExpansionRegion_mutated");
    	result.put("AR070", "CopyExpression_mutated");
    	result.put("AR071", "CopyExtend_mutated");
    	result.put("AR072", "CopyExtension_mutated");
    	result.put("AR073", "CopyExtensionEnd_mutated");
    	result.put("AR074", "CopyExtensionPoint_mutated");
    	result.put("AR075", "CopyFinalState_mutated");
    	result.put("AR076", "CopyFlowFinalNode_mutated");
    	result.put("AR077", "CopyForkNode_mutated");
    	result.put("AR078", "CopyFunctionBehavior_mutated");
    	result.put("AR079", "CopyGate_mutated");
    	result.put("AR080", "CopyGeneralOrdering_mutated");
    	result.put("AR081", "CopyGeneralization_mutated");
    	result.put("AR082", "CopyGeneralizationSet_mutated");
    	result.put("AR083", "CopyImage_mutated");
    	result.put("AR084", "CopyInclude_mutated");
    	result.put("AR085", "CopyInformationFlow_mutated");
    	result.put("AR086", "CopyInformationItem_mutated");
    	result.put("AR087", "CopyInitialNode_mutated");
    	result.put("AR088", "CopyInputPin_mutated");
    	result.put("AR089", "CopyInstanceSpecification_mutated");
    	result.put("AR090", "CopyInstanceValue_mutated");
    	result.put("AR091", "CopyInteraction_mutated");
    	result.put("AR092", "CopyInteractionConstraint_mutated");
    	result.put("AR093", "CopyInteractionOperand_mutated");
    	result.put("AR094", "CopyInteractionUse_mutated");
    	result.put("AR095", "CopyInterface_mutated");
    	result.put("AR096", "CopyInterfaceRealization_mutated");
    	result.put("AR097", "CopyInterruptibleActivityRegion_mutated");
    	result.put("AR098", "CopyInterval_mutated");
    	result.put("AR099", "CopyIntervalConstraint_mutated");
    	result.put("AR100", "CopyJoinNode_mutated");
    	result.put("AR101", "CopyLifeline_mutated");
    	result.put("AR102", "CopyLinkEndCreationData_mutated");
    	result.put("AR103", "CopyLinkEndData_mutated");
    	result.put("AR104", "CopyLinkEndDestructionData_mutated");
    	result.put("AR105", "CopyLiteralBoolean_mutated");
    	result.put("AR106", "CopyLiteralInteger_mutated");
    	result.put("AR107", "CopyLiteralNull_mutated");
    	result.put("AR108", "CopyLiteralReal_mutated");
    	result.put("AR109", "CopyLiteralString_mutated");
    	result.put("AR110", "CopyLiteralUnlimitedNatural_mutated");
    	result.put("AR111", "CopyLoopNode_mutated");
    	result.put("AR112", "CopyManifestation_mutated");
    	result.put("AR113", "CopyMergeNode_mutated");
    	result.put("AR114", "CopyMessage_mutated");
    	result.put("AR115", "CopyMessageOccurrenceSpecification_mutated");
    	result.put("AR116", "CopyModel_mutated");
    	result.put("AR117", "CopyNode_mutated");
    	result.put("AR118", "CopyObjectFlow_mutated");
    	result.put("AR119", "CopyOccurrenceSpecification_mutated");
    	result.put("AR120", "CopyOpaqueAction_mutated");
    	result.put("AR121", "CopyOpaqueBehavior_mutated");
    	result.put("AR122", "CopyOpaqueExpression_mutated");
    	result.put("AR123", "CopyOperation_mutated");
    	result.put("AR124", "CopyOperationTemplateParameter_mutated");
    	result.put("AR125", "CopyOutputPin_mutated");
    	result.put("AR126", "CopyPackage_mutated");
    	result.put("AR127", "CopyPackageImport_mutated");
    	result.put("AR128", "CopyPackageMerge_mutated");
    	result.put("AR129", "CopyParameter_mutated");
    	result.put("AR130", "CopyParameterSet_mutated");
    	result.put("AR131", "CopyPartDecomposition_mutated");
    	result.put("AR132", "CopyPort_mutated");
    	result.put("AR133", "CopyPrimitiveType_mutated");
    	result.put("AR134", "CopyProfile_mutated");
    	result.put("AR135", "CopyProfileApplication_mutated");
    	result.put("AR136", "CopyProperty_mutated");
    	result.put("AR137", "CopyProtocolConformance_mutated");
    	result.put("AR138", "CopyProtocolStateMachine_mutated");
    	result.put("AR139", "CopyProtocolTransition_mutated");
    	result.put("AR140", "CopyPseudostate_mutated");
    	result.put("AR141", "CopyQualifierValue_mutated");
    	result.put("AR142", "CopyRaiseExceptionAction_mutated");
    	result.put("AR143", "CopyReadExtentAction_mutated");
    	result.put("AR144", "CopyReadIsClassifiedObjectAction_mutated");
    	result.put("AR145", "CopyReadLinkAction_mutated");
    	result.put("AR146", "CopyReadLinkObjectEndAction_mutated");
    	result.put("AR147", "CopyReadLinkObjectEndQualifierAction_mutated");
    	result.put("AR148", "CopyReadSelfAction_mutated");
    	result.put("AR149", "CopyReadStructuralFeatureAction_mutated");
    	result.put("AR150", "CopyReadVariableAction_mutated");
    	result.put("AR151", "CopyRealization_mutated");
    	result.put("AR152", "CopyReception_mutated");
    	result.put("AR153", "CopyReclassifyObjectAction_mutated");
    	result.put("AR154", "CopyRedefinableTemplateSignature_mutated");
    	result.put("AR155", "CopyReduceAction_mutated");
    	result.put("AR156", "CopyRegion_mutated");
    	result.put("AR157", "CopyRemoveStructuralFeatureValueAction_mutated");
    	result.put("AR158", "CopyRemoveVariableValueAction_mutated");
    	result.put("AR159", "CopyReplyAction_mutated");
    	result.put("AR160", "CopySendObjectAction_mutated");
    	result.put("AR161", "CopySendSignalAction_mutated");
    	result.put("AR162", "CopySequenceNode_mutated");
    	result.put("AR163", "CopySignal_mutated");
    	result.put("AR164", "CopySignalEvent_mutated");
    	result.put("AR165", "CopySlot_mutated");
    	result.put("AR166", "CopyStartClassifierBehaviorAction_mutated");
    	result.put("AR167", "CopyStartObjectBehaviorAction_mutated");
    	result.put("AR168", "CopyState_mutated");
    	result.put("AR169", "CopyStateInvariant_mutated");
    	result.put("AR170", "CopyStateMachine_mutated");
    	result.put("AR171", "CopyStereotype_mutated");
    	result.put("AR172", "CopyStringExpression_mutated");
    	result.put("AR173", "CopyStructuredActivityNode_mutated");
    	result.put("AR174", "CopySubstitution_mutated");
    	result.put("AR175", "CopyTemplateBinding_mutated");
    	result.put("AR176", "CopyTemplateParameter_mutated");
    	result.put("AR177", "CopyTemplateParameterSubstitution_mutated");
    	result.put("AR178", "CopyTemplateSignature_mutated");
    	result.put("AR179", "CopyTestIdentityAction_mutated");
    	result.put("AR180", "CopyTimeConstraint_mutated");
    	result.put("AR181", "CopyTimeEvent_mutated");
    	result.put("AR182", "CopyTimeExpression_mutated");
    	result.put("AR183", "CopyTimeInterval_mutated");
    	result.put("AR184", "CopyTimeObservation_mutated");
    	result.put("AR185", "CopyTransition_mutated");
    	result.put("AR186", "CopyTrigger_mutated");
    	result.put("AR187", "CopyUnmarshallAction_mutated");
    	result.put("AR188", "CopyUsage_mutated");
    	result.put("AR189", "CopyUseCase_mutated");
    	result.put("AR190", "CopyValuePin_mutated");
    	result.put("AR191", "CopyValueSpecificationAction_mutated");
    	result.put("AR192", "CopyVariable_mutated");
  
        return Collections.unmodifiableMap(result);
    }
    
    public static Map<String, String> Del() {
    	Map<String, String> result = new HashMap<String, String>();
    	result.put("DR000", "CopyAbstraction");
    	result.put("DR001", "CopyAcceptCallAction");
    	result.put("DR002", "CopyAcceptEventAction");
    	result.put("DR003", "CopyActionExecutionSpecification");
    	result.put("DR004", "CopyActionInputPin");
    	result.put("DR005", "CopyActivity");
    	result.put("DR006", "CopyActivityFinalNode");
    	result.put("DR007", "CopyActivityParameterNode");
    	result.put("DR008", "CopyActivityPartition");
    	result.put("DR009", "CopyActor");
    	result.put("DR010", "CopyAddStructuralFeatureValueAction");
    	result.put("DR011", "CopyAddVariableValueAction");
    	result.put("DR012", "CopyAnyReceiveEvent");
    	result.put("DR013", "CopyArtifact");
    	result.put("DR014", "CopyAssociation");
    	result.put("DR015", "CopyAssociationClass");
    	result.put("DR016", "CopyBehaviorExecutionSpecification");
    	result.put("DR017", "CopyBroadcastSignalAction");
    	result.put("DR018", "CopyCallBehaviorAction");
    	result.put("DR019", "CopyCallEvent");
    	result.put("DR020", "CopyCallOperationAction");
    	result.put("DR021", "CopyCentralBufferNode");
    	result.put("DR022", "CopyChangeEvent");
    	result.put("DR023", "CopyClass");
    	result.put("DR024", "CopyClassifierTemplateParameter");
    	result.put("DR025", "CopyClause");
    	result.put("DR026", "CopyClearAssociationAction");
    	result.put("DR027", "CopyClearStructuralFeatureAction");
    	result.put("DR028", "CopyClearVariableAction");
    	result.put("DR029", "CopyCollaboration");
    	result.put("DR030", "CopyCollaborationUse");
    	result.put("DR031", "CopyCombinedFragment");
    	result.put("DR032", "CopyComment");
    	result.put("DR033", "CopyCommunicationPath");
    	result.put("DR034", "CopyComponent");
    	result.put("DR035", "CopyComponentRealization");
    	result.put("DR036", "CopyConditionalNode");
    	result.put("DR037", "CopyConnectableElementTemplateParameter");
    	result.put("DR038", "CopyConnectionPointReference");
    	result.put("DR039", "CopyConnector");
    	result.put("DR040", "CopyConnectorEnd");
    	result.put("DR041", "CopyConsiderIgnoreFragment");
    	result.put("DR042", "CopyConstraint");
    	result.put("DR043", "CopyContinuation");
    	result.put("DR044", "CopyControlFlow");
    	result.put("DR045", "CopyCreateLinkAction");
    	result.put("DR046", "CopyCreateLinkObjectAction");
    	result.put("DR047", "CopyCreateObjectAction");
    	result.put("DR048", "CopyDataStoreNode");
    	result.put("DR049", "CopyDataType");
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
    	result.put("DR100", "CopyJoinNode");
    	result.put("DR101", "CopyLifeline");
    	result.put("DR102", "CopyLinkEndCreationData");
    	result.put("DR103", "CopyLinkEndData");
    	result.put("DR104", "CopyLinkEndDestructionData");
    	result.put("DR105", "CopyLiteralBoolean");
    	result.put("DR106", "CopyLiteralInteger");
    	result.put("DR107", "CopyLiteralNull");
    	result.put("DR108", "CopyLiteralReal");
    	result.put("DR109", "CopyLiteralString");
    	result.put("DR110", "CopyLiteralUnlimitedNatural");
    	result.put("DR111", "CopyLoopNode");
    	result.put("DR112", "CopyManifestation");
    	result.put("DR113", "CopyMergeNode");
    	result.put("DR114", "CopyMessage");
    	result.put("DR115", "CopyMessageOccurrenceSpecification");
    	result.put("DR116", "CopyModel");
    	result.put("DR117", "CopyNode");
    	result.put("DR118", "CopyObjectFlow");
    	result.put("DR119", "CopyOccurrenceSpecification");
    	result.put("DR120", "CopyOpaqueAction");
    	result.put("DR121", "CopyOpaqueBehavior");
    	result.put("DR122", "CopyOpaqueExpression");
    	result.put("DR123", "CopyOperation");
    	result.put("DR124", "CopyOperationTemplateParameter");
    	result.put("DR125", "CopyOutputPin");
    	result.put("DR126", "CopyPackage");
    	result.put("DR127", "CopyPackageImport");
    	result.put("DR128", "CopyPackageMerge");
    	result.put("DR129", "CopyParameter");
    	result.put("DR130", "CopyParameterSet");
    	result.put("DR131", "CopyPartDecomposition");
    	result.put("DR132", "CopyPort");
    	result.put("DR133", "CopyPrimitiveType");
    	result.put("DR134", "CopyProfile");
    	result.put("DR135", "CopyProfileApplication");
    	result.put("DR136", "CopyProperty");
    	result.put("DR137", "CopyProtocolConformance");
    	result.put("DR138", "CopyProtocolStateMachine");
    	result.put("DR139", "CopyProtocolTransition");
    	result.put("DR140", "CopyPseudostate");
    	result.put("DR141", "CopyQualifierValue");
    	result.put("DR142", "CopyRaiseExceptionAction");
    	result.put("DR143", "CopyReadExtentAction");
    	result.put("DR144", "CopyReadIsClassifiedObjectAction");
    	result.put("DR145", "CopyReadLinkAction");
    	result.put("DR146", "CopyReadLinkObjectEndAction");
    	result.put("DR147", "CopyReadLinkObjectEndQualifierAction");
    	result.put("DR148", "CopyReadSelfAction");
    	result.put("DR149", "CopyReadStructuralFeatureAction");
    	result.put("DR150", "CopyReadVariableAction");
    	result.put("DR151", "CopyRealization");
    	result.put("DR152", "CopyReception");
    	result.put("DR153", "CopyReclassifyObjectAction");
    	result.put("DR154", "CopyRedefinableTemplateSignature");
    	result.put("DR155", "CopyReduceAction");
    	result.put("DR156", "CopyRegion");
    	result.put("DR157", "CopyRemoveStructuralFeatureValueAction");
    	result.put("DR158", "CopyRemoveVariableValueAction");
    	result.put("DR159", "CopyReplyAction");
    	result.put("DR160", "CopySendObjectAction");
    	result.put("DR161", "CopySendSignalAction");
    	result.put("DR162", "CopySequenceNode");
    	result.put("DR163", "CopySignal");
    	result.put("DR164", "CopySignalEvent");
    	result.put("DR165", "CopySlot");
    	result.put("DR166", "CopyStartClassifierBehaviorAction");
    	result.put("DR167", "CopyStartObjectBehaviorAction");
    	result.put("DR168", "CopyState");
    	result.put("DR169", "CopyStateInvariant");
    	result.put("DR170", "CopyStateMachine");
    	result.put("DR171", "CopyStereotype");
    	result.put("DR172", "CopyStringExpression");
    	result.put("DR173", "CopyStructuredActivityNode");
    	result.put("DR174", "CopySubstitution");
    	result.put("DR175", "CopyTemplateBinding");
    	result.put("DR176", "CopyTemplateParameter");
    	result.put("DR177", "CopyTemplateParameterSubstitution");
    	result.put("DR178", "CopyTemplateSignature");
    	result.put("DR179", "CopyTestIdentityAction");
    	result.put("DR180", "CopyTimeConstraint");
    	result.put("DR181", "CopyTimeEvent");
    	result.put("DR182", "CopyTimeExpression");
    	result.put("DR183", "CopyTimeInterval");
    	result.put("DR184", "CopyTimeObservation");
    	result.put("DR185", "CopyTransition");
    	result.put("DR186", "CopyTrigger");
    	result.put("DR187", "CopyUnmarshallAction");
    	result.put("DR188", "CopyUsage");
    	result.put("DR189", "CopyUseCase");
    	result.put("DR190", "CopyValuePin");
    	result.put("DR191", "CopyValueSpecificationAction");
    	result.put("DR192", "CopyVariable");

        
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
