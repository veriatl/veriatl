implementation driver(){
call init_tar_model();
call CopyProperty_matchAll();
call CopyPort_matchAll();
call CopyExtensionEnd_matchAll();
call CopyProperty_applyAll();
call CopyPort_applyAll();
call CopyExtensionEnd_applyAll();

//Property_derived_union_is_read_only 
// rule size -> 3
assert (forall p:ref :: // [UMLs$Pin]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Property), p) ==>
	     read( $tarHeap , p, UMLs$Property.isDerivedUnion) ==> read( $tarHeap , p, UMLs$StructuralFeature.isReadOnly))
;
}
