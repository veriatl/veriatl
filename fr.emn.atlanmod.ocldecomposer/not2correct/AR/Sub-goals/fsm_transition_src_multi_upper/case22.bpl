implementation driver(){
var s2: ref;
var s1: ref;
var t: ref;
call init_tar_model();
call IS2IS_matchAll();
call T2TB_matchAll();
call IS2IS_applyAll();
call T2TB_applyAll();
assume genBy(s2, _IS2IS, $srcHeap, $tarHeap);
assume genBy(s1, _IS2IS, $srcHeap, $tarHeap);
assume genBy(t, _T2TB, $srcHeap, $tarHeap);
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), s2);
assume read($tarHeap, t, FSM$Transition.source) == s1 && read($tarHeap, t, FSM$Transition.source) == s2;
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$Transition), t);
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), s1);
assume read($tarHeap, t, FSM$Transition.source) == s2;
assume genBy(t, _T2TA, $srcHeap, $tarHeap) || genBy(t, _T2TB, $srcHeap, $tarHeap) || genBy(t, _T2TC, $srcHeap, $tarHeap);
assume genBy(s1, _RS2RS, $srcHeap, $tarHeap) || genBy(s1, _IS2IS, $srcHeap, $tarHeap) || genBy(s1, _IS2RS, $srcHeap, $tarHeap);
assume genBy(s2, _RS2RS, $srcHeap, $tarHeap) || genBy(s2, _IS2IS, $srcHeap, $tarHeap) || genBy(s2, _IS2RS, $srcHeap, $tarHeap);
assume read($tarHeap, t, FSM$Transition.source) == s1;
assert s1 == s2;
}

