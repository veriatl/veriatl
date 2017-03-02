implementation driver(){
call init_tar_model();
call CopyAcceptEventAction_matchAll();
call CopyValuePin_matchAll();
call CopyAcceptCallAction_matchAll();
call CopyActionInputPin_matchAll();
call CopyInputPin_matchAll();
call CopyAcceptEventAction_applyAll();
call CopyValuePin_applyAll();
call CopyAcceptCallAction_applyAll();
call CopyActionInputPin_applyAll();
call CopyInputPin_applyAll();

//AcceptEventAction_no_input_pins 
// rule size -> 5
assert (forall aea:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$AcceptEventAction), aea) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , aea, UMLs$Action.input))) > 0 ==> Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , aea, UMLs$Action.input))) == 0)
;
}
