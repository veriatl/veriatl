implementation driver(){

var s: ref;

call init_tar_model();

call RS2RS_matchAll();
call IS2IS_matchAll();
call IS2RS_matchAll();
call RS2RS_applyAll();
call IS2IS_applyAll();
call IS2RS_applyAll();

assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), s);

assume read($tarHeap, s, FSM$AbstractState.stateMachine) == null || !read($tarHeap, read($tarHeap, s, FSM$AbstractState.stateMachine), alloc);

assume genBy(s, _RS2RS, $srcHeap, $tarHeap) || genBy(s, _IS2IS, $srcHeap, $tarHeap) || genBy(s, _IS2RS, $srcHeap, $tarHeap);

assert false;
}
