implementation driver(){
call init_tar_model();
call CopyControlFlow_matchAll();
call CopyObjectFlow_matchAll();
call CopyInitialNode_matchAll();
call CopyControlFlow_applyAll();
call CopyObjectFlow_applyAll();
call CopyInitialNode_applyAll();

//InitialNode_no_incoming_edges 
// rule size -> 3
assert (forall _in:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$InitialNode), _in) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , _in, UMLs$ActivityNode.incoming))) > 0 ==> Seq#IsEmpty(Seq#FromArray( $tarHeap , read( $tarHeap , _in, UMLs$ActivityNode.incoming))))
;
}
