implementation driver(){
call init_tar_model();
call CopyControlFlow_matchAll();
call CopyActivityFinalNode_matchAll();
call CopyFlowFinalNode_matchAll();
call CopyObjectFlow_matchAll();
call CopyControlFlow_applyAll();
call CopyActivityFinalNode_applyAll();
call CopyFlowFinalNode_applyAll();
call CopyObjectFlow_applyAll();

//FinalNode_no_outgoing_edges 
// rule size -> 4
assert (forall fn:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$FinalNode), fn) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , fn, UMLs$ActivityNode.outgoing))) > 0 ==> Seq#IsEmpty(Seq#FromArray( $tarHeap , read( $tarHeap , fn, UMLs$ActivityNode.outgoing))))
;
}
