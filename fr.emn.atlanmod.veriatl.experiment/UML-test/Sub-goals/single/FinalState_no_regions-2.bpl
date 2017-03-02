implementation driver(){
call init_tar_model();
call CopyFinalState_matchAll();
call CopyRegion_matchAll();
call CopyFinalState_applyAll();
call CopyRegion_applyAll();

//FinalState_no_regions 
// rule size -> 2
assert (forall fs:ref :: // [UMLs$FinalState]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$FinalState), fs) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , fs, UMLs$State.region))) > 0 ==> Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , fs, UMLs$State.region))) == 0)
;
}
