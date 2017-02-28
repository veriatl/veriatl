implementation driver(){
call init_tar_model();
call CopyObjectFlow_matchAll();
call CopyObjectFlow_applyAll();

//ObjectFlow_is_multicast_or_is_multireceive 
// rule size -> 1
assert (forall of:ref :: // [UMLs$ObjectFlow]
	   Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , UMLs$ObjectFlow), of) ==>
	     !(read( $tarHeap , of, UMLs$ObjectFlow.isMulticast)  &&  read( $tarHeap , of, UMLs$ObjectFlow.isMultireceive)))
;
}
