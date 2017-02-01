
implementation RA2AK_matchAll() returns ()
{

var stk: Seq BoxType;
var $newCol: ref;
var att: ref;	//slot: 1
var rse: ref;	//slot: 2
var self: ref;	//slot: 0
var obj#4: Seq ref;
var $counter#5: int;
var decreases#5: int;
var obj#11: Seq ref;
var $counter#12: int;
var decreases#12: int;
var cond#25: bool;
var obj#30: ref;
var obj#46: ref;
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
invariant (forall _$counter#5: int :: 0<= _$counter#5 && _$counter#5< $counter#5 ==> true ==> (Seq#Index(obj#4,_$counter#5)!=null && read($srcHeap, Seq#Index(obj#4,_$counter#5), alloc) && dtype(Seq#Index(obj#4,_$counter#5)) <: ER$ERAttribute ==> (forall __rse:ref :: Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),ER$RelshipEnd),__rse) ==> printGuard_RA2AK($srcHeap,Seq#Index(obj#4,_$counter#5),__rse) ==> getTarsBySrcs(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __rse)) != null &&read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __rse)), alloc) && dtype(getTarsBySrcs(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __rse))) <: REL$RELAttribute)));
invariant (forall<alpha> $o : ref, $f: Field alpha :: ($o == null || read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) || ((dtype($o) <: REL$RELAttribute) && Seq#Length(getTarsBySrcs_inverse($o)) == 2 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$ERAttribute && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: ER$RelshipEnd && $f==alloc )));
{ decreases#5 := Seq#Length(obj#4) - $counter#5;
stk := Seq#Build(stk, $Box(Seq#Index(obj#4, $counter#5)));
call stk, att := OpCode#Store(stk);
call stk := OpCode#Push(stk, _RelshipEnd);
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
invariant (forall _$counter#5: int :: 0<= _$counter#5 && _$counter#5< $counter#5 ==> true ==> (Seq#Index(obj#4,_$counter#5)!=null && read($srcHeap, Seq#Index(obj#4,_$counter#5), alloc) && dtype(Seq#Index(obj#4,_$counter#5)) <: ER$ERAttribute ==> (forall __rse:ref :: Seq#Contains(Fun#LIB#AllInstanceFrom(old($srcHeap),ER$RelshipEnd),__rse) ==> printGuard_RA2AK($srcHeap,Seq#Index(obj#4,_$counter#5),__rse) ==> getTarsBySrcs(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __rse)) != null &&read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __rse)), alloc) && dtype(getTarsBySrcs(Seq#Build(Seq#Singleton(Seq#Index(obj#4,_$counter#5)), __rse))) <: REL$RELAttribute)));
invariant (forall<alpha> $o : ref, $f: Field alpha :: ($o == null || read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) || ((dtype($o) <: REL$RELAttribute) && Seq#Length(getTarsBySrcs_inverse($o)) == 2 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$ERAttribute && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: ER$RelshipEnd && $f==alloc )));
invariant $counter#12 <= Seq#Length(obj#11);
invariant (forall _rse: ref :: _rse != null && read($srcHeap, _rse, alloc) && dtype(_rse) <: ER$RelshipEnd ==> Seq#Contains(obj#11,_rse));
invariant (forall _$counter#12: int :: 0<= _$counter#12 && _$counter#12< $counter#12 ==> true ==> (Seq#Index(obj#11,_$counter#12)!=null && read($srcHeap, Seq#Index(obj#11,_$counter#12), alloc) && dtype(Seq#Index(obj#11,_$counter#12)) <: ER$RelshipEnd ==>printGuard_RA2AK($srcHeap,Seq#Index(obj#4,$counter#5),Seq#Index(obj#11,_$counter#12)) ==> getTarsBySrcs(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,_$counter#12))) != null &&read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,_$counter#12))), alloc) && dtype(getTarsBySrcs(Seq#Build(Seq#Singleton(Seq#Index(obj#4,$counter#5)), Seq#Index(obj#11,_$counter#12)))) <: REL$RELAttribute));
{ decreases#12 := Seq#Length(obj#11) - $counter#12;
stk := Seq#Build(stk, $Box(Seq#Index(obj#11, $counter#12)));
call stk, rse := OpCode#Store(stk);
call stk := OpCode#Load(stk, att);
assert Seq#Length(stk) >= 1;
assert $Unbox(Seq#Index(stk, Seq#Length(stk)-1)) != null;
assert read($srcHeap, $Unbox(Seq#Index(stk, Seq#Length(stk)-1)),alloc);
stk := Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(read($srcHeap,$Unbox(Seq#Index(stk, Seq#Length(stk)-1)),ER$ERAttribute.entity)));
call stk := OpCode#Load(stk, rse);
assert Seq#Length(stk) >= 1;
assert $Unbox(Seq#Index(stk, Seq#Length(stk)-1)) != null;
assert read($srcHeap, $Unbox(Seq#Index(stk, Seq#Length(stk)-1)),alloc);
stk := Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(read($srcHeap,$Unbox(Seq#Index(stk, Seq#Length(stk)-1)),ER$RelshipEnd.entity)));
call stk := OCLAny#Equal(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-2)): ref,$Unbox(Seq#Index(stk, Seq#Length(stk)-1)): ref);
call stk := OpCode#Load(stk, att);
assert Seq#Length(stk) >= 1;
assert $Unbox(Seq#Index(stk, Seq#Length(stk)-1)) != null;
assert read($srcHeap, $Unbox(Seq#Index(stk, Seq#Length(stk)-1)),alloc);
stk := Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(read($srcHeap,$Unbox(Seq#Index(stk, Seq#Length(stk)-1)),ER$ERAttribute.isKey)));
call stk := OpCode#Pusht(stk);
call stk := OCLAny#Equal(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-2)): ref,$Unbox(Seq#Index(stk, Seq#Length(stk)-1)): ref);
call stk := OCLAny#And(stk);
call stk := OCL#Boolean#Not(stk);
cond#25 := $Unbox(Seq#Index(stk, Seq#Length(stk)-1));
call stk := OpCode#Pop(stk);
if(cond#25){goto label_50;}
label_26:
call stk := OpCode#GetASM(stk);
assert Seq#Length(stk) >= 1;
assert $Unbox(Seq#Index(stk, Seq#Length(stk)-1)) != null;
stk := Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(read($linkHeap,$Unbox(Seq#Index(stk, Seq#Length(stk)-1)),ASM.links)));
call stk := OpCode#Push(stk, _TransientLink);
call stk := OpCode#Push(stk, _#native);
assert Seq#Length(stk) >= 2;
havoc obj#30;
assume obj#30!= null && !read($linkHeap, obj#30, alloc) && dtype(obj#30) == classifierTable[($Unbox(Seq#Index(stk, Seq#Length(stk)-1)): String),($Unbox(Seq#Index(stk, Seq#Length(stk)-2)): String)];
$linkHeap := update($linkHeap, obj#30, alloc, true);
assume $IsGoodHeap($linkHeap);
assume $HeapSucc(old($linkHeap), $linkHeap);
stk := Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(obj#30));

call stk := OpCode#Dup(stk);
call stk := OpCode#Push(stk, _RA2AK);
call stk := NTransientLink#setRule(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-2)),$Unbox(Seq#Index(stk, Seq#Length(stk)-1)));
call stk := OpCode#Dup(stk);
call stk := OpCode#Push(stk, _att);
call stk := OpCode#Load(stk, att);
call stk := NTransientLink#addSourceElement(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-3)),$Unbox(Seq#Index(stk, Seq#Length(stk)-2)),$Unbox(Seq#Index(stk, Seq#Length(stk)-1)));
call stk := OpCode#Dup(stk);
call stk := OpCode#Push(stk, _rse);
call stk := OpCode#Load(stk, rse);
call stk := NTransientLink#addSourceElement(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-3)),$Unbox(Seq#Index(stk, Seq#Length(stk)-2)),$Unbox(Seq#Index(stk, Seq#Length(stk)-1)));
call stk := OpCode#Dup(stk);
call stk := OpCode#Push(stk, _t);
call stk := OpCode#Push(stk, _RELAttribute);
call stk := OpCode#Push(stk, _REL);
assert Seq#Length(stk) >= 2;
havoc obj#46;
assume obj#46!= null && !read($tarHeap, obj#46, alloc) && dtype(obj#46) == classifierTable[($Unbox(Seq#Index(stk, Seq#Length(stk)-1)): String),($Unbox(Seq#Index(stk, Seq#Length(stk)-2)): String)];
$tarHeap := update($tarHeap, obj#46, alloc, true);
assume $IsGoodHeap($tarHeap);
assume $HeapSucc(old($tarHeap), $tarHeap);
assume getTarsBySrcs(Seq#Build(Seq#Singleton(att),rse)) == obj#46;
stk := Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(obj#46));

call stk := NTransientLink#addTargetElement(stk,$Unbox(Seq#Index(stk, Seq#Length(stk)-3)),$Unbox(Seq#Index(stk, Seq#Length(stk)-2)),$Unbox(Seq#Index(stk, Seq#Length(stk)-1)));
call stk := OpCode#Pusht(stk);
stk := Seq#Take(stk, Seq#Length(stk)-3);
label_50:
$counter#12 := $counter#12+1;
assert 0<= decreases#12 || Seq#Length(obj#11) - $counter#12 == decreases#12;
assert Seq#Length(obj#11) - $counter#12 < decreases#12;
}
$counter#5 := $counter#5+1;
assert 0<= decreases#5 || Seq#Length(obj#4) - $counter#5 == decreases#5;
assert Seq#Length(obj#4) - $counter#5 < decreases#5;
}

}
