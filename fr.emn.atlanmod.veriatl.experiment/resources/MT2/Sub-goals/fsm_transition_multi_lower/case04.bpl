implementation driver(){
var t: ref;
call init_tar_model();
call RS2RS_matchAll();
call T2TA_matchAll();
call RS2RS_applyAll();
call T2TA_applyAll();
assume read($tarHeap, t, FSM$Transition.stateMachine) == null || !read($tarHeap, read($tarHeap, t, FSM$Transition.stateMachine), alloc);
assume genBy(t, _T2TA, $srcHeap, $tarHeap);
assume genBy(read($tarHeap, t, FSM$Transition.stateMachine), _RS2RS, $srcHeap, $tarHeap);
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$Transition), t);
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$StateMachine), read($tarHeap, t, FSM$Transition.stateMachine));
assume genBy(t, _T2TA, $srcHeap, $tarHeap) || genBy(t, _T2TB, $srcHeap, $tarHeap) || genBy(t, _T2TC, $srcHeap, $tarHeap);
assume genBy(read($tarHeap, t, FSM$Transition.stateMachine), _SM2SM, $srcHeap, $tarHeap) || genBy(read($tarHeap, t, FSM$Transition.stateMachine), _RS2RS, $srcHeap, $tarHeap);
assert false;
}

