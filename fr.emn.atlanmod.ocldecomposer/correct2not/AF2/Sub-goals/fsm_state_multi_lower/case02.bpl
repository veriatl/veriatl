implementation driver(){
var s: ref;
call init_tar_model();
call SM2SM_matchAll();
call IS2RS_matchAll();
call SM2SM_applyAll();
call IS2RS_applyAll();
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), s);
assume genBy(s, _IS2RS, $srcHeap, $tarHeap);
assume !Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$StateMachine), read($tarHeap, s, FSM$AbstractState.stateMachine));
assume read($tarHeap, s, FSM$AbstractState.stateMachine) == null || !read($tarHeap, read($tarHeap, s, FSM$AbstractState.stateMachine), alloc);
assume !(genBy(read($tarHeap, s, FSM$AbstractState.stateMachine), _SM2SM, $srcHeap, $tarHeap) || false);
assume genBy(s, _RS2RS, $srcHeap, $tarHeap) || genBy(s, _IS2IS, $srcHeap, $tarHeap) || genBy(s, _IS2RS, $srcHeap, $tarHeap);
assert false;
}

