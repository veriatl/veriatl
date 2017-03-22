// Eval: 
// calculate module depth : 1

procedure init_tar_model();
  modifies $tarHeap;
  free ensures  (forall $o: ref :: $o == null || !read($tarHeap, $o, alloc));

procedure SM2SM_matchAll() returns ();
  // detect rule conflict
  free requires (forall  sm1: ref  ::
     sm1!=null && read( $srcHeap , sm1, alloc) && dtype(sm1) <: HSM$StateMachine  ==>
      printGuard_SM2SM( $srcHeap ,  sm1 ) ==> 
        (  getTarsBySrcs(Seq#Singleton( sm1  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( sm1  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  sm1: ref  ::
  	     sm1!=null && read( $srcHeap , sm1, alloc) && dtype(sm1) <: HSM$StateMachine  ==>
  	      printGuard_SM2SM( $srcHeap ,  sm1 ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( sm1  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( sm1  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( sm1  )) ) <: FSM$StateMachine)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: FSM$StateMachine && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: HSM$StateMachine
  		&& printGuard_SM2SM( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_SM2SM( __$hp : HeapType,  sm1: ref ): bool
  { 
  	true
  }  
  
procedure RS2RS_matchAll() returns ();
  // detect rule conflict
  free requires (forall  rs1: ref  ::
     rs1!=null && read( $srcHeap , rs1, alloc) && dtype(rs1) <: HSM$RegularState  ==>
      printGuard_RS2RS( $srcHeap ,  rs1 ) ==> 
        (  getTarsBySrcs(Seq#Singleton( rs1  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( rs1  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  rs1: ref  ::
  	     rs1!=null && read( $srcHeap , rs1, alloc) && dtype(rs1) <: HSM$RegularState  ==>
  	      printGuard_RS2RS( $srcHeap ,  rs1 ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( rs1  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( rs1  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( rs1  )) ) <: FSM$RegularState)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: FSM$RegularState && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: HSM$RegularState
  		&& printGuard_RS2RS( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_RS2RS( __$hp : HeapType,  rs1: ref ): bool
  { 
  	true
  }  
  
procedure IS2IS_matchAll() returns ();
  // detect rule conflict
  free requires (forall  is1: ref  ::
     is1!=null && read( $srcHeap , is1, alloc) && dtype(is1) <: HSM$InitialState  ==>
      printGuard_IS2IS( $srcHeap ,  is1 ) ==> 
        (  getTarsBySrcs(Seq#Singleton( is1  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( is1  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  is1: ref  ::
  	     is1!=null && read( $srcHeap , is1, alloc) && dtype(is1) <: HSM$InitialState  ==>
  	      printGuard_IS2IS( $srcHeap ,  is1 ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( is1  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( is1  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( is1  )) ) <: FSM$InitialState)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: FSM$InitialState && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: HSM$InitialState
  		&& printGuard_IS2IS( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_IS2IS( __$hp : HeapType,  is1: ref ): bool
  { 
  	(read( __$hp , is1, HSM$AbstractState.compositeState)==null || !read( __$hp , read( __$hp , is1, HSM$AbstractState.compositeState), alloc))
  }  
  
procedure IS2RS_matchAll() returns ();
  // detect rule conflict
  free requires (forall  is1: ref  ::
     is1!=null && read( $srcHeap , is1, alloc) && dtype(is1) <: HSM$InitialState  ==>
      printGuard_IS2RS( $srcHeap ,  is1 ) ==> 
        (  getTarsBySrcs(Seq#Singleton( is1  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( is1  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  is1: ref  ::
  	     is1!=null && read( $srcHeap , is1, alloc) && dtype(is1) <: HSM$InitialState  ==>
  	      printGuard_IS2RS( $srcHeap ,  is1 ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( is1  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( is1  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( is1  )) ) <: FSM$RegularState)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: FSM$RegularState && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: HSM$InitialState
  		&& printGuard_IS2RS( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_IS2RS( __$hp : HeapType,  is1: ref ): bool
  { 
  	!((read( __$hp , is1, HSM$AbstractState.compositeState)==null || !read( __$hp , read( __$hp , is1, HSM$AbstractState.compositeState), alloc)))
  }  
  
procedure CS2RS_matchAll() returns ();
  // detect rule conflict
  free requires (forall  rs1: ref  ::
     rs1!=null && read( $srcHeap , rs1, alloc) && dtype(rs1) <: HSM$CompositeState  ==>
      printGuard_CS2RS( $srcHeap ,  rs1 ) ==> 
        (  getTarsBySrcs(Seq#Singleton( rs1  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( rs1  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  rs1: ref  ::
  	     rs1!=null && read( $srcHeap , rs1, alloc) && dtype(rs1) <: HSM$CompositeState  ==>
  	      printGuard_CS2RS( $srcHeap ,  rs1 ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( rs1  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( rs1  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( rs1  )) ) <: FSM$RegularState)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: FSM$RegularState && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: HSM$CompositeState
  		&& printGuard_CS2RS( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CS2RS( __$hp : HeapType,  rs1: ref ): bool
  { 
  	true
  }  
  
procedure T2TA_matchAll() returns ();
  // detect rule conflict
  free requires (forall  t1: ref  ::
     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  ==>
      printGuard_T2TA( $srcHeap ,  t1 ) ==> 
        (  getTarsBySrcs(Seq#Singleton( t1  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( t1  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  t1: ref  ::
  	     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  ==>
  	      printGuard_T2TA( $srcHeap ,  t1 ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( t1  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( t1  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( t1  )) ) <: FSM$Transition)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: FSM$Transition && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: HSM$Transition
  		&& printGuard_T2TA( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_T2TA( __$hp : HeapType,  t1: ref ): bool
  { 
  	!(dtype(read( __$hp , t1, HSM$Transition.source)) == HSM$CompositeState)  &&  !(dtype(read( __$hp , t1, HSM$Transition.target)) == HSM$CompositeState)
  }  
  
procedure T2TB_matchAll() returns ();
  // detect rule conflict
  free requires (forall  t1: ref , src: ref , trg: ref , c: ref  ::
     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  &&  src!=null && read( $srcHeap , src, alloc) && dtype(src) <: HSM$CompositeState  &&  trg!=null && read( $srcHeap , trg, alloc) && dtype(trg) <: HSM$AbstractState  &&  c!=null && read( $srcHeap , c, alloc) && dtype(c) <: HSM$AbstractState  ==>
      printGuard_T2TB( $srcHeap ,  t1 , src , trg , c ) ==> 
        (  getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  t1: ref , src: ref , trg: ref , c: ref  ::
  	     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  &&  src!=null && read( $srcHeap , src, alloc) && dtype(src) <: HSM$CompositeState  &&  trg!=null && read( $srcHeap , trg, alloc) && dtype(trg) <: HSM$AbstractState  &&  c!=null && read( $srcHeap , c, alloc) && dtype(c) <: HSM$AbstractState  ==>
  	      printGuard_T2TB( $srcHeap ,  t1 , src , trg , c ) ==> 
  	        (    getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) ) <: FSM$Transition)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: FSM$Transition && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==4
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: HSM$Transition && dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 1)) <: HSM$CompositeState && dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 2)) <: HSM$AbstractState && dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 3)) <: HSM$AbstractState
  		&& printGuard_T2TB( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0),Seq#Index(getTarsBySrcs_inverse(__$o), 1),Seq#Index(getTarsBySrcs_inverse(__$o), 2),Seq#Index(getTarsBySrcs_inverse(__$o), 3)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_T2TB( __$hp : HeapType,  t1: ref , src: ref , trg: ref , c: ref ): bool
  { 
  	!(c == src)  &&  read( __$hp , t1, HSM$Transition.source) == src  &&  read( __$hp , t1, HSM$Transition.target) == trg  &&  read( __$hp , c, HSM$AbstractState.compositeState) == src  &&  !(dtype(trg) == HSM$CompositeState)
  }  
  
procedure T2TC_matchAll() returns ();
  // detect rule conflict
  free requires (forall  t1: ref , src: ref , trg: ref , c: ref  ::
     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  &&  src!=null && read( $srcHeap , src, alloc) && dtype(src) <: HSM$AbstractState  &&  trg!=null && read( $srcHeap , trg, alloc) && dtype(trg) <: HSM$CompositeState  &&  c!=null && read( $srcHeap , c, alloc) && dtype(c) <: HSM$InitialState  ==>
      printGuard_T2TC( $srcHeap ,  t1 , src , trg , c ) ==> 
        (  getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  t1: ref , src: ref , trg: ref , c: ref  ::
  	     t1!=null && read( $srcHeap , t1, alloc) && dtype(t1) <: HSM$Transition  &&  src!=null && read( $srcHeap , src, alloc) && dtype(src) <: HSM$AbstractState  &&  trg!=null && read( $srcHeap , trg, alloc) && dtype(trg) <: HSM$CompositeState  &&  c!=null && read( $srcHeap , c, alloc) && dtype(c) <: HSM$InitialState  ==>
  	      printGuard_T2TC( $srcHeap ,  t1 , src , trg , c ) ==> 
  	        (    getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  )) ) <: FSM$Transition)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: FSM$Transition && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==4
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: HSM$Transition && dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 1)) <: HSM$AbstractState && dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 2)) <: HSM$CompositeState && dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 3)) <: HSM$InitialState
  		&& printGuard_T2TC( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0),Seq#Index(getTarsBySrcs_inverse(__$o), 1),Seq#Index(getTarsBySrcs_inverse(__$o), 2),Seq#Index(getTarsBySrcs_inverse(__$o), 3)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_T2TC( __$hp : HeapType,  t1: ref , src: ref , trg: ref , c: ref ): bool
  { 
  	read( __$hp , t1, HSM$Transition.source) == src  &&  read( __$hp , t1, HSM$Transition.target) == trg  &&  read( __$hp , c, HSM$AbstractState.compositeState) == trg  &&  !(dtype(src) == HSM$CompositeState)
  }  
  
