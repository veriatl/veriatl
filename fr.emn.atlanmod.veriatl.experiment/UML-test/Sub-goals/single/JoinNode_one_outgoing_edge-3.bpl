implementation driver(){
call init_tar_model();
call CopyControlFlow_matchAll();
call CopyObjectFlow_matchAll();
call CopyJoinNode_matchAll();
call CopyControlFlow_applyAll();
call CopyObjectFlow_applyAll();
call CopyJoinNode_applyAll();

//JoinNode_one_outgoing_edge 
// rule size -> 3
assert (forall jn:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$JoinNode), jn) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , jn, UMLs$ActivityNode.outgoing))) > 0 ==> Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , jn, UMLs$ActivityNode.outgoing))) == 1)
;
}
