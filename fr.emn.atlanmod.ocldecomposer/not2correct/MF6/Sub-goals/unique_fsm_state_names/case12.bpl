implementation driver(){
var s1: ref;
var s2: ref;
call init_tar_model();
call RS2RS_matchAll();
call CS2RS_matchAll();
call RS2RS_applyAll();
call CS2RS_applyAll();
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), s1);
assume s1 != s2;
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), s2);
assume genBy(s2, _CS2RS, $srcHeap, $tarHeap);
assume genBy(s1, _RS2RS, $srcHeap, $tarHeap);
assume genBy(s2, _RS2RS, $srcHeap, $tarHeap) || genBy(s2, _IS2IS, $srcHeap, $tarHeap) || genBy(s2, _IS2RS, $srcHeap, $tarHeap) || genBy(s2, _CS2RS, $srcHeap, $tarHeap);
assume genBy(s1, _RS2RS, $srcHeap, $tarHeap) || genBy(s1, _IS2IS, $srcHeap, $tarHeap) || genBy(s1, _IS2RS, $srcHeap, $tarHeap) || genBy(s1, _CS2RS, $srcHeap, $tarHeap);
assert read($tarHeap, s1, FSM$AbstractState.name) != read($tarHeap, s2, FSM$AbstractState.name);
}

