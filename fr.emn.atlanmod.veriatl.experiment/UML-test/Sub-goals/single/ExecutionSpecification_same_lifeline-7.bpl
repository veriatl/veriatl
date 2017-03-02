implementation driver(){
call init_tar_model();
call CopyExecutionOccurrenceSpecification_matchAll();
call CopyBehaviorExecutionSpecification_matchAll();
call CopyMessageOccurrenceSpecification_matchAll();
call CopyDestructionOccurrenceSpecification_matchAll();
call CopyActionExecutionSpecification_matchAll();
call CopyLifeline_matchAll();
call CopyOccurrenceSpecification_matchAll();
call CopyExecutionOccurrenceSpecification_applyAll();
call CopyBehaviorExecutionSpecification_applyAll();
call CopyMessageOccurrenceSpecification_applyAll();
call CopyDestructionOccurrenceSpecification_applyAll();
call CopyActionExecutionSpecification_applyAll();
call CopyLifeline_applyAll();
call CopyOccurrenceSpecification_applyAll();

//ExecutionSpecification_same_lifeline 
// rule size -> 7
assert (forall es:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$ExecutionSpecification), es) ==>
	     Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$OccurrenceSpecification), read( $tarHeap , es, UMLs$ExecutionSpecification.finish)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Lifeline), read( $tarHeap , read( $tarHeap , es, UMLs$ExecutionSpecification.start), UMLs$InteractionFragment.covered)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$Lifeline), read( $tarHeap , read( $tarHeap , es, UMLs$ExecutionSpecification.finish), UMLs$InteractionFragment.covered)) ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$OccurrenceSpecification), read( $tarHeap , es, UMLs$ExecutionSpecification.start)) ==> read( $tarHeap , read( $tarHeap , es, UMLs$ExecutionSpecification.start), UMLs$InteractionFragment.covered) == read( $tarHeap , read( $tarHeap , es, UMLs$ExecutionSpecification.finish), UMLs$InteractionFragment.covered))
;
}
