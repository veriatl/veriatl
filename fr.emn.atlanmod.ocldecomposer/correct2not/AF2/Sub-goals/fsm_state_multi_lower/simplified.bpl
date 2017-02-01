implementation driver(){

var s: ref;

call init_tar_model();

call SM2SM_matchAll();
call RS2RS_matchAll();
call IS2IS_matchAll();
call IS2RS_matchAll();
call SM2SM_applyAll();
call RS2RS_applyAll();
call IS2IS_applyAll();
call IS2RS_applyAll();

assume read($tarHeap, s, FSM$AbstractState.stateMachine) == null || !read($tarHeap, read($tarHeap, s, FSM$AbstractState.stateMachine), alloc);

assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), s);

assert false;
}
