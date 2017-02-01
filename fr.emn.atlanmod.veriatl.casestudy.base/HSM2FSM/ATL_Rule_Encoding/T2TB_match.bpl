
implementation T2TB_matchAll() returns ()
{

var stk: Seq BoxType;
var $newCol: ref;
var t1: ref;	//slot: 1
var src: ref;	//slot: 2
var trg: ref;	//slot: 3
var c: ref;	//slot: 4
var self: ref;	//slot: 0
var obj#4: Seq ref;
var $counter#5: int;
var decreases#5: int;
var obj#11: Seq ref;
var $counter#12: int;
var decreases#12: int;
var obj#18: Seq ref;
var $counter#19: int;
var decreases#19: int;
var obj#25: Seq ref;
var $counter#26: int;
var decreases#26: int;
var cond#50: bool;
var obj#55: ref;
var obj#79: ref;
stk := OpCode#Aux#InitStk();

call stk := OpCode#Push(stk, _Transition);
call stk := OpCode#Push(stk, _HSM);
call stk := OpCode#Findme(stk);
call stk := OpCode#Push(stk, _IN);
call stk, obj#4 := LIB#AllInstanceFrom(stk, $srcHeap);
obj#4 := $Unbox(Seq#Index(stk, Seq#Length(stk)-1));
$counter#5:=0;
call stk := OpCode#Pop(stk);
while($counter#5<Seq#Length(obj#4)) 
invariant $counter#5 <= Seq#Length(obj#4);
invariant (forall _t1: ref :: _t1 != null && read($srcHeap, _t1, alloc) && dtype(_t1) <: HSM$Transition ==> Seq#Contains(obj#4,_t1));
invariant (forall _$counter#5: int :: 0<= _$counter#5 && _$counter#5< $counter#5 ==> true ==> (Seq#Index(obj#4,_$counter#5)!=null && read($srcHeap, Seq#Index(obj#4,_$counter#5), alloc) && dtype(Seq#Index(obj#4,_$counter#5)) <: HSM$Transition ==> (forall __src,__trg,__c:ref :: Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$CompositeState),__src) && Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$AbstractState),__trg) && Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$AbstractState),__c) ==> printGuard_T2TB($srcHeap,Seq#Index(obj#4,_$counter#5),__src,__trg,__c) ==> getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __src), __trg), __c)) != null &&read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __src), __trg), __c)), alloc) && dtype(getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __src), __trg), __c))) <: FSM$Transition)));
invariant (forall<alpha> $o : ref, $f: Field alpha :: ($o == null || read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) || ((dtype($o) <: FSM$Transition) && Seq#Length(getTarsBySrcs_inverse($o)) == 4 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$Transition && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: HSM$CompositeState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 2)) <: HSM$AbstractState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 3)) <: HSM$AbstractState && $f==alloc )));
{ decreases#5 := Seq#Length(obj#4) - $counter#5;
stk := Seq#Build(stk, $Box(Seq#Index(obj#4, $counter#5)));
call stk, t1 := OpCode#Store(stk);
call stk := OpCode#Push(stk, _CompositeState);
call stk := OpCode#Push(stk, _HSM);
call stk := OpCode#Findme(stk);
call stk := OpCode#Push(stk, _IN);
call stk, obj#11 := LIB#AllInstanceFrom(stk, $srcHeap);
obj#11 := $Unbox(Seq#Index(stk, Seq#Length(stk)-1));
$counter#12:=0;
call stk := OpCode#Pop(stk);
while($counter#12<Seq#Length(obj#11)) 
invariant $counter#5 <= Seq#Length(obj#4);
invariant (forall _t1: ref :: _t1 != null && read($srcHeap, _t1, alloc) && dtype(_t1) <: HSM$Transition ==> Seq#Contains(obj#4,_t1));
invariant (forall _$counter#5: int :: 0<= _$counter#5 && _$counter#5< $counter#5 ==> true ==> (Seq#Index(obj#4,_$counter#5)!=null && read($srcHeap, Seq#Index(obj#4,_$counter#5), alloc) && dtype(Seq#Index(obj#4,_$counter#5)) <: HSM$Transition ==> (forall __src,__trg,__c:ref :: Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$CompositeState),__src) && Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$AbstractState),__trg) && Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$AbstractState),__c) ==> printGuard_T2TB($srcHeap,Seq#Index(obj#4,_$counter#5),__src,__trg,__c) ==> getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __src), __trg), __c)) != null &&read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __src), __trg), __c)), alloc) && dtype(getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __src), __trg), __c))) <: FSM$Transition)));
invariant (forall<alpha> $o : ref, $f: Field alpha :: ($o == null || read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) || ((dtype($o) <: FSM$Transition) && Seq#Length(getTarsBySrcs_inverse($o)) == 4 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$Transition && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: HSM$CompositeState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 2)) <: HSM$AbstractState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 3)) <: HSM$AbstractState && $f==alloc )));
invariant $counter#12 <= Seq#Length(obj#11);
invariant (forall _src: ref :: _src != null && read($srcHeap, _src, alloc) && dtype(_src) <: HSM$CompositeState ==> Seq#Contains(obj#11,_src));
invariant (forall _$counter#12: int :: 0<= _$counter#12 && _$counter#12< $counter#12 ==> true ==> (Seq#Index(obj#11,_$counter#12)!=null && read($srcHeap, Seq#Index(obj#11,_$counter#12), alloc) && dtype(Seq#Index(obj#11,_$counter#12)) <: HSM$CompositeState ==> (forall __trg,__c:ref :: Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$AbstractState),__trg) && Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$AbstractState),__c) ==> printGuard_T2TB($srcHeap,Seq#Index(obj#4,$counter#5),Seq#Index(obj#11,_$counter#12),__trg,__c) ==> getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,_$counter#12)), __trg), __c)) != null &&read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,_$counter#12)), __trg), __c)), alloc) && dtype(getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,_$counter#12)), __trg), __c))) <: FSM$Transition)));
{ decreases#12 := Seq#Length(obj#11) - $counter#12;
stk := Seq#Build(stk, $Box(Seq#Index(obj#11, $counter#12)));
call stk, src := OpCode#Store(stk);
call stk := OpCode#Push(stk, _AbstractState);
call stk := OpCode#Push(stk, _HSM);
call stk := OpCode#Findme(stk);
call stk := OpCode#Push(stk, _IN);
call stk, obj#18 := LIB#AllInstanceFrom(stk, $srcHeap);
obj#18 := $Unbox(Seq#Index(stk, Seq#Length(stk)-1));
$counter#19:=0;
call stk := OpCode#Pop(stk);
while($counter#19<Seq#Length(obj#18)) 
invariant $counter#5 <= Seq#Length(obj#4);
invariant (forall _t1: ref :: _t1 != null && read($srcHeap, _t1, alloc) && dtype(_t1) <: HSM$Transition ==> Seq#Contains(obj#4,_t1));
invariant (forall _$counter#5: int :: 0<= _$counter#5 && _$counter#5< $counter#5 ==> true ==> (Seq#Index(obj#4,_$counter#5)!=null && read($srcHeap, Seq#Index(obj#4,_$counter#5), alloc) && dtype(Seq#Index(obj#4,_$counter#5)) <: HSM$Transition ==> (forall __src,__trg,__c:ref :: Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$CompositeState),__src) && Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$AbstractState),__trg) && Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$AbstractState),__c) ==> printGuard_T2TB($srcHeap,Seq#Index(obj#4,_$counter#5),__src,__trg,__c) ==> getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __src), __trg), __c)) != null &&read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __src), __trg), __c)), alloc) && dtype(getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __src), __trg), __c))) <: FSM$Transition)));
invariant (forall<alpha> $o : ref, $f: Field alpha :: ($o == null || read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) || ((dtype($o) <: FSM$Transition) && Seq#Length(getTarsBySrcs_inverse($o)) == 4 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$Transition && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: HSM$CompositeState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 2)) <: HSM$AbstractState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 3)) <: HSM$AbstractState && $f==alloc )));
invariant $counter#12 <= Seq#Length(obj#11);
invariant (forall _src: ref :: _src != null && read($srcHeap, _src, alloc) && dtype(_src) <: HSM$CompositeState ==> Seq#Contains(obj#11,_src));
invariant (forall _$counter#12: int :: 0<= _$counter#12 && _$counter#12< $counter#12 ==> true ==> (Seq#Index(obj#11,_$counter#12)!=null && read($srcHeap, Seq#Index(obj#11,_$counter#12), alloc) && dtype(Seq#Index(obj#11,_$counter#12)) <: HSM$CompositeState ==> (forall __trg,__c:ref :: Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$AbstractState),__trg) && Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$AbstractState),__c) ==> printGuard_T2TB($srcHeap,Seq#Index(obj#4,$counter#5),Seq#Index(obj#11,_$counter#12),__trg,__c) ==> getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,_$counter#12)), __trg), __c)) != null &&read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,_$counter#12)), __trg), __c)), alloc) && dtype(getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,_$counter#12)), __trg), __c))) <: FSM$Transition)));
invariant $counter#19 <= Seq#Length(obj#18);
invariant (forall _trg: ref :: _trg != null && read($srcHeap, _trg, alloc) && dtype(_trg) <: HSM$AbstractState ==> Seq#Contains(obj#18,_trg));
invariant (forall _$counter#19: int :: 0<= _$counter#19 && _$counter#19< $counter#19 ==> true ==> (Seq#Index(obj#18,_$counter#19)!=null && read($srcHeap, Seq#Index(obj#18,_$counter#19), alloc) && dtype(Seq#Index(obj#18,_$counter#19)) <: HSM$AbstractState ==> (forall __c:ref :: Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$AbstractState),__c) ==> printGuard_T2TB($srcHeap,Seq#Index(obj#4,$counter#5),Seq#Index(obj#11,$counter#12),Seq#Index(obj#18,_$counter#19),__c) ==> getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,$counter#12)), Seq#Index(obj#18,_$counter#19)), __c)) != null &&read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,$counter#12)), Seq#Index(obj#18,_$counter#19)), __c)), alloc) && dtype(getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,$counter#12)), Seq#Index(obj#18,_$counter#19)), __c))) <: FSM$Transition)));
{ decreases#19 := Seq#Length(obj#18) - $counter#19;
stk := Seq#Build(stk, $Box(Seq#Index(obj#18, $counter#19)));
call stk, trg := OpCode#Store(stk);
call stk := OpCode#Push(stk, _AbstractState);
call stk := OpCode#Push(stk, _HSM);
call stk := OpCode#Findme(stk);
call stk := OpCode#Push(stk, _IN);
call stk, obj#25 := LIB#AllInstanceFrom(stk, $srcHeap);
obj#25 := $Unbox(Seq#Index(stk, Seq#Length(stk)-1));
$counter#26:=0;
call stk := OpCode#Pop(stk);
while($counter#26<Seq#Length(obj#25)) 
invariant $counter#5 <= Seq#Length(obj#4);
invariant (forall _t1: ref :: _t1 != null && read($srcHeap, _t1, alloc) && dtype(_t1) <: HSM$Transition ==> Seq#Contains(obj#4,_t1));
invariant (forall _$counter#5: int :: 0<= _$counter#5 && _$counter#5< $counter#5 ==> true ==> (Seq#Index(obj#4,_$counter#5)!=null && read($srcHeap, Seq#Index(obj#4,_$counter#5), alloc) && dtype(Seq#Index(obj#4,_$counter#5)) <: HSM$Transition ==> (forall __src,__trg,__c:ref :: Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$CompositeState),__src) && Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$AbstractState),__trg) && Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$AbstractState),__c) ==> printGuard_T2TB($srcHeap,Seq#Index(obj#4,_$counter#5),__src,__trg,__c) ==> getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __src), __trg), __c)) != null &&read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __src), __trg), __c)), alloc) && dtype(getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __src), __trg), __c))) <: FSM$Transition)));
invariant (forall<alpha> $o : ref, $f: Field alpha :: ($o == null || read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) || ((dtype($o) <: FSM$Transition) && Seq#Length(getTarsBySrcs_inverse($o)) == 4 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: HSM$Transition && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: HSM$CompositeState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 2)) <: HSM$AbstractState && dtype(Seq#Index(getTarsBySrcs_inverse($o), 3)) <: HSM$AbstractState && $f==alloc )));
invariant $counter#12 <= Seq#Length(obj#11);
invariant (forall _src: ref :: _src != null && read($srcHeap, _src, alloc) && dtype(_src) <: HSM$CompositeState ==> Seq#Contains(obj#11,_src));
invariant (forall _$counter#12: int :: 0<= _$counter#12 && _$counter#12< $counter#12 ==> true ==> (Seq#Index(obj#11,_$counter#12)!=null && read($srcHeap, Seq#Index(obj#11,_$counter#12), alloc) && dtype(Seq#Index(obj#11,_$counter#12)) <: HSM$CompositeState ==> (forall __trg,__c:ref :: Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$AbstractState),__trg) && Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$AbstractState),__c) ==> printGuard_T2TB($srcHeap,Seq#Index(obj#4,$counter#5),Seq#Index(obj#11,_$counter#12),__trg,__c) ==> getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,_$counter#12)), __trg), __c)) != null &&read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,_$counter#12)), __trg), __c)), alloc) && dtype(getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,_$counter#12)), __trg), __c))) <: FSM$Transition)));
invariant $counter#19 <= Seq#Length(obj#18);
invariant (forall _trg: ref :: _trg != null && read($srcHeap, _trg, alloc) && dtype(_trg) <: HSM$AbstractState ==> Seq#Contains(obj#18,_trg));
invariant (forall _$counter#19: int :: 0<= _$counter#19 && _$counter#19< $counter#19 ==> true ==> (Seq#Index(obj#18,_$counter#19)!=null && read($srcHeap, Seq#Index(obj#18,_$counter#19), alloc) && dtype(Seq#Index(obj#18,_$counter#19)) <: HSM$AbstractState ==> (forall __c:ref :: Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),HSM$AbstractState),__c) ==> printGuard_T2TB($srcHeap,Seq#Index(obj#4,$counter#5),Seq#Index(obj#11,$counter#12),Seq#Index(obj#18,_$counter#19),__c) ==> getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,$counter#12)), Seq#Index(obj#18,_$counter#19)), __c)) != null &&read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,$counter#12)), Seq#Index(obj#18,_$counter#19)), __c)), alloc) && dtype(getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,$counter#12)), Seq#Index(obj#18,_$counter#19)), __c))) <: FSM$Transition)));
invariant $counter#26 <= Seq#Length(obj#25);
invariant (forall _c: ref :: _c != null && read($srcHeap, _c, alloc) && dtype(_c) <: HSM$AbstractState ==> Seq#Contains(obj#25,_c));
invariant (forall _$counter#26: int :: 0<= _$counter#26 && _$counter#26< $counter#26 ==> true ==> (Seq#Index(obj#25,_$counter#26)!=null && read($srcHeap, Seq#Index(obj#25,_$counter#26), alloc) && dtype(Seq#Index(obj#25,_$counter#26)) <: HSM$AbstractState ==>printGuard_T2TB($srcHeap,Seq#Index(obj#4,$counter#5),Seq#Index(obj#11,$counter#12),Seq#Index(obj#18,$counter#19),Seq#Index(obj#25,_$counter#26)) ==> getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,$counter#12)), Seq#Index(obj#18,$counter#19)), Seq#Index(obj#25,_$counter#26))) != null &&read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,$counter#12)), Seq#Index(obj#18,$counter#19)), Seq#Index(obj#25,_$counter#26))), alloc) && dtype(getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,$counter#12)), Seq#Index(obj#18,$counter#19)), Seq#Index(obj#25,_$counter#26)))) <: FSM$Transition));
{ decreases#26 := Seq#Length(obj#25) - $counter#26;
stk := Seq#Build(stk, $Box(Seq#Index(obj#25, $counter#26)));
call stk, c := OpCode#Store(stk);
call stk := OpCode#Load(stk, t1);
assert Seq#Length(stk) >= 1;
assert $Unbox(Seq#Index(stk, Seq#Length(stk)-1)) != null;
assert read($srcHeap, $Unbox(Seq#Index(stk, Seq#Length(stk)-1)),alloc);
stk := Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(read($srcHeap,$Unbox(Seq#Index(stk, Seq#Length(stk)-1)),HSM$Transition.source)));
call stk := OpCode#Load(stk, src);
call stk := OCLAny#Equal(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-2)): ref,$Unbox(Seq#Index(stk, Seq#Length(stk)-1)): ref);
call stk := OpCode#Load(stk, t1);
assert Seq#Length(stk) >= 1;
assert $Unbox(Seq#Index(stk, Seq#Length(stk)-1)) != null;
assert read($srcHeap, $Unbox(Seq#Index(stk, Seq#Length(stk)-1)),alloc);
stk := Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(read($srcHeap,$Unbox(Seq#Index(stk, Seq#Length(stk)-1)),HSM$Transition.target)));
call stk := OpCode#Load(stk, trg);
call stk := OCLAny#Equal(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-2)): ref,$Unbox(Seq#Index(stk, Seq#Length(stk)-1)): ref);
call stk := OCLAny#And(stk);
call stk := OpCode#Load(stk, c);
assert Seq#Length(stk) >= 1;
assert $Unbox(Seq#Index(stk, Seq#Length(stk)-1)) != null;
assert read($srcHeap, $Unbox(Seq#Index(stk, Seq#Length(stk)-1)),alloc);
stk := Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(read($srcHeap,$Unbox(Seq#Index(stk, Seq#Length(stk)-1)),HSM$AbstractState.compositeState)));
call stk := OpCode#Load(stk, src);
call stk := OCLAny#Equal(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-2)): ref,$Unbox(Seq#Index(stk, Seq#Length(stk)-1)): ref);
call stk := OCLAny#And(stk);
call stk := OpCode#Load(stk, trg);
call stk := OpCode#Push(stk, _CompositeState);
call stk := OpCode#Push(stk, _HSM);
call stk := OpCode#Findme(stk);
call stk := OCLAny#IsTypeof(stk);
call stk := OCLAny#Not(stk);
call stk := OCLAny#And(stk);
call stk := OCL#Boolean#Not(stk);
cond#50 := $Unbox(Seq#Index(stk, Seq#Length(stk)-1));
call stk := OpCode#Pop(stk);
if(cond#50){goto label_83;}
label_51:
call stk := OpCode#GetASM(stk);
assert Seq#Length(stk) >= 1;
assert $Unbox(Seq#Index(stk, Seq#Length(stk)-1)) != null;
stk := Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(read($linkHeap,$Unbox(Seq#Index(stk, Seq#Length(stk)-1)),ASM.links)));
call stk := OpCode#Push(stk, _TransientLink);
call stk := OpCode#Push(stk, _#native);
assert Seq#Length(stk) >= 2;
havoc obj#55;
assume obj#55!= null && !read($linkHeap, obj#55, alloc) && dtype(obj#55) == classifierTable[($Unbox(Seq#Index(stk, Seq#Length(stk)-1)): String),($Unbox(Seq#Index(stk, Seq#Length(stk)-2)): String)];
$linkHeap := update($linkHeap, obj#55, alloc, true);
assume $IsGoodHeap($linkHeap);
assume $HeapSucc(old($linkHeap), $linkHeap);
stk := Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(obj#55));

call stk := OpCode#Dup(stk);
call stk := OpCode#Push(stk, _T2TB);
call stk := NTransientLink#setRule(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-2)),$Unbox(Seq#Index(stk, Seq#Length(stk)-1)));
call stk := OpCode#Dup(stk);
call stk := OpCode#Push(stk, _t1);
call stk := OpCode#Load(stk, t1);
call stk := NTransientLink#addSourceElement(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-3)),$Unbox(Seq#Index(stk, Seq#Length(stk)-2)),$Unbox(Seq#Index(stk, Seq#Length(stk)-1)));
call stk := OpCode#Dup(stk);
call stk := OpCode#Push(stk, _src);
call stk := OpCode#Load(stk, src);
call stk := NTransientLink#addSourceElement(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-3)),$Unbox(Seq#Index(stk, Seq#Length(stk)-2)),$Unbox(Seq#Index(stk, Seq#Length(stk)-1)));
call stk := OpCode#Dup(stk);
call stk := OpCode#Push(stk, _trg);
call stk := OpCode#Load(stk, trg);
call stk := NTransientLink#addSourceElement(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-3)),$Unbox(Seq#Index(stk, Seq#Length(stk)-2)),$Unbox(Seq#Index(stk, Seq#Length(stk)-1)));
call stk := OpCode#Dup(stk);
call stk := OpCode#Push(stk, _c);
call stk := OpCode#Load(stk, c);
call stk := NTransientLink#addSourceElement(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-3)),$Unbox(Seq#Index(stk, Seq#Length(stk)-2)),$Unbox(Seq#Index(stk, Seq#Length(stk)-1)));
call stk := OpCode#Dup(stk);
call stk := OpCode#Push(stk, _t2);
call stk := OpCode#Push(stk, _Transition);
call stk := OpCode#Push(stk, _FSM);
assert Seq#Length(stk) >= 2;
havoc obj#79;
assume obj#79!= null && !read($tarHeap, obj#79, alloc) && dtype(obj#79) == classifierTable[($Unbox(Seq#Index(stk, Seq#Length(stk)-1)): String),($Unbox(Seq#Index(stk, Seq#Length(stk)-2)): String)];
$tarHeap := update($tarHeap, obj#79, alloc, true);
assume $IsGoodHeap($tarHeap);
assume $HeapSucc(old($tarHeap), $tarHeap);
assume getTarsBySrcs(Seq#Build(Seq#Build(Seq#Build(Seq#Singleton(t1),src),trg),c)) == obj#79;
stk := Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(obj#79));

call stk := NTransientLink#addTargetElement(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-3)),$Unbox(Seq#Index(stk, Seq#Length(stk)-2)),$Unbox(Seq#Index(stk, Seq#Length(stk)-1)));
call stk := OpCode#Pusht(stk);
stk := Seq#Take(stk, Seq#Length(stk)-3);
label_83:
$counter#26 := $counter#26+1;
assert 0<= decreases#26 || Seq#Length(obj#25) - $counter#26 == decreases#26;
assert Seq#Length(obj#25) - $counter#26 < decreases#26;
}
$counter#19 := $counter#19+1;
assert 0<= decreases#19 || Seq#Length(obj#18) - $counter#19 == decreases#19;
assert Seq#Length(obj#18) - $counter#19 < decreases#19;
}
$counter#12 := $counter#12+1;
assert 0<= decreases#12 || Seq#Length(obj#11) - $counter#12 == decreases#12;
assert Seq#Length(obj#11) - $counter#12 < decreases#12;
}
$counter#5 := $counter#5+1;
assert 0<= decreases#5 || Seq#Length(obj#4) - $counter#5 == decreases#5;
assert Seq#Length(obj#4) - $counter#5 < decreases#5;
}

}
