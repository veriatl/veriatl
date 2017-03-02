// Eval: 
// calculate module depth : 1

procedure init_tar_model();
  modifies $tarHeap;
  free ensures  (forall $o: ref :: $o == null || !read($tarHeap, $o, alloc));

procedure CopyAbstraction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Abstraction  ==>
      printGuard_CopyAbstraction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Abstraction  ==>
  	      printGuard_CopyAbstraction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Abstraction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Abstraction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Abstraction
  		&& printGuard_CopyAbstraction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyAbstraction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Abstraction
  }  
  
procedure CopyAcceptCallAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$AcceptCallAction  ==>
      printGuard_CopyAcceptCallAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$AcceptCallAction  ==>
  	      printGuard_CopyAcceptCallAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$AcceptCallAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$AcceptCallAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$AcceptCallAction
  		&& printGuard_CopyAcceptCallAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyAcceptCallAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$AcceptCallAction
  }  
  
procedure CopyAcceptEventAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$AcceptEventAction  ==>
      printGuard_CopyAcceptEventAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$AcceptEventAction  ==>
  	      printGuard_CopyAcceptEventAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$AcceptEventAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$AcceptEventAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$AcceptEventAction
  		&& printGuard_CopyAcceptEventAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyAcceptEventAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$AcceptEventAction
  }  
  
procedure CopyActionExecutionSpecification_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ActionExecutionSpecification  ==>
      printGuard_CopyActionExecutionSpecification( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ActionExecutionSpecification  ==>
  	      printGuard_CopyActionExecutionSpecification( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ActionExecutionSpecification)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ActionExecutionSpecification && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ActionExecutionSpecification
  		&& printGuard_CopyActionExecutionSpecification( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyActionExecutionSpecification( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ActionExecutionSpecification
  }  
  
procedure CopyActionInputPin_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ActionInputPin  ==>
      printGuard_CopyActionInputPin( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ActionInputPin  ==>
  	      printGuard_CopyActionInputPin( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ActionInputPin)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ActionInputPin && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ActionInputPin
  		&& printGuard_CopyActionInputPin( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyActionInputPin( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ActionInputPin
  }  
  
procedure CopyActivity_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Activity  ==>
      printGuard_CopyActivity( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Activity  ==>
  	      printGuard_CopyActivity( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Activity)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Activity && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Activity
  		&& printGuard_CopyActivity( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyActivity( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Activity
  }  
  
procedure CopyActivityFinalNode_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ActivityFinalNode  ==>
      printGuard_CopyActivityFinalNode( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ActivityFinalNode  ==>
  	      printGuard_CopyActivityFinalNode( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ActivityFinalNode)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ActivityFinalNode && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ActivityFinalNode
  		&& printGuard_CopyActivityFinalNode( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyActivityFinalNode( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ActivityFinalNode
  }  
  
procedure CopyActivityParameterNode_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ActivityParameterNode  ==>
      printGuard_CopyActivityParameterNode( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ActivityParameterNode  ==>
  	      printGuard_CopyActivityParameterNode( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ActivityParameterNode)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ActivityParameterNode && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ActivityParameterNode
  		&& printGuard_CopyActivityParameterNode( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyActivityParameterNode( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ActivityParameterNode
  }  
  
procedure CopyActivityPartition_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ActivityPartition  ==>
      printGuard_CopyActivityPartition( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ActivityPartition  ==>
  	      printGuard_CopyActivityPartition( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ActivityPartition)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ActivityPartition && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ActivityPartition
  		&& printGuard_CopyActivityPartition( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyActivityPartition( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ActivityPartition
  }  
  
procedure CopyActor_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Actor  ==>
      printGuard_CopyActor( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Actor  ==>
  	      printGuard_CopyActor( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Actor)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Actor && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Actor
  		&& printGuard_CopyActor( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyActor( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Actor
  }  
  
procedure CopyAddStructuralFeatureValueAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$AddStructuralFeatureValueAction  ==>
      printGuard_CopyAddStructuralFeatureValueAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$AddStructuralFeatureValueAction  ==>
  	      printGuard_CopyAddStructuralFeatureValueAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$AddStructuralFeatureValueAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$AddStructuralFeatureValueAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$AddStructuralFeatureValueAction
  		&& printGuard_CopyAddStructuralFeatureValueAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyAddStructuralFeatureValueAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$AddStructuralFeatureValueAction
  }  
  
procedure CopyAddVariableValueAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$AddVariableValueAction  ==>
      printGuard_CopyAddVariableValueAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$AddVariableValueAction  ==>
  	      printGuard_CopyAddVariableValueAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$AddVariableValueAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$AddVariableValueAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$AddVariableValueAction
  		&& printGuard_CopyAddVariableValueAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyAddVariableValueAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$AddVariableValueAction
  }  
  
procedure CopyAnyReceiveEvent_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$AnyReceiveEvent  ==>
      printGuard_CopyAnyReceiveEvent( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$AnyReceiveEvent  ==>
  	      printGuard_CopyAnyReceiveEvent( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$AnyReceiveEvent)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$AnyReceiveEvent && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$AnyReceiveEvent
  		&& printGuard_CopyAnyReceiveEvent( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyAnyReceiveEvent( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$AnyReceiveEvent
  }  
  
procedure CopyArtifact_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Artifact  ==>
      printGuard_CopyArtifact( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Artifact  ==>
  	      printGuard_CopyArtifact( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Artifact)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Artifact && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Artifact
  		&& printGuard_CopyArtifact( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyArtifact( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Artifact
  }  
  
procedure CopyAssociation_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Association  ==>
      printGuard_CopyAssociation( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Association  ==>
  	      printGuard_CopyAssociation( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Association)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Association && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Association
  		&& printGuard_CopyAssociation( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyAssociation( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Association
  }  
  
procedure CopyAssociationClass_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$AssociationClass  ==>
      printGuard_CopyAssociationClass( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$AssociationClass  ==>
  	      printGuard_CopyAssociationClass( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$AssociationClass)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$AssociationClass && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$AssociationClass
  		&& printGuard_CopyAssociationClass( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyAssociationClass( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$AssociationClass
  }  
  
procedure CopyBehaviorExecutionSpecification_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$BehaviorExecutionSpecification  ==>
      printGuard_CopyBehaviorExecutionSpecification( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$BehaviorExecutionSpecification  ==>
  	      printGuard_CopyBehaviorExecutionSpecification( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$BehaviorExecutionSpecification)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$BehaviorExecutionSpecification && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$BehaviorExecutionSpecification
  		&& printGuard_CopyBehaviorExecutionSpecification( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyBehaviorExecutionSpecification( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$BehaviorExecutionSpecification
  }  
  
procedure CopyBroadcastSignalAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$BroadcastSignalAction  ==>
      printGuard_CopyBroadcastSignalAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$BroadcastSignalAction  ==>
  	      printGuard_CopyBroadcastSignalAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$BroadcastSignalAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$BroadcastSignalAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$BroadcastSignalAction
  		&& printGuard_CopyBroadcastSignalAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyBroadcastSignalAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$BroadcastSignalAction
  }  
  
procedure CopyCallBehaviorAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CallBehaviorAction  ==>
      printGuard_CopyCallBehaviorAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CallBehaviorAction  ==>
  	      printGuard_CopyCallBehaviorAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$CallBehaviorAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$CallBehaviorAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$CallBehaviorAction
  		&& printGuard_CopyCallBehaviorAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyCallBehaviorAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$CallBehaviorAction
  }  
  
procedure CopyCallEvent_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CallEvent  ==>
      printGuard_CopyCallEvent( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CallEvent  ==>
  	      printGuard_CopyCallEvent( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$CallEvent)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$CallEvent && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$CallEvent
  		&& printGuard_CopyCallEvent( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyCallEvent( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$CallEvent
  }  
  
procedure CopyCallOperationAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CallOperationAction  ==>
      printGuard_CopyCallOperationAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CallOperationAction  ==>
  	      printGuard_CopyCallOperationAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$CallOperationAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$CallOperationAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$CallOperationAction
  		&& printGuard_CopyCallOperationAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyCallOperationAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$CallOperationAction
  }  
  
procedure CopyCentralBufferNode_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CentralBufferNode  ==>
      printGuard_CopyCentralBufferNode( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CentralBufferNode  ==>
  	      printGuard_CopyCentralBufferNode( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$CentralBufferNode)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$CentralBufferNode && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$CentralBufferNode
  		&& printGuard_CopyCentralBufferNode( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyCentralBufferNode( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$CentralBufferNode
  }  
  
procedure CopyChangeEvent_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ChangeEvent  ==>
      printGuard_CopyChangeEvent( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ChangeEvent  ==>
  	      printGuard_CopyChangeEvent( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ChangeEvent)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ChangeEvent && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ChangeEvent
  		&& printGuard_CopyChangeEvent( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyChangeEvent( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ChangeEvent
  }  
  
procedure CopyClass_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Class  ==>
      printGuard_CopyClass( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Class  ==>
  	      printGuard_CopyClass( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Class)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Class && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Class
  		&& printGuard_CopyClass( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyClass( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Class
  }  
  
procedure CopyClassifierTemplateParameter_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ClassifierTemplateParameter  ==>
      printGuard_CopyClassifierTemplateParameter( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ClassifierTemplateParameter  ==>
  	      printGuard_CopyClassifierTemplateParameter( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ClassifierTemplateParameter)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ClassifierTemplateParameter && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ClassifierTemplateParameter
  		&& printGuard_CopyClassifierTemplateParameter( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyClassifierTemplateParameter( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ClassifierTemplateParameter
  }  
  
procedure CopyClause_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Clause  ==>
      printGuard_CopyClause( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Clause  ==>
  	      printGuard_CopyClause( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Clause)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Clause && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Clause
  		&& printGuard_CopyClause( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyClause( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Clause
  }  
  
procedure CopyClearAssociationAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ClearAssociationAction  ==>
      printGuard_CopyClearAssociationAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ClearAssociationAction  ==>
  	      printGuard_CopyClearAssociationAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ClearAssociationAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ClearAssociationAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ClearAssociationAction
  		&& printGuard_CopyClearAssociationAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyClearAssociationAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ClearAssociationAction
  }  
  
procedure CopyClearStructuralFeatureAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ClearStructuralFeatureAction  ==>
      printGuard_CopyClearStructuralFeatureAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ClearStructuralFeatureAction  ==>
  	      printGuard_CopyClearStructuralFeatureAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ClearStructuralFeatureAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ClearStructuralFeatureAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ClearStructuralFeatureAction
  		&& printGuard_CopyClearStructuralFeatureAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyClearStructuralFeatureAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ClearStructuralFeatureAction
  }  
  
procedure CopyClearVariableAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ClearVariableAction  ==>
      printGuard_CopyClearVariableAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ClearVariableAction  ==>
  	      printGuard_CopyClearVariableAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ClearVariableAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ClearVariableAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ClearVariableAction
  		&& printGuard_CopyClearVariableAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyClearVariableAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ClearVariableAction
  }  
  
procedure CopyCollaboration_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Collaboration  ==>
      printGuard_CopyCollaboration( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Collaboration  ==>
  	      printGuard_CopyCollaboration( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Collaboration)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Collaboration && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Collaboration
  		&& printGuard_CopyCollaboration( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyCollaboration( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Collaboration
  }  
  
procedure CopyCollaborationUse_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CollaborationUse  ==>
      printGuard_CopyCollaborationUse( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CollaborationUse  ==>
  	      printGuard_CopyCollaborationUse( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$CollaborationUse)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$CollaborationUse && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$CollaborationUse
  		&& printGuard_CopyCollaborationUse( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyCollaborationUse( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$CollaborationUse
  }  
  
procedure CopyCombinedFragment_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CombinedFragment  ==>
      printGuard_CopyCombinedFragment( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CombinedFragment  ==>
  	      printGuard_CopyCombinedFragment( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$CombinedFragment)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$CombinedFragment && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$CombinedFragment
  		&& printGuard_CopyCombinedFragment( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyCombinedFragment( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$CombinedFragment
  }  
  
procedure CopyComment_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Comment  ==>
      printGuard_CopyComment( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Comment  ==>
  	      printGuard_CopyComment( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Comment)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Comment && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Comment
  		&& printGuard_CopyComment( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyComment( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Comment
  }  
  
procedure CopyCommunicationPath_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CommunicationPath  ==>
      printGuard_CopyCommunicationPath( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CommunicationPath  ==>
  	      printGuard_CopyCommunicationPath( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$CommunicationPath)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$CommunicationPath && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$CommunicationPath
  		&& printGuard_CopyCommunicationPath( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyCommunicationPath( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$CommunicationPath
  }  
  
procedure CopyComponent_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Component  ==>
      printGuard_CopyComponent( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Component  ==>
  	      printGuard_CopyComponent( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Component)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Component && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Component
  		&& printGuard_CopyComponent( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyComponent( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Component
  }  
  
procedure CopyComponentRealization_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ComponentRealization  ==>
      printGuard_CopyComponentRealization( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ComponentRealization  ==>
  	      printGuard_CopyComponentRealization( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ComponentRealization)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ComponentRealization && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ComponentRealization
  		&& printGuard_CopyComponentRealization( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyComponentRealization( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ComponentRealization
  }  
  
procedure CopyConditionalNode_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ConditionalNode  ==>
      printGuard_CopyConditionalNode( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ConditionalNode  ==>
  	      printGuard_CopyConditionalNode( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ConditionalNode)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ConditionalNode && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ConditionalNode
  		&& printGuard_CopyConditionalNode( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyConditionalNode( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ConditionalNode
  }  
  
procedure CopyConnectableElementTemplateParameter_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ConnectableElementTemplateParameter  ==>
      printGuard_CopyConnectableElementTemplateParameter( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ConnectableElementTemplateParameter  ==>
  	      printGuard_CopyConnectableElementTemplateParameter( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ConnectableElementTemplateParameter)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ConnectableElementTemplateParameter && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ConnectableElementTemplateParameter
  		&& printGuard_CopyConnectableElementTemplateParameter( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyConnectableElementTemplateParameter( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ConnectableElementTemplateParameter
  }  
  
procedure CopyConnectionPointReference_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ConnectionPointReference  ==>
      printGuard_CopyConnectionPointReference( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ConnectionPointReference  ==>
  	      printGuard_CopyConnectionPointReference( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ConnectionPointReference)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ConnectionPointReference && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ConnectionPointReference
  		&& printGuard_CopyConnectionPointReference( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyConnectionPointReference( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ConnectionPointReference
  }  
  
procedure CopyConnector_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Connector  ==>
      printGuard_CopyConnector( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Connector  ==>
  	      printGuard_CopyConnector( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Connector)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Connector && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Connector
  		&& printGuard_CopyConnector( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyConnector( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Connector
  }  
  
procedure CopyConnectorEnd_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ConnectorEnd  ==>
      printGuard_CopyConnectorEnd( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ConnectorEnd  ==>
  	      printGuard_CopyConnectorEnd( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ConnectorEnd)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ConnectorEnd && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ConnectorEnd
  		&& printGuard_CopyConnectorEnd( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyConnectorEnd( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ConnectorEnd
  }  
  
procedure CopyConsiderIgnoreFragment_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ConsiderIgnoreFragment  ==>
      printGuard_CopyConsiderIgnoreFragment( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ConsiderIgnoreFragment  ==>
  	      printGuard_CopyConsiderIgnoreFragment( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ConsiderIgnoreFragment)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ConsiderIgnoreFragment && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ConsiderIgnoreFragment
  		&& printGuard_CopyConsiderIgnoreFragment( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyConsiderIgnoreFragment( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ConsiderIgnoreFragment
  }  
  
procedure CopyConstraint_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Constraint  ==>
      printGuard_CopyConstraint( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Constraint  ==>
  	      printGuard_CopyConstraint( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Constraint)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Constraint && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Constraint
  		&& printGuard_CopyConstraint( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyConstraint( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Constraint
  }  
  
procedure CopyContinuation_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Continuation  ==>
      printGuard_CopyContinuation( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Continuation  ==>
  	      printGuard_CopyContinuation( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Continuation)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Continuation && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Continuation
  		&& printGuard_CopyContinuation( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyContinuation( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Continuation
  }  
  
procedure CopyControlFlow_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ControlFlow  ==>
      printGuard_CopyControlFlow( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ControlFlow  ==>
  	      printGuard_CopyControlFlow( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ControlFlow)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ControlFlow && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ControlFlow
  		&& printGuard_CopyControlFlow( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyControlFlow( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ControlFlow
  }  
  
procedure CopyCreateLinkAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CreateLinkAction  ==>
      printGuard_CopyCreateLinkAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CreateLinkAction  ==>
  	      printGuard_CopyCreateLinkAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$CreateLinkAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$CreateLinkAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$CreateLinkAction
  		&& printGuard_CopyCreateLinkAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyCreateLinkAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$CreateLinkAction
  }  
  
procedure CopyCreateLinkObjectAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CreateLinkObjectAction  ==>
      printGuard_CopyCreateLinkObjectAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CreateLinkObjectAction  ==>
  	      printGuard_CopyCreateLinkObjectAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$CreateLinkObjectAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$CreateLinkObjectAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$CreateLinkObjectAction
  		&& printGuard_CopyCreateLinkObjectAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyCreateLinkObjectAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$CreateLinkObjectAction
  }  
  
procedure CopyCreateObjectAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CreateObjectAction  ==>
      printGuard_CopyCreateObjectAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$CreateObjectAction  ==>
  	      printGuard_CopyCreateObjectAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$CreateObjectAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$CreateObjectAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$CreateObjectAction
  		&& printGuard_CopyCreateObjectAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyCreateObjectAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$CreateObjectAction
  }  
  
procedure CopyDataStoreNode_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DataStoreNode  ==>
      printGuard_CopyDataStoreNode( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DataStoreNode  ==>
  	      printGuard_CopyDataStoreNode( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$DataStoreNode)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$DataStoreNode && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$DataStoreNode
  		&& printGuard_CopyDataStoreNode( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyDataStoreNode( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$DataStoreNode
  }  
  
procedure CopyDataType_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DataType  ==>
      printGuard_CopyDataType( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DataType  ==>
  	      printGuard_CopyDataType( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$DataType)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$DataType && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$DataType
  		&& printGuard_CopyDataType( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyDataType( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$DataType
  }  
  
procedure CopyDecisionNode_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DecisionNode  ==>
      printGuard_CopyDecisionNode( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DecisionNode  ==>
  	      printGuard_CopyDecisionNode( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$DecisionNode)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$DecisionNode && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$DecisionNode
  		&& printGuard_CopyDecisionNode( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyDecisionNode( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$DecisionNode
  }  
  
procedure CopyDependency_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Dependency  ==>
      printGuard_CopyDependency( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Dependency  ==>
  	      printGuard_CopyDependency( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Dependency)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Dependency && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Dependency
  		&& printGuard_CopyDependency( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyDependency( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Dependency
  }  
  
procedure CopyDeployment_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Deployment  ==>
      printGuard_CopyDeployment( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Deployment  ==>
  	      printGuard_CopyDeployment( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Deployment)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Deployment && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Deployment
  		&& printGuard_CopyDeployment( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyDeployment( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Deployment
  }  
  
procedure CopyDeploymentSpecification_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DeploymentSpecification  ==>
      printGuard_CopyDeploymentSpecification( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DeploymentSpecification  ==>
  	      printGuard_CopyDeploymentSpecification( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$DeploymentSpecification)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$DeploymentSpecification && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$DeploymentSpecification
  		&& printGuard_CopyDeploymentSpecification( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyDeploymentSpecification( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$DeploymentSpecification
  }  
  
procedure CopyDestroyLinkAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DestroyLinkAction  ==>
      printGuard_CopyDestroyLinkAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DestroyLinkAction  ==>
  	      printGuard_CopyDestroyLinkAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$DestroyLinkAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$DestroyLinkAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$DestroyLinkAction
  		&& printGuard_CopyDestroyLinkAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyDestroyLinkAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$DestroyLinkAction
  }  
  
procedure CopyDestroyObjectAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DestroyObjectAction  ==>
      printGuard_CopyDestroyObjectAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DestroyObjectAction  ==>
  	      printGuard_CopyDestroyObjectAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$DestroyObjectAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$DestroyObjectAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$DestroyObjectAction
  		&& printGuard_CopyDestroyObjectAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyDestroyObjectAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$DestroyObjectAction
  }  
  
procedure CopyDestructionOccurrenceSpecification_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DestructionOccurrenceSpecification  ==>
      printGuard_CopyDestructionOccurrenceSpecification( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DestructionOccurrenceSpecification  ==>
  	      printGuard_CopyDestructionOccurrenceSpecification( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$DestructionOccurrenceSpecification)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$DestructionOccurrenceSpecification && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$DestructionOccurrenceSpecification
  		&& printGuard_CopyDestructionOccurrenceSpecification( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyDestructionOccurrenceSpecification( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$DestructionOccurrenceSpecification
  }  
  
procedure CopyDevice_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Device  ==>
      printGuard_CopyDevice( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Device  ==>
  	      printGuard_CopyDevice( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Device)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Device && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Device
  		&& printGuard_CopyDevice( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyDevice( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Device
  }  
  
procedure CopyDuration_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Duration  ==>
      printGuard_CopyDuration( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Duration  ==>
  	      printGuard_CopyDuration( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Duration)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Duration && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Duration
  		&& printGuard_CopyDuration( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyDuration( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Duration
  }  
  
procedure CopyDurationConstraint_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DurationConstraint  ==>
      printGuard_CopyDurationConstraint( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DurationConstraint  ==>
  	      printGuard_CopyDurationConstraint( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$DurationConstraint)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$DurationConstraint && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$DurationConstraint
  		&& printGuard_CopyDurationConstraint( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyDurationConstraint( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$DurationConstraint
  }  
  
procedure CopyDurationInterval_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DurationInterval  ==>
      printGuard_CopyDurationInterval( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DurationInterval  ==>
  	      printGuard_CopyDurationInterval( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$DurationInterval)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$DurationInterval && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$DurationInterval
  		&& printGuard_CopyDurationInterval( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyDurationInterval( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$DurationInterval
  }  
  
procedure CopyDurationObservation_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DurationObservation  ==>
      printGuard_CopyDurationObservation( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$DurationObservation  ==>
  	      printGuard_CopyDurationObservation( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$DurationObservation)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$DurationObservation && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$DurationObservation
  		&& printGuard_CopyDurationObservation( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyDurationObservation( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$DurationObservation
  }  
  
procedure CopyElementImport_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ElementImport  ==>
      printGuard_CopyElementImport( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ElementImport  ==>
  	      printGuard_CopyElementImport( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ElementImport)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ElementImport && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ElementImport
  		&& printGuard_CopyElementImport( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyElementImport( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ElementImport
  }  
  
procedure CopyEnumeration_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Enumeration  ==>
      printGuard_CopyEnumeration( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Enumeration  ==>
  	      printGuard_CopyEnumeration( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Enumeration)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Enumeration && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Enumeration
  		&& printGuard_CopyEnumeration( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyEnumeration( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Enumeration
  }  
  
procedure CopyEnumerationLiteral_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$EnumerationLiteral  ==>
      printGuard_CopyEnumerationLiteral( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$EnumerationLiteral  ==>
  	      printGuard_CopyEnumerationLiteral( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$EnumerationLiteral)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$EnumerationLiteral && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$EnumerationLiteral
  		&& printGuard_CopyEnumerationLiteral( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyEnumerationLiteral( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$EnumerationLiteral
  }  
  
procedure CopyExceptionHandler_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ExceptionHandler  ==>
      printGuard_CopyExceptionHandler( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ExceptionHandler  ==>
  	      printGuard_CopyExceptionHandler( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ExceptionHandler)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ExceptionHandler && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ExceptionHandler
  		&& printGuard_CopyExceptionHandler( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyExceptionHandler( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ExceptionHandler
  }  
  
procedure CopyExecutionEnvironment_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ExecutionEnvironment  ==>
      printGuard_CopyExecutionEnvironment( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ExecutionEnvironment  ==>
  	      printGuard_CopyExecutionEnvironment( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ExecutionEnvironment)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ExecutionEnvironment && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ExecutionEnvironment
  		&& printGuard_CopyExecutionEnvironment( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyExecutionEnvironment( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ExecutionEnvironment
  }  
  
procedure CopyExecutionOccurrenceSpecification_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ExecutionOccurrenceSpecification  ==>
      printGuard_CopyExecutionOccurrenceSpecification( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ExecutionOccurrenceSpecification  ==>
  	      printGuard_CopyExecutionOccurrenceSpecification( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ExecutionOccurrenceSpecification)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ExecutionOccurrenceSpecification && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ExecutionOccurrenceSpecification
  		&& printGuard_CopyExecutionOccurrenceSpecification( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyExecutionOccurrenceSpecification( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ExecutionOccurrenceSpecification
  }  
  
procedure CopyExpansionNode_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ExpansionNode  ==>
      printGuard_CopyExpansionNode( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ExpansionNode  ==>
  	      printGuard_CopyExpansionNode( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ExpansionNode)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ExpansionNode && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ExpansionNode
  		&& printGuard_CopyExpansionNode( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyExpansionNode( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ExpansionNode
  }  
  
procedure CopyExpansionRegion_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ExpansionRegion  ==>
      printGuard_CopyExpansionRegion( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ExpansionRegion  ==>
  	      printGuard_CopyExpansionRegion( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ExpansionRegion)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ExpansionRegion && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ExpansionRegion
  		&& printGuard_CopyExpansionRegion( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyExpansionRegion( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ExpansionRegion
  }  
  
procedure CopyExpression_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Expression  ==>
      printGuard_CopyExpression( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Expression  ==>
  	      printGuard_CopyExpression( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Expression)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Expression && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Expression
  		&& printGuard_CopyExpression( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyExpression( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Expression
  }  
  
procedure CopyExtend_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Extend  ==>
      printGuard_CopyExtend( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Extend  ==>
  	      printGuard_CopyExtend( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Extend)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Extend && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Extend
  		&& printGuard_CopyExtend( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyExtend( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Extend
  }  
  
procedure CopyExtension_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Extension  ==>
      printGuard_CopyExtension( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Extension  ==>
  	      printGuard_CopyExtension( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Extension)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Extension && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Extension
  		&& printGuard_CopyExtension( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyExtension( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Extension
  }  
  
procedure CopyExtensionEnd_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ExtensionEnd  ==>
      printGuard_CopyExtensionEnd( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ExtensionEnd  ==>
  	      printGuard_CopyExtensionEnd( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ExtensionEnd)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ExtensionEnd && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ExtensionEnd
  		&& printGuard_CopyExtensionEnd( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyExtensionEnd( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ExtensionEnd
  }  
  
procedure CopyExtensionPoint_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ExtensionPoint  ==>
      printGuard_CopyExtensionPoint( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ExtensionPoint  ==>
  	      printGuard_CopyExtensionPoint( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ExtensionPoint)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ExtensionPoint && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ExtensionPoint
  		&& printGuard_CopyExtensionPoint( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyExtensionPoint( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ExtensionPoint
  }  
  
procedure CopyFinalState_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$FinalState  ==>
      printGuard_CopyFinalState( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$FinalState  ==>
  	      printGuard_CopyFinalState( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$FinalState)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$FinalState && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$FinalState
  		&& printGuard_CopyFinalState( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyFinalState( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$FinalState
  }  
  
procedure CopyFlowFinalNode_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$FlowFinalNode  ==>
      printGuard_CopyFlowFinalNode( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$FlowFinalNode  ==>
  	      printGuard_CopyFlowFinalNode( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$FlowFinalNode)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$FlowFinalNode && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$FlowFinalNode
  		&& printGuard_CopyFlowFinalNode( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyFlowFinalNode( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$FlowFinalNode
  }  
  
procedure CopyForkNode_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ForkNode  ==>
      printGuard_CopyForkNode( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ForkNode  ==>
  	      printGuard_CopyForkNode( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ForkNode)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ForkNode && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ForkNode
  		&& printGuard_CopyForkNode( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyForkNode( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ForkNode
  }  
  
procedure CopyFunctionBehavior_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$FunctionBehavior  ==>
      printGuard_CopyFunctionBehavior( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$FunctionBehavior  ==>
  	      printGuard_CopyFunctionBehavior( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$FunctionBehavior)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$FunctionBehavior && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$FunctionBehavior
  		&& printGuard_CopyFunctionBehavior( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyFunctionBehavior( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$FunctionBehavior
  }  
  
procedure CopyGate_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Gate  ==>
      printGuard_CopyGate( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Gate  ==>
  	      printGuard_CopyGate( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Gate)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Gate && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Gate
  		&& printGuard_CopyGate( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyGate( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Gate
  }  
  
procedure CopyGeneralOrdering_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$GeneralOrdering  ==>
      printGuard_CopyGeneralOrdering( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$GeneralOrdering  ==>
  	      printGuard_CopyGeneralOrdering( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$GeneralOrdering)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$GeneralOrdering && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$GeneralOrdering
  		&& printGuard_CopyGeneralOrdering( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyGeneralOrdering( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$GeneralOrdering
  }  
  
procedure CopyGeneralization_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Generalization  ==>
      printGuard_CopyGeneralization( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Generalization  ==>
  	      printGuard_CopyGeneralization( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Generalization)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Generalization && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Generalization
  		&& printGuard_CopyGeneralization( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyGeneralization( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Generalization
  }  
  
procedure CopyGeneralizationSet_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$GeneralizationSet  ==>
      printGuard_CopyGeneralizationSet( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$GeneralizationSet  ==>
  	      printGuard_CopyGeneralizationSet( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$GeneralizationSet)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$GeneralizationSet && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$GeneralizationSet
  		&& printGuard_CopyGeneralizationSet( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyGeneralizationSet( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$GeneralizationSet
  }  
  
procedure CopyImage_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Image  ==>
      printGuard_CopyImage( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Image  ==>
  	      printGuard_CopyImage( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Image)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Image && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Image
  		&& printGuard_CopyImage( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyImage( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Image
  }  
  
procedure CopyInclude_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Include  ==>
      printGuard_CopyInclude( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Include  ==>
  	      printGuard_CopyInclude( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Include)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Include && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Include
  		&& printGuard_CopyInclude( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyInclude( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Include
  }  
  
procedure CopyInformationFlow_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InformationFlow  ==>
      printGuard_CopyInformationFlow( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InformationFlow  ==>
  	      printGuard_CopyInformationFlow( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$InformationFlow)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$InformationFlow && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$InformationFlow
  		&& printGuard_CopyInformationFlow( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyInformationFlow( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$InformationFlow
  }  
  
procedure CopyInformationItem_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InformationItem  ==>
      printGuard_CopyInformationItem( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InformationItem  ==>
  	      printGuard_CopyInformationItem( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$InformationItem)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$InformationItem && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$InformationItem
  		&& printGuard_CopyInformationItem( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyInformationItem( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$InformationItem
  }  
  
procedure CopyInitialNode_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InitialNode  ==>
      printGuard_CopyInitialNode( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InitialNode  ==>
  	      printGuard_CopyInitialNode( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$InitialNode)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$InitialNode && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$InitialNode
  		&& printGuard_CopyInitialNode( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyInitialNode( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$InitialNode
  }  
  
procedure CopyInputPin_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InputPin  ==>
      printGuard_CopyInputPin( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InputPin  ==>
  	      printGuard_CopyInputPin( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$InputPin)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$InputPin && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$InputPin
  		&& printGuard_CopyInputPin( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyInputPin( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$InputPin
  }  
  
procedure CopyInstanceSpecification_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InstanceSpecification  ==>
      printGuard_CopyInstanceSpecification( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InstanceSpecification  ==>
  	      printGuard_CopyInstanceSpecification( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$InstanceSpecification)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$InstanceSpecification && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$InstanceSpecification
  		&& printGuard_CopyInstanceSpecification( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyInstanceSpecification( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$InstanceSpecification
  }  
  
procedure CopyInstanceValue_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InstanceValue  ==>
      printGuard_CopyInstanceValue( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InstanceValue  ==>
  	      printGuard_CopyInstanceValue( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$InstanceValue)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$InstanceValue && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$InstanceValue
  		&& printGuard_CopyInstanceValue( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyInstanceValue( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$InstanceValue
  }  
  
procedure CopyInteraction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Interaction  ==>
      printGuard_CopyInteraction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Interaction  ==>
  	      printGuard_CopyInteraction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Interaction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Interaction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Interaction
  		&& printGuard_CopyInteraction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyInteraction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Interaction
  }  
  
procedure CopyInteractionConstraint_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InteractionConstraint  ==>
      printGuard_CopyInteractionConstraint( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InteractionConstraint  ==>
  	      printGuard_CopyInteractionConstraint( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$InteractionConstraint)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$InteractionConstraint && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$InteractionConstraint
  		&& printGuard_CopyInteractionConstraint( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyInteractionConstraint( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$InteractionConstraint
  }  
  
procedure CopyInteractionOperand_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InteractionOperand  ==>
      printGuard_CopyInteractionOperand( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InteractionOperand  ==>
  	      printGuard_CopyInteractionOperand( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$InteractionOperand)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$InteractionOperand && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$InteractionOperand
  		&& printGuard_CopyInteractionOperand( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyInteractionOperand( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$InteractionOperand
  }  
  
procedure CopyInteractionUse_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InteractionUse  ==>
      printGuard_CopyInteractionUse( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InteractionUse  ==>
  	      printGuard_CopyInteractionUse( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$InteractionUse)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$InteractionUse && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$InteractionUse
  		&& printGuard_CopyInteractionUse( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyInteractionUse( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$InteractionUse
  }  
  
procedure CopyInterface_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Interface  ==>
      printGuard_CopyInterface( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Interface  ==>
  	      printGuard_CopyInterface( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Interface)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Interface && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Interface
  		&& printGuard_CopyInterface( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyInterface( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Interface
  }  
  
procedure CopyInterfaceRealization_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InterfaceRealization  ==>
      printGuard_CopyInterfaceRealization( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InterfaceRealization  ==>
  	      printGuard_CopyInterfaceRealization( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$InterfaceRealization)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$InterfaceRealization && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$InterfaceRealization
  		&& printGuard_CopyInterfaceRealization( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyInterfaceRealization( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$InterfaceRealization
  }  
  
procedure CopyInterruptibleActivityRegion_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InterruptibleActivityRegion  ==>
      printGuard_CopyInterruptibleActivityRegion( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$InterruptibleActivityRegion  ==>
  	      printGuard_CopyInterruptibleActivityRegion( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$InterruptibleActivityRegion)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$InterruptibleActivityRegion && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$InterruptibleActivityRegion
  		&& printGuard_CopyInterruptibleActivityRegion( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyInterruptibleActivityRegion( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$InterruptibleActivityRegion
  }  
  
procedure CopyInterval_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Interval  ==>
      printGuard_CopyInterval( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Interval  ==>
  	      printGuard_CopyInterval( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Interval)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Interval && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Interval
  		&& printGuard_CopyInterval( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyInterval( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Interval
  }  
  
procedure CopyIntervalConstraint_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$IntervalConstraint  ==>
      printGuard_CopyIntervalConstraint( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$IntervalConstraint  ==>
  	      printGuard_CopyIntervalConstraint( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$IntervalConstraint)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$IntervalConstraint && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$IntervalConstraint
  		&& printGuard_CopyIntervalConstraint( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyIntervalConstraint( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$IntervalConstraint
  }  
  
procedure CopyJoinNode_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$JoinNode  ==>
      printGuard_CopyJoinNode( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$JoinNode  ==>
  	      printGuard_CopyJoinNode( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$JoinNode)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$JoinNode && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$JoinNode
  		&& printGuard_CopyJoinNode( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyJoinNode( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$JoinNode
  }  
  
procedure CopyLifeline_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Lifeline  ==>
      printGuard_CopyLifeline( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Lifeline  ==>
  	      printGuard_CopyLifeline( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Lifeline)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Lifeline && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Lifeline
  		&& printGuard_CopyLifeline( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyLifeline( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Lifeline
  }  
  
procedure CopyLinkEndCreationData_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LinkEndCreationData  ==>
      printGuard_CopyLinkEndCreationData( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LinkEndCreationData  ==>
  	      printGuard_CopyLinkEndCreationData( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$LinkEndCreationData)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$LinkEndCreationData && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$LinkEndCreationData
  		&& printGuard_CopyLinkEndCreationData( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyLinkEndCreationData( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$LinkEndCreationData
  }  
  
procedure CopyLinkEndData_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LinkEndData  ==>
      printGuard_CopyLinkEndData( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LinkEndData  ==>
  	      printGuard_CopyLinkEndData( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$LinkEndData)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$LinkEndData && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$LinkEndData
  		&& printGuard_CopyLinkEndData( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyLinkEndData( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$LinkEndData
  }  
  
procedure CopyLinkEndDestructionData_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LinkEndDestructionData  ==>
      printGuard_CopyLinkEndDestructionData( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LinkEndDestructionData  ==>
  	      printGuard_CopyLinkEndDestructionData( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$LinkEndDestructionData)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$LinkEndDestructionData && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$LinkEndDestructionData
  		&& printGuard_CopyLinkEndDestructionData( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyLinkEndDestructionData( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$LinkEndDestructionData
  }  
  
procedure CopyLiteralBoolean_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LiteralBoolean  ==>
      printGuard_CopyLiteralBoolean( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LiteralBoolean  ==>
  	      printGuard_CopyLiteralBoolean( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$LiteralBoolean)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$LiteralBoolean && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$LiteralBoolean
  		&& printGuard_CopyLiteralBoolean( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyLiteralBoolean( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$LiteralBoolean
  }  
  
procedure CopyLiteralInteger_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LiteralInteger  ==>
      printGuard_CopyLiteralInteger( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LiteralInteger  ==>
  	      printGuard_CopyLiteralInteger( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$LiteralInteger)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$LiteralInteger && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$LiteralInteger
  		&& printGuard_CopyLiteralInteger( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyLiteralInteger( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$LiteralInteger
  }  
  
procedure CopyLiteralNull_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LiteralNull  ==>
      printGuard_CopyLiteralNull( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LiteralNull  ==>
  	      printGuard_CopyLiteralNull( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$LiteralNull)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$LiteralNull && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$LiteralNull
  		&& printGuard_CopyLiteralNull( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyLiteralNull( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$LiteralNull
  }  
  
procedure CopyLiteralReal_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LiteralReal  ==>
      printGuard_CopyLiteralReal( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LiteralReal  ==>
  	      printGuard_CopyLiteralReal( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$LiteralReal)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$LiteralReal && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$LiteralReal
  		&& printGuard_CopyLiteralReal( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyLiteralReal( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$LiteralReal
  }  
  
procedure CopyLiteralString_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LiteralString  ==>
      printGuard_CopyLiteralString( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LiteralString  ==>
  	      printGuard_CopyLiteralString( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$LiteralString)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$LiteralString && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$LiteralString
  		&& printGuard_CopyLiteralString( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyLiteralString( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$LiteralString
  }  
  
procedure CopyLiteralUnlimitedNatural_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LiteralUnlimitedNatural  ==>
      printGuard_CopyLiteralUnlimitedNatural( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LiteralUnlimitedNatural  ==>
  	      printGuard_CopyLiteralUnlimitedNatural( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$LiteralUnlimitedNatural)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$LiteralUnlimitedNatural && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$LiteralUnlimitedNatural
  		&& printGuard_CopyLiteralUnlimitedNatural( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyLiteralUnlimitedNatural( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$LiteralUnlimitedNatural
  }  
  
procedure CopyLoopNode_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LoopNode  ==>
      printGuard_CopyLoopNode( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$LoopNode  ==>
  	      printGuard_CopyLoopNode( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$LoopNode)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$LoopNode && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$LoopNode
  		&& printGuard_CopyLoopNode( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyLoopNode( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$LoopNode
  }  
  
procedure CopyManifestation_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Manifestation  ==>
      printGuard_CopyManifestation( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Manifestation  ==>
  	      printGuard_CopyManifestation( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Manifestation)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Manifestation && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Manifestation
  		&& printGuard_CopyManifestation( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyManifestation( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Manifestation
  }  
  
procedure CopyMergeNode_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$MergeNode  ==>
      printGuard_CopyMergeNode( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$MergeNode  ==>
  	      printGuard_CopyMergeNode( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$MergeNode)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$MergeNode && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$MergeNode
  		&& printGuard_CopyMergeNode( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyMergeNode( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$MergeNode
  }  
  
procedure CopyMessage_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Message  ==>
      printGuard_CopyMessage( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Message  ==>
  	      printGuard_CopyMessage( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Message)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Message && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Message
  		&& printGuard_CopyMessage( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyMessage( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Message
  }  
  
procedure CopyMessageOccurrenceSpecification_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$MessageOccurrenceSpecification  ==>
      printGuard_CopyMessageOccurrenceSpecification( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$MessageOccurrenceSpecification  ==>
  	      printGuard_CopyMessageOccurrenceSpecification( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$MessageOccurrenceSpecification)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$MessageOccurrenceSpecification && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$MessageOccurrenceSpecification
  		&& printGuard_CopyMessageOccurrenceSpecification( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyMessageOccurrenceSpecification( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$MessageOccurrenceSpecification
  }  
  
procedure CopyModel_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Model  ==>
      printGuard_CopyModel( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Model  ==>
  	      printGuard_CopyModel( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Model)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Model && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Model
  		&& printGuard_CopyModel( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyModel( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Model
  }  
  
procedure CopyNode_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Node  ==>
      printGuard_CopyNode( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Node  ==>
  	      printGuard_CopyNode( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Node)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Node && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Node
  		&& printGuard_CopyNode( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyNode( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Node
  }  
  
procedure CopyObjectFlow_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ObjectFlow  ==>
      printGuard_CopyObjectFlow( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ObjectFlow  ==>
  	      printGuard_CopyObjectFlow( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ObjectFlow)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ObjectFlow && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ObjectFlow
  		&& printGuard_CopyObjectFlow( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyObjectFlow( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ObjectFlow
  }  
  
procedure CopyOccurrenceSpecification_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$OccurrenceSpecification  ==>
      printGuard_CopyOccurrenceSpecification( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$OccurrenceSpecification  ==>
  	      printGuard_CopyOccurrenceSpecification( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$OccurrenceSpecification)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$OccurrenceSpecification && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$OccurrenceSpecification
  		&& printGuard_CopyOccurrenceSpecification( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyOccurrenceSpecification( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$OccurrenceSpecification
  }  
  
procedure CopyOpaqueAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$OpaqueAction  ==>
      printGuard_CopyOpaqueAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$OpaqueAction  ==>
  	      printGuard_CopyOpaqueAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$OpaqueAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$OpaqueAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$OpaqueAction
  		&& printGuard_CopyOpaqueAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyOpaqueAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$OpaqueAction
  }  
  
procedure CopyOpaqueBehavior_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$OpaqueBehavior  ==>
      printGuard_CopyOpaqueBehavior( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$OpaqueBehavior  ==>
  	      printGuard_CopyOpaqueBehavior( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$OpaqueBehavior)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$OpaqueBehavior && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$OpaqueBehavior
  		&& printGuard_CopyOpaqueBehavior( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyOpaqueBehavior( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$OpaqueBehavior
  }  
  
procedure CopyOpaqueExpression_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$OpaqueExpression  ==>
      printGuard_CopyOpaqueExpression( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$OpaqueExpression  ==>
  	      printGuard_CopyOpaqueExpression( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$OpaqueExpression)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$OpaqueExpression && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$OpaqueExpression
  		&& printGuard_CopyOpaqueExpression( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyOpaqueExpression( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$OpaqueExpression
  }  
  
procedure CopyOperation_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Operation  ==>
      printGuard_CopyOperation( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Operation  ==>
  	      printGuard_CopyOperation( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Operation)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Operation && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Operation
  		&& printGuard_CopyOperation( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyOperation( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Operation
  }  
  
procedure CopyOperationTemplateParameter_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$OperationTemplateParameter  ==>
      printGuard_CopyOperationTemplateParameter( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$OperationTemplateParameter  ==>
  	      printGuard_CopyOperationTemplateParameter( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$OperationTemplateParameter)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$OperationTemplateParameter && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$OperationTemplateParameter
  		&& printGuard_CopyOperationTemplateParameter( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyOperationTemplateParameter( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$OperationTemplateParameter
  }  
  
procedure CopyOutputPin_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$OutputPin  ==>
      printGuard_CopyOutputPin( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$OutputPin  ==>
  	      printGuard_CopyOutputPin( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$OutputPin)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$OutputPin && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$OutputPin
  		&& printGuard_CopyOutputPin( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyOutputPin( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$OutputPin
  }  
  
procedure CopyPackage_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Package  ==>
      printGuard_CopyPackage( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Package  ==>
  	      printGuard_CopyPackage( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Package)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Package && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Package
  		&& printGuard_CopyPackage( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyPackage( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Package
  }  
  
procedure CopyPackageImport_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$PackageImport  ==>
      printGuard_CopyPackageImport( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$PackageImport  ==>
  	      printGuard_CopyPackageImport( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$PackageImport)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$PackageImport && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$PackageImport
  		&& printGuard_CopyPackageImport( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyPackageImport( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$PackageImport
  }  
  
procedure CopyPackageMerge_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$PackageMerge  ==>
      printGuard_CopyPackageMerge( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$PackageMerge  ==>
  	      printGuard_CopyPackageMerge( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$PackageMerge)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$PackageMerge && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$PackageMerge
  		&& printGuard_CopyPackageMerge( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyPackageMerge( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$PackageMerge
  }  
  
procedure CopyParameter_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Parameter  ==>
      printGuard_CopyParameter( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Parameter  ==>
  	      printGuard_CopyParameter( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Parameter)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Parameter && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Parameter
  		&& printGuard_CopyParameter( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyParameter( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Parameter
  }  
  
procedure CopyParameterSet_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ParameterSet  ==>
      printGuard_CopyParameterSet( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ParameterSet  ==>
  	      printGuard_CopyParameterSet( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ParameterSet)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ParameterSet && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ParameterSet
  		&& printGuard_CopyParameterSet( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyParameterSet( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ParameterSet
  }  
  
procedure CopyPartDecomposition_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$PartDecomposition  ==>
      printGuard_CopyPartDecomposition( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$PartDecomposition  ==>
  	      printGuard_CopyPartDecomposition( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$PartDecomposition)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$PartDecomposition && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$PartDecomposition
  		&& printGuard_CopyPartDecomposition( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyPartDecomposition( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$PartDecomposition
  }  
  
procedure CopyPort_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Port  ==>
      printGuard_CopyPort( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Port  ==>
  	      printGuard_CopyPort( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Port)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Port && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Port
  		&& printGuard_CopyPort( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyPort( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Port
  }  
  
procedure CopyPrimitiveType_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$PrimitiveType  ==>
      printGuard_CopyPrimitiveType( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$PrimitiveType  ==>
  	      printGuard_CopyPrimitiveType( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$PrimitiveType)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$PrimitiveType && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$PrimitiveType
  		&& printGuard_CopyPrimitiveType( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyPrimitiveType( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$PrimitiveType
  }  
  
procedure CopyProfile_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Profile  ==>
      printGuard_CopyProfile( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Profile  ==>
  	      printGuard_CopyProfile( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Profile)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Profile && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Profile
  		&& printGuard_CopyProfile( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyProfile( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Profile
  }  
  
procedure CopyProfileApplication_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ProfileApplication  ==>
      printGuard_CopyProfileApplication( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ProfileApplication  ==>
  	      printGuard_CopyProfileApplication( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ProfileApplication)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ProfileApplication && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ProfileApplication
  		&& printGuard_CopyProfileApplication( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyProfileApplication( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ProfileApplication
  }  
  
procedure CopyProperty_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Property  ==>
      printGuard_CopyProperty( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Property  ==>
  	      printGuard_CopyProperty( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Property)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Property && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Property
  		&& printGuard_CopyProperty( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyProperty( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Property
  }  
  
procedure CopyProtocolConformance_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ProtocolConformance  ==>
      printGuard_CopyProtocolConformance( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ProtocolConformance  ==>
  	      printGuard_CopyProtocolConformance( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ProtocolConformance)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ProtocolConformance && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ProtocolConformance
  		&& printGuard_CopyProtocolConformance( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyProtocolConformance( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ProtocolConformance
  }  
  
procedure CopyProtocolStateMachine_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ProtocolStateMachine  ==>
      printGuard_CopyProtocolStateMachine( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ProtocolStateMachine  ==>
  	      printGuard_CopyProtocolStateMachine( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ProtocolStateMachine)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ProtocolStateMachine && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ProtocolStateMachine
  		&& printGuard_CopyProtocolStateMachine( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyProtocolStateMachine( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ProtocolStateMachine
  }  
  
procedure CopyProtocolTransition_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ProtocolTransition  ==>
      printGuard_CopyProtocolTransition( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ProtocolTransition  ==>
  	      printGuard_CopyProtocolTransition( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ProtocolTransition)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ProtocolTransition && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ProtocolTransition
  		&& printGuard_CopyProtocolTransition( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyProtocolTransition( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ProtocolTransition
  }  
  
procedure CopyPseudostate_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Pseudostate  ==>
      printGuard_CopyPseudostate( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Pseudostate  ==>
  	      printGuard_CopyPseudostate( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Pseudostate)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Pseudostate && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Pseudostate
  		&& printGuard_CopyPseudostate( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyPseudostate( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Pseudostate
  }  
  
procedure CopyQualifierValue_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$QualifierValue  ==>
      printGuard_CopyQualifierValue( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$QualifierValue  ==>
  	      printGuard_CopyQualifierValue( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$QualifierValue)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$QualifierValue && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$QualifierValue
  		&& printGuard_CopyQualifierValue( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyQualifierValue( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$QualifierValue
  }  
  
procedure CopyRaiseExceptionAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$RaiseExceptionAction  ==>
      printGuard_CopyRaiseExceptionAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$RaiseExceptionAction  ==>
  	      printGuard_CopyRaiseExceptionAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$RaiseExceptionAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$RaiseExceptionAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$RaiseExceptionAction
  		&& printGuard_CopyRaiseExceptionAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyRaiseExceptionAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$RaiseExceptionAction
  }  
  
procedure CopyReadExtentAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReadExtentAction  ==>
      printGuard_CopyReadExtentAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReadExtentAction  ==>
  	      printGuard_CopyReadExtentAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ReadExtentAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ReadExtentAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ReadExtentAction
  		&& printGuard_CopyReadExtentAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyReadExtentAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ReadExtentAction
  }  
  
procedure CopyReadIsClassifiedObjectAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReadIsClassifiedObjectAction  ==>
      printGuard_CopyReadIsClassifiedObjectAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReadIsClassifiedObjectAction  ==>
  	      printGuard_CopyReadIsClassifiedObjectAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ReadIsClassifiedObjectAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ReadIsClassifiedObjectAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ReadIsClassifiedObjectAction
  		&& printGuard_CopyReadIsClassifiedObjectAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyReadIsClassifiedObjectAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ReadIsClassifiedObjectAction
  }  
  
procedure CopyReadLinkAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReadLinkAction  ==>
      printGuard_CopyReadLinkAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReadLinkAction  ==>
  	      printGuard_CopyReadLinkAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ReadLinkAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ReadLinkAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ReadLinkAction
  		&& printGuard_CopyReadLinkAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyReadLinkAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ReadLinkAction
  }  
  
procedure CopyReadLinkObjectEndAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReadLinkObjectEndAction  ==>
      printGuard_CopyReadLinkObjectEndAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReadLinkObjectEndAction  ==>
  	      printGuard_CopyReadLinkObjectEndAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ReadLinkObjectEndAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ReadLinkObjectEndAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ReadLinkObjectEndAction
  		&& printGuard_CopyReadLinkObjectEndAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyReadLinkObjectEndAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ReadLinkObjectEndAction
  }  
  
procedure CopyReadLinkObjectEndQualifierAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReadLinkObjectEndQualifierAction  ==>
      printGuard_CopyReadLinkObjectEndQualifierAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReadLinkObjectEndQualifierAction  ==>
  	      printGuard_CopyReadLinkObjectEndQualifierAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ReadLinkObjectEndQualifierAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ReadLinkObjectEndQualifierAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ReadLinkObjectEndQualifierAction
  		&& printGuard_CopyReadLinkObjectEndQualifierAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyReadLinkObjectEndQualifierAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ReadLinkObjectEndQualifierAction
  }  
  
procedure CopyReadSelfAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReadSelfAction  ==>
      printGuard_CopyReadSelfAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReadSelfAction  ==>
  	      printGuard_CopyReadSelfAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ReadSelfAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ReadSelfAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ReadSelfAction
  		&& printGuard_CopyReadSelfAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyReadSelfAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ReadSelfAction
  }  
  
procedure CopyReadStructuralFeatureAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReadStructuralFeatureAction  ==>
      printGuard_CopyReadStructuralFeatureAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReadStructuralFeatureAction  ==>
  	      printGuard_CopyReadStructuralFeatureAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ReadStructuralFeatureAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ReadStructuralFeatureAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ReadStructuralFeatureAction
  		&& printGuard_CopyReadStructuralFeatureAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyReadStructuralFeatureAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ReadStructuralFeatureAction
  }  
  
procedure CopyReadVariableAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReadVariableAction  ==>
      printGuard_CopyReadVariableAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReadVariableAction  ==>
  	      printGuard_CopyReadVariableAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ReadVariableAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ReadVariableAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ReadVariableAction
  		&& printGuard_CopyReadVariableAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyReadVariableAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ReadVariableAction
  }  
  
procedure CopyRealization_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Realization  ==>
      printGuard_CopyRealization( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Realization  ==>
  	      printGuard_CopyRealization( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Realization)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Realization && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Realization
  		&& printGuard_CopyRealization( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyRealization( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Realization
  }  
  
procedure CopyReception_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Reception  ==>
      printGuard_CopyReception( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Reception  ==>
  	      printGuard_CopyReception( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Reception)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Reception && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Reception
  		&& printGuard_CopyReception( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyReception( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Reception
  }  
  
procedure CopyReclassifyObjectAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReclassifyObjectAction  ==>
      printGuard_CopyReclassifyObjectAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReclassifyObjectAction  ==>
  	      printGuard_CopyReclassifyObjectAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ReclassifyObjectAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ReclassifyObjectAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ReclassifyObjectAction
  		&& printGuard_CopyReclassifyObjectAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyReclassifyObjectAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ReclassifyObjectAction
  }  
  
procedure CopyRedefinableTemplateSignature_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$RedefinableTemplateSignature  ==>
      printGuard_CopyRedefinableTemplateSignature( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$RedefinableTemplateSignature  ==>
  	      printGuard_CopyRedefinableTemplateSignature( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$RedefinableTemplateSignature)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$RedefinableTemplateSignature && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$RedefinableTemplateSignature
  		&& printGuard_CopyRedefinableTemplateSignature( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyRedefinableTemplateSignature( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$RedefinableTemplateSignature
  }  
  
procedure CopyReduceAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReduceAction  ==>
      printGuard_CopyReduceAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReduceAction  ==>
  	      printGuard_CopyReduceAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ReduceAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ReduceAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ReduceAction
  		&& printGuard_CopyReduceAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyReduceAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ReduceAction
  }  
  
procedure CopyRegion_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Region  ==>
      printGuard_CopyRegion( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Region  ==>
  	      printGuard_CopyRegion( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Region)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Region && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Region
  		&& printGuard_CopyRegion( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyRegion( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Region
  }  
  
procedure CopyRemoveStructuralFeatureValueAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$RemoveStructuralFeatureValueAction  ==>
      printGuard_CopyRemoveStructuralFeatureValueAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$RemoveStructuralFeatureValueAction  ==>
  	      printGuard_CopyRemoveStructuralFeatureValueAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$RemoveStructuralFeatureValueAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$RemoveStructuralFeatureValueAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$RemoveStructuralFeatureValueAction
  		&& printGuard_CopyRemoveStructuralFeatureValueAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyRemoveStructuralFeatureValueAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$RemoveStructuralFeatureValueAction
  }  
  
procedure CopyRemoveVariableValueAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$RemoveVariableValueAction  ==>
      printGuard_CopyRemoveVariableValueAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$RemoveVariableValueAction  ==>
  	      printGuard_CopyRemoveVariableValueAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$RemoveVariableValueAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$RemoveVariableValueAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$RemoveVariableValueAction
  		&& printGuard_CopyRemoveVariableValueAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyRemoveVariableValueAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$RemoveVariableValueAction
  }  
  
procedure CopyReplyAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReplyAction  ==>
      printGuard_CopyReplyAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ReplyAction  ==>
  	      printGuard_CopyReplyAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ReplyAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ReplyAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ReplyAction
  		&& printGuard_CopyReplyAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyReplyAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ReplyAction
  }  
  
procedure CopySendObjectAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$SendObjectAction  ==>
      printGuard_CopySendObjectAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$SendObjectAction  ==>
  	      printGuard_CopySendObjectAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$SendObjectAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$SendObjectAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$SendObjectAction
  		&& printGuard_CopySendObjectAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopySendObjectAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$SendObjectAction
  }  
  
procedure CopySendSignalAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$SendSignalAction  ==>
      printGuard_CopySendSignalAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$SendSignalAction  ==>
  	      printGuard_CopySendSignalAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$SendSignalAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$SendSignalAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$SendSignalAction
  		&& printGuard_CopySendSignalAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopySendSignalAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$SendSignalAction
  }  
  
procedure CopySequenceNode_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$SequenceNode  ==>
      printGuard_CopySequenceNode( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$SequenceNode  ==>
  	      printGuard_CopySequenceNode( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$SequenceNode)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$SequenceNode && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$SequenceNode
  		&& printGuard_CopySequenceNode( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopySequenceNode( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$SequenceNode
  }  
  
procedure CopySignal_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Signal  ==>
      printGuard_CopySignal( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Signal  ==>
  	      printGuard_CopySignal( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Signal)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Signal && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Signal
  		&& printGuard_CopySignal( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopySignal( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Signal
  }  
  
procedure CopySignalEvent_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$SignalEvent  ==>
      printGuard_CopySignalEvent( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$SignalEvent  ==>
  	      printGuard_CopySignalEvent( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$SignalEvent)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$SignalEvent && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$SignalEvent
  		&& printGuard_CopySignalEvent( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopySignalEvent( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$SignalEvent
  }  
  
procedure CopySlot_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Slot  ==>
      printGuard_CopySlot( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Slot  ==>
  	      printGuard_CopySlot( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Slot)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Slot && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Slot
  		&& printGuard_CopySlot( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopySlot( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Slot
  }  
  
procedure CopyStartClassifierBehaviorAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$StartClassifierBehaviorAction  ==>
      printGuard_CopyStartClassifierBehaviorAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$StartClassifierBehaviorAction  ==>
  	      printGuard_CopyStartClassifierBehaviorAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$StartClassifierBehaviorAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$StartClassifierBehaviorAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$StartClassifierBehaviorAction
  		&& printGuard_CopyStartClassifierBehaviorAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyStartClassifierBehaviorAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$StartClassifierBehaviorAction
  }  
  
procedure CopyStartObjectBehaviorAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$StartObjectBehaviorAction  ==>
      printGuard_CopyStartObjectBehaviorAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$StartObjectBehaviorAction  ==>
  	      printGuard_CopyStartObjectBehaviorAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$StartObjectBehaviorAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$StartObjectBehaviorAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$StartObjectBehaviorAction
  		&& printGuard_CopyStartObjectBehaviorAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyStartObjectBehaviorAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$StartObjectBehaviorAction
  }  
  
procedure CopyState_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$State  ==>
      printGuard_CopyState( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$State  ==>
  	      printGuard_CopyState( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$State)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$State && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$State
  		&& printGuard_CopyState( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyState( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$State
  }  
  
procedure CopyStateInvariant_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$StateInvariant  ==>
      printGuard_CopyStateInvariant( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$StateInvariant  ==>
  	      printGuard_CopyStateInvariant( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$StateInvariant)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$StateInvariant && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$StateInvariant
  		&& printGuard_CopyStateInvariant( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyStateInvariant( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$StateInvariant
  }  
  
procedure CopyStateMachine_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$StateMachine  ==>
      printGuard_CopyStateMachine( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$StateMachine  ==>
  	      printGuard_CopyStateMachine( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$StateMachine)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$StateMachine && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$StateMachine
  		&& printGuard_CopyStateMachine( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyStateMachine( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$StateMachine
  }  
  
procedure CopyStereotype_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Stereotype  ==>
      printGuard_CopyStereotype( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Stereotype  ==>
  	      printGuard_CopyStereotype( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Stereotype)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Stereotype && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Stereotype
  		&& printGuard_CopyStereotype( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyStereotype( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Stereotype
  }  
  
procedure CopyStringExpression_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$StringExpression  ==>
      printGuard_CopyStringExpression( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$StringExpression  ==>
  	      printGuard_CopyStringExpression( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$StringExpression)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$StringExpression && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$StringExpression
  		&& printGuard_CopyStringExpression( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyStringExpression( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$StringExpression
  }  
  
procedure CopyStructuredActivityNode_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$StructuredActivityNode  ==>
      printGuard_CopyStructuredActivityNode( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$StructuredActivityNode  ==>
  	      printGuard_CopyStructuredActivityNode( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$StructuredActivityNode)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$StructuredActivityNode && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$StructuredActivityNode
  		&& printGuard_CopyStructuredActivityNode( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyStructuredActivityNode( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$StructuredActivityNode
  }  
  
procedure CopySubstitution_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Substitution  ==>
      printGuard_CopySubstitution( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Substitution  ==>
  	      printGuard_CopySubstitution( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Substitution)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Substitution && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Substitution
  		&& printGuard_CopySubstitution( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopySubstitution( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Substitution
  }  
  
procedure CopyTemplateBinding_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TemplateBinding  ==>
      printGuard_CopyTemplateBinding( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TemplateBinding  ==>
  	      printGuard_CopyTemplateBinding( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$TemplateBinding)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$TemplateBinding && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$TemplateBinding
  		&& printGuard_CopyTemplateBinding( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyTemplateBinding( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$TemplateBinding
  }  
  
procedure CopyTemplateParameter_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TemplateParameter  ==>
      printGuard_CopyTemplateParameter( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TemplateParameter  ==>
  	      printGuard_CopyTemplateParameter( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$TemplateParameter)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$TemplateParameter && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$TemplateParameter
  		&& printGuard_CopyTemplateParameter( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyTemplateParameter( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$TemplateParameter
  }  
  
procedure CopyTemplateParameterSubstitution_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TemplateParameterSubstitution  ==>
      printGuard_CopyTemplateParameterSubstitution( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TemplateParameterSubstitution  ==>
  	      printGuard_CopyTemplateParameterSubstitution( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$TemplateParameterSubstitution)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$TemplateParameterSubstitution && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$TemplateParameterSubstitution
  		&& printGuard_CopyTemplateParameterSubstitution( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyTemplateParameterSubstitution( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$TemplateParameterSubstitution
  }  
  
procedure CopyTemplateSignature_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TemplateSignature  ==>
      printGuard_CopyTemplateSignature( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TemplateSignature  ==>
  	      printGuard_CopyTemplateSignature( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$TemplateSignature)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$TemplateSignature && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$TemplateSignature
  		&& printGuard_CopyTemplateSignature( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyTemplateSignature( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$TemplateSignature
  }  
  
procedure CopyTestIdentityAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TestIdentityAction  ==>
      printGuard_CopyTestIdentityAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TestIdentityAction  ==>
  	      printGuard_CopyTestIdentityAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$TestIdentityAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$TestIdentityAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$TestIdentityAction
  		&& printGuard_CopyTestIdentityAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyTestIdentityAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$TestIdentityAction
  }  
  
procedure CopyTimeConstraint_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TimeConstraint  ==>
      printGuard_CopyTimeConstraint( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TimeConstraint  ==>
  	      printGuard_CopyTimeConstraint( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$TimeConstraint)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$TimeConstraint && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$TimeConstraint
  		&& printGuard_CopyTimeConstraint( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyTimeConstraint( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$TimeConstraint
  }  
  
procedure CopyTimeEvent_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TimeEvent  ==>
      printGuard_CopyTimeEvent( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TimeEvent  ==>
  	      printGuard_CopyTimeEvent( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$TimeEvent)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$TimeEvent && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$TimeEvent
  		&& printGuard_CopyTimeEvent( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyTimeEvent( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$TimeEvent
  }  
  
procedure CopyTimeExpression_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TimeExpression  ==>
      printGuard_CopyTimeExpression( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TimeExpression  ==>
  	      printGuard_CopyTimeExpression( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$TimeExpression)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$TimeExpression && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$TimeExpression
  		&& printGuard_CopyTimeExpression( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyTimeExpression( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$TimeExpression
  }  
  
procedure CopyTimeInterval_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TimeInterval  ==>
      printGuard_CopyTimeInterval( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TimeInterval  ==>
  	      printGuard_CopyTimeInterval( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$TimeInterval)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$TimeInterval && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$TimeInterval
  		&& printGuard_CopyTimeInterval( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyTimeInterval( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$TimeInterval
  }  
  
procedure CopyTimeObservation_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TimeObservation  ==>
      printGuard_CopyTimeObservation( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$TimeObservation  ==>
  	      printGuard_CopyTimeObservation( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$TimeObservation)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$TimeObservation && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$TimeObservation
  		&& printGuard_CopyTimeObservation( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyTimeObservation( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$TimeObservation
  }  
  
procedure CopyTransition_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Transition  ==>
      printGuard_CopyTransition( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Transition  ==>
  	      printGuard_CopyTransition( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Transition)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Transition && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Transition
  		&& printGuard_CopyTransition( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyTransition( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Transition
  }  
  
procedure CopyTrigger_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Trigger  ==>
      printGuard_CopyTrigger( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Trigger  ==>
  	      printGuard_CopyTrigger( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Trigger)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Trigger && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Trigger
  		&& printGuard_CopyTrigger( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyTrigger( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Trigger
  }  
  
procedure CopyUnmarshallAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$UnmarshallAction  ==>
      printGuard_CopyUnmarshallAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$UnmarshallAction  ==>
  	      printGuard_CopyUnmarshallAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$UnmarshallAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$UnmarshallAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$UnmarshallAction
  		&& printGuard_CopyUnmarshallAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyUnmarshallAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$UnmarshallAction
  }  
  
procedure CopyUsage_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Usage  ==>
      printGuard_CopyUsage( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Usage  ==>
  	      printGuard_CopyUsage( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Usage)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Usage && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Usage
  		&& printGuard_CopyUsage( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyUsage( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Usage
  }  
  
procedure CopyUseCase_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$UseCase  ==>
      printGuard_CopyUseCase( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$UseCase  ==>
  	      printGuard_CopyUseCase( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$UseCase)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$UseCase && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$UseCase
  		&& printGuard_CopyUseCase( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyUseCase( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$UseCase
  }  
  
procedure CopyValuePin_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ValuePin  ==>
      printGuard_CopyValuePin( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ValuePin  ==>
  	      printGuard_CopyValuePin( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ValuePin)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ValuePin && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ValuePin
  		&& printGuard_CopyValuePin( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyValuePin( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ValuePin
  }  
  
procedure CopyValueSpecificationAction_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ValueSpecificationAction  ==>
      printGuard_CopyValueSpecificationAction( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$ValueSpecificationAction  ==>
  	      printGuard_CopyValueSpecificationAction( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$ValueSpecificationAction)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$ValueSpecificationAction && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$ValueSpecificationAction
  		&& printGuard_CopyValueSpecificationAction( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyValueSpecificationAction( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$ValueSpecificationAction
  }  
  
procedure CopyVariable_matchAll() returns ();
  // detect rule conflict
  free requires (forall  s: ref  ::
     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Variable  ==>
      printGuard_CopyVariable( $srcHeap ,  s ) ==> 
        (  getTarsBySrcs(Seq#Singleton( s  )) ==null || !read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc))
  );
  modifies  $tarHeap ,  $linkHeap ;
  // rule matching outcome
  free ensures (forall  s: ref  ::
  	     s!=null && read( $srcHeap , s, alloc) && dtype(s) <: UML$Variable  ==>
  	      printGuard_CopyVariable( $srcHeap ,  s ) ==> 
  	        (    getTarsBySrcs(Seq#Singleton( s  )) !=null 
  	          && read( $tarHeap ,  getTarsBySrcs(Seq#Singleton( s  )) , alloc)
  	          && dtype( getTarsBySrcs(Seq#Singleton( s  )) ) <: UMLs$Variable)
  );
  // frame condition
  free ensures (forall<alpha> __$o: ref, __$f: Field alpha ::
  	(__$o == null 
  	|| read( $tarHeap , __$o, __$f) == read(old( $tarHeap ), __$o, __$f) 
  	||  ( dtype(__$o) <: UMLs$Variable && __$f==alloc && Seq#Length(getTarsBySrcs_inverse(__$o))==1
  		&& dtype(Seq#Index(getTarsBySrcs_inverse(__$o), 0)) <: UML$Variable
  		&& printGuard_CopyVariable( $srcHeap , Seq#Index(getTarsBySrcs_inverse(__$o), 0)) )
  	 )
  );
  free ensures $HeapSucc(old( $tarHeap ),  $tarHeap );
  free ensures $HeapSucc(old( $linkHeap ),  $linkHeap );
  free ensures surj_tar_model( $srcHeap ,  $tarHeap );
  
function printGuard_CopyVariable( __$hp : HeapType,  s: ref ): bool
  { 
  	dtype(s) == UML$Variable
  }  
  
