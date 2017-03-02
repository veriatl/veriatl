implementation driver(){
call init_tar_model();
call CopyProperty_matchAll();
call CopyPort_matchAll();
call CopyExtensionEnd_matchAll();
call CopyExtension_matchAll();
call CopyProperty_applyAll();
call CopyPort_applyAll();
call CopyExtensionEnd_applyAll();
call CopyExtension_applyAll();

//Extension_is_binary 
// rule size -> 4
assert (forall e:ref :: // [UMLs$Extend]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Extension), e) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , e, UMLs$Association.memberEnd))) > 0 ==> Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , e, UMLs$Association.memberEnd))) == 2)
;
}
