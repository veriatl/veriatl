implementation driver(){
call init_tar_model();
call CopyControlFlow_matchAll();
call CopyValuePin_matchAll();
call CopyObjectFlow_matchAll();
call CopyControlFlow_applyAll();
call CopyValuePin_applyAll();
call CopyObjectFlow_applyAll();

//ValuePin_no_incoming_edges 
// rule size -> 3
assert (forall vp:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$ValuePin), vp) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , vp, UMLs$ActivityNode.incoming))) > 0 ==> Seq#IsEmpty(Seq#FromArray( $tarHeap , read( $tarHeap , vp, UMLs$ActivityNode.incoming))))
;
}
