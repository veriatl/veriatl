implementation driver(){
var t: ref;
call init_tar_model();
call SM2SM_matchAll();
call T2TB_matchAll();
call SM2SM_applyAll();
call T2TB_applyAll();
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$StateMachine), read($tarHeap, t, FSM$Transition.stateMachine));
assume genBy(read($tarHeap, t, FSM$Transition.stateMachine), _SM2SM, $srcHeap, $tarHeap);
assume genBy(t, _T2TB, $srcHeap, $tarHeap);
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$Transition), t);
assume read($tarHeap, t, FSM$Transition.stateMachine) == null || !read($tarHeap, read($tarHeap, t, FSM$Transition.stateMachine), alloc);
assume genBy(read($tarHeap, t, FSM$Transition.stateMachine), _SM2SM, $srcHeap, $tarHeap) || false;
assume genBy(t, _T2TA, $srcHeap, $tarHeap) || genBy(t, _T2TB, $srcHeap, $tarHeap) || genBy(t, _T2TC, $srcHeap, $tarHeap);
assert false;
}

