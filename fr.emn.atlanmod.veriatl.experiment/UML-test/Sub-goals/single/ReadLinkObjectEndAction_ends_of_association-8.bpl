implementation driver(){
call init_tar_model();
call CopyProperty_matchAll();
call CopyPort_matchAll();
call CopyCommunicationPath_matchAll();
call CopyReadLinkObjectEndAction_matchAll();
call CopyExtensionEnd_matchAll();
call CopyAssociationClass_matchAll();
call CopyAssociation_matchAll();
call CopyExtension_matchAll();
call CopyProperty_applyAll();
call CopyPort_applyAll();
call CopyCommunicationPath_applyAll();
call CopyReadLinkObjectEndAction_applyAll();
call CopyExtensionEnd_applyAll();
call CopyAssociationClass_applyAll();
call CopyAssociation_applyAll();
call CopyExtension_applyAll();

//ReadLinkObjectEndAction_ends_of_association 
// rule size -> 8
assert (forall rloea:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$ReadLinkObjectEndAction), rloea) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , read( $tarHeap , read( $tarHeap , rloea, UMLs$ReadLinkObjectEndAction.end), UMLs$Property.association), UMLs$Association.memberEnd))) > 0 ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Association), read( $tarHeap , read( $tarHeap , rloea, UMLs$ReadLinkObjectEndAction.end), UMLs$Property.association)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Property), read( $tarHeap , rloea, UMLs$ReadLinkObjectEndAction.end)) ==> (forall pe:ref :: // [null]
	     	   Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , read( $tarHeap , read( $tarHeap , rloea, UMLs$ReadLinkObjectEndAction.end), UMLs$Property.association), UMLs$Association.memberEnd)), $Box(pe)) ==>
	     	     !(read( $tarHeap , pe, UMLs$Feature.isStatic)))
	     )
;
}
