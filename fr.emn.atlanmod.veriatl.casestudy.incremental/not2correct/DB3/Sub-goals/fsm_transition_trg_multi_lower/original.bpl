implementation driver(){
call init_tar_model(); 
call RS2RS_matchAll();
call IS2IS_matchAll();
call IS2RS_matchAll();
call CS2RS_matchAll();
call T2TA_matchAll();
call T2TB_matchAll();
call T2TC_matchAll();
call RS2RS_applyAll();
call IS2IS_applyAll();
call IS2RS_applyAll();
call CS2RS_applyAll();
call T2TA_applyAll();
call T2TB_applyAll();
call T2TC_applyAll();

assert (forall t: ref :: Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$Transition), t) ==> !(read($tarHeap, t, FSM$Transition.target) == null || !read($tarHeap, read($tarHeap, t, FSM$Transition.target), alloc)));
}
