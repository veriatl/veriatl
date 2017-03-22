procedure RS2RS_applyAll() returns ();
  free requires surj_tar_model( $srcHeap ,  $tarHeap );
  free requires (forall  rs1: ref  ::
  	     rs1!=null && read( $srcHeap , rs1, alloc) && dtype(rs1) <: HSM$RegularState  ==>
  	      printGuard_RS2RS( $srcHeap ,  rs1 ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( rs1  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( rs1  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( rs1  )) ) <: FSM$RegularState)
  );
  modifies  $tarHeap ;
  // Rule Outcome
  free ensures (forall  rs1: ref  ::
     rs1!=null && read( $srcHeap , rs1, alloc) && dtype(rs1) <: HSM$RegularState  ==>
      printGuard_RS2RS( $srcHeap ,  rs1 ) ==> 
        //primitive : string
        read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( rs1  )) , FSM$AbstractState.name) == read( $srcHeap , rs1, HSM$AbstractState.name)
  ); 
  free ensures (forall  rs1: ref  ::
     rs1!=null && read( $srcHeap , rs1, alloc) && dtype(rs1) <: HSM$RegularState  ==>
      printGuard_RS2RS( $srcHeap ,  rs1 ) ==> 
        //srcRef : HSM$StateMachine
        read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( rs1  )) , FSM$AbstractState.stateMachine) == getTarsBySrcs(Seq#Singleton(read( $srcHeap , rs1, HSM$AbstractState.stateMachine)))
  ); 
  // Frame property
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha :: 
	  ( (dtype(__$o) <: FSM$RegularState  && (__$f == FSM$AbstractState.name  || __$f == FSM$AbstractState.stateMachine ) 
	   && (Seq#Length(getTarsBySrcs_inverse(__$o)) == 1 
	   && dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: HSM$RegularState 
	   && printGuard_RS2RS( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) ) ) 
	  
	    // not ideal frame cond, since using dtype to constraint $o is not very precise
	    || __$o == null
        || (read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f))
 	  )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
procedure IS2IS_applyAll() returns ();
  free requires surj_tar_model( $srcHeap ,  $tarHeap );
  free requires (forall  is1: ref  ::
  	     is1!=null && read( $srcHeap , is1, alloc) && dtype(is1) <: HSM$InitialState  ==>
  	      printGuard_IS2IS( $srcHeap ,  is1 ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( is1  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( is1  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( is1  )) ) <: FSM$InitialState)
  );
  modifies  $tarHeap ;
  // Rule Outcome
  free ensures (forall  is1: ref  ::
     is1!=null && read( $srcHeap , is1, alloc) && dtype(is1) <: HSM$InitialState  ==>
      printGuard_IS2IS( $srcHeap ,  is1 ) ==> 
        //srcRef : HSM$StateMachine
        read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( is1  )) , FSM$AbstractState.stateMachine) == getTarsBySrcs(Seq#Singleton(read( $srcHeap , is1, HSM$AbstractState.stateMachine)))
  ); 
  free ensures (forall  is1: ref  ::
     is1!=null && read( $srcHeap , is1, alloc) && dtype(is1) <: HSM$InitialState  ==>
      printGuard_IS2IS( $srcHeap ,  is1 ) ==> 
        //primitive : string
        read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( is1  )) , FSM$AbstractState.name) == read( $srcHeap , is1, HSM$AbstractState.name)
  ); 
  // Frame property
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha :: 
	  ( (dtype(__$o) <: FSM$InitialState  && (__$f == FSM$AbstractState.stateMachine  || __$f == FSM$AbstractState.name ) 
	   && (Seq#Length(getTarsBySrcs_inverse(__$o)) == 1 
	   && dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: HSM$InitialState 
	   && printGuard_IS2IS( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) ) ) 
	  
	    // not ideal frame cond, since using dtype to constraint $o is not very precise
	    || __$o == null
        || (read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f))
 	  )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
procedure IS2RS_applyAll() returns ();
  free requires surj_tar_model( $srcHeap ,  $tarHeap );
  free requires (forall  is1: ref  ::
  	     is1!=null && read( $srcHeap , is1, alloc) && dtype(is1) <: HSM$InitialState  ==>
  	      printGuard_IS2RS( $srcHeap ,  is1 ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( is1  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( is1  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( is1  )) ) <: FSM$RegularState)
  );
  modifies  $tarHeap ;
  // Rule Outcome
  free ensures (forall  is1: ref  ::
     is1!=null && read( $srcHeap , is1, alloc) && dtype(is1) <: HSM$InitialState  ==>
      printGuard_IS2RS( $srcHeap ,  is1 ) ==> 
        //srcRef : HSM$StateMachine
        read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( is1  )) , FSM$AbstractState.stateMachine) == getTarsBySrcs(Seq#Singleton(read( $srcHeap , is1, HSM$AbstractState.stateMachine)))
  ); 
  free ensures (forall  is1: ref  ::
     is1!=null && read( $srcHeap , is1, alloc) && dtype(is1) <: HSM$InitialState  ==>
      printGuard_IS2RS( $srcHeap ,  is1 ) ==> 
        //primitive : string
        read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( is1  )) , FSM$AbstractState.name) == read( $srcHeap , is1, HSM$AbstractState.name)
  ); 
  // Frame property
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha :: 
	  ( (dtype(__$o) <: FSM$RegularState  && (__$f == FSM$AbstractState.stateMachine  || __$f == FSM$AbstractState.name ) 
	   && (Seq#Length(getTarsBySrcs_inverse(__$o)) == 1 
	   && dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: HSM$InitialState 
	   && printGuard_IS2RS( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) ) ) 
	  
	    // not ideal frame cond, since using dtype to constraint $o is not very precise
	    || __$o == null
        || (read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f))
 	  )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
procedure T2TA_applyAll() returns ();
  free requires surj_tar_model( $srcHeap ,  $tarHeap );
  free requires (forall  t1: ref  ::
  	     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  ==>
  	      printGuard_T2TA( $srcHeap ,  t1 ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( t1  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( t1  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( t1  )) ) <: FSM$Transition)
  );
  modifies  $tarHeap ;
  // Rule Outcome
  free ensures (forall  t1: ref  ::
     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  ==>
      printGuard_T2TA( $srcHeap ,  t1 ) ==> 
        //primitive : string
        read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( t1  )) , FSM$Transition.label) == read( $srcHeap , t1, HSM$Transition.label)
  ); 
  free ensures (forall  t1: ref  ::
     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  ==>
      printGuard_T2TA( $srcHeap ,  t1 ) ==> 
        //srcRef : HSM$StateMachine
        read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( t1  )) , FSM$Transition.stateMachine) == getTarsBySrcs(Seq#Singleton(read( $srcHeap , t1, HSM$Transition.stateMachine)))
  ); 
  free ensures (forall  t1: ref  ::
     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  ==>
      printGuard_T2TA( $srcHeap ,  t1 ) ==> 
        //srcRef : HSM$AbstractState
        read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( t1  )) , FSM$Transition.source) == getTarsBySrcs(Seq#Singleton(read( $srcHeap , t1, HSM$Transition.source)))
  ); 
  free ensures (forall  t1: ref  ::
     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  ==>
      printGuard_T2TA( $srcHeap ,  t1 ) ==> 
        //srcRef : HSM$AbstractState
        read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( t1  )) , FSM$Transition.target) == getTarsBySrcs(Seq#Singleton(read( $srcHeap , t1, HSM$Transition.target)))
  ); 
  // Frame property
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha :: 
	  ( (dtype(__$o) <: FSM$Transition  && (__$f == FSM$Transition.label  || __$f == FSM$Transition.stateMachine  || __$f == FSM$Transition.source  || __$f == FSM$Transition.target ) 
	   && (Seq#Length(getTarsBySrcs_inverse(__$o)) == 1 
	   && dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: HSM$Transition 
	   && printGuard_T2TA( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) ) ) 
	  
	    // not ideal frame cond, since using dtype to constraint $o is not very precise
	    || __$o == null
        || (read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f))
 	  )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
procedure T2TB_applyAll() returns ();
  free requires surj_tar_model( $srcHeap ,  $tarHeap );
  free requires (forall  t1: ref , src: ref , trg: ref , c: ref  ::
  	     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  &&  src!=null && read( $srcHeap , src, alloc) && dtype(src) <: HSM$CompositeState  &&  trg!=null && read( $srcHeap , trg, alloc) && dtype(trg) <: HSM$AbstractState  &&  c!=null && read( $srcHeap , c, alloc) && dtype(c) <: HSM$AbstractState  ==>
  	      printGuard_T2TB( $srcHeap ,  t1 , src , trg , c ) ==> 
  	        (    getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) ) <: FSM$Transition)
  );
  modifies  $tarHeap ;
  // Rule Outcome
  free ensures (forall  t1: ref , src: ref , trg: ref , c: ref  ::
     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  &&  src!=null && read( $srcHeap , src, alloc) && dtype(src) <: HSM$CompositeState  &&  trg!=null && read( $srcHeap , trg, alloc) && dtype(trg) <: HSM$AbstractState  &&  c!=null && read( $srcHeap , c, alloc) && dtype(c) <: HSM$AbstractState  ==>
      printGuard_T2TB( $srcHeap ,  t1 , src , trg , c ) ==> 
        //primitive : string
        read( $tarHeap ,  getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) , FSM$Transition.label) == read( $srcHeap , t1, HSM$Transition.label)
  ); 
  free ensures (forall  t1: ref , src: ref , trg: ref , c: ref  ::
     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  &&  src!=null && read( $srcHeap , src, alloc) && dtype(src) <: HSM$CompositeState  &&  trg!=null && read( $srcHeap , trg, alloc) && dtype(trg) <: HSM$AbstractState  &&  c!=null && read( $srcHeap , c, alloc) && dtype(c) <: HSM$AbstractState  ==>
      printGuard_T2TB( $srcHeap ,  t1 , src , trg , c ) ==> 
        //srcRef : HSM$StateMachine
        read( $tarHeap ,  getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) , FSM$Transition.stateMachine) == getTarsBySrcs(Seq#Singleton(read( $srcHeap , t1, HSM$Transition.stateMachine)))
  ); 
  free ensures (forall  t1: ref , src: ref , trg: ref , c: ref  ::
     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  &&  src!=null && read( $srcHeap , src, alloc) && dtype(src) <: HSM$CompositeState  &&  trg!=null && read( $srcHeap , trg, alloc) && dtype(trg) <: HSM$AbstractState  &&  c!=null && read( $srcHeap , c, alloc) && dtype(c) <: HSM$AbstractState  ==>
      printGuard_T2TB( $srcHeap ,  t1 , src , trg , c ) ==> 
        //srcRef : HSM$AbstractState
        read( $tarHeap ,  getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) , FSM$Transition.source) == getTarsBySrcs(Seq#Singleton(c))
  ); 
  free ensures (forall  t1: ref , src: ref , trg: ref , c: ref  ::
     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  &&  src!=null && read( $srcHeap , src, alloc) && dtype(src) <: HSM$CompositeState  &&  trg!=null && read( $srcHeap , trg, alloc) && dtype(trg) <: HSM$AbstractState  &&  c!=null && read( $srcHeap , c, alloc) && dtype(c) <: HSM$AbstractState  ==>
      printGuard_T2TB( $srcHeap ,  t1 , src , trg , c ) ==> 
        //srcRef : HSM$AbstractState
        read( $tarHeap ,  getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) , FSM$Transition.target) == getTarsBySrcs(Seq#Singleton(trg))
  ); 
  // Frame property
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha :: 
	  ( (dtype(__$o) <: FSM$Transition  && (__$f == FSM$Transition.label  || __$f == FSM$Transition.stateMachine  || __$f == FSM$Transition.source  || __$f == FSM$Transition.target ) 
	   && (Seq#Length(getTarsBySrcs_inverse(__$o)) == 4 
	   && dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: HSM$Transition  && dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 1)) <: HSM$CompositeState  && dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 2)) <: HSM$AbstractState  && dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 3)) <: HSM$AbstractState 
	   && printGuard_T2TB( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0),Seq#Index(getTarsBySrcs_inverse(__$o), 1),Seq#Index(getTarsBySrcs_inverse(__$o), 2),Seq#Index(getTarsBySrcs_inverse(__$o), 3)) ) ) 
	  
	    // not ideal frame cond, since using dtype to constraint $o is not very precise
	    || __$o == null
        || (read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f))
 	  )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
procedure T2TC_applyAll() returns ();
  free requires surj_tar_model( $srcHeap ,  $tarHeap );
  free requires (forall  t1: ref , src: ref , trg: ref , c: ref  ::
  	     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  &&  src!=null && read( $srcHeap , src, alloc) && dtype(src) <: HSM$AbstractState  &&  trg!=null && read( $srcHeap , trg, alloc) && dtype(trg) <: HSM$CompositeState  &&  c!=null && read( $srcHeap , c, alloc) && dtype(c) <: HSM$InitialState  ==>
  	      printGuard_T2TC( $srcHeap ,  t1 , src , trg , c ) ==> 
  	        (    getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) ) <: FSM$Transition)
  );
  modifies  $tarHeap ;
  // Rule Outcome
  free ensures (forall  t1: ref , src: ref , trg: ref , c: ref  ::
     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  &&  src!=null && read( $srcHeap , src, alloc) && dtype(src) <: HSM$AbstractState  &&  trg!=null && read( $srcHeap , trg, alloc) && dtype(trg) <: HSM$CompositeState  &&  c!=null && read( $srcHeap , c, alloc) && dtype(c) <: HSM$InitialState  ==>
      printGuard_T2TC( $srcHeap ,  t1 , src , trg , c ) ==> 
        //primitive : string
        read( $tarHeap ,  getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) , FSM$Transition.label) == read( $srcHeap , t1, HSM$Transition.label)
  ); 
  free ensures (forall  t1: ref , src: ref , trg: ref , c: ref  ::
     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  &&  src!=null && read( $srcHeap , src, alloc) && dtype(src) <: HSM$AbstractState  &&  trg!=null && read( $srcHeap , trg, alloc) && dtype(trg) <: HSM$CompositeState  &&  c!=null && read( $srcHeap , c, alloc) && dtype(c) <: HSM$InitialState  ==>
      printGuard_T2TC( $srcHeap ,  t1 , src , trg , c ) ==> 
        //srcRef : HSM$StateMachine
        read( $tarHeap ,  getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) , FSM$Transition.stateMachine) == getTarsBySrcs(Seq#Singleton(read( $srcHeap , t1, HSM$Transition.stateMachine)))
  ); 
  free ensures (forall  t1: ref , src: ref , trg: ref , c: ref  ::
     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  &&  src!=null && read( $srcHeap , src, alloc) && dtype(src) <: HSM$AbstractState  &&  trg!=null && read( $srcHeap , trg, alloc) && dtype(trg) <: HSM$CompositeState  &&  c!=null && read( $srcHeap , c, alloc) && dtype(c) <: HSM$InitialState  ==>
      printGuard_T2TC( $srcHeap ,  t1 , src , trg , c ) ==> 
        //srcRef : HSM$AbstractState
        read( $tarHeap ,  getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) , FSM$Transition.source) == getTarsBySrcs(Seq#Singleton(src))
  ); 
  free ensures (forall  t1: ref , src: ref , trg: ref , c: ref  ::
     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  &&  src!=null && read( $srcHeap , src, alloc) && dtype(src) <: HSM$AbstractState  &&  trg!=null && read( $srcHeap , trg, alloc) && dtype(trg) <: HSM$CompositeState  &&  c!=null && read( $srcHeap , c, alloc) && dtype(c) <: HSM$InitialState  ==>
      printGuard_T2TC( $srcHeap ,  t1 , src , trg , c ) ==> 
        //srcRef : HSM$InitialState
        read( $tarHeap ,  getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) , FSM$Transition.target) == getTarsBySrcs(Seq#Singleton(c))
  ); 
  // Frame property
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha :: 
	  ( (dtype(__$o) <: FSM$Transition  && (__$f == FSM$Transition.label  || __$f == FSM$Transition.stateMachine  || __$f == FSM$Transition.source  || __$f == FSM$Transition.target ) 
	   && (Seq#Length(getTarsBySrcs_inverse(__$o)) == 4 
	   && dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: HSM$Transition  && dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 1)) <: HSM$AbstractState  && dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 2)) <: HSM$CompositeState  && dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 3)) <: HSM$InitialState 
	   && printGuard_T2TC( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0),Seq#Index(getTarsBySrcs_inverse(__$o), 1),Seq#Index(getTarsBySrcs_inverse(__$o), 2),Seq#Index(getTarsBySrcs_inverse(__$o), 3)) ) ) 
	  
	    // not ideal frame cond, since using dtype to constraint $o is not very precise
	    || __$o == null
        || (read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f))
 	  )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
