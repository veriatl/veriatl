implementation driver(){
call init_tar_model();
call CopyParameter_matchAll();
call CopyActivityParameterNode_matchAll();
call CopyActivity_matchAll();
call CopyParameter_applyAll();
call CopyActivityParameterNode_applyAll();
call CopyActivity_applyAll();

//ActivityParameterNode_has_parameters 
// rule size -> 3
assert (forall apn:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$ActivityParameterNode), apn) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , read( $tarHeap , apn, UMLs$ActivityNode.activity), UMLs$Behavior.ownedParameter))) > 0 ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Activity), read( $tarHeap , apn, UMLs$ActivityNode.activity)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Parameter), read( $tarHeap , apn, UMLs$ActivityParameterNode.parameter)) ==> Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , read( $tarHeap , apn, UMLs$ActivityNode.activity), UMLs$Behavior.ownedParameter)), $Box(read( $tarHeap , apn, UMLs$ActivityParameterNode.parameter))))
;
}
