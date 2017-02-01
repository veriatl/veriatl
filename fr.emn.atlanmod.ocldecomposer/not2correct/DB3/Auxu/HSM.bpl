
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
	axiom (forall r: ref :: dtype(r)!=HSM$AbstractState);
const unique HSM$AbstractState.stateMachine: Field ref;
const unique HSM$AbstractState.name: Field String;
const unique HSM$AbstractState.compositeState: Field ref;

const unique HSM$InitialState: ClassName extends HSM$AbstractState complete;
	

const unique HSM$RegularState: ClassName extends HSM$AbstractState complete;
	

const unique HSM$CompositeState: ClassName extends HSM$AbstractState complete;
	
const unique HSM$CompositeState.states: Field ref;

