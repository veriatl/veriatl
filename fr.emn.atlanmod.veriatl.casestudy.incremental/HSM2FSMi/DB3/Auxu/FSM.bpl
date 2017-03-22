// print classifier const	
const unique FSM$StateMachine: ClassName extends  complete;
const unique FSM$StateMachine.transitions: Field ref;
const unique FSM$StateMachine.states: Field ref;
const unique FSM$StateMachine.name: Field String;
const unique FSM$Transition: ClassName extends  complete;
const unique FSM$Transition.stateMachine: Field ref;
const unique FSM$Transition.source: Field ref;
const unique FSM$Transition.target: Field ref;
const unique FSM$Transition.label: Field String;
const unique FSM$AbstractState: ClassName extends  complete;
const unique FSM$AbstractState.stateMachine: Field ref;
const unique FSM$AbstractState.name: Field String;
const unique FSM$AbstractState.compositeState: Field ref;
   axiom (forall r: ref :: dtype(r)!= FSM$AbstractState);
const unique FSM$InitialState: ClassName extends FSM$AbstractState complete;
const unique FSM$RegularState: ClassName extends FSM$AbstractState complete;
const unique FSM$CompositeState: ClassName extends FSM$AbstractState complete;
const unique FSM$CompositeState.states: Field ref;

// print classifier table
axiom classifierTable[_FSM, _StateMachine] == FSM$StateMachine;
axiom classifierTable[_FSM, _Transition] == FSM$Transition;
axiom classifierTable[_FSM, _AbstractState] == FSM$AbstractState;
axiom classifierTable[_FSM, _InitialState] == FSM$InitialState;
axiom classifierTable[_FSM, _RegularState] == FSM$RegularState;
axiom classifierTable[_FSM, _CompositeState] == FSM$CompositeState;

// if src mm print valid src
