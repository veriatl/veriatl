implementation driver(){
call init_tar_model();
call CopyAcceptCallAction_matchAll();
call CopyAcceptCallAction_applyAll();

//AcceptCallAction_unmarshall 
// rule size -> 1
assert (forall aca:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$AcceptCallAction), aca) ==>
	     read( $tarHeap , aca, UMLs$AcceptEventAction.isUnmarshall) == true)
;
}
