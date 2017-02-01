function surj_tar_model($s: HeapType, $t: HeapType): bool{



(forall sm2: ref :: 
  sm2!=null && read($t, sm2, alloc) && dtype(sm2) == FSM$StateMachine ==>
   
   		

(exists sm1: ref :: 
sm1!=null && read($s, sm1, alloc) && dtype(sm1) <: HSM$StateMachine 
 &&  true  &&
  getTarsBySrcs(Seq#Singleton(sm1)) == sm2)

   
)


&&


(forall rs2: ref :: 
  rs2!=null && read($t, rs2, alloc) && dtype(rs2) == FSM$RegularState ==>
   
   		

(exists rs1: ref :: 
rs1!=null && read($s, rs1, alloc) && dtype(rs1) <: HSM$RegularState 
 &&  true  &&
  getTarsBySrcs(Seq#Singleton(rs1)) == rs2)

   ||
   		

(exists is1: ref :: 
is1!=null && read($s, is1, alloc) && dtype(is1) <: HSM$InitialState 
 &&  !((read($s, is1, HSM$AbstractState.compositeState)==null || !read($s,read($s, is1, HSM$AbstractState.compositeState),alloc)))  &&
  getTarsBySrcs(Seq#Singleton(is1)) == rs2)

   
)


&&


(forall is2: ref :: 
  is2!=null && read($t, is2, alloc) && dtype(is2) == FSM$InitialState ==>
   
   		

(exists is1: ref :: 
is1!=null && read($s, is1, alloc) && dtype(is1) <: HSM$InitialState 
 &&  (read($s, is1, HSM$AbstractState.compositeState)==null || !read($s,read($s, is1, HSM$AbstractState.compositeState),alloc))  &&
  getTarsBySrcs(Seq#Singleton(is1)) == is2)

   
)


&&


true


&&


(forall t2: ref :: 
  t2!=null && read($t, t2, alloc) && dtype(t2) == FSM$Transition ==>
   
   		

(exists t1: ref :: 
t1!=null && read($s, t1, alloc) && dtype(t1) <: HSM$Transition 
 &&  !(dtype(read($s, t1, HSM$Transition.source)) == HSM$CompositeState) && !(dtype(read($s, t1, HSM$Transition.target)) == HSM$CompositeState)  &&
  getTarsBySrcs(Seq#Singleton(t1)) == t2)

   ||
   		

(exists t1,src,trg,c: ref :: 
t1!=null && read($s, t1, alloc) && dtype(t1) <: HSM$Transition 
 && src!=null && read($s, src, alloc) && dtype(src) <: HSM$CompositeState 
 && trg!=null && read($s, trg, alloc) && dtype(trg) <: HSM$AbstractState 
 && c!=null && read($s, c, alloc) && dtype(c) <: HSM$AbstractState 
 &&  read($s, t1, HSM$Transition.source) == src && read($s, t1, HSM$Transition.target) == trg && read($s, c, HSM$AbstractState.compositeState) == src  &&
  getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)) == t2)

   ||
   		

(exists t1,src,trg,c: ref :: 
t1!=null && read($s, t1, alloc) && dtype(t1) <: HSM$Transition 
 && src!=null && read($s, src, alloc) && dtype(src) <: HSM$AbstractState 
 && trg!=null && read($s, trg, alloc) && dtype(trg) <: HSM$CompositeState 
 && c!=null && read($s, c, alloc) && dtype(c) <: HSM$InitialState 
 &&  read($s, t1, HSM$Transition.source) == src && read($s, t1, HSM$Transition.target) == trg && read($s, c, HSM$AbstractState.compositeState) == trg && !(dtype(src) == HSM$CompositeState)  &&
  getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)) == t2)

   
)


&&


true


&&


true



}