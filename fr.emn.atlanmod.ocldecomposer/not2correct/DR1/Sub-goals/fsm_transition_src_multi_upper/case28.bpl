implementation driver(){
var s1: ref;
var t: ref;
var s2: ref;
call init_tar_model();
call RS2RS_matchAll();
call CS2RS_matchAll();
call T2TC_matchAll();
call RS2RS_applyAll();
call CS2RS_applyAll();
call T2TC_applyAll();
assume genBy(t, _T2TC, $srcHeap, $tarHeap);
assume genBy(s2, _RS2RS, $srcHeap, $tarHeap);
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$Transition), t);
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), s1);
assume genBy(s1, _CS2RS, $srcHeap, $tarHeap);
assume read($tarHeap, t, FSM$Transition.source) == s1 && read($tarHeap, t, FSM$Transition.source) == s2;
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), s2);
assume genBy(s1, _RS2RS, $srcHeap, $tarHeap) || genBy(s1, _IS2IS, $srcHeap, $tarHeap) || genBy(s1, _IS2RS, $srcHeap, $tarHeap) || genBy(s1, _CS2RS, $srcHeap, $tarHeap);
assume read($tarHeap, t, FSM$Transition.source) == s1;
assume genBy(t, _T2TA, $srcHeap, $tarHeap) || genBy(t, _T2TB, $srcHeap, $tarHeap) || genBy(t, _T2TC, $srcHeap, $tarHeap);
assume genBy(s2, _RS2RS, $srcHeap, $tarHeap) || genBy(s2, _IS2IS, $srcHeap, $tarHeap) || genBy(s2, _IS2RS, $srcHeap, $tarHeap) || genBy(s2, _CS2RS, $srcHeap, $tarHeap);
assume read($tarHeap, t, FSM$Transition.source) == s2;
assert s1 == s2;
}

