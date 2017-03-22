// print classifier const	
const unique HSM$StateMachine: ClassName extends  complete;
const unique HSM$StateMachine.transitions: Field ref;
const unique HSM$StateMachine.states: Field ref;
const unique HSM$StateMachine.name: Field String;
const unique HSM$Transition: ClassName extends  complete;
const unique HSM$Transition.stateMachine: Field ref;
const unique HSM$Transition.source: Field ref;
const unique HSM$Transition.target: Field ref;
const unique HSM$Transition.label: Field String;
const unique HSM$AbstractState: ClassName extends  complete;
const unique HSM$AbstractState.stateMachine: Field ref;
const unique HSM$AbstractState.name: Field String;
const unique HSM$AbstractState.compositeState: Field ref;
   axiom (forall r: ref :: dtype(r)!= HSM$AbstractState);
const unique HSM$InitialState: ClassName extends HSM$AbstractState complete;
const unique HSM$RegularState: ClassName extends HSM$AbstractState complete;
const unique HSM$CompositeState: ClassName extends HSM$AbstractState complete;
const unique HSM$CompositeState.states: Field ref;

// print classifier table
axiom classifierTable[_HSM, _StateMachine] == HSM$StateMachine;
axiom classifierTable[_HSM, _Transition] == HSM$Transition;
axiom classifierTable[_HSM, _AbstractState] == HSM$AbstractState;
axiom classifierTable[_HSM, _InitialState] == HSM$InitialState;
axiom classifierTable[_HSM, _RegularState] == HSM$RegularState;
axiom classifierTable[_HSM, _CompositeState] == HSM$CompositeState;

// if src mm print valid src
function valid_src_model($h: HeapType): bool{
	(forall __statemachine : ref ::
	  (__statemachine!=null && read($h, __statemachine, alloc) && dtype(__statemachine) <: HSM$StateMachine ==> 
	    (read($h, __statemachine, HSM$StateMachine.transitions)==null || (read($h, read($h, __statemachine, HSM$StateMachine.transitions), alloc) && dtype(read($h, __statemachine, HSM$StateMachine.transitions)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __statemachine, HSM$StateMachine.transitions)) ==> 
	         ($Unbox(read($h, read($h, __statemachine, HSM$StateMachine.transitions), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __statemachine, HSM$StateMachine.transitions), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __statemachine, HSM$StateMachine.transitions), IndexField(__i))): ref)<:HSM$Transition) ) ) )&&
	    (read($h, __statemachine, HSM$StateMachine.states)==null || (read($h, read($h, __statemachine, HSM$StateMachine.states), alloc) && dtype(read($h, __statemachine, HSM$StateMachine.states)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __statemachine, HSM$StateMachine.states)) ==> 
	         ($Unbox(read($h, read($h, __statemachine, HSM$StateMachine.states), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __statemachine, HSM$StateMachine.states), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __statemachine, HSM$StateMachine.states), IndexField(__i))): ref)<:HSM$AbstractState) ) ) )&&
	 true 
	  )
	)
	&&(forall __transition : ref ::
	  (__transition!=null && read($h, __transition, alloc) && dtype(__transition) <: HSM$Transition ==> 
	    (read($h, __transition, HSM$Transition.stateMachine)!=null && read($h, read($h, __transition, HSM$Transition.stateMachine) ,alloc) ==>
	       dtype(read($h, __transition, HSM$Transition.stateMachine)) <: HSM$StateMachine ) &&
	    (read($h, __transition, HSM$Transition.source)!=null && read($h, read($h, __transition, HSM$Transition.source) ,alloc) ==>
	       dtype(read($h, __transition, HSM$Transition.source)) <: HSM$AbstractState ) &&
	    (read($h, __transition, HSM$Transition.target)!=null && read($h, read($h, __transition, HSM$Transition.target) ,alloc) ==>
	       dtype(read($h, __transition, HSM$Transition.target)) <: HSM$AbstractState ) &&
	 true 
	  )
	)
	&&(forall __abstractstate : ref ::
	  (__abstractstate!=null && read($h, __abstractstate, alloc) && dtype(__abstractstate) <: HSM$AbstractState ==> 
	    (read($h, __abstractstate, HSM$AbstractState.stateMachine)!=null && read($h, read($h, __abstractstate, HSM$AbstractState.stateMachine) ,alloc) ==>
	       dtype(read($h, __abstractstate, HSM$AbstractState.stateMachine)) <: HSM$StateMachine ) &&
	 true &&
	    (read($h, __abstractstate, HSM$AbstractState.compositeState)!=null && read($h, read($h, __abstractstate, HSM$AbstractState.compositeState) ,alloc) ==>
	       dtype(read($h, __abstractstate, HSM$AbstractState.compositeState)) <: HSM$CompositeState ) 
	  )
	)
	&&(forall __initialstate : ref ::
	  (__initialstate!=null && read($h, __initialstate, alloc) && dtype(__initialstate) <: HSM$InitialState ==> true
	  )
	)
	&&(forall __regularstate : ref ::
	  (__regularstate!=null && read($h, __regularstate, alloc) && dtype(__regularstate) <: HSM$RegularState ==> true
	  )
	)
	&&(forall __compositestate : ref ::
	  (__compositestate!=null && read($h, __compositestate, alloc) && dtype(__compositestate) <: HSM$CompositeState ==> 
	    (read($h, __compositestate, HSM$CompositeState.states)==null || (read($h, read($h, __compositestate, HSM$CompositeState.states), alloc) && dtype(read($h, __compositestate, HSM$CompositeState.states)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __compositestate, HSM$CompositeState.states)) ==> 
	         ($Unbox(read($h, read($h, __compositestate, HSM$CompositeState.states), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __compositestate, HSM$CompositeState.states), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __compositestate, HSM$CompositeState.states), IndexField(__i))): ref)<:HSM$AbstractState) ) ) )
	  )
	)
} 
