implementation driver(){
call init_tar_model();
call CopyProperty_matchAll();
call CopyDestroyLinkAction_matchAll();
call CopyPort_matchAll();
call CopyCreateLinkObjectAction_matchAll();
call CopyReadLinkAction_matchAll();
call CopyCreateLinkAction_matchAll();
call CopyLinkEndCreationData_matchAll();
call CopyLinkEndData_matchAll();
call CopyExtensionEnd_matchAll();
call CopyLinkEndDestructionData_matchAll();
call CopyProperty_applyAll();
call CopyDestroyLinkAction_applyAll();
call CopyPort_applyAll();
call CopyCreateLinkObjectAction_applyAll();
call CopyReadLinkAction_applyAll();
call CopyCreateLinkAction_applyAll();
call CopyLinkEndCreationData_applyAll();
call CopyLinkEndData_applyAll();
call CopyExtensionEnd_applyAll();
call CopyLinkEndDestructionData_applyAll();

//LinkAction_not_static 
// rule size -> 10
assert (forall la:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$LinkAction), la) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , la, UMLs$LinkAction.endData))) > 0 ==> (forall led1_:ref :: // [null]
	     	   Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , la, UMLs$LinkAction.endData)), $Box(led1_)) ==>
	     	     Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Property), read( $tarHeap , led1_, UMLs$LinkEndData.end)) ==> !(read( $tarHeap , read( $tarHeap , led1_, UMLs$LinkEndData.end), UMLs$Feature.isStatic)))
	     )
;
}
