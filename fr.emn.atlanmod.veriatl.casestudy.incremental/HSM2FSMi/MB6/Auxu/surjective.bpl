// Eval: 
// calculate module depth : 1

// gen functions: getTarsBySrcs and its inverse
function getTarsBySrcs(Seq ref): ref;
function getTarsBySrcs_inverse(ref): Seq ref;
axiom (forall __refs: Seq ref :: { getTarsBySrcs(__refs) } getTarsBySrcs_inverse(getTarsBySrcs(__refs)) == __refs);
axiom getTarsBySrcs( Seq#Singleton(null) ) == null;


function surj_tar_model($s: HeapType, $t: HeapType): bool{		

(forall rs2: ref :: 
  rs2!=null && read($t, rs2, alloc) && dtype(rs2) == FSM$RegularState ==>
    
    (exists  rs1: ref  ::
       rs1!=null && read($s, rs1, alloc) && dtype(rs1) <: HSM$CompositeState  &&
       printGuard_CS2RS($s,  rs1 ) && 
      	 getTarsBySrcs(Seq#Singleton( rs1  ))  == rs2 )
    ||
    (exists  is1: ref  ::
       is1!=null && read($s, is1, alloc) && dtype(is1) <: HSM$InitialState  &&
       printGuard_IS2RS($s,  is1 ) && 
      	 getTarsBySrcs(Seq#Singleton( is1  ))  == rs2 )
    ||
    (exists  rs1: ref  ::
       rs1!=null && read($s, rs1, alloc) && dtype(rs1) <: HSM$RegularState  &&
       printGuard_RS2RS($s,  rs1 ) && 
      	 getTarsBySrcs(Seq#Singleton( rs1  ))  == rs2 )
)
&&
(forall is2: ref :: 
  is2!=null && read($t, is2, alloc) && dtype(is2) == FSM$InitialState ==>
    
    (exists  is1: ref  ::
       is1!=null && read($s, is1, alloc) && dtype(is1) <: HSM$InitialState  &&
       printGuard_IS2IS($s,  is1 ) && 
      	 getTarsBySrcs(Seq#Singleton( is1  ))  == is2 )
)
&&
true 
&&
true 
&&
(forall t2: ref :: 
  t2!=null && read($t, t2, alloc) && dtype(t2) == FSM$Transition ==>
    
    (exists  t1: ref  ::
       t1!=null && read($s, t1, alloc) && dtype(t1) <: HSM$Transition  &&
       printGuard_T2TA($s,  t1 ) && 
      	 getTarsBySrcs(Seq#Singleton( t1  ))  == t2 )
    ||
    (exists  t1: ref , src: ref , trg: ref , c: ref  ::
       t1!=null && read($s, t1, alloc) && dtype(t1) <: HSM$Transition  &&  src!=null && read($s, src, alloc) && dtype(src) <: HSM$AbstractState  &&  trg!=null && read($s, trg, alloc) && dtype(trg) <: HSM$CompositeState  &&  c!=null && read($s, c, alloc) && dtype(c) <: HSM$InitialState  &&
       printGuard_T2TC($s,  t1 , src , trg , c ) && 
      	 getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  ))  == t2 )
    ||
    (exists  t1: ref , src: ref , trg: ref , c: ref  ::
       t1!=null && read($s, t1, alloc) && dtype(t1) <: HSM$Transition  &&  src!=null && read($s, src, alloc) && dtype(src) <: HSM$CompositeState  &&  trg!=null && read($s, trg, alloc) && dtype(trg) <: HSM$AbstractState  &&  c!=null && read($s, c, alloc) && dtype(c) <: HSM$AbstractState  &&
       printGuard_T2TB($s,  t1 , src , trg , c ) && 
      	 getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton( t1 ), src ), trg ), c  ))  == t2 )
)
&&
true 
&&
true 
}
