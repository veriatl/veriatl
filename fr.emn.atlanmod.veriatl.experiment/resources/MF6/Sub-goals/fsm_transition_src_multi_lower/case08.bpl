implementation driver(){
var t: ref;
call init_tar_model();
call IS2RS_matchAll();
call T2TB_matchAll();
call IS2RS_applyAll();
call T2TB_applyAll();
assume genBy(read($tarHeap, t, FSM$Transition.source), _IS2RS, $srcHeap, $tarHeap);
assume genBy(t, _T2TB, $srcHeap, $tarHeap);
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$Transition), t);
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), read($tarHeap, t, FSM$Transition.source));
assume read($tarHeap, t, FSM$Transition.source) == null || !read($tarHeap, read($tarHeap, t, FSM$Transition.source), alloc);
assume genBy(read($tarHeap, t, FSM$Transition.source), _RS2RS, $srcHeap, $tarHeap) || genBy(read($tarHeap, t, FSM$Transition.source), _IS2IS, $srcHeap, $tarHeap) || genBy(read($tarHeap, t, FSM$Transition.source), _IS2RS, $srcHeap, $tarHeap);
assume genBy(t, _T2TA, $srcHeap, $tarHeap) || genBy(t, _T2TB, $srcHeap, $tarHeap) || genBy(t, _T2TC, $srcHeap, $tarHeap);
assert false;
}

