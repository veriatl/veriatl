function genBy(ref, String, HeapType, HeapType): bool;
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _RS2RS, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:HSM$RegularState &&
true
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _IS2IS, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:HSM$InitialState &&
(read($s, Seq#Index(getTarsBySrcs_inverse(__r), 0), HSM$AbstractState.compositeState) == null || !read($s, read($s, Seq#Index(getTarsBySrcs_inverse(__r), 0), HSM$AbstractState.compositeState), alloc))
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _IS2RS, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:HSM$InitialState &&
!((read($s, Seq#Index(getTarsBySrcs_inverse(__r), 0), HSM$AbstractState.compositeState) == null || !read($s, read($s, Seq#Index(getTarsBySrcs_inverse(__r), 0), HSM$AbstractState.compositeState), alloc)))
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _T2TA, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:HSM$Transition &&
!((dtype(read($s, Seq#Index(getTarsBySrcs_inverse(__r), 0), HSM$Transition.source)) <: HSM$CompositeState)) && !((dtype(read($s, Seq#Index(getTarsBySrcs_inverse(__r), 0), HSM$Transition.target)) <: HSM$CompositeState))
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _T2TB, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:HSM$Transition &&
Seq#Index(getTarsBySrcs_inverse(__r), 1)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 1),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 1))<:HSM$CompositeState &&
Seq#Index(getTarsBySrcs_inverse(__r), 2)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 2),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 2))<:HSM$AbstractState &&
Seq#Index(getTarsBySrcs_inverse(__r), 3)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 3),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 3))<:HSM$AbstractState &&
read($s, Seq#Index(getTarsBySrcs_inverse(__r), 0), HSM$Transition.source) == Seq#Index(getTarsBySrcs_inverse(__r), 1) && read($s, Seq#Index(getTarsBySrcs_inverse(__r), 0), HSM$Transition.target) == Seq#Index(getTarsBySrcs_inverse(__r), 2) && read($s, Seq#Index(getTarsBySrcs_inverse(__r), 3), HSM$AbstractState.compositeState) == Seq#Index(getTarsBySrcs_inverse(__r), 1) && !((dtype(Seq#Index(getTarsBySrcs_inverse(__r), 2)) <: HSM$CompositeState))
);
axiom (forall __r: ref, $s: HeapType, $t: HeapType :: genBy(__r, _T2TC, $s, $t) <==>
Seq#Index(getTarsBySrcs_inverse(__r), 0)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 0),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 0))<:HSM$Transition &&
Seq#Index(getTarsBySrcs_inverse(__r), 1)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 1),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 1))<:HSM$AbstractState &&
Seq#Index(getTarsBySrcs_inverse(__r), 2)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 2),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 2))<:HSM$CompositeState &&
Seq#Index(getTarsBySrcs_inverse(__r), 3)!=null && read($s,Seq#Index(getTarsBySrcs_inverse(__r), 3),alloc) && dtype(Seq#Index(getTarsBySrcs_inverse(__r), 3))<:HSM$InitialState &&
read($s, Seq#Index(getTarsBySrcs_inverse(__r), 0), HSM$Transition.source) == Seq#Index(getTarsBySrcs_inverse(__r), 1) && read($s, Seq#Index(getTarsBySrcs_inverse(__r), 0), HSM$Transition.target) == Seq#Index(getTarsBySrcs_inverse(__r), 2) && read($s, Seq#Index(getTarsBySrcs_inverse(__r), 3), HSM$AbstractState.compositeState) == Seq#Index(getTarsBySrcs_inverse(__r), 2) && !((dtype(Seq#Index(getTarsBySrcs_inverse(__r), 1)) <: HSM$CompositeState))
);
