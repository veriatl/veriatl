implementation driver(){
call init_tar_model();
call CopyProperty_matchAll();
call CopyPort_matchAll();
call CopyExtensionEnd_matchAll();
call CopyProperty_applyAll();
call CopyPort_applyAll();
call CopyExtensionEnd_applyAll();

//Property_derived_union_is_derived 
// rule size -> 3
assert (forall p:ref :: // [UMLs$Property]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Property), p) ==>
	     read( $tarHeap , p, UMLs$Property.isDerivedUnion) ==> read( $tarHeap , p, UMLs$Property.isDerived))
;
}
