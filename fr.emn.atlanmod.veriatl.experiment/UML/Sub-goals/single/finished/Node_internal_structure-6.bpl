implementation driver(){
call init_tar_model();
call CopyProperty_matchAll();
call CopyDevice_matchAll();
call CopyExecutionEnvironment_matchAll();
call CopyPort_matchAll();
call CopyNode_matchAll();
call CopyExtensionEnd_matchAll();
call CopyProperty_applyAll();
call CopyDevice_applyAll();
call CopyExecutionEnvironment_applyAll();
call CopyPort_applyAll();
call CopyNode_applyAll();
call CopyExtensionEnd_applyAll();

//Node_internal_structure 
// rule size -> 6
assert (forall n:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Node), n) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , n, UMLs$StructuredClassifier.part))) > 0 ==> (forall p1_:ref :: // [UMLs$Property]
	     	   Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , n, UMLs$StructuredClassifier.part)), $Box(p1_)) ==>
	     	     dtype(p1_) <: UMLs$Node)
	     )
;
}
