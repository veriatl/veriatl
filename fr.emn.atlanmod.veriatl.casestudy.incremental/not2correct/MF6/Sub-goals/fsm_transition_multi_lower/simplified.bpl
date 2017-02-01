implementation driver(){

var t: ref;

call init_tar_model();

call T2TA_matchAll();
call T2TB_matchAll();
call T2TC_matchAll();
call T2TA_applyAll();
call T2TB_applyAll();
call T2TC_applyAll();

assume read($tarHeap, t, FSM$Transition.stateMachine) == null || !read($tarHeap, read($tarHeap, t, FSM$Transition.stateMachine), alloc);

assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$Transition), t);

assert false;
}
