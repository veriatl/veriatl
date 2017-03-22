implementation driver(){
var s: ref;
call init_tar_model();
call IS2IS_matchAll();
call IS2IS_applyAll();
assume Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , FSM$AbstractState), s);
assume (read( $tarHeap , s, FSM$AbstractState.stateMachine)==null || !read( $tarHeap , read( $tarHeap , s, FSM$AbstractState.stateMachine), alloc));
assume Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , FSM$StateMachine), read( $tarHeap , s, FSM$AbstractState.stateMachine));
assume genBy(s, _RS2RS,  $srcHeap ,  $tarHeap )  ||  genBy(s, _IS2IS,  $srcHeap ,  $tarHeap ) || genBy(s, _IS2RS,  $srcHeap ,  $tarHeap );
assume genBy(s, _IS2IS,  $srcHeap ,  $tarHeap );
assert false;
}
