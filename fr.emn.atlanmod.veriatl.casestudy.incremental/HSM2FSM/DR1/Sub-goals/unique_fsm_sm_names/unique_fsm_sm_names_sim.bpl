implementation driver(){
var s1: ref;
var s2: ref;
call init_tar_model();
assume Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , FSM$StateMachine), s1);
assume s1 != s2;
assume Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , FSM$StateMachine), s2);
assert read( $tarHeap , s1, FSM$StateMachine.name) != read( $tarHeap , s2, FSM$StateMachine.name)
;
}
