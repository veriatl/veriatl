package fr.emn.atlanmod.veriatl.experiment.standalone;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class CreateMap {
	
	public static String[] AddMutants() {
		return new String[] {
				"AR017"
				//"AR000","AR001","AR002","AR003","AR004","AR005","AR006","AR007","AR008","AR009","AR010","AR011","AR012","AR013","AR014","AR015","AR016","AR017","AR018","AR019","AR020","AR021","AR022","AR023","AR024","AR025","AR026","AR027","AR028","AR029",
				//"AR030","AR031","AR032","AR033","AR034","AR035","AR036","AR037","AR038","AR039","AR040","AR041","AR042","AR043","AR044","AR045","AR046","AR047","AR048","AR049",
//				"AR050","AR051","AR052","AR053","AR054","AR055","AR056","AR057","AR058","AR059","AR060","AR061",
//				"AR062","AR063","AR064","AR065","AR066","AR067","AR068","AR069","AR070","AR071","AR072","AR073","AR074","AR075","AR076","AR077","AR078","AR079","AR080","AR081","AR082","AR083",
//				"AR084","AR085","AR086","AR087","AR088","AR089","AR090","AR091","AR092","AR093","AR094","AR095","AR096","AR097","AR098","AR099","AR100","AR101","AR102","AR103","AR104","AR105","AR106","AR107","AR108","AR109","AR110","AR111","AR112","AR113","AR114","AR115","AR116","AR117",
//				"AR118","AR119","AR120","AR121","AR122","AR123","AR124","AR125","AR126","AR127","AR128","AR129","AR130","AR131","AR132","AR133","AR134","AR135","AR136","AR137","AR138","AR139","AR140","AR141","AR142","AR143","AR144","AR145","AR146","AR147","AR148","AR149","AR150",
//				"AR151","AR152","AR153","AR154","AR155","AR156","AR157","AR158","AR159","AR160","AR161","AR162","AR163","AR164","AR165","AR166","AR167","AR168","AR169","AR170","AR171","AR172","AR173","AR174","AR175","AR176","AR177","AR178","AR179","AR180","AR181","AR182","AR183","AR184","AR185",
//				"AR186","AR187","AR188","AR189","AR190","AR191","AR192"
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
				"MF001_000","MF002_000","MF004_000","MF005_000","MF006_000","MF007_000","MF008_000","MF009_000","MF010_000","MF011_000","MF013_000","MF014_000","MF015_000","MF017_000","MF018_000","MF020_000","MF021_000","MF023_000","MF024_000","MF026_000","MF027_000","MF028_000","MF029_000","MF033_000","MF034_000","MF036_000","MF039_000","MF040_000","MF043_000","MF044_000","MF045_000","MF046_000","MF047_000","MF048_000","MF049_000","MF050_000",
				"MF053_000","MF054_000","MF055_000","MF057_000","MF063_000","MF066_000","MF068_000","MF069_000","MF072_000","MF073_000",
				"MF074_000","MF075_000","MF076_000","MF077_000","MF078_000","MF082_000","MF086_000","MF087_000","MF088_000","MF091_000","MF095_000",
				"MF100_000","MF102_000","MF104_000","MF105_000","MF111_000","MF113_000","MF117_000","MF118_000","MF120_000","MF121_000","MF123_000","MF125_000","MF129_000","MF132_000","MF133_000","MF135_000","MF136_000","MF138_000","MF139_000","MF142_000","MF143_000","MF144_000","MF145_000","MF146_000","MF147_000","MF148_000","MF149_000",
				"MF150_000","MF152_000","MF153_000","MF154_000","MF155_000","MF156_000","MF157_000","MF158_000","MF159_000","MF160_000","MF161_000","MF162_000","MF163_000","MF166_000","MF167_000","MF168_000","MF170_000","MF171_000","MF173_000","MF179_000","MF181_000","MF184_000","MF185_000","MF187_000","MF189_000","MF190_000","MF191_000","MF192_000"
		};
		
	}
	
	public static String[] BindMutants() {
		return new String[] {
				//"MB000_000","MB001_000","MB002_000","MB003_000","MB004_000","MB005_000","MB006_000","MB007_000","MB008_000","MB009_000","MB010_000","MB011_000","MB012_000","MB013_000","MB014_000","MB015_000","MB016_000","MB017_000","MB018_000","MB019_000","MB020_000","MB021_000","MB022_000","MB023_000","MB024_000","MB025_000","MB026_000","MB027_000","MB028_000","MB029_000","MB030_000","MB031_000","MB032_000","MB033_000","MB034_000","MB035_000","MB036_000","MB037_000","MB038_000","MB039_000","MB040_000","MB041_000","MB042_000","MB043_000","MB044_000","MB045_000","MB046_000","MB047_000","MB048_000","MB049_000","MB050_000",
				//"MB051_000","MB052_000","MB053_000","MB054_000","MB055_000","MB056_000","MB057_000","MB058_000","MB059_000","MB060_000","MB061_000","MB062_000","MB063_000","MB064_000","MB065_000","MB066_000","MB067_000","MB068_000","MB069_000","MB070_000","MB071_000","MB072_000","MB073_000","MB074_000","MB075_000","MB076_000","MB077_000","MB078_000","MB079_000","MB080_000","MB081_000","MB082_000","MB083_000","MB084_000","MB085_000","MB086_000","MB087_000","MB088_000","MB089_000","MB090_000","MB091_000","MB092_000","MB093_000","MB094_000","MB095_000","MB096_000","MB097_000",
				//"MB098_000","MB099_000","MB100_000",
				"MB101_000","MB102_000","MB103_000","MB104_000","MB105_000","MB106_000","MB107_000","MB108_000","MB109_000","MB110_000","MB111_000","MB112_000","MB113_000","MB114_000","MB115_000","MB116_000","MB117_000","MB118_000","MB119_000","MB120_000","MB121_000","MB122_000","MB123_000","MB124_000","MB125_000","MB126_000","MB127_000","MB128_000","MB129_000","MB130_000","MB131_000","MB132_000","MB133_000","MB134_000","MB135_000","MB136_000","MB137_000","MB138_000","MB139_000","MB140_000","MB141_000","MB142_000","MB143_000","MB144_000","MB145_000","MB146_000","MB147_000","MB148_000","MB149_000",
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
    	
    	result.put("MF001_000", "CopyAcceptCallAction");
    	result.put("MF002_000", "CopyAcceptEventAction");
    	result.put("MF004_000", "CopyActionInputPin");
    	result.put("MF005_000", "CopyActivity");
    	result.put("MF006_000", "CopyActivityFinalNode");
    	result.put("MF007_000", "CopyActivityParameterNode");
    	result.put("MF008_000", "CopyActivityPartition");
    	result.put("MF009_000", "CopyActor");
    	result.put("MF010_000", "CopyAddStructuralFeatureValueAction");
    	result.put("MF011_000", "CopyAddVariableValueAction");
    	result.put("MF013_000", "CopyArtifact");
    	result.put("MF014_000", "CopyAssociation");
    	result.put("MF015_000", "CopyAssociationClass");
    	result.put("MF017_000", "CopyBroadcastSignalAction");
    	result.put("MF018_000", "CopyCallBehaviorAction");
    	result.put("MF020_000", "CopyCallOperationAction");
    	result.put("MF021_000", "CopyCentralBufferNode");
    	result.put("MF023_000", "CopyClass");
    	result.put("MF024_000", "CopyClassifierTemplateParameter");
    	result.put("MF026_000", "CopyClearAssociationAction");
    	result.put("MF027_000", "CopyClearStructuralFeatureAction");
    	result.put("MF028_000", "CopyClearVariableAction");
    	result.put("MF029_000", "CopyCollaboration");
    	result.put("MF033_000", "CopyCommunicationPath");
    	result.put("MF034_000", "CopyComponent");
    	result.put("MF036_000", "CopyConditionalNode");
    	result.put("MF039_000", "CopyConnector");
    	result.put("MF040_000", "CopyConnectorEnd");
    	result.put("MF043_000", "CopyContinuation");
    	result.put("MF044_000", "CopyControlFlow");
    	result.put("MF045_000", "CopyCreateLinkAction");
    	result.put("MF046_000", "CopyCreateLinkObjectAction");
    	result.put("MF047_000", "CopyCreateObjectAction");
    	result.put("MF048_000", "CopyDataStoreNode");
    	result.put("MF049_000", "CopyDataType");
    	result.put("MF050_000", "CopyDecisionNode");
    	result.put("MF053_000", "CopyDeploymentSpecification");
    	result.put("MF054_000", "CopyDestroyLinkAction");
    	result.put("MF055_000", "CopyDestroyObjectAction");
    	result.put("MF057_000", "CopyDevice");


    	result.put("MF063_000", "CopyEnumeration");
    	result.put("MF066_000", "CopyExecutionEnvironment");
    	result.put("MF068_000", "CopyExpansionNode");
    	result.put("MF069_000", "CopyExpansionRegion");
    	result.put("MF072_000", "CopyExtension");
    	result.put("MF073_000", "CopyExtensionEnd");
    	result.put("MF074_000", "CopyExtensionPoint");
    	result.put("MF075_000", "CopyFinalState");
    	result.put("MF076_000", "CopyFlowFinalNode");
    	result.put("MF077_000", "CopyForkNode");
    	result.put("MF078_000", "CopyFunctionBehavior");

    	result.put("MF082_000", "CopyGeneralizationSet");
    	result.put("MF086_000", "CopyInformationItem");
    	result.put("MF087_000", "CopyInitialNode");
    	result.put("MF088_000", "CopyInputPin");
    	result.put("MF091_000", "CopyInteraction");
    	result.put("MF095_000", "CopyInterface");
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
    	result.put("MF150_000", "CopyReadVariableAction");
    	result.put("MF152_000", "CopyReception");
    	result.put("MF153_000", "CopyReclassifyObjectAction");
    	result.put("MF154_000", "CopyRedefinableTemplateSignature");
    	result.put("MF155_000", "CopyReduceAction");
    	result.put("MF156_000", "CopyRegion");
    	result.put("MF157_000", "CopyRemoveStructuralFeatureValueAction");
    	result.put("MF158_000", "CopyRemoveVariableValueAction");
    	result.put("MF159_000", "CopyReplyAction");
    	result.put("MF160_000", "CopySendObjectAction");
    	result.put("MF161_000", "CopySendSignalAction");
    	result.put("MF162_000", "CopySequenceNode");
    	result.put("MF163_000", "CopySignal");
    	result.put("MF166_000", "CopyStartClassifierBehaviorAction");
    	result.put("MF167_000", "CopyStartObjectBehaviorAction");
    	result.put("MF168_000", "CopyState");
    	result.put("MF170_000", "CopyStateMachine");
    	result.put("MF171_000", "CopyStereotype");
    	result.put("MF173_000", "CopyStructuredActivityNode");
    	result.put("MF179_000", "CopyTestIdentityAction");

    	result.put("MF181_000", "CopyTimeEvent");
    	result.put("MF184_000", "CopyTimeObservation");
    	result.put("MF185_000", "CopyTransition");
    	result.put("MF187_000", "CopyUnmarshallAction");
    	result.put("MF189_000", "CopyUseCase");
    	result.put("MF190_000", "CopyValuePin");
    	result.put("MF191_000", "CopyValueSpecificationAction");
    	result.put("MF192_000", "CopyVariable");

        
        return Collections.unmodifiableMap(result);
    }
    
    public static Map<String, String> Bind() {
    	Map<String, String> result = new HashMap<String, String>();
    	result.put("MB000_000", "CopyAbstraction");
    	result.put("MB001_000", "CopyAcceptCallAction");
    	result.put("MB002_000", "CopyAcceptEventAction");
    	result.put("MB003_000", "CopyActionExecutionSpecification");
    	result.put("MB004_000", "CopyActionInputPin");
    	result.put("MB005_000", "CopyActivity");
    	result.put("MB006_000", "CopyActivityFinalNode");
    	result.put("MB007_000", "CopyActivityParameterNode");
    	result.put("MB008_000", "CopyActivityPartition");
    	result.put("MB009_000", "CopyActor");
    	result.put("MB010_000", "CopyAddStructuralFeatureValueAction");
    	result.put("MB011_000", "CopyAddVariableValueAction");
    	result.put("MB012_000", "CopyAnyReceiveEvent");
    	result.put("MB013_000", "CopyArtifact");
    	result.put("MB014_000", "CopyAssociation");
    	result.put("MB015_000", "CopyAssociationClass");
    	result.put("MB016_000", "CopyBehaviorExecutionSpecification");
    	result.put("MB017_000", "CopyBroadcastSignalAction");
    	result.put("MB018_000", "CopyCallBehaviorAction");
    	result.put("MB019_000", "CopyCallEvent");
    	result.put("MB020_000", "CopyCallOperationAction");
    	result.put("MB021_000", "CopyCentralBufferNode");
    	result.put("MB022_000", "CopyChangeEvent");
    	result.put("MB023_000", "CopyClass");
    	result.put("MB024_000", "CopyClassifierTemplateParameter");
    	result.put("MB025_000", "CopyClause");
    	result.put("MB026_000", "CopyClearAssociationAction");
    	result.put("MB027_000", "CopyClearStructuralFeatureAction");
    	result.put("MB028_000", "CopyClearVariableAction");
    	result.put("MB029_000", "CopyCollaboration");
    	result.put("MB030_000", "CopyCollaborationUse");
    	result.put("MB031_000", "CopyCombinedFragment");
    	result.put("MB032_000", "CopyComment");
    	result.put("MB033_000", "CopyCommunicationPath");
    	result.put("MB034_000", "CopyComponent");
    	result.put("MB035_000", "CopyComponentRealization");
    	result.put("MB036_000", "CopyConditionalNode");
    	result.put("MB037_000", "CopyConnectableElementTemplateParameter");
    	result.put("MB038_000", "CopyConnectionPointReference");
    	result.put("MB039_000", "CopyConnector");
    	result.put("MB040_000", "CopyConnectorEnd");
    	result.put("MB041_000", "CopyConsiderIgnoreFragment");
    	result.put("MB042_000", "CopyConstraint");
    	result.put("MB043_000", "CopyContinuation");
    	result.put("MB044_000", "CopyControlFlow");
    	result.put("MB045_000", "CopyCreateLinkAction");
    	result.put("MB046_000", "CopyCreateLinkObjectAction");
    	result.put("MB047_000", "CopyCreateObjectAction");
    	result.put("MB048_000", "CopyDataStoreNode");
    	result.put("MB049_000", "CopyDataType");
    	result.put("MB050_000", "CopyDecisionNode");
    	result.put("MB051_000", "CopyDependency");
    	result.put("MB052_000", "CopyDeployment");
    	result.put("MB053_000", "CopyDeploymentSpecification");
    	result.put("MB054_000", "CopyDestroyLinkAction");
    	result.put("MB055_000", "CopyDestroyObjectAction");
    	result.put("MB056_000", "CopyDestructionOccurrenceSpecification");
    	result.put("MB057_000", "CopyDevice");
    	result.put("MB058_000", "CopyDuration");
    	result.put("MB059_000", "CopyDurationConstraint");
    	result.put("MB060_000", "CopyDurationInterval");
    	result.put("MB061_000", "CopyDurationObservation");
    	result.put("MB062_000", "CopyElementImport");
    	result.put("MB063_000", "CopyEnumeration");
    	result.put("MB064_000", "CopyEnumerationLiteral");
    	result.put("MB065_000", "CopyExceptionHandler");
    	result.put("MB066_000", "CopyExecutionEnvironment");
    	result.put("MB067_000", "CopyExecutionOccurrenceSpecification");
    	result.put("MB068_000", "CopyExpansionNode");
    	result.put("MB069_000", "CopyExpansionRegion");
    	result.put("MB070_000", "CopyExpression");
    	result.put("MB071_000", "CopyExtend");
    	result.put("MB072_000", "CopyExtension");
    	result.put("MB073_000", "CopyExtensionEnd");
    	result.put("MB074_000", "CopyExtensionPoint");
    	result.put("MB075_000", "CopyFinalState");
    	result.put("MB076_000", "CopyFlowFinalNode");
    	result.put("MB077_000", "CopyForkNode");
    	result.put("MB078_000", "CopyFunctionBehavior");
    	result.put("MB079_000", "CopyGate");
    	result.put("MB080_000", "CopyGeneralOrdering");
    	result.put("MB081_000", "CopyGeneralization");
    	result.put("MB082_000", "CopyGeneralizationSet");
    	result.put("MB083_000", "CopyImage");
    	result.put("MB084_000", "CopyInclude");
    	result.put("MB085_000", "CopyInformationFlow");
    	result.put("MB086_000", "CopyInformationItem");
    	result.put("MB087_000", "CopyInitialNode");
    	result.put("MB088_000", "CopyInputPin");
    	result.put("MB089_000", "CopyInstanceSpecification");
    	result.put("MB090_000", "CopyInstanceValue");
    	result.put("MB091_000", "CopyInteraction");
    	result.put("MB092_000", "CopyInteractionConstraint");
    	result.put("MB093_000", "CopyInteractionOperand");
    	result.put("MB094_000", "CopyInteractionUse");
    	result.put("MB095_000", "CopyInterface");
    	result.put("MB096_000", "CopyInterfaceRealization");
    	result.put("MB097_000", "CopyInterruptibleActivityRegion");
    	result.put("MB098_000", "CopyInterval");
    	result.put("MB099_000", "CopyIntervalConstraint");
    	result.put("MB100_000", "CopyJoinNode");
    	result.put("MB101_000", "CopyLifeline");
    	result.put("MB102_000", "CopyLinkEndCreationData");
    	result.put("MB103_000", "CopyLinkEndData");
    	result.put("MB104_000", "CopyLinkEndDestructionData");
    	result.put("MB105_000", "CopyLiteralBoolean");
    	result.put("MB106_000", "CopyLiteralInteger");
    	result.put("MB107_000", "CopyLiteralNull");
    	result.put("MB108_000", "CopyLiteralReal");
    	result.put("MB109_000", "CopyLiteralString");
    	result.put("MB110_000", "CopyLiteralUnlimitedNatural");
    	result.put("MB111_000", "CopyLoopNode");
    	result.put("MB112_000", "CopyManifestation");
    	result.put("MB113_000", "CopyMergeNode");
    	result.put("MB114_000", "CopyMessage");
    	result.put("MB115_000", "CopyMessageOccurrenceSpecification");
    	result.put("MB116_000", "CopyModel");
    	result.put("MB117_000", "CopyNode");
    	result.put("MB118_000", "CopyObjectFlow");
    	result.put("MB119_000", "CopyOccurrenceSpecification");
    	result.put("MB120_000", "CopyOpaqueAction");
    	result.put("MB121_000", "CopyOpaqueBehavior");
    	result.put("MB122_000", "CopyOpaqueExpression");
    	result.put("MB123_000", "CopyOperation");
    	result.put("MB124_000", "CopyOperationTemplateParameter");
    	result.put("MB125_000", "CopyOutputPin");
    	result.put("MB126_000", "CopyPackage");
    	result.put("MB127_000", "CopyPackageImport");
    	result.put("MB128_000", "CopyPackageMerge");
    	result.put("MB129_000", "CopyParameter");
    	result.put("MB130_000", "CopyParameterSet");
    	result.put("MB131_000", "CopyPartDecomposition");
    	result.put("MB132_000", "CopyPort");
    	result.put("MB133_000", "CopyPrimitiveType");
    	result.put("MB134_000", "CopyProfile");
    	result.put("MB135_000", "CopyProfileApplication");
    	result.put("MB136_000", "CopyProperty");
    	result.put("MB137_000", "CopyProtocolConformance");
    	result.put("MB138_000", "CopyProtocolStateMachine");
    	result.put("MB139_000", "CopyProtocolTransition");
    	result.put("MB140_000", "CopyPseudostate");
    	result.put("MB141_000", "CopyQualifierValue");
    	result.put("MB142_000", "CopyRaiseExceptionAction");
    	result.put("MB143_000", "CopyReadExtentAction");
    	result.put("MB144_000", "CopyReadIsClassifiedObjectAction");
    	result.put("MB145_000", "CopyReadLinkAction");
    	result.put("MB146_000", "CopyReadLinkObjectEndAction");
    	result.put("MB147_000", "CopyReadLinkObjectEndQualifierAction");
    	result.put("MB148_000", "CopyReadSelfAction");
    	result.put("MB149_000", "CopyReadStructuralFeatureAction");
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
