implementation driver(){
call init_tar_model();
call CopyControlFlow_matchAll();
call CopyDecisionNode_matchAll();
call CopyObjectFlow_matchAll();
call CopyControlFlow_applyAll();
call CopyDecisionNode_applyAll();
call CopyObjectFlow_applyAll();

//DecisionNode_decision_input_flow_incoming 
// rule size -> 3
assert (forall dn:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$DecisionNode), dn) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , dn, UMLs$ActivityNode.incoming))) > 0 ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$ObjectFlow), read( $tarHeap , dn, UMLs$DecisionNode.decisionInputFlow)) ==> Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , dn, UMLs$ActivityNode.incoming)), $Box(read( $tarHeap , dn, UMLs$DecisionNode.decisionInputFlow))))
;
}
