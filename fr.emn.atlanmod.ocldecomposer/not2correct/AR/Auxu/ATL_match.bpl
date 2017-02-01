
procedure init_tar_model();
modifies $tarHeap;
ensures  (forall $o: ref :: $o == null || !read($tarHeap, $o, alloc));



procedure RS2RS_matchAll() returns ();
  requires (forall rs1: ref :: rs1!=null && read($srcHeap, rs1, alloc) && dtype(rs1) <: HSM$RegularState ==>
 (read($srcHeap, rs1, HSM$AbstractState.compositeState)==null || !read($srcHeap,read($srcHeap, rs1, HSM$AbstractState.compositeState),alloc))  ==>
getTarsBySrcs(Seq#Singleton(rs1)) ==null || !read($tarHeap, getTarsBySrcs(Seq#Singleton(rs1)), alloc)); 
  modifies $tarHeap,$linkHeap;
// Rule Outcome
  ensures (forall rs1: ref ::
rs1!=null && read($srcHeap, rs1, alloc) && dtype(rs1) <: HSM$RegularState ==>
 (read($srcHeap, rs1, HSM$AbstractState.compositeState)==null || !read($srcHeap,read($srcHeap, rs1, HSM$AbstractState.compositeState),alloc))  ==>
getTarsBySrcs(Seq#Singleton(rs1)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Singleton(rs1)), alloc)
&& dtype(getTarsBySrcs(Seq#Singleton(rs1))) <: FSM$RegularState);
// Frame Condition
  ensures (forall<alpha> $o : ref, $f: Field alpha ::
	($o == null 
	|| read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) 
	|| ((dtype($o) <: FSM$RegularState) && Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$RegularState && $f==alloc )));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures $HeapSucc(old($linkHeap), $linkHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

function printGuard_RS2RS(hp: HeapType, rs1: ref): bool
{  (read(hp, rs1, HSM$AbstractState.compositeState)==null || !read(hp,read(hp, rs1, HSM$AbstractState.compositeState),alloc))  }




procedure IS2IS_matchAll() returns ();
  requires (forall is1: ref :: is1!=null && read($srcHeap, is1, alloc) && dtype(is1) <: HSM$InitialState ==>
 (read($srcHeap, is1, HSM$AbstractState.compositeState)==null || !read($srcHeap,read($srcHeap, is1, HSM$AbstractState.compositeState),alloc))  ==>
getTarsBySrcs(Seq#Singleton(is1)) ==null || !read($tarHeap, getTarsBySrcs(Seq#Singleton(is1)), alloc)); 
  modifies $tarHeap,$linkHeap;
// Rule Outcome
  ensures (forall is1: ref ::
is1!=null && read($srcHeap, is1, alloc) && dtype(is1) <: HSM$InitialState ==>
 (read($srcHeap, is1, HSM$AbstractState.compositeState)==null || !read($srcHeap,read($srcHeap, is1, HSM$AbstractState.compositeState),alloc))  ==>
getTarsBySrcs(Seq#Singleton(is1)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Singleton(is1)), alloc)
&& dtype(getTarsBySrcs(Seq#Singleton(is1))) <: FSM$InitialState);
// Frame Condition
  ensures (forall<alpha> $o : ref, $f: Field alpha ::
	($o == null 
	|| read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) 
	|| ((dtype($o) <: FSM$InitialState) && Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$InitialState && $f==alloc )));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures $HeapSucc(old($linkHeap), $linkHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

function printGuard_IS2IS(hp: HeapType, is1: ref): bool
{  (read(hp, is1, HSM$AbstractState.compositeState)==null || !read(hp,read(hp, is1, HSM$AbstractState.compositeState),alloc))  }




procedure IS2RS_matchAll() returns ();
  requires (forall is1: ref :: is1!=null && read($srcHeap, is1, alloc) && dtype(is1) <: HSM$InitialState ==>
 !((read($srcHeap, is1, HSM$AbstractState.compositeState)==null || !read($srcHeap,read($srcHeap, is1, HSM$AbstractState.compositeState),alloc)))  ==>
getTarsBySrcs(Seq#Singleton(is1)) ==null || !read($tarHeap, getTarsBySrcs(Seq#Singleton(is1)), alloc)); 
  modifies $tarHeap,$linkHeap;
// Rule Outcome
  ensures (forall is1: ref ::
is1!=null && read($srcHeap, is1, alloc) && dtype(is1) <: HSM$InitialState ==>
 !((read($srcHeap, is1, HSM$AbstractState.compositeState)==null || !read($srcHeap,read($srcHeap, is1, HSM$AbstractState.compositeState),alloc)))  ==>
getTarsBySrcs(Seq#Singleton(is1)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Singleton(is1)), alloc)
&& dtype(getTarsBySrcs(Seq#Singleton(is1))) <: FSM$RegularState);
// Frame Condition
  ensures (forall<alpha> $o : ref, $f: Field alpha ::
	($o == null 
	|| read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) 
	|| ((dtype($o) <: FSM$RegularState) && Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$InitialState && $f==alloc )));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures $HeapSucc(old($linkHeap), $linkHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

function printGuard_IS2RS(hp: HeapType, is1: ref): bool
{  !((read(hp, is1, HSM$AbstractState.compositeState)==null || !read(hp,read(hp, is1, HSM$AbstractState.compositeState),alloc)))  }




procedure T2TA_matchAll() returns ();
  requires (forall t1: ref :: t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition ==>
 !(dtype(read($srcHeap, t1, HSM$Transition.source)) == HSM$CompositeState) && !(dtype(read($srcHeap, t1, HSM$Transition.target)) == HSM$CompositeState)  ==>
getTarsBySrcs(Seq#Singleton(t1)) ==null || !read($tarHeap, getTarsBySrcs(Seq#Singleton(t1)), alloc)); 
  modifies $tarHeap,$linkHeap;
// Rule Outcome
  ensures (forall t1: ref ::
t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition ==>
 !(dtype(read($srcHeap, t1, HSM$Transition.source)) == HSM$CompositeState) && !(dtype(read($srcHeap, t1, HSM$Transition.target)) == HSM$CompositeState)  ==>
getTarsBySrcs(Seq#Singleton(t1)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Singleton(t1)), alloc)
&& dtype(getTarsBySrcs(Seq#Singleton(t1))) <: FSM$Transition);
// Frame Condition
  ensures (forall<alpha> $o : ref, $f: Field alpha ::
	($o == null 
	|| read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) 
	|| ((dtype($o) <: FSM$Transition) && Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$Transition && $f==alloc )));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures $HeapSucc(old($linkHeap), $linkHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

function printGuard_T2TA(hp: HeapType, t1: ref): bool
{  !(dtype(read(hp, t1, HSM$Transition.source)) == HSM$CompositeState) && !(dtype(read(hp, t1, HSM$Transition.target)) == HSM$CompositeState)  }




procedure T2TB_matchAll() returns ();
  requires (forall t1,src,trg,c: ref :: t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition && src!=null && read($srcHeap, src, alloc) && dtype(src) <: HSM$CompositeState && trg!=null && read($srcHeap, trg, alloc) && dtype(trg) <: HSM$AbstractState && c!=null && read($srcHeap, c, alloc) && dtype(c) <: HSM$AbstractState ==>
 read($srcHeap, t1, HSM$Transition.source) == src && read($srcHeap, t1, HSM$Transition.target) == trg && read($srcHeap, c, HSM$AbstractState.compositeState) == src  ==>
getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)) ==null || !read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)), alloc)); 
  modifies $tarHeap,$linkHeap;
// Rule Outcome
  ensures (forall t1,src,trg,c: ref ::
t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition && src!=null && read($srcHeap, src, alloc) && dtype(src) <: HSM$CompositeState && trg!=null && read($srcHeap, trg, alloc) && dtype(trg) <: HSM$AbstractState && c!=null && read($srcHeap, c, alloc) && dtype(c) <: HSM$AbstractState ==>
 read($srcHeap, t1, HSM$Transition.source) == src && read($srcHeap, t1, HSM$Transition.target) == trg && read($srcHeap, c, HSM$AbstractState.compositeState) == src  ==>
getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)), alloc)
&& dtype(getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c))) <: FSM$Transition);
// Frame Condition
  ensures (forall<alpha> $o : ref, $f: Field alpha ::
	($o == null 
	|| read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) 
	|| ((dtype($o) <: FSM$Transition) && Seq#Length(getTarsBySrcs_inverse($o)) == 4 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$Transition && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: HSM$CompositeState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 2)) <: HSM$AbstractState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 3)) <: HSM$AbstractState && $f==alloc )));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures $HeapSucc(old($linkHeap), $linkHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

function printGuard_T2TB(hp: HeapType, t1: ref,src: ref,trg: ref,c: ref): bool
{  read(hp, t1, HSM$Transition.source) == src && read(hp, t1, HSM$Transition.target) == trg && read(hp, c, HSM$AbstractState.compositeState) == src  }




procedure T2TC_matchAll() returns ();
  requires (forall t1,src,trg,c: ref :: t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition && src!=null && read($srcHeap, src, alloc) && dtype(src) <: HSM$AbstractState && trg!=null && read($srcHeap, trg, alloc) && dtype(trg) <: HSM$CompositeState && c!=null && read($srcHeap, c, alloc) && dtype(c) <: HSM$InitialState ==>
 read($srcHeap, t1, HSM$Transition.source) == src && read($srcHeap, t1, HSM$Transition.target) == trg && read($srcHeap, c, HSM$AbstractState.compositeState) == trg && !(dtype(src) == HSM$CompositeState)  ==>
getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)) ==null || !read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)), alloc)); 
  modifies $tarHeap,$linkHeap;
// Rule Outcome
  ensures (forall t1,src,trg,c: ref ::
t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition && src!=null && read($srcHeap, src, alloc) && dtype(src) <: HSM$AbstractState && trg!=null && read($srcHeap, trg, alloc) && dtype(trg) <: HSM$CompositeState && c!=null && read($srcHeap, c, alloc) && dtype(c) <: HSM$InitialState ==>
 read($srcHeap, t1, HSM$Transition.source) == src && read($srcHeap, t1, HSM$Transition.target) == trg && read($srcHeap, c, HSM$AbstractState.compositeState) == trg && !(dtype(src) == HSM$CompositeState)  ==>
getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)), alloc)
&& dtype(getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c))) <: FSM$Transition);
// Frame Condition
  ensures (forall<alpha> $o : ref, $f: Field alpha ::
	($o == null 
	|| read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) 
	|| ((dtype($o) <: FSM$Transition) && Seq#Length(getTarsBySrcs_inverse($o)) == 4 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$Transition && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: HSM$AbstractState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 2)) <: HSM$CompositeState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 3)) <: HSM$InitialState && $f==alloc )));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures $HeapSucc(old($linkHeap), $linkHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

function printGuard_T2TC(hp: HeapType, t1: ref,src: ref,trg: ref,c: ref): bool
{  read(hp, t1, HSM$Transition.source) == src && read(hp, t1, HSM$Transition.target) == trg && read(hp, c, HSM$AbstractState.compositeState) == trg && !(dtype(src) == HSM$CompositeState)  }


