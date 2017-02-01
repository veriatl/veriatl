
implementation RA2A_matchAll() returns ()
{

var stk: Seq BoxType;
var $newCol: ref;
var att: ref;	//slot: 1
var rs: ref;	//slot: 2
var self: ref;	//slot: 0
var obj#4: Seq ref;
var $counter#5: int;
var decreases#5: int;
var obj#11: Seq ref;
var $counter#12: int;
var decreases#12: int;
var cond#19: bool;
var obj#24: ref;
var obj#40: ref;
stk := OpCode#Aux#InitStk();

call stk := OpCode#Push(stk, _ERAttribute);
call stk := OpCode#Push(stk, _ER);
call stk := OpCode#Findme(stk);
call stk := OpCode#Push(stk, _IN);
call stk, obj#4 := LIB#AllInstanceFrom(stk, $srcHeap);
obj#4 := $Unbox(Seq#Index(stk, Seq#Length(stk)-1));
$counter#5:=0;
call stk := OpCode#Pop(stk);
while($counter#5<Seq#Length(obj#4)) 
invariant $counter#5 <= Seq#Length(obj#4);
invariant (forall _att: ref :: _att != null && read($srcHeap, _att, alloc) && dtype(_att) <: ER$ERAttribute ==> Seq#Contains(obj#4,_att));
invariant (forall _$counter#5: int :: 0<= _$counter#5 && _$counter#5< $counter#5 ==> true ==> (Seq#Index(obj#4,_$counter#5)!=null && read($srcHeap, Seq#Index(obj#4,_$counter#5), alloc) && dtype(Seq#Index(obj#4,_$counter#5)) <: ER$ERAttribute ==> (forall __rs:ref :: Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),ER$Relship),__rs) ==> printGuard_RA2A($srcHeap,Seq#Index(obj#4,_$counter#5),__rs) ==> getTarsBySrcs(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __rs)) != null &&read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __rs)), alloc) && dtype(getTarsBySrcs(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __rs))) <: REL$RELAttribute)));
invariant (forall<alpha> $o : ref, $f: Field alpha :: ($o == null || read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) || ((dtype($o) <: REL$RELAttribute) && Seq#Length(getTarsBySrcs_inverse($o)) == 2 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$ERAttribute && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: ER$Relship && $f==alloc )));
{ decreases#5 := Seq#Length(obj#4) - $counter#5;
stk := Seq#Build(stk, $Box(Seq#Index(obj#4, $counter#5)));
call stk, att := OpCode#Store(stk);
call stk := OpCode#Push(stk, _Relship);
call stk := OpCode#Push(stk, _ER);
call stk := OpCode#Findme(stk);
call stk := OpCode#Push(stk, _IN);
call stk, obj#11 := LIB#AllInstanceFrom(stk, $srcHeap);
obj#11 := $Unbox(Seq#Index(stk, Seq#Length(stk)-1));
$counter#12:=0;
call stk := OpCode#Pop(stk);
while($counter#12<Seq#Length(obj#11)) 
invariant $counter#5 <= Seq#Length(obj#4);
invariant (forall _att: ref :: _att != null && read($srcHeap, _att, alloc) && dtype(_att) <: ER$ERAttribute ==> Seq#Contains(obj#4,_att));
invariant (forall _$counter#5: int :: 0<= _$counter#5 && _$counter#5< $counter#5 ==> true ==> (Seq#Index(obj#4,_$counter#5)!=null && read($srcHeap, Seq#Index(obj#4,_$counter#5), alloc) && dtype(Seq#Index(obj#4,_$counter#5)) <: ER$ERAttribute ==> (forall __rs:ref :: Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),ER$Relship),__rs) ==> printGuard_RA2A($srcHeap,Seq#Index(obj#4,_$counter#5),__rs) ==> getTarsBySrcs(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __rs)) != null &&read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __rs)), alloc) && dtype(getTarsBySrcs(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __rs))) <: REL$RELAttribute)));
invariant (forall<alpha> $o : ref, $f: Field alpha :: ($o == null || read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) || ((dtype($o) <: REL$RELAttribute) && Seq#Length(getTarsBySrcs_inverse($o)) == 2 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$ERAttribute && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: ER$Relship && $f==alloc )));
invariant $counter#12 <= Seq#Length(obj#11);
invariant (forall _rs: ref :: _rs != null && read($srcHeap, _rs, alloc) && dtype(_rs) <: ER$Relship ==> Seq#Contains(obj#11,_rs));
invariant (forall _$counter#12: int :: 0<= _$counter#12 && _$counter#12< $counter#12 ==> true ==> (Seq#Index(obj#11,_$counter#12)!=null && read($srcHeap, Seq#Index(obj#11,_$counter#12), alloc) && dtype(Seq#Index(obj#11,_$counter#12)) <: ER$Relship ==>printGuard_RA2A($srcHeap,Seq#Index(obj#4,$counter#5),Seq#Index(obj#11,_$counter#12)) ==> getTarsBySrcs(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,_$counter#12))) != null &&read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,_$counter#12))), alloc) && dtype(getTarsBySrcs(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,_$counter#12)))) <: REL$RELAttribute));
{ decreases#12 := Seq#Length(obj#11) - $counter#12;
stk := Seq#Build(stk, $Box(Seq#Index(obj#11, $counter#12)));
call stk, rs := OpCode#Store(stk);
call stk := OpCode#Load(stk, att);
assert Seq#Length(stk) >= 1;
assert $Unbox(Seq#Index(stk, Seq#Length(stk)-1)) != null;
assert read($srcHeap, $Unbox(Seq#Index(stk, Seq#Length(stk)-1)),alloc);
stk := Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(read($srcHeap,$Unbox(Seq#Index(stk, Seq#Length(stk)-1)),ER$ERAttribute.relship)));
call stk := OpCode#Load(stk, rs);
call stk := OCLAny#Equal(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-2)): ref,$Unbox(Seq#Index(stk, Seq#Length(stk)-1)): ref);
call stk := OCL#Boolean#Not(stk);
cond#19 := $Unbox(Seq#Index(stk, Seq#Length(stk)-1));
call stk := OpCode#Pop(stk);
if(cond#19){goto label_44;}
label_20:
call stk := OpCode#GetASM(stk);
assert Seq#Length(stk) >= 1;
assert $Unbox(Seq#Index(stk, Seq#Length(stk)-1)) != null;
stk := Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(read($linkHeap,$Unbox(Seq#Index(stk, Seq#Length(stk)-1)),ASM.links)));
call stk := OpCode#Push(stk, _TransientLink);
call stk := OpCode#Push(stk, _#native);
assert Seq#Length(stk) >= 2;
havoc obj#24;
assume obj#24!= null && !read($linkHeap, obj#24, alloc) && dtype(obj#24) == classifierTable[($Unbox(Seq#Index(stk, Seq#Length(stk)-1)): String),($Unbox(Seq#Index(stk, Seq#Length(stk)-2)): String)];
$linkHeap := update($linkHeap, obj#24, alloc, true);
assume $IsGoodHeap($linkHeap);
assume $HeapSucc(old($linkHeap), $linkHeap);
stk := Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(obj#24));

call stk := OpCode#Dup(stk);
call stk := OpCode#Push(stk, _RA2A);
call stk := NTransientLink#setRule(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-2)),$Unbox(Seq#Index(stk, Seq#Length(stk)-1)));
call stk := OpCode#Dup(stk);
call stk := OpCode#Push(stk, _att);
call stk := OpCode#Load(stk, att);
call stk := NTransientLink#addSourceElement(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-3)),$Unbox(Seq#Index(stk, Seq#Length(stk)-2)),$Unbox(Seq#Index(stk, Seq#Length(stk)-1)));
call stk := OpCode#Dup(stk);
call stk := OpCode#Push(stk, _rs);
call stk := OpCode#Load(stk, rs);
call stk := NTransientLink#addSourceElement(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-3)),$Unbox(Seq#Index(stk, Seq#Length(stk)-2)),$Unbox(Seq#Index(stk, Seq#Length(stk)-1)));
call stk := OpCode#Dup(stk);
call stk := OpCode#Push(stk, _t);
call stk := OpCode#Push(stk, _RELAttribute);
call stk := OpCode#Push(stk, _REL);
assert Seq#Length(stk) >= 2;
havoc obj#40;
assume obj#40!= null && !read($tarHeap, obj#40, alloc) && dtype(obj#40) == classifierTable[($Unbox(Seq#Index(stk, Seq#Length(stk)-1)): String),($Unbox(Seq#Index(stk, Seq#Length(stk)-2)): String)];
$tarHeap := update($tarHeap, obj#40, alloc, true);
assume $IsGoodHeap($tarHeap);
assume $HeapSucc(old($tarHeap), $tarHeap);
assume getTarsBySrcs(Seq#Build(Seq#Singleton(att),rs)) == obj#40;
stk := Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(obj#40));

call stk := NTransientLink#addTargetElement(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-3)),$Unbox(Seq#Index(stk, Seq#Length(stk)-2)),$Unbox(Seq#Index(stk, Seq#Length(stk)-1)));
call stk := OpCode#Pusht(stk);
stk := Seq#Take(stk, Seq#Length(stk)-3);
label_44:
$counter#12 := $counter#12+1;
assert 0<= decreases#12 || Seq#Length(obj#11) - $counter#12 == decreases#12;
assert Seq#Length(obj#11) - $counter#12 < decreases#12;
}
$counter#5 := $counter#5+1;
assert 0<= decreases#5 || Seq#Length(obj#4) - $counter#5 == decreases#5;
assert Seq#Length(obj#4) - $counter#5 < decreases#5;
}

}
