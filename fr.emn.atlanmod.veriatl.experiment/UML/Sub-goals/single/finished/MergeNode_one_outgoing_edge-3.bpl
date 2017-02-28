implementation driver(){
call init_tar_model();
call CopyControlFlow_matchAll();
call CopyMergeNode_matchAll();
call CopyObjectFlow_matchAll();
call CopyControlFlow_applyAll();
call CopyMergeNode_applyAll();
call CopyObjectFlow_applyAll();

//MergeNode_one_outgoing_edge 
// rule size -> 3
assert (forall mn:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$MergeNode), mn) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , mn, UMLs$ActivityNode.outgoing))) > 0 ==> Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , mn, UMLs$ActivityNode.outgoing))) == 1)
;
}
