implementation driver(){
call init_tar_model();
call CopyProperty_matchAll();
call CopyPort_matchAll();
call CopyEnumeration_matchAll();
call CopyExtensionEnd_matchAll();
call CopyProperty_applyAll();
call CopyPort_applyAll();
call CopyEnumeration_applyAll();
call CopyExtensionEnd_applyAll();

//Enumeration_immutable 
// rule size -> 4
assert (forall e:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Enumeration), e) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , e, UMLs$DataType.ownedAttribute))) > 0 ==> (forall p1_:ref :: // [null]
	     	   Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , e, UMLs$DataType.ownedAttribute)), $Box(p1_)) ==>
	     	     read( $tarHeap , p1_, UMLs$StructuralFeature.isReadOnly))
	     )
;
}
