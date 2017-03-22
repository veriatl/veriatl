implementation driver(){
var s: ref;
call init_tar_model();
call RS2RS_matchAll();
call IS2IS_matchAll();
call IS2RS_matchAll();
call CS2RS_matchAll();
call SM2SM_matchAll();
call RS2RS_applyAll();
call IS2IS_applyAll();
call IS2RS_applyAll();
call CS2RS_applyAll();
call SM2SM_applyAll();
assume Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , FSM$AbstractState), s);
assume genBy(s, _RS2RS,  $srcHeap ,  $tarHeap )  ||  genBy(s, _IS2IS,  $srcHeap ,  $tarHeap ) || genBy(s, _IS2RS,  $srcHeap ,  $tarHeap ) || genBy(s, _CS2RS,  $srcHeap ,  $tarHeap );
assume (read( $tarHeap , s, FSM$AbstractState.stateMachine)==null || !read( $tarHeap , read( $tarHeap , s, FSM$AbstractState.stateMachine), alloc));
assert false;
}
