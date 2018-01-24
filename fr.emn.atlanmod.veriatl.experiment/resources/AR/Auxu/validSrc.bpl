
function valid_src_model($h: HeapType): bool{


(forall __statemachine : ref ::
  (__statemachine!=null && read($h, __statemachine, alloc) && dtype(__statemachine) <: HSM$StateMachine ==> 
    (read($h, __statemachine, HSM$StateMachine.transitions)!=null &&
       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __statemachine, HSM$StateMachine.transitions)) ==> 
         ($Unbox(read($h, read($h, __statemachine, HSM$StateMachine.transitions), IndexField(__i))): ref !=null 
         && read($h, $Unbox(read($h, read($h, __statemachine, HSM$StateMachine.transitions), IndexField(__i))): ref, alloc)
         && dtype($Unbox(read($h, read($h, __statemachine, HSM$StateMachine.transitions), IndexField(__i))): ref)<:HSM$Transition) ))
        
     &&(read($h, __statemachine, HSM$StateMachine.states)!=null &&
       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __statemachine, HSM$StateMachine.states)) ==> 
         ($Unbox(read($h, read($h, __statemachine, HSM$StateMachine.states), IndexField(__i))): ref !=null 
         && read($h, $Unbox(read($h, read($h, __statemachine, HSM$StateMachine.states), IndexField(__i))): ref, alloc)
         && dtype($Unbox(read($h, read($h, __statemachine, HSM$StateMachine.states), IndexField(__i))): ref)<:HSM$AbstractState) ))
        
     && true 
       
  )
)

&&

(forall __transition : ref ::
  (__transition!=null && read($h, __transition, alloc) && dtype(__transition) <: HSM$Transition ==> 
    (read($h, __transition, HSM$Transition.stateMachine)!=null && read($h, read($h, __transition, HSM$Transition.stateMachine) ,alloc) ==>
       dtype(read($h, __transition, HSM$Transition.stateMachine)) <: HSM$StateMachine ) 
     &&(read($h, __transition, HSM$Transition.source)!=null && read($h, read($h, __transition, HSM$Transition.source) ,alloc) ==>
       dtype(read($h, __transition, HSM$Transition.source)) <: HSM$AbstractState ) 
     &&(read($h, __transition, HSM$Transition.target)!=null && read($h, read($h, __transition, HSM$Transition.target) ,alloc) ==>
       dtype(read($h, __transition, HSM$Transition.target)) <: HSM$AbstractState ) 
     && true 
       
  )
)

&&

(forall __abstractstate : ref ::
  (__abstractstate!=null && read($h, __abstractstate, alloc) && dtype(__abstractstate) <: HSM$AbstractState ==> 
    (read($h, __abstractstate, HSM$AbstractState.stateMachine)!=null && read($h, read($h, __abstractstate, HSM$AbstractState.stateMachine) ,alloc) ==>
       dtype(read($h, __abstractstate, HSM$AbstractState.stateMachine)) <: HSM$StateMachine ) 
     && true 
     &&(read($h, __abstractstate, HSM$AbstractState.compositeState)!=null && read($h, read($h, __abstractstate, HSM$AbstractState.compositeState) ,alloc) ==>
       dtype(read($h, __abstractstate, HSM$AbstractState.compositeState)) <: HSM$CompositeState ) 
       
  )
)

&&

(forall __initialstate : ref ::
  (__initialstate!=null && read($h, __initialstate, alloc) && dtype(__initialstate) <: HSM$InitialState ==> true
      
  )
)

&&

(forall __regularstate : ref ::
  (__regularstate!=null && read($h, __regularstate, alloc) && dtype(__regularstate) <: HSM$RegularState ==> true
      
  )
)

&&

(forall __compositestate : ref ::
  (__compositestate!=null && read($h, __compositestate, alloc) && dtype(__compositestate) <: HSM$CompositeState ==> 
    (read($h, __compositestate, HSM$CompositeState.states)!=null &&
       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __compositestate, HSM$CompositeState.states)) ==> 
         ($Unbox(read($h, read($h, __compositestate, HSM$CompositeState.states), IndexField(__i))): ref !=null 
         && read($h, $Unbox(read($h, read($h, __compositestate, HSM$CompositeState.states), IndexField(__i))): ref, alloc)
         && dtype($Unbox(read($h, read($h, __compositestate, HSM$CompositeState.states), IndexField(__i))): ref)<:HSM$AbstractState) ))
        
       
  )
)

} 
