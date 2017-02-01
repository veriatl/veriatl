
procedure RS2RS_applyAll() returns();
  requires surj_tar_model($srcHeap, $tarHeap);
  requires (forall rs1: ref :: rs1!=null && read($srcHeap, rs1, alloc) && dtype(rs1) <: HSM$RegularState ==>
 true  ==>
getTarsBySrcs(Seq#Singleton(rs1)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Singleton(rs1)), alloc)
&& dtype(getTarsBySrcs(Seq#Singleton(rs1))) <: FSM$RegularState);
  modifies $tarHeap;
// Rule outcome


  ensures (forall rs1: ref :: rs1!=null && read($srcHeap, rs1, alloc) && dtype(rs1) <: HSM$RegularState ==>
 true  ==>
read($tarHeap, getTarsBySrcs(Seq#Singleton(rs1)), FSM$AbstractState.name) == read($srcHeap, rs1, HSM$AbstractState.name));
  ensures (forall rs1: ref :: rs1!=null && read($srcHeap, rs1, alloc) && dtype(rs1) <: HSM$RegularState ==>
 true  ==>
read($tarHeap, getTarsBySrcs(Seq#Singleton(rs1)), FSM$AbstractState.stateMachine) == getTarsBySrcs(Seq#Singleton(read($srcHeap, rs1, HSM$AbstractState.stateMachine))));


// Frame property
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$RegularState && ( dtype($o) <: FSM$RegularState && ($f == FSM$AbstractState.name || $f == FSM$AbstractState.stateMachine))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

procedure IS2IS_applyAll() returns();
  requires surj_tar_model($srcHeap, $tarHeap);
  requires (forall is1: ref :: is1!=null && read($srcHeap, is1, alloc) && dtype(is1) <: HSM$InitialState ==>
 (read($srcHeap, is1, HSM$AbstractState.compositeState)==null || !read($srcHeap,read($srcHeap, is1, HSM$AbstractState.compositeState),alloc))  ==>
getTarsBySrcs(Seq#Singleton(is1)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Singleton(is1)), alloc)
&& dtype(getTarsBySrcs(Seq#Singleton(is1))) <: FSM$InitialState);
  modifies $tarHeap;
// Rule outcome


  ensures (forall is1: ref :: is1!=null && read($srcHeap, is1, alloc) && dtype(is1) <: HSM$InitialState ==>
 (read($srcHeap, is1, HSM$AbstractState.compositeState)==null || !read($srcHeap,read($srcHeap, is1, HSM$AbstractState.compositeState),alloc))  ==>
read($tarHeap, getTarsBySrcs(Seq#Singleton(is1)), FSM$AbstractState.stateMachine) == getTarsBySrcs(Seq#Singleton(read($srcHeap, is1, HSM$AbstractState.stateMachine))));


// Frame property
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$InitialState && ( dtype($o) <: FSM$InitialState && ($f == FSM$AbstractState.stateMachine))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

procedure IS2RS_applyAll() returns();
  requires surj_tar_model($srcHeap, $tarHeap);
  requires (forall is1: ref :: is1!=null && read($srcHeap, is1, alloc) && dtype(is1) <: HSM$InitialState ==>
 !((read($srcHeap, is1, HSM$AbstractState.compositeState)==null || !read($srcHeap,read($srcHeap, is1, HSM$AbstractState.compositeState),alloc)))  ==>
getTarsBySrcs(Seq#Singleton(is1)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Singleton(is1)), alloc)
&& dtype(getTarsBySrcs(Seq#Singleton(is1))) <: FSM$RegularState);
  modifies $tarHeap;
// Rule outcome


  ensures (forall is1: ref :: is1!=null && read($srcHeap, is1, alloc) && dtype(is1) <: HSM$InitialState ==>
 !((read($srcHeap, is1, HSM$AbstractState.compositeState)==null || !read($srcHeap,read($srcHeap, is1, HSM$AbstractState.compositeState),alloc)))  ==>
read($tarHeap, getTarsBySrcs(Seq#Singleton(is1)), FSM$AbstractState.stateMachine) == getTarsBySrcs(Seq#Singleton(read($srcHeap, is1, HSM$AbstractState.stateMachine))));
  ensures (forall is1: ref :: is1!=null && read($srcHeap, is1, alloc) && dtype(is1) <: HSM$InitialState ==>
 !((read($srcHeap, is1, HSM$AbstractState.compositeState)==null || !read($srcHeap,read($srcHeap, is1, HSM$AbstractState.compositeState),alloc)))  ==>
read($tarHeap, getTarsBySrcs(Seq#Singleton(is1)), FSM$AbstractState.name) == read($srcHeap, is1, HSM$AbstractState.name));


// Frame property
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$InitialState && ( dtype($o) <: FSM$RegularState && ($f == FSM$AbstractState.stateMachine || $f == FSM$AbstractState.name))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

procedure CS2RS_applyAll() returns();
  requires surj_tar_model($srcHeap, $tarHeap);
  requires (forall rs1: ref :: rs1!=null && read($srcHeap, rs1, alloc) && dtype(rs1) <: HSM$CompositeState ==>
 true  ==>
getTarsBySrcs(Seq#Singleton(rs1)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Singleton(rs1)), alloc)
&& dtype(getTarsBySrcs(Seq#Singleton(rs1))) <: FSM$RegularState);
  modifies $tarHeap;
// Rule outcome




// Frame property
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$CompositeState && ( dtype($o) <: FSM$RegularState )) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

procedure T2TA_applyAll() returns();
  requires surj_tar_model($srcHeap, $tarHeap);
  requires (forall t1: ref :: t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition ==>
 !(dtype(read($srcHeap, t1, HSM$Transition.source)) == HSM$CompositeState) && !(dtype(read($srcHeap, t1, HSM$Transition.target)) == HSM$CompositeState)  ==>
getTarsBySrcs(Seq#Singleton(t1)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Singleton(t1)), alloc)
&& dtype(getTarsBySrcs(Seq#Singleton(t1))) <: FSM$Transition);
  modifies $tarHeap;
// Rule outcome


  ensures (forall t1: ref :: t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition ==>
 !(dtype(read($srcHeap, t1, HSM$Transition.source)) == HSM$CompositeState) && !(dtype(read($srcHeap, t1, HSM$Transition.target)) == HSM$CompositeState)  ==>
read($tarHeap, getTarsBySrcs(Seq#Singleton(t1)), FSM$Transition.label) == read($srcHeap, t1, HSM$Transition.label));
  ensures (forall t1: ref :: t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition ==>
 !(dtype(read($srcHeap, t1, HSM$Transition.source)) == HSM$CompositeState) && !(dtype(read($srcHeap, t1, HSM$Transition.target)) == HSM$CompositeState)  ==>
read($tarHeap, getTarsBySrcs(Seq#Singleton(t1)), FSM$Transition.stateMachine) == getTarsBySrcs(Seq#Singleton(read($srcHeap, t1, HSM$Transition.stateMachine))));
  ensures (forall t1: ref :: t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition ==>
 !(dtype(read($srcHeap, t1, HSM$Transition.source)) == HSM$CompositeState) && !(dtype(read($srcHeap, t1, HSM$Transition.target)) == HSM$CompositeState)  ==>
read($tarHeap, getTarsBySrcs(Seq#Singleton(t1)), FSM$Transition.source) == getTarsBySrcs(Seq#Singleton(read($srcHeap, t1, HSM$Transition.source))));
  ensures (forall t1: ref :: t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition ==>
 !(dtype(read($srcHeap, t1, HSM$Transition.source)) == HSM$CompositeState) && !(dtype(read($srcHeap, t1, HSM$Transition.target)) == HSM$CompositeState)  ==>
read($tarHeap, getTarsBySrcs(Seq#Singleton(t1)), FSM$Transition.target) == getTarsBySrcs(Seq#Singleton(read($srcHeap, t1, HSM$Transition.target))));


// Frame property
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$Transition && ( dtype($o) <: FSM$Transition && ($f == FSM$Transition.label || $f == FSM$Transition.stateMachine || $f == FSM$Transition.source || $f == FSM$Transition.target))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

procedure T2TB_applyAll() returns();
  requires surj_tar_model($srcHeap, $tarHeap);
  requires (forall t1,src,trg,c: ref :: t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition && src!=null && read($srcHeap, src, alloc) && dtype(src) <: HSM$CompositeState && trg!=null && read($srcHeap, trg, alloc) && dtype(trg) <: HSM$AbstractState && c!=null && read($srcHeap, c, alloc) && dtype(c) <: HSM$AbstractState ==>
 read($srcHeap, t1, HSM$Transition.source) == src && read($srcHeap, t1, HSM$Transition.target) == trg && read($srcHeap, c, HSM$AbstractState.compositeState) == src  ==>
getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)), alloc)
&& dtype(getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c))) <: FSM$Transition);
  modifies $tarHeap;
// Rule outcome


  ensures (forall t1,src,trg,c: ref :: t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition && src!=null && read($srcHeap, src, alloc) && dtype(src) <: HSM$CompositeState && trg!=null && read($srcHeap, trg, alloc) && dtype(trg) <: HSM$AbstractState && c!=null && read($srcHeap, c, alloc) && dtype(c) <: HSM$AbstractState ==>
 read($srcHeap, t1, HSM$Transition.source) == src && read($srcHeap, t1, HSM$Transition.target) == trg && read($srcHeap, c, HSM$AbstractState.compositeState) == src  ==>
read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)), FSM$Transition.label) == read($srcHeap, t1, HSM$Transition.label));
  ensures (forall t1,src,trg,c: ref :: t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition && src!=null && read($srcHeap, src, alloc) && dtype(src) <: HSM$CompositeState && trg!=null && read($srcHeap, trg, alloc) && dtype(trg) <: HSM$AbstractState && c!=null && read($srcHeap, c, alloc) && dtype(c) <: HSM$AbstractState ==>
 read($srcHeap, t1, HSM$Transition.source) == src && read($srcHeap, t1, HSM$Transition.target) == trg && read($srcHeap, c, HSM$AbstractState.compositeState) == src  ==>
read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)), FSM$Transition.stateMachine) == getTarsBySrcs(Seq#Singleton(read($srcHeap, t1, HSM$Transition.stateMachine))));
  ensures (forall t1,src,trg,c: ref :: t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition && src!=null && read($srcHeap, src, alloc) && dtype(src) <: HSM$CompositeState && trg!=null && read($srcHeap, trg, alloc) && dtype(trg) <: HSM$AbstractState && c!=null && read($srcHeap, c, alloc) && dtype(c) <: HSM$AbstractState ==>
 read($srcHeap, t1, HSM$Transition.source) == src && read($srcHeap, t1, HSM$Transition.target) == trg && read($srcHeap, c, HSM$AbstractState.compositeState) == src  ==>
read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)), FSM$Transition.source) == getTarsBySrcs(Seq#Singleton(c)));
  ensures (forall t1,src,trg,c: ref :: t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition && src!=null && read($srcHeap, src, alloc) && dtype(src) <: HSM$CompositeState && trg!=null && read($srcHeap, trg, alloc) && dtype(trg) <: HSM$AbstractState && c!=null && read($srcHeap, c, alloc) && dtype(c) <: HSM$AbstractState ==>
 read($srcHeap, t1, HSM$Transition.source) == src && read($srcHeap, t1, HSM$Transition.target) == trg && read($srcHeap, c, HSM$AbstractState.compositeState) == src  ==>
read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)), FSM$Transition.target) == getTarsBySrcs(Seq#Singleton(src)));


// Frame property
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 4 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$Transition && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: HSM$CompositeState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 2)) <: HSM$AbstractState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 3)) <: HSM$AbstractState && ( dtype($o) <: FSM$Transition && ($f == FSM$Transition.label || $f == FSM$Transition.stateMachine || $f == FSM$Transition.source || $f == FSM$Transition.target))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

procedure T2TC_applyAll() returns();
  requires surj_tar_model($srcHeap, $tarHeap);
  requires (forall t1,src,trg,c: ref :: t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition && src!=null && read($srcHeap, src, alloc) && dtype(src) <: HSM$AbstractState && trg!=null && read($srcHeap, trg, alloc) && dtype(trg) <: HSM$CompositeState && c!=null && read($srcHeap, c, alloc) && dtype(c) <: HSM$InitialState ==>
 read($srcHeap, t1, HSM$Transition.source) == src && read($srcHeap, t1, HSM$Transition.target) == trg && read($srcHeap, c, HSM$AbstractState.compositeState) == trg && !(dtype(src) == HSM$CompositeState)  ==>
getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)), alloc)
&& dtype(getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c))) <: FSM$Transition);
  modifies $tarHeap;
// Rule outcome


  ensures (forall t1,src,trg,c: ref :: t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition && src!=null && read($srcHeap, src, alloc) && dtype(src) <: HSM$AbstractState && trg!=null && read($srcHeap, trg, alloc) && dtype(trg) <: HSM$CompositeState && c!=null && read($srcHeap, c, alloc) && dtype(c) <: HSM$InitialState ==>
 read($srcHeap, t1, HSM$Transition.source) == src && read($srcHeap, t1, HSM$Transition.target) == trg && read($srcHeap, c, HSM$AbstractState.compositeState) == trg && !(dtype(src) == HSM$CompositeState)  ==>
read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)), FSM$Transition.label) == read($srcHeap, t1, HSM$Transition.label));
  ensures (forall t1,src,trg,c: ref :: t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition && src!=null && read($srcHeap, src, alloc) && dtype(src) <: HSM$AbstractState && trg!=null && read($srcHeap, trg, alloc) && dtype(trg) <: HSM$CompositeState && c!=null && read($srcHeap, c, alloc) && dtype(c) <: HSM$InitialState ==>
 read($srcHeap, t1, HSM$Transition.source) == src && read($srcHeap, t1, HSM$Transition.target) == trg && read($srcHeap, c, HSM$AbstractState.compositeState) == trg && !(dtype(src) == HSM$CompositeState)  ==>
read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)), FSM$Transition.stateMachine) == getTarsBySrcs(Seq#Singleton(read($srcHeap, t1, HSM$Transition.stateMachine))));
  ensures (forall t1,src,trg,c: ref :: t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition && src!=null && read($srcHeap, src, alloc) && dtype(src) <: HSM$AbstractState && trg!=null && read($srcHeap, trg, alloc) && dtype(trg) <: HSM$CompositeState && c!=null && read($srcHeap, c, alloc) && dtype(c) <: HSM$InitialState ==>
 read($srcHeap, t1, HSM$Transition.source) == src && read($srcHeap, t1, HSM$Transition.target) == trg && read($srcHeap, c, HSM$AbstractState.compositeState) == trg && !(dtype(src) == HSM$CompositeState)  ==>
read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)), FSM$Transition.source) == getTarsBySrcs(Seq#Singleton(src)));
  ensures (forall t1,src,trg,c: ref :: t1!=null && read($srcHeap, t1, alloc) && dtype(t1) <: HSM$Transition && src!=null && read($srcHeap, src, alloc) && dtype(src) <: HSM$AbstractState && trg!=null && read($srcHeap, trg, alloc) && dtype(trg) <: HSM$CompositeState && c!=null && read($srcHeap, c, alloc) && dtype(c) <: HSM$InitialState ==>
 read($srcHeap, t1, HSM$Transition.source) == src && read($srcHeap, t1, HSM$Transition.target) == trg && read($srcHeap, c, HSM$AbstractState.compositeState) == trg && !(dtype(src) == HSM$CompositeState)  ==>
read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)), FSM$Transition.target) == getTarsBySrcs(Seq#Singleton(c)));


// Frame property
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 4 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$Transition && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: HSM$AbstractState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 2)) <: HSM$CompositeState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 3)) <: HSM$InitialState && ( dtype($o) <: FSM$Transition && ($f == FSM$Transition.label || $f == FSM$Transition.stateMachine || $f == FSM$Transition.source || $f == FSM$Transition.target))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);



