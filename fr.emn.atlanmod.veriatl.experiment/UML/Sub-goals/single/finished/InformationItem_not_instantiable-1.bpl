implementation driver(){
call init_tar_model();
call CopyInformationItem_matchAll();
call CopyInformationItem_applyAll();

//InformationItem_not_instantiable 
// rule size -> 1
assert (forall ii:ref :: // [UMLs$InformationItem]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$InformationItem), ii) ==>
	     read( $tarHeap , ii, UMLs$Classifier.isAbstract))
;
}
