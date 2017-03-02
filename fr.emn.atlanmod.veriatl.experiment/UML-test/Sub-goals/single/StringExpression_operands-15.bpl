implementation driver(){
call init_tar_model();
call CopyDurationInterval_matchAll();
call CopyLiteralString_matchAll();
call CopyLiteralNull_matchAll();
call CopyInterval_matchAll();
call CopyDuration_matchAll();
call CopyStringExpression_matchAll();
call CopyLiteralBoolean_matchAll();
call CopyInstanceValue_matchAll();
call CopyTimeExpression_matchAll();
call CopyExpression_matchAll();
call CopyLiteralUnlimitedNatural_matchAll();
call CopyTimeInterval_matchAll();
call CopyLiteralReal_matchAll();
call CopyOpaqueExpression_matchAll();
call CopyLiteralInteger_matchAll();
call CopyDurationInterval_applyAll();
call CopyLiteralString_applyAll();
call CopyLiteralNull_applyAll();
call CopyInterval_applyAll();
call CopyDuration_applyAll();
call CopyStringExpression_applyAll();
call CopyLiteralBoolean_applyAll();
call CopyInstanceValue_applyAll();
call CopyTimeExpression_applyAll();
call CopyExpression_applyAll();
call CopyLiteralUnlimitedNatural_applyAll();
call CopyTimeInterval_applyAll();
call CopyLiteralReal_applyAll();
call CopyOpaqueExpression_applyAll();
call CopyLiteralInteger_applyAll();

//StringExpression_operands 
// rule size -> 15
assert (forall se:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$StringExpression), se) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , se, UMLs$Expression.operand))) > 0 ==> (forall vs1_:ref :: // [null]
	     	   Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , se, UMLs$Expression.operand)), $Box(vs1_)) ==>
	     	     dtype(vs1_) <: UMLs$LiteralString)
	     )
;
}
