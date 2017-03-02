implementation driver(){
call init_tar_model();
call CopyReception_matchAll();
call CopySignal_matchAll();
call CopyReception_applyAll();
call CopySignal_applyAll();

//Reception_same_name_as_signal 
// rule size -> 2
assert (forall r:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Reception), r) ==>
	     Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Signal), read( $tarHeap , r, UMLs$Reception.signal)) ==> read( $tarHeap , r, UMLs$NamedElement.name) == read( $tarHeap , read( $tarHeap , r, UMLs$Reception.signal), UMLs$NamedElement.name)
	     )
;
}
