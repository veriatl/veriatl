implementation driver(){
call init_tar_model();
call CopyForkNode_matchAll();
call CopyControlFlow_matchAll();
call CopyObjectFlow_matchAll();
call CopyForkNode_applyAll();
call CopyControlFlow_applyAll();
call CopyObjectFlow_applyAll();

//ForkNode_one_incoming_edge 
// rule size -> 3
assert (forall fn:ref :: // [UMLs$FinalNode]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$ForkNode), fn) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , fn, UMLs$ActivityNode.incoming))) > 0 ==> Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , fn, UMLs$ActivityNode.incoming))) == 1)
;
}
