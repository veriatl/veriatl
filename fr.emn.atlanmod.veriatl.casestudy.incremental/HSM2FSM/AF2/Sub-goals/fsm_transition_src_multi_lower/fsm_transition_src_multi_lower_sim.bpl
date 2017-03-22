implementation driver(){
var t: ref;
call init_tar_model();
call RS2RS_matchAll();
call IS2IS_matchAll();
call IS2RS_matchAll();
call T2TB_matchAll();
call T2TC_matchAll();
call T2TA_matchAll();
call RS2RS_applyAll();
call IS2IS_applyAll();
call IS2RS_applyAll();
call T2TB_applyAll();
call T2TC_applyAll();
call T2TA_applyAll();
assume Seq#Contains(Fun#LIB#AllInstanceFrom( $tarHeap , FSM$Transition), t);
assume genBy(t, _T2TA,  $srcHeap ,  $tarHeap )  ||  genBy(t, _T2TB,  $srcHeap ,  $tarHeap ) || genBy(t, _T2TC,  $srcHeap ,  $tarHeap );
assume (read( $tarHeap , t, FSM$Transition.source)==null || !read( $tarHeap , read( $tarHeap , t, FSM$Transition.source), alloc));
assert false;
}
