implementation driver(){
var t: ref;
call init_tar_model();
call RS2RS_matchAll();
call IS2IS_matchAll();
call IS2RS_matchAll();
call T2TA_matchAll();
call RS2RS_applyAll();
call IS2IS_applyAll();
call IS2RS_applyAll();
call T2TA_applyAll();
assume genBy(t, _T2TA, $srcHeap, $tarHeap);
assume !Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), read($tarHeap, t, FSM$Transition.target));
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$Transition), t);
assume read($tarHeap, t, FSM$Transition.target) == null || !read($tarHeap, read($tarHeap, t, FSM$Transition.target), alloc);
assume !(genBy(read($tarHeap, t, FSM$Transition.target), _RS2RS, $srcHeap, $tarHeap) || genBy(read($tarHeap, t, FSM$Transition.target), _IS2IS, $srcHeap, $tarHeap) || genBy(read($tarHeap, t, FSM$Transition.target), _IS2RS, $srcHeap, $tarHeap));
assume genBy(t, _T2TA, $srcHeap, $tarHeap) || genBy(t, _T2TB, $srcHeap, $tarHeap) || genBy(t, _T2TC, $srcHeap, $tarHeap);
assert false;
}

