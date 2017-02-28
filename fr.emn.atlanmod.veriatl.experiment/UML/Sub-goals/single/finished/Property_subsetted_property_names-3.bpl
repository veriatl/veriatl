implementation driver(){
call init_tar_model();
call CopyProperty_matchAll();
call CopyPort_matchAll();
call CopyExtensionEnd_matchAll();
call CopyProperty_applyAll();
call CopyPort_applyAll();
call CopyExtensionEnd_applyAll();

//Property_subsetted_property_names 
// rule size -> 3
assert (forall p:ref :: // [UMLs$Property]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Property), p) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , p, UMLs$Property.subsettedProperty))) > 0 ==> (forall psp:ref :: // [null]
	     	   Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , p, UMLs$Property.subsettedProperty)), $Box(psp)) ==>
	     	     read( $tarHeap , psp, UMLs$NamedElement.name) != read( $tarHeap , p, UMLs$NamedElement.name)
	     	     )
	     )
;
}
