implementation driver(){
call init_tar_model();
call CopyExtensionPoint_matchAll();
call CopyExtend_matchAll();
call CopyUseCase_matchAll();
call CopyExtensionPoint_applyAll();
call CopyExtend_applyAll();
call CopyUseCase_applyAll();

//Extend_extension_points 
// rule size -> 3
assert (forall e:ref :: // [UMLs$Enumeration]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Extend), e) ==>
	     Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$UseCase), read( $tarHeap , e, UMLs$Extend.extendedCase)) ==> Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , read( $tarHeap , e, UMLs$Extend.extendedCase), UMLs$UseCase.extensionPoint))) > 0 ==> Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , e, UMLs$Extend.extensionLocation))) > 0 ==> (forall epxp:ref :: // [null]
	     	   Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , e, UMLs$Extend.extensionLocation)), $Box(epxp)) ==>
	     	     Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , read( $tarHeap , e, UMLs$Extend.extendedCase), UMLs$UseCase.extensionPoint)), $Box(epxp)))
	     )
;
}
