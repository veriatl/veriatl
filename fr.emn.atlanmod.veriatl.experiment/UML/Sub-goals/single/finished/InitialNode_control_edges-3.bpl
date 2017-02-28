implementation driver(){
call init_tar_model();
call CopyControlFlow_matchAll();
call CopyObjectFlow_matchAll();
call CopyInitialNode_matchAll();
call CopyControlFlow_applyAll();
call CopyObjectFlow_applyAll();
call CopyInitialNode_applyAll();

//InitialNode_control_edges 
// rule size -> 3
assert (forall _in:ref :: // [UMLs$InitialNode]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$InitialNode), _in) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , _in, UMLs$ActivityNode.outgoing))) > 0 ==> (forall ae1_:ref :: // [null]
	     	   Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , _in, UMLs$ActivityNode.outgoing)), $Box(ae1_)) ==>
	     	     dtype(ae1_) <: UMLs$ControlFlow)
	     )
;
}
