implementation driver(){
call init_tar_model();
call CopyAcceptEventAction_matchAll();
call CopyAcceptCallAction_matchAll();
call CopyOutputPin_matchAll();
call CopyTrigger_matchAll();
call CopyAcceptEventAction_applyAll();
call CopyAcceptCallAction_applyAll();
call CopyOutputPin_applyAll();
call CopyTrigger_applyAll();

//AcceptEventAction_no_output_pins 
// rule size -> 4
assert (forall aea:ref :: // [UMLs$AcceptEventAction]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$AcceptEventAction), aea) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , aea, UMLs$Action.output))) > 0 ==> Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , aea, UMLs$AcceptEventAction.trigger))) > 0 ==> dtype(aea) == UMLs$AcceptEventAction  &&  (forall t1_:ref :: // [UMLs$Trigger]
	     	   Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , aea, UMLs$AcceptEventAction.trigger)), $Box(t1_)) ==>
	     	     Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Event), read( $tarHeap , t1_, UMLs$Trigger.event)) ==> dtype(read( $tarHeap , t1_, UMLs$Trigger.event)) <: UMLs$ChangeEvent  ||  dtype(read( $tarHeap , t1_, UMLs$Trigger.event)) <: UMLs$CallEvent)
	      ==> Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , aea, UMLs$Action.output))) == 0)
;
}
