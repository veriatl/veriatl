implementation driver(){
call init_tar_model();
call CopyReadStructuralFeatureAction_matchAll();
call CopyProperty_matchAll();
call CopyPort_matchAll();
call CopyClearStructuralFeatureAction_matchAll();
call CopyRemoveStructuralFeatureValueAction_matchAll();
call CopyAddStructuralFeatureValueAction_matchAll();
call CopyExtensionEnd_matchAll();
call CopyReadStructuralFeatureAction_applyAll();
call CopyProperty_applyAll();
call CopyPort_applyAll();
call CopyClearStructuralFeatureAction_applyAll();
call CopyRemoveStructuralFeatureValueAction_applyAll();
call CopyAddStructuralFeatureValueAction_applyAll();
call CopyExtensionEnd_applyAll();

//StructuralFeatureAction_not_static 
// rule size -> 7
assert (forall sfa:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$StructuralFeatureAction), sfa) ==>
	     Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$StructuralFeature), read( $tarHeap , sfa, UMLs$StructuralFeatureAction.structuralFeature)) ==> !(read( $tarHeap , read( $tarHeap , sfa, UMLs$StructuralFeatureAction.structuralFeature), UMLs$Feature.isStatic)))
;
}
