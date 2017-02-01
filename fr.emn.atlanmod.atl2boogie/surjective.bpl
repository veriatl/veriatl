// Eval: 
// calculate module depth : 2

// gen functions: getTarsBySrcs and its inverse
function getTarsBySrcs(Seq ref): ref;
function getTarsBySrcs_inverse(ref): Seq ref;
axiom (forall __refs: Seq ref :: { getTarsBySrcs(__refs) } getTarsBySrcs_inverse(getTarsBySrcs(__refs)) == __refs);
axiom (forall __refs: Seq ref,  __$hp : HeapType :: 
  (   (getTarsBySrcs(__refs)!=null && read( __$hp ,getTarsBySrcs(__refs),alloc)) 
   && (getTarsBySrcs1(__refs)!=null && read( __$hp ,getTarsBySrcs1(__refs),alloc)) )
     ==> getTarsBySrcs(__refs) != getTarsBySrcs1(__refs));
axiom (forall __refs1, __refs2: Seq ref,  __$hp : HeapType :: 
  ( (__refs1 != __refs2) 
    && (getTarsBySrcs(__refs1)!=null && read( __$hp  ,getTarsBySrcs(__refs1), alloc))
    && (getTarsBySrcs1(__refs2)!=null && read( __$hp  ,getTarsBySrcs1(__refs2), alloc)) ) 
      ==> getTarsBySrcs(__refs1) != getTarsBySrcs1(__refs2));
axiom getTarsBySrcs( Seq#Singleton(null) ) == null;

function getTarsBySrcs1(Seq ref): ref;
function getTarsBySrcs1_inverse(ref): Seq ref;
axiom (forall __refs: Seq ref :: { getTarsBySrcs1(__refs) } getTarsBySrcs1_inverse(getTarsBySrcs1(__refs)) == __refs);
axiom getTarsBySrcs1( Seq#Singleton(null) ) == null;


function surj_tar_model($s: HeapType, $t: HeapType): bool{		

(forall co: ref :: 
  co!=null && read($t, co, alloc) && dtype(co) == Persons$Community ==>
    
    (exists  c: ref  ::
       c!=null && read($s, c, alloc) && dtype(c) <: Families$Country  &&
       printGuard_Country2Community($s,  c ) && 
      	 getTarsBySrcs(Seq#Singleton( c  ))  == co )
)
&&
(forall m: ref :: 
  m!=null && read($t, m, alloc) && dtype(m) == Persons$Man ==>
    
    (exists  p: ref  ::
       p!=null && read($s, p, alloc) && dtype(p) <: Families$Parent  &&
       printGuard_Father2Man($s,  p ) && 
      	 getTarsBySrcs(Seq#Singleton( p  ))  == m )
    ||
    (exists  ch: ref  ::
       ch!=null && read($s, ch, alloc) && dtype(ch) <: Families$Child  &&
       printGuard_Son2Man($s,  ch ) && 
      	 getTarsBySrcs(Seq#Singleton( ch  ))  == m )
)
&&
(forall w: ref :: 
  w!=null && read($t, w, alloc) && dtype(w) == Persons$Woman ==>
    
    (exists  p: ref  ::
       p!=null && read($s, p, alloc) && dtype(p) <: Families$Parent  &&
       printGuard_Mother2Woman($s,  p ) && 
      	 getTarsBySrcs(Seq#Singleton( p  ))  == w )
    ||
    (exists  ch: ref  ::
       ch!=null && read($s, ch, alloc) && dtype(ch) <: Families$Child  &&
       printGuard_Daughter2Woman($s,  ch ) && 
      	 getTarsBySrcs(Seq#Singleton( ch  ))  == w )
)
&&
true 
&&
true 
&&
(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == Persons$TownHall ==>
    
    (exists  c: ref  ::
       c!=null && read($s, c, alloc) && dtype(c) <: Families$City  &&
       printGuard_City2TownHall($s,  c ) && 
      	 getTarsBySrcs(Seq#Singleton( c  ))  == t )
)&&
(forall cmt: ref :: 
  cmt!=null && read($t, cmt, alloc) && dtype(cmt) == Persons$Committee ==>
    
    (exists  c: ref  ::
       c!=null && read($s, c, alloc) && dtype(c) <: Families$City  &&
       printGuard_City2TownHall($s,  c ) && 
      	 getTarsBySrcs1(Seq#Singleton( c  ))  == cmt )
)
&&
(forall a: ref :: 
  a!=null && read($t, a, alloc) && dtype(a) == Persons$Association ==>
    
    (exists  ct: ref , cm: ref  ::
       ct!=null && read($s, ct, alloc) && dtype(ct) <: Families$City  &&  cm!=null && read($s, cm, alloc) && dtype(cm) <: Families$Company  &&
       printGuard_CityCompany2Association($s,  ct , cm ) && 
      	 getTarsBySrcs(Seq#Build(Seq#Singleton( ct ), cm  ))  == a )
)
&&
(forall d: ref :: 
  d!=null && read($t, d, alloc) && dtype(d) == Persons$District ==>
    
    (exists  n: ref  ::
       n!=null && read($s, n, alloc) && dtype(n) <: Families$Neighborhood  &&
       printGuard_Neighborhood2District($s,  n ) && 
      	 getTarsBySrcs(Seq#Singleton( n  ))  == d )
)
&&
(forall os: ref :: 
  os!=null && read($t, os, alloc) && dtype(os) == Persons$OrdinaryFacility ==>
    
    (exists  sch: ref , n: ref  ::
       sch!=null && read($s, sch, alloc) && dtype(sch) <: Families$School  &&  n!=null && read($s, n, alloc) && dtype(n) <: Families$Neighborhood  &&
       printGuard_createOrdinaryFacility($s,  sch , n ) && 
      	 getTarsBySrcs(Seq#Build(Seq#Singleton( sch ), n  ))  == os )
)
&&
(forall os: ref :: 
  os!=null && read($t, os, alloc) && dtype(os) == Persons$SpecialFacility ==>
    
    (exists  sch: ref , n: ref  ::
       sch!=null && read($s, sch, alloc) && dtype(sch) <: Families$School  &&  n!=null && read($s, n, alloc) && dtype(n) <: Families$Neighborhood  &&
       printGuard_createSpecialFacility($s,  sch , n ) && 
      	 getTarsBySrcs(Seq#Build(Seq#Singleton( sch ), n  ))  == os )
)
}
// We don't understand VariableDeclaration
