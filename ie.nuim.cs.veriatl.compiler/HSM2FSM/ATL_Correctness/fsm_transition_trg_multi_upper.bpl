procedure driver();
modifies $tarHeap, $linkHeap;
requires valid_src_model($srcHeap);

requires  
(

forall s1,s2:ref :: {read($srcHeap,s1,alloc),read($srcHeap,s2,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$StateMachine), s1) && Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$StateMachine), s2)
     ==> s1 != s2 ==> read($srcHeap, s1, HSM$StateMachine.name) != read($srcHeap, s2, HSM$StateMachine.name)
  
) 
;

requires  
(

forall s1,s2:ref :: {read($srcHeap,s1,alloc),read($srcHeap,s2,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$AbstractState), s1) && Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$AbstractState), s2)
     ==> s1 != s2 ==> read($srcHeap, s1, HSM$AbstractState.name) != read($srcHeap, s2, HSM$AbstractState.name)
  
) 
;

requires  
(

forall s:ref :: {read($srcHeap,s,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$AbstractState), s)
     ==> !((read($srcHeap, s, HSM$AbstractState.stateMachine)==null || !read($srcHeap,read($srcHeap, s, HSM$AbstractState.stateMachine),alloc)))
  
) 
;

requires  
(

forall s:ref :: {read($srcHeap,s,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$AbstractState), s)
     ==> 
(

forall sm1,sm2:ref :: {read($srcHeap,sm1,alloc),read($srcHeap,sm2,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$StateMachine), sm1) && Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$StateMachine), sm2)
     ==> read($srcHeap, s, HSM$AbstractState.stateMachine) == sm1 && read($srcHeap, s, HSM$AbstractState.stateMachine) == sm2 ==> sm1 == sm2
  
) 

  
) 
;

requires  
(

forall c1,c2:ref :: {read($srcHeap,c1,alloc),read($srcHeap,c2,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$AbstractState), c1) && Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$AbstractState), c2)
     ==> dtype(c1) == HSM$CompositeState && dtype(c2) == HSM$CompositeState ==> c1 == c2
  
) 
;

requires  
(

forall t:ref :: {read($srcHeap,t,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$Transition), t)
     ==> !((read($srcHeap, t, HSM$Transition.stateMachine)==null || !read($srcHeap,read($srcHeap, t, HSM$Transition.stateMachine),alloc)))
  
) 
;

requires  
(

forall t:ref :: {read($srcHeap,t,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$Transition), t)
     ==> 
(

forall sm1,sm2:ref :: {read($srcHeap,sm1,alloc),read($srcHeap,sm2,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$StateMachine), sm1) && Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$StateMachine), sm2)
     ==> read($srcHeap, t, HSM$Transition.stateMachine) == sm1 && read($srcHeap, t, HSM$Transition.stateMachine) == sm2 ==> sm1 == sm2
  
) 

  
) 
;

requires  
(

forall t:ref :: {read($srcHeap,t,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$Transition), t)
     ==> !((read($srcHeap, t, HSM$Transition.source)==null || !read($srcHeap,read($srcHeap, t, HSM$Transition.source),alloc)))
  
) 
;

requires  
(

forall t:ref :: {read($srcHeap,t,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$Transition), t)
     ==> 
(

forall s1,s2:ref :: {read($srcHeap,s1,alloc),read($srcHeap,s2,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$AbstractState), s1) && Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$AbstractState), s2)
     ==> read($srcHeap, t, HSM$Transition.source) == s1 && read($srcHeap, t, HSM$Transition.source) == s2 ==> s1 == s2
  
) 

  
) 
;

requires  
(

forall t:ref :: {read($srcHeap,t,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$Transition), t)
     ==> !((read($srcHeap, t, HSM$Transition.target)==null || !read($srcHeap,read($srcHeap, t, HSM$Transition.target),alloc)))
  
) 
;

requires  
(

forall t:ref :: {read($srcHeap,t,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$Transition), t)
     ==> 
(

forall s1,s2:ref :: {read($srcHeap,s1,alloc),read($srcHeap,s2,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$AbstractState), s1) && Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$AbstractState), s2)
     ==> read($srcHeap, t, HSM$Transition.target) == s1 && read($srcHeap, t, HSM$Transition.target) == s2 ==> s1 == s2
  
) 

  
) 
;

requires  
(

forall t:ref :: {read($srcHeap,t,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$Transition), t)
     ==> 
(

forall s:ref :: {read($srcHeap,s,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$AbstractState), s)
     ==> read($srcHeap, t, HSM$Transition.source) == s ==> 
(

forall sm1,sm2:ref :: {read($srcHeap,sm1,alloc),read($srcHeap,sm2,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$StateMachine), sm1) && Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$StateMachine), sm2)
     ==> read($srcHeap, t, HSM$Transition.stateMachine) == sm1 && read($srcHeap, s, HSM$AbstractState.stateMachine) == sm2 ==> sm1 == sm2
  
) 

  
) 

  
) 
;

requires  
(

forall t:ref :: {read($srcHeap,t,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$Transition), t)
     ==> 
(

forall s:ref :: {read($srcHeap,s,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$AbstractState), s)
     ==> read($srcHeap, t, HSM$Transition.target) == s ==> 
(

forall sm1,sm2:ref :: {read($srcHeap,sm1,alloc),read($srcHeap,sm2,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$StateMachine), sm1) && Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$StateMachine), sm2)
     ==> read($srcHeap, t, HSM$Transition.stateMachine) == sm1 && read($srcHeap, s, HSM$AbstractState.stateMachine) == sm2 ==> sm1 == sm2
  
) 

  
) 

  
) 
;

requires  
(

forall t:ref :: {read($srcHeap,t,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$Transition), t)
     ==> 
(

forall s1,s2:ref :: {read($srcHeap,s1,alloc),read($srcHeap,s2,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$AbstractState), s1) && Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$AbstractState), s2)
     ==> read($srcHeap, t, HSM$Transition.source) == s1 && read($srcHeap, t, HSM$Transition.target) == s2 ==> 
(

forall sm1,sm2:ref :: {read($srcHeap,sm1,alloc),read($srcHeap,sm2,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$StateMachine), sm1) && Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, HSM$StateMachine), sm2)
     ==> read($srcHeap, s1, HSM$AbstractState.stateMachine) == sm1 && read($srcHeap, s2, HSM$AbstractState.stateMachine) == sm2 ==> sm1 == sm2
  
) 

  
) 

  
) 
;




























ensures  
(

forall t:ref :: {read($tarHeap,t,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$Transition), t)
     ==> 
(

forall s1,s2:ref :: {read($tarHeap,s1,alloc),read($tarHeap,s2,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), s1) && Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), s2)
     ==> read($tarHeap, t, FSM$Transition.target) == s1 && read($tarHeap, t, FSM$Transition.target) == s2 ==> s1 == s2
  
) 

  
) 
;

