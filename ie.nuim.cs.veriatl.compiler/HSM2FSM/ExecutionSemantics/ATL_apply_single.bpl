
procedure SM2SM_apply(in: ref) returns();
free requires surj_tar_model($srcHeap, $tarHeap);
//free requires isValidSrc($srcHeap);
//free requires isInstTar($tarHeap);
// link info
free requires $linkHeap[in, alloc] == true;
free requires dtype(in) == Native$TransientLink;
// rule info
free requires $linkHeap[in, TransientLink#rule]==_SM2SM;  
free requires Map#Domain($linkHeap[in, TransientLink#source])[_sm1];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_sm1]) <: HSM$StateMachine;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_sm1] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_sm1], alloc);

free requires Map#Domain($linkHeap[in, TransientLink#target])[_sm2];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#target])[_sm2]) <: FSM$StateMachine;
free requires Map#Elements($linkHeap[in, TransientLink#target])[_sm2] != null;
free requires read($tarHeap, Map#Elements($linkHeap[in, TransientLink#target])[_sm2], alloc);

// Correspondence I/O
free requires getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_sm1])) == Map#Elements($linkHeap[in, TransientLink#target])[_sm2];
// Guard
free requires true ;
// isValid Source model, to cooperate with resolve function.

// isValid Target model, i.e. associations are populated with empty array.

// modifies
modifies $tarHeap;
// Rule outcome

ensures read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_sm1])), FSM$StateMachine.name) == read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_sm1], HSM$StateMachine.name);


// Frame 
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$StateMachine && ( dtype($o) <: FSM$StateMachine && ($f == FSM$StateMachine.name))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) && $o != getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_sm1])) ==> 
	(read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
  );
// Preserving
free ensures $HeapSucc(old($tarHeap), $tarHeap);
free ensures surj_tar_model($srcHeap, $tarHeap);

procedure RS2RS_apply(in: ref) returns();
free requires surj_tar_model($srcHeap, $tarHeap);
//free requires isValidSrc($srcHeap);
//free requires isInstTar($tarHeap);
// link info
free requires $linkHeap[in, alloc] == true;
free requires dtype(in) == Native$TransientLink;
// rule info
free requires $linkHeap[in, TransientLink#rule]==_RS2RS;  
free requires Map#Domain($linkHeap[in, TransientLink#source])[_rs1];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_rs1]) <: HSM$RegularState;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_rs1] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_rs1], alloc);

free requires Map#Domain($linkHeap[in, TransientLink#target])[_rs2];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#target])[_rs2]) <: FSM$RegularState;
free requires Map#Elements($linkHeap[in, TransientLink#target])[_rs2] != null;
free requires read($tarHeap, Map#Elements($linkHeap[in, TransientLink#target])[_rs2], alloc);

// Correspondence I/O
free requires getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_rs1])) == Map#Elements($linkHeap[in, TransientLink#target])[_rs2];
// Guard
free requires true ;
// isValid Source model, to cooperate with resolve function.

free requires dtype(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_rs1], HSM$AbstractState.stateMachine)) != class._System.array;
// isValid Target model, i.e. associations are populated with empty array.

// modifies
modifies $tarHeap;
// Rule outcome

ensures read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_rs1])), FSM$AbstractState.name) == read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_rs1], HSM$AbstractState.name);
ensures read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_rs1])), FSM$AbstractState.stateMachine) == getTarsBySrcs(Seq#Singleton(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_rs1], HSM$AbstractState.stateMachine)));


// Frame 
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$RegularState && ( dtype($o) <: FSM$RegularState && ($f == FSM$AbstractState.name || $f == FSM$AbstractState.stateMachine))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) && $o != getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_rs1])) ==> 
	(read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
  );
// Preserving
free ensures $HeapSucc(old($tarHeap), $tarHeap);
free ensures surj_tar_model($srcHeap, $tarHeap);

procedure IS2IS_apply(in: ref) returns();
free requires surj_tar_model($srcHeap, $tarHeap);
//free requires isValidSrc($srcHeap);
//free requires isInstTar($tarHeap);
// link info
free requires $linkHeap[in, alloc] == true;
free requires dtype(in) == Native$TransientLink;
// rule info
free requires $linkHeap[in, TransientLink#rule]==_IS2IS;  
free requires Map#Domain($linkHeap[in, TransientLink#source])[_is1];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_is1]) <: HSM$InitialState;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_is1] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_is1], alloc);

free requires Map#Domain($linkHeap[in, TransientLink#target])[_is2];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#target])[_is2]) <: FSM$InitialState;
free requires Map#Elements($linkHeap[in, TransientLink#target])[_is2] != null;
free requires read($tarHeap, Map#Elements($linkHeap[in, TransientLink#target])[_is2], alloc);

// Correspondence I/O
free requires getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_is1])) == Map#Elements($linkHeap[in, TransientLink#target])[_is2];
// Guard
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_is1], HSM$AbstractState.compositeState)==null ;
// isValid Source model, to cooperate with resolve function.

free requires dtype(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_is1], HSM$AbstractState.stateMachine)) != class._System.array;
// isValid Target model, i.e. associations are populated with empty array.

// modifies
modifies $tarHeap;
// Rule outcome

ensures read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_is1])), FSM$AbstractState.stateMachine) == getTarsBySrcs(Seq#Singleton(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_is1], HSM$AbstractState.stateMachine)));
ensures read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_is1])), FSM$AbstractState.name) == read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_is1], HSM$AbstractState.name);


// Frame 
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$InitialState && ( dtype($o) <: FSM$InitialState && ($f == FSM$AbstractState.stateMachine || $f == FSM$AbstractState.name))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) && $o != getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_is1])) ==> 
	(read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
  );
// Preserving
free ensures $HeapSucc(old($tarHeap), $tarHeap);
free ensures surj_tar_model($srcHeap, $tarHeap);

procedure IS2RS_apply(in: ref) returns();
free requires surj_tar_model($srcHeap, $tarHeap);
//free requires isValidSrc($srcHeap);
//free requires isInstTar($tarHeap);
// link info
free requires $linkHeap[in, alloc] == true;
free requires dtype(in) == Native$TransientLink;
// rule info
free requires $linkHeap[in, TransientLink#rule]==_IS2RS;  
free requires Map#Domain($linkHeap[in, TransientLink#source])[_is1];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_is1]) <: HSM$InitialState;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_is1] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_is1], alloc);

free requires Map#Domain($linkHeap[in, TransientLink#target])[_is2];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#target])[_is2]) <: FSM$RegularState;
free requires Map#Elements($linkHeap[in, TransientLink#target])[_is2] != null;
free requires read($tarHeap, Map#Elements($linkHeap[in, TransientLink#target])[_is2], alloc);

// Correspondence I/O
free requires getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_is1])) == Map#Elements($linkHeap[in, TransientLink#target])[_is2];
// Guard
free requires !(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_is1], HSM$AbstractState.compositeState)==null) ;
// isValid Source model, to cooperate with resolve function.

free requires dtype(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_is1], HSM$AbstractState.stateMachine)) != class._System.array;
// isValid Target model, i.e. associations are populated with empty array.

// modifies
modifies $tarHeap;
// Rule outcome

ensures read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_is1])), FSM$AbstractState.stateMachine) == getTarsBySrcs(Seq#Singleton(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_is1], HSM$AbstractState.stateMachine)));
ensures read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_is1])), FSM$AbstractState.name) == read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_is1], HSM$AbstractState.name);


// Frame 
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$InitialState && ( dtype($o) <: FSM$RegularState && ($f == FSM$AbstractState.stateMachine || $f == FSM$AbstractState.name))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) && $o != getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_is1])) ==> 
	(read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
  );
// Preserving
free ensures $HeapSucc(old($tarHeap), $tarHeap);
free ensures surj_tar_model($srcHeap, $tarHeap);

procedure T2TA_apply(in: ref) returns();
free requires surj_tar_model($srcHeap, $tarHeap);
//free requires isValidSrc($srcHeap);
//free requires isInstTar($tarHeap);
// link info
free requires $linkHeap[in, alloc] == true;
free requires dtype(in) == Native$TransientLink;
// rule info
free requires $linkHeap[in, TransientLink#rule]==_T2TA;  
free requires Map#Domain($linkHeap[in, TransientLink#source])[_t1];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_t1]) <: HSM$Transition;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_t1] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], alloc);

free requires Map#Domain($linkHeap[in, TransientLink#target])[_t2];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#target])[_t2]) <: FSM$Transition;
free requires Map#Elements($linkHeap[in, TransientLink#target])[_t2] != null;
free requires read($tarHeap, Map#Elements($linkHeap[in, TransientLink#target])[_t2], alloc);

// Correspondence I/O
free requires getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_t1])) == Map#Elements($linkHeap[in, TransientLink#target])[_t2];
// Guard
free requires !(dtype(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], HSM$Transition.source)) == HSM$CompositeState) && !(dtype(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], HSM$Transition.target)) == HSM$CompositeState) ;
// isValid Source model, to cooperate with resolve function.

free requires dtype(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], HSM$Transition.stateMachine)) != class._System.array;
free requires dtype(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], HSM$Transition.source)) != class._System.array;
free requires dtype(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], HSM$Transition.target)) != class._System.array;
// isValid Target model, i.e. associations are populated with empty array.

// modifies
modifies $tarHeap;
// Rule outcome

ensures read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_t1])), FSM$Transition.label) == read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], HSM$Transition.label);
ensures read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_t1])), FSM$Transition.stateMachine) == getTarsBySrcs(Seq#Singleton(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], HSM$Transition.stateMachine)));
ensures read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_t1])), FSM$Transition.source) == getTarsBySrcs(Seq#Singleton(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], HSM$Transition.source)));
ensures read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_t1])), FSM$Transition.target) == getTarsBySrcs(Seq#Singleton(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], HSM$Transition.target)));


// Frame 
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$Transition && ( dtype($o) <: FSM$Transition && ($f == FSM$Transition.label || $f == FSM$Transition.stateMachine || $f == FSM$Transition.source || $f == FSM$Transition.target))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) && $o != getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_t1])) ==> 
	(read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
  );
// Preserving
free ensures $HeapSucc(old($tarHeap), $tarHeap);
free ensures surj_tar_model($srcHeap, $tarHeap);

procedure T2TB_apply(in: ref) returns();
free requires surj_tar_model($srcHeap, $tarHeap);
//free requires isValidSrc($srcHeap);
//free requires isInstTar($tarHeap);
// link info
free requires $linkHeap[in, alloc] == true;
free requires dtype(in) == Native$TransientLink;
// rule info
free requires $linkHeap[in, TransientLink#rule]==_T2TB;  
free requires Map#Domain($linkHeap[in, TransientLink#source])[_t1];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_t1]) <: HSM$Transition;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_t1] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], alloc);
free requires Map#Domain($linkHeap[in, TransientLink#source])[_src];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_src]) <: HSM$CompositeState;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_src] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_src], alloc);
free requires Map#Domain($linkHeap[in, TransientLink#source])[_trg];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_trg]) <: HSM$AbstractState;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_trg] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_trg], alloc);
free requires Map#Domain($linkHeap[in, TransientLink#source])[_c];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_c]) <: HSM$AbstractState;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_c] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_c], alloc);

free requires Map#Domain($linkHeap[in, TransientLink#target])[_t2];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#target])[_t2]) <: FSM$Transition;
free requires Map#Elements($linkHeap[in, TransientLink#target])[_t2] != null;
free requires read($tarHeap, Map#Elements($linkHeap[in, TransientLink#target])[_t2], alloc);

// Correspondence I/O
free requires getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_t1]),Map#Elements($linkHeap[in, TransientLink#source])[_src]),Map#Elements($linkHeap[in, TransientLink#source])[_trg]),Map#Elements($linkHeap[in, TransientLink#source])[_c])) == Map#Elements($linkHeap[in, TransientLink#target])[_t2];
// Guard
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], HSM$Transition.source) == Map#Elements($linkHeap[in, TransientLink#source])[_src] && read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], HSM$Transition.target) == Map#Elements($linkHeap[in, TransientLink#source])[_trg] && read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_c], HSM$AbstractState.compositeState) == Map#Elements($linkHeap[in, TransientLink#source])[_src] && !(dtype(Map#Elements($linkHeap[in, TransientLink#source])[_trg]) == HSM$CompositeState) && !(Map#Elements($linkHeap[in, TransientLink#source])[_c] == Map#Elements($linkHeap[in, TransientLink#source])[_src]) ;
// isValid Source model, to cooperate with resolve function.

free requires dtype(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], HSM$Transition.stateMachine)) != class._System.array;
// isValid Target model, i.e. associations are populated with empty array.

// modifies
modifies $tarHeap;
// Rule outcome

ensures read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_t1]),Map#Elements($linkHeap[in, TransientLink#source])[_src]),Map#Elements($linkHeap[in, TransientLink#source])[_trg]),Map#Elements($linkHeap[in, TransientLink#source])[_c])), FSM$Transition.label) == read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], HSM$Transition.label);
ensures read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_t1]),Map#Elements($linkHeap[in, TransientLink#source])[_src]),Map#Elements($linkHeap[in, TransientLink#source])[_trg]),Map#Elements($linkHeap[in, TransientLink#source])[_c])), FSM$Transition.stateMachine) == getTarsBySrcs(Seq#Singleton(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], HSM$Transition.stateMachine)));
ensures read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_t1]),Map#Elements($linkHeap[in, TransientLink#source])[_src]),Map#Elements($linkHeap[in, TransientLink#source])[_trg]),Map#Elements($linkHeap[in, TransientLink#source])[_c])), FSM$Transition.source) == getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_c]));
ensures read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_t1]),Map#Elements($linkHeap[in, TransientLink#source])[_src]),Map#Elements($linkHeap[in, TransientLink#source])[_trg]),Map#Elements($linkHeap[in, TransientLink#source])[_c])), FSM$Transition.target) == getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_trg]));


// Frame 
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 4 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$Transition && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: HSM$CompositeState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 2)) <: HSM$AbstractState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 3)) <: HSM$AbstractState && ( dtype($o) <: FSM$Transition && ($f == FSM$Transition.label || $f == FSM$Transition.stateMachine || $f == FSM$Transition.source || $f == FSM$Transition.target))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) && $o != getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_t1]),Map#Elements($linkHeap[in, TransientLink#source])[_src]),Map#Elements($linkHeap[in, TransientLink#source])[_trg]),Map#Elements($linkHeap[in, TransientLink#source])[_c])) ==> 
	(read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
  );
// Preserving
free ensures $HeapSucc(old($tarHeap), $tarHeap);
free ensures surj_tar_model($srcHeap, $tarHeap);

procedure T2TC_apply(in: ref) returns();
free requires surj_tar_model($srcHeap, $tarHeap);
//free requires isValidSrc($srcHeap);
//free requires isInstTar($tarHeap);
// link info
free requires $linkHeap[in, alloc] == true;
free requires dtype(in) == Native$TransientLink;
// rule info
free requires $linkHeap[in, TransientLink#rule]==_T2TC;  
free requires Map#Domain($linkHeap[in, TransientLink#source])[_t1];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_t1]) <: HSM$Transition;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_t1] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], alloc);
free requires Map#Domain($linkHeap[in, TransientLink#source])[_src];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_src]) <: HSM$AbstractState;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_src] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_src], alloc);
free requires Map#Domain($linkHeap[in, TransientLink#source])[_trg];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_trg]) <: HSM$CompositeState;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_trg] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_trg], alloc);
free requires Map#Domain($linkHeap[in, TransientLink#source])[_c];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_c]) <: HSM$InitialState;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_c] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_c], alloc);

free requires Map#Domain($linkHeap[in, TransientLink#target])[_t2];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#target])[_t2]) <: FSM$Transition;
free requires Map#Elements($linkHeap[in, TransientLink#target])[_t2] != null;
free requires read($tarHeap, Map#Elements($linkHeap[in, TransientLink#target])[_t2], alloc);

// Correspondence I/O
free requires getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_t1]),Map#Elements($linkHeap[in, TransientLink#source])[_src]),Map#Elements($linkHeap[in, TransientLink#source])[_trg]),Map#Elements($linkHeap[in, TransientLink#source])[_c])) == Map#Elements($linkHeap[in, TransientLink#target])[_t2];
// Guard
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], HSM$Transition.source) == Map#Elements($linkHeap[in, TransientLink#source])[_src] && read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], HSM$Transition.target) == Map#Elements($linkHeap[in, TransientLink#source])[_trg] && read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_c], HSM$AbstractState.compositeState) == Map#Elements($linkHeap[in, TransientLink#source])[_trg] && !(dtype(Map#Elements($linkHeap[in, TransientLink#source])[_src]) == HSM$CompositeState) ;
// isValid Source model, to cooperate with resolve function.

free requires dtype(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], HSM$Transition.stateMachine)) != class._System.array;
// isValid Target model, i.e. associations are populated with empty array.

// modifies
modifies $tarHeap;
// Rule outcome

ensures read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_t1]),Map#Elements($linkHeap[in, TransientLink#source])[_src]),Map#Elements($linkHeap[in, TransientLink#source])[_trg]),Map#Elements($linkHeap[in, TransientLink#source])[_c])), FSM$Transition.label) == read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], HSM$Transition.label);
ensures read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_t1]),Map#Elements($linkHeap[in, TransientLink#source])[_src]),Map#Elements($linkHeap[in, TransientLink#source])[_trg]),Map#Elements($linkHeap[in, TransientLink#source])[_c])), FSM$Transition.stateMachine) == getTarsBySrcs(Seq#Singleton(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_t1], HSM$Transition.stateMachine)));
ensures read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_t1]),Map#Elements($linkHeap[in, TransientLink#source])[_src]),Map#Elements($linkHeap[in, TransientLink#source])[_trg]),Map#Elements($linkHeap[in, TransientLink#source])[_c])), FSM$Transition.source) == getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_src]));
ensures read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_t1]),Map#Elements($linkHeap[in, TransientLink#source])[_src]),Map#Elements($linkHeap[in, TransientLink#source])[_trg]),Map#Elements($linkHeap[in, TransientLink#source])[_c])), FSM$Transition.target) == getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_c]));


// Frame 
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 4 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$Transition && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: HSM$AbstractState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 2)) <: HSM$CompositeState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 3)) <: HSM$InitialState && ( dtype($o) <: FSM$Transition && ($f == FSM$Transition.label || $f == FSM$Transition.stateMachine || $f == FSM$Transition.source || $f == FSM$Transition.target))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) && $o != getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_t1]),Map#Elements($linkHeap[in, TransientLink#source])[_src]),Map#Elements($linkHeap[in, TransientLink#source])[_trg]),Map#Elements($linkHeap[in, TransientLink#source])[_c])) ==> 
	(read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
  );
// Preserving
free ensures $HeapSucc(old($tarHeap), $tarHeap);
free ensures surj_tar_model($srcHeap, $tarHeap);



