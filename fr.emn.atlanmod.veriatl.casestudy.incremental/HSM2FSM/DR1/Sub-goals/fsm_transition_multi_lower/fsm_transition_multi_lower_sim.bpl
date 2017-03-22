implementation driver(){
var t: ref;
call init_tar_model();
call T2TA_matchAll();
call T2TB_matchAll();
call T2TC_matchAll();
call T2TA_applyAll();
call T2TB_applyAll();
call T2TC_applyAll();
assume Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , FSM$Transition), t);
assume genBy(t, _T2TA,  $srcHeap ,  $tarHeap )  ||  genBy(t, _T2TB,  $srcHeap ,  $tarHeap ) || genBy(t, _T2TC,  $srcHeap ,  $tarHeap );
assume (read( $tarHeap , t, FSM$Transition.stateMachine)==null || !read( $tarHeap , read( $tarHeap , t, FSM$Transition.stateMachine), alloc));
assert false;
}
