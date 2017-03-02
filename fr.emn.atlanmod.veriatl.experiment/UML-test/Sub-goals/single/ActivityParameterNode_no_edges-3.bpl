implementation driver(){
call init_tar_model();
call CopyControlFlow_matchAll();
call CopyActivityParameterNode_matchAll();
call CopyObjectFlow_matchAll();
call CopyControlFlow_applyAll();
call CopyActivityParameterNode_applyAll();
call CopyObjectFlow_applyAll();

//ActivityParameterNode_no_edges 
// rule size -> 3
assert (forall apn:ref :: // [UMLs$ActivityParameterNode]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$ActivityParameterNode), apn) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , apn, UMLs$ActivityNode.outgoing))) > 0 ==> Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , apn, UMLs$ActivityNode.incoming))) > 0 ==> Seq#IsEmpty(Seq#FromArray( $tarHeap , read( $tarHeap , apn, UMLs$ActivityNode.incoming)))  ||  Seq#IsEmpty(Seq#FromArray( $tarHeap , read( $tarHeap , apn, UMLs$ActivityNode.outgoing))))
;
}
