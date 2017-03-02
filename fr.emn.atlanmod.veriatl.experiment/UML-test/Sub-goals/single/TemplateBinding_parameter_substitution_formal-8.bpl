implementation driver(){
call init_tar_model();
call CopyTemplateParameterSubstitution_matchAll();
call CopyRedefinableTemplateSignature_matchAll();
call CopyOperationTemplateParameter_matchAll();
call CopyTemplateParameter_matchAll();
call CopyTemplateSignature_matchAll();
call CopyClassifierTemplateParameter_matchAll();
call CopyConnectableElementTemplateParameter_matchAll();
call CopyTemplateBinding_matchAll();
call CopyTemplateParameterSubstitution_applyAll();
call CopyRedefinableTemplateSignature_applyAll();
call CopyOperationTemplateParameter_applyAll();
call CopyTemplateParameter_applyAll();
call CopyTemplateSignature_applyAll();
call CopyClassifierTemplateParameter_applyAll();
call CopyConnectableElementTemplateParameter_applyAll();
call CopyTemplateBinding_applyAll();

//TemplateBinding_parameter_substitution_formal 
// rule size -> 8
assert (forall tb:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$TemplateBinding), tb) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , read( $tarHeap , tb, UMLs$TemplateBinding.signature), UMLs$TemplateSignature.parameter))) > 0 ==> Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$TemplateSignature), read( $tarHeap , tb, UMLs$TemplateBinding.signature)) ==> Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , tb, UMLs$TemplateBinding.parameterSubstitution))) > 0 ==> (forall tpsb:ref :: // [null]
	     	   Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , tb, UMLs$TemplateBinding.parameterSubstitution)), $Box(tpsb)) ==>
	     	     Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$TemplateParameter), read( $tarHeap , tpsb, UMLs$TemplateParameterSubstitution.formal)) ==> Seq#Contains(Seq#FromArray( $tarHeap , read( $tarHeap , read( $tarHeap , tb, UMLs$TemplateBinding.signature), UMLs$TemplateSignature.parameter)), $Box(read( $tarHeap , tpsb, UMLs$TemplateParameterSubstitution.formal))))
	     )
;
}
