implementation driver(){
var s: ref;
call init_tar_model();
call CS2RS_matchAll();
call CS2RS_applyAll();
assume read($tarHeap, s, FSM$AbstractState.stateMachine) == null || !read($tarHeap, read($tarHeap, s, FSM$AbstractState.stateMachine), alloc);
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), s);
assume genBy(s, _CS2RS, $srcHeap, $tarHeap);
assume !Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$StateMachine), read($tarHeap, s, FSM$AbstractState.stateMachine));
assume genBy(s, _RS2RS, $srcHeap, $tarHeap) || genBy(s, _IS2IS, $srcHeap, $tarHeap) || genBy(s, _IS2RS, $srcHeap, $tarHeap) || genBy(s, _CS2RS, $srcHeap, $tarHeap);
assert false;
}

