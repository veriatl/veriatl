implementation driver(){
var s1: ref;
var s2: ref;
call init_tar_model();
call SM2SM_matchAll();
call SM2SM_applyAll();
assume s1 != s2;
assume genBy(s1, _SM2SM,  $srcHeap ,  $tarHeap );
assume genBy(s2, _SM2SM,  $srcHeap ,  $tarHeap );
assume Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , FSM$StateMachine), s1);
assume Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , FSM$StateMachine), s2);
assert read( $tarHeap , s1, FSM$StateMachine.name) != read( $tarHeap , s2, FSM$StateMachine.name)
;
}
