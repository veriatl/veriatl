implementation driver(){
call init_tar_model();
call CopyConditionalNode_matchAll();
call CopyValuePin_matchAll();
call CopyActionInputPin_matchAll();
call CopyInputPin_matchAll();
call CopyConditionalNode_applyAll();
call CopyValuePin_applyAll();
call CopyActionInputPin_applyAll();
call CopyInputPin_applyAll();

//ConditionalNode_no_input_pins 
// rule size -> 4
assert (forall cn:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$ConditionalNode), cn) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , cn, UMLs$Action.input))) > 0 ==> Seq#IsEmpty(Seq#FromArray( $tarHeap , read( $tarHeap , cn, UMLs$Action.input))))
;
}
