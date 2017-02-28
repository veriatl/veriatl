implementation driver(){
call init_tar_model();
call CopyProperty_matchAll();
call CopyOperation_matchAll();
call CopyReception_matchAll();
call CopyPort_matchAll();
call CopyConnector_matchAll();
call CopyGeneralization_matchAll();
call CopyInformationItem_matchAll();
call CopyExtensionEnd_matchAll();
call CopyProperty_applyAll();
call CopyOperation_applyAll();
call CopyReception_applyAll();
call CopyPort_applyAll();
call CopyConnector_applyAll();
call CopyGeneralization_applyAll();
call CopyInformationItem_applyAll();
call CopyExtensionEnd_applyAll();

//InformationItem_has_no 
// rule size -> 8
assert (forall ii:ref :: // [null]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$InformationItem), ii) ==>
	     Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , ii, UMLs$Classifier.feature))) > 0 ==> Seq#Length(Seq#FromArray( $tarHeap , read( $tarHeap , ii, UMLs$Classifier.generalization))) > 0 ==> Seq#IsEmpty(Seq#FromArray( $tarHeap , read( $tarHeap , ii, UMLs$Classifier.generalization)))  &&  Seq#IsEmpty(Seq#FromArray( $tarHeap , read( $tarHeap , ii, UMLs$Classifier.feature))))
;
}
