procedure driver();
  modifies $tarHeap, $linkHeap;
  free requires valid_src_model($srcHeap);
  //unique_hsm_sm_names
    free requires (forall s1:ref,s2:ref :: // [null, null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$StateMachine), s1)&&Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$StateMachine), s2) ==>
  	     s1 != s2 ==> read( $srcHeap , s1, HSM$StateMachine.name) != read( $srcHeap , s2, HSM$StateMachine.name)
  	     )
  ;
  //unique_hsm_state_names
    free requires (forall s1:ref,s2:ref :: // [null, null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$AbstractState), s1)&&Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$AbstractState), s2) ==>
  	     s1 != s2 ==> read( $srcHeap , s1, HSM$AbstractState.name) != read( $srcHeap , s2, HSM$AbstractState.name)
  	     )
  ;
  //hsm_state_multi_lower
    free requires (forall s:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$AbstractState), s) ==>
  	     !((read( $srcHeap , s, HSM$AbstractState.stateMachine)==null || !read( $srcHeap , read( $srcHeap , s, HSM$AbstractState.stateMachine), alloc))))
  ;
  //hsm_state_multi_upper
    free requires (forall s:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$AbstractState), s) ==>
  	     (forall sm1:ref,sm2:ref :: // [null, null]
  	     	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$StateMachine), sm1)&&Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$StateMachine), sm2) ==>
  	     	     read( $srcHeap , s, HSM$AbstractState.stateMachine) == sm1  &&  read( $srcHeap , s, HSM$AbstractState.stateMachine) == sm2 ==> sm1 == sm2)
  	     )
  ;
  //hsm_transition_composite_upper
    free requires (forall c1:ref,c2:ref :: // [null, null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$AbstractState), c1)&&Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$AbstractState), c2) ==>
  	     dtype(c1) == HSM$CompositeState  &&  dtype(c2) == HSM$CompositeState ==> c1 == c2)
  ;
  //hsm_transition_multi_lower
    free requires (forall t:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$Transition), t) ==>
  	     !((read( $srcHeap , t, HSM$Transition.stateMachine)==null || !read( $srcHeap , read( $srcHeap , t, HSM$Transition.stateMachine), alloc))))
  ;
  //hsm_transition_multi_upper
    free requires (forall t:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$Transition), t) ==>
  	     (forall sm1:ref,sm2:ref :: // [null, null]
  	     	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$StateMachine), sm1)&&Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$StateMachine), sm2) ==>
  	     	     read( $srcHeap , t, HSM$Transition.stateMachine) == sm1  &&  read( $srcHeap , t, HSM$Transition.stateMachine) == sm2 ==> sm1 == sm2)
  	     )
  ;
  //hsm_transition_src_multi_lower
    free requires (forall t:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$Transition), t) ==>
  	     !((read( $srcHeap , t, HSM$Transition.source)==null || !read( $srcHeap , read( $srcHeap , t, HSM$Transition.source), alloc))))
  ;
  //hsm_transition_src_multi_upper
    free requires (forall t:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$Transition), t) ==>
  	     (forall s1:ref,s2:ref :: // [null, null]
  	     	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$AbstractState), s1)&&Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$AbstractState), s2) ==>
  	     	     read( $srcHeap , t, HSM$Transition.source) == s1  &&  read( $srcHeap , t, HSM$Transition.source) == s2 ==> s1 == s2)
  	     )
  ;
  //hsm_transition_trg_multi_lower
    free requires (forall t:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$Transition), t) ==>
  	     !((read( $srcHeap , t, HSM$Transition.target)==null || !read( $srcHeap , read( $srcHeap , t, HSM$Transition.target), alloc))))
  ;
  //hsm_transition_trg_multi_upper
    free requires (forall t:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$Transition), t) ==>
  	     (forall s1:ref,s2:ref :: // [null, null]
  	     	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$AbstractState), s1)&&Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$AbstractState), s2) ==>
  	     	     read( $srcHeap , t, HSM$Transition.target) == s1  &&  read( $srcHeap , t, HSM$Transition.target) == s2 ==> s1 == s2)
  	     )
  ;
  //hsm_transition_src_contain_sm
    free requires (forall t:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$Transition), t) ==>
  	     (forall s:ref :: // [null]
  	     	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$AbstractState), s) ==>
  	     	     read( $srcHeap , t, HSM$Transition.source) == s ==> (forall sm1:ref,sm2:ref :: // [null, null]
  	     	     	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$StateMachine), sm1)&&Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$StateMachine), sm2) ==>
  	     	     	     read( $srcHeap , t, HSM$Transition.stateMachine) == sm1  &&  read( $srcHeap , s, HSM$AbstractState.stateMachine) == sm2 ==> sm1 == sm2)
  	     	     )
  	     )
  ;
  //hsm_transition_trg_contain_sm
    free requires (forall t:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$Transition), t) ==>
  	     (forall s:ref :: // [null]
  	     	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$AbstractState), s) ==>
  	     	     read( $srcHeap , t, HSM$Transition.target) == s ==> (forall sm1:ref,sm2:ref :: // [null, null]
  	     	     	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$StateMachine), sm1)&&Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$StateMachine), sm2) ==>
  	     	     	     read( $srcHeap , t, HSM$Transition.stateMachine) == sm1  &&  read( $srcHeap , s, HSM$AbstractState.stateMachine) == sm2 ==> sm1 == sm2)
  	     	     )
  	     )
  ;
  //hsm_transition_contain_sm
    free requires (forall t:ref :: // [null]
  	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$Transition), t) ==>
  	     (forall s1:ref,s2:ref :: // [null, null]
  	     	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$AbstractState), s1)&&Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$AbstractState), s2) ==>
  	     	     read( $srcHeap , t, HSM$Transition.source) == s1  &&  read( $srcHeap , t, HSM$Transition.target) == s2 ==> (forall sm1:ref,sm2:ref :: // [null, null]
  	     	     	   Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$StateMachine), sm1)&&Seq#Contains(Fun#LIB#AllInstanceFrom( $srcHeap , HSM$StateMachine), sm2) ==>
  	     	     	     read( $srcHeap , s1, HSM$AbstractState.stateMachine) == sm1  &&  read( $srcHeap , s2, HSM$AbstractState.stateMachine) == sm2 ==> sm1 == sm2)
  	     	     )
  	     )
  ;
  