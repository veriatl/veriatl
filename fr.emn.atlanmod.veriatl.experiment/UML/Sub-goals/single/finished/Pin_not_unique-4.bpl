implementation driver(){
call init_tar_model();
call CopyValuePin_matchAll();
call CopyOutputPin_matchAll();
call CopyActionInputPin_matchAll();
call CopyInputPin_matchAll();
call CopyValuePin_applyAll();
call CopyOutputPin_applyAll();
call CopyActionInputPin_applyAll();
call CopyInputPin_applyAll();

//Pin_not_unique 
// rule size -> 4
assert (forall p:ref :: // [UMLs$Pin]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Pin), p) ==>
	     !(read( $tarHeap , p, UMLs$MultiplicityElement.isUnique)))
;
}
