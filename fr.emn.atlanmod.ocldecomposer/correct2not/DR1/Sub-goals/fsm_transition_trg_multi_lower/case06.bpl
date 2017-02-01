implementation driver(){
var t: ref;
call init_tar_model();
call RS2RS_matchAll();
call T2TB_matchAll();
call RS2RS_applyAll();
call T2TB_applyAll();
assume genBy(t, _T2TB, $srcHeap, $tarHeap);
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$Transition), t);
assume genBy(read($tarHeap, t, FSM$Transition.target), _RS2RS, $srcHeap, $tarHeap);
assume read($tarHeap, t, FSM$Transition.target) == null || !read($tarHeap, read($tarHeap, t, FSM$Transition.target), alloc);
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), read($tarHeap, t, FSM$Transition.target));
assume genBy(t, _T2TA, $srcHeap, $tarHeap) || genBy(t, _T2TB, $srcHeap, $tarHeap) || genBy(t, _T2TC, $srcHeap, $tarHeap);
assume genBy(read($tarHeap, t, FSM$Transition.target), _RS2RS, $srcHeap, $tarHeap) || genBy(read($tarHeap, t, FSM$Transition.target), _IS2IS, $srcHeap, $tarHeap) || genBy(read($tarHeap, t, FSM$Transition.target), _IS2RS, $srcHeap, $tarHeap);
assert false;
}

