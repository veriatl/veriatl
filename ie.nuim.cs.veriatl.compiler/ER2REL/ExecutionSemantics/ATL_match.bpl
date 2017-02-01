
procedure init_tar_model();
modifies $tarHeap;
ensures  (forall $o: ref :: $o == null || !read($tarHeap, $o, alloc));



procedure S2S_matchAll() returns ();
  requires (forall s: ref :: s!=null && read($srcHeap, s, alloc) && dtype(s) <: ER$ERSchema ==>
 true  ==>
getTarsBySrcs(Seq#Singleton(s)) ==null || !read($tarHeap, getTarsBySrcs(Seq#Singleton(s)), alloc)); 
  modifies $tarHeap,$linkHeap;
// Rule Outcome
  ensures (forall s: ref ::
s!=null && read($srcHeap, s, alloc) && dtype(s) <: ER$ERSchema ==>
 true  ==>
getTarsBySrcs(Seq#Singleton(s)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Singleton(s)), alloc)
&& dtype(getTarsBySrcs(Seq#Singleton(s))) <: REL$RELSchema);
// Frame Condition
  ensures (forall<alpha> $o : ref, $f: Field alpha ::
	($o == null 
	|| read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) 
	|| ((dtype($o) <: REL$RELSchema) && Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$ERSchema && $f==alloc )));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures $HeapSucc(old($linkHeap), $linkHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

function printGuard_S2S(hp: HeapType, s: ref): bool
{  true  }




procedure E2R_matchAll() returns ();
  requires (forall s: ref :: s!=null && read($srcHeap, s, alloc) && dtype(s) <: ER$Entity ==>
 true  ==>
getTarsBySrcs(Seq#Singleton(s)) ==null || !read($tarHeap, getTarsBySrcs(Seq#Singleton(s)), alloc)); 
  modifies $tarHeap,$linkHeap;
// Rule Outcome
  ensures (forall s: ref ::
s!=null && read($srcHeap, s, alloc) && dtype(s) <: ER$Entity ==>
 true  ==>
getTarsBySrcs(Seq#Singleton(s)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Singleton(s)), alloc)
&& dtype(getTarsBySrcs(Seq#Singleton(s))) <: REL$Relation);
// Frame Condition
  ensures (forall<alpha> $o : ref, $f: Field alpha ::
	($o == null 
	|| read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) 
	|| ((dtype($o) <: REL$Relation) && Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$Entity && $f==alloc )));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures $HeapSucc(old($linkHeap), $linkHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

function printGuard_E2R(hp: HeapType, s: ref): bool
{  true  }




procedure R2R_matchAll() returns ();
  requires (forall s: ref :: s!=null && read($srcHeap, s, alloc) && dtype(s) <: ER$Relship ==>
 true  ==>
getTarsBySrcs(Seq#Singleton(s)) ==null || !read($tarHeap, getTarsBySrcs(Seq#Singleton(s)), alloc)); 
  modifies $tarHeap,$linkHeap;
// Rule Outcome
  ensures (forall s: ref ::
s!=null && read($srcHeap, s, alloc) && dtype(s) <: ER$Relship ==>
 true  ==>
getTarsBySrcs(Seq#Singleton(s)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Singleton(s)), alloc)
&& dtype(getTarsBySrcs(Seq#Singleton(s))) <: REL$Relation);
// Frame Condition
  ensures (forall<alpha> $o : ref, $f: Field alpha ::
	($o == null 
	|| read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) 
	|| ((dtype($o) <: REL$Relation) && Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$Relship && $f==alloc )));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures $HeapSucc(old($linkHeap), $linkHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

function printGuard_R2R(hp: HeapType, s: ref): bool
{  true  }




procedure EA2A_matchAll() returns ();
  requires (forall att,ent: ref :: att!=null && read($srcHeap, att, alloc) && dtype(att) <: ER$ERAttribute && ent!=null && read($srcHeap, ent, alloc) && dtype(ent) <: ER$Entity ==>
 read($srcHeap, att, ER$ERAttribute.entity) == ent  ==>
getTarsBySrcs(Seq#Build(Seq#Singleton(att),ent)) ==null || !read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(att),ent)), alloc)); 
  modifies $tarHeap,$linkHeap;
// Rule Outcome
  ensures (forall att,ent: ref ::
att!=null && read($srcHeap, att, alloc) && dtype(att) <: ER$ERAttribute && ent!=null && read($srcHeap, ent, alloc) && dtype(ent) <: ER$Entity ==>
 read($srcHeap, att, ER$ERAttribute.entity) == ent  ==>
getTarsBySrcs(Seq#Build(Seq#Singleton(att),ent)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(att),ent)), alloc)
&& dtype(getTarsBySrcs(Seq#Build(Seq#Singleton(att),ent))) <: REL$RELAttribute);
// Frame Condition
  ensures (forall<alpha> $o : ref, $f: Field alpha ::
	($o == null 
	|| read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) 
	|| ((dtype($o) <: REL$RELAttribute) && Seq#Length(getTarsBySrcs_inverse($o)) == 2 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$ERAttribute && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: ER$Entity && $f==alloc )));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures $HeapSucc(old($linkHeap), $linkHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

function printGuard_EA2A(hp: HeapType, att: ref,ent: ref): bool
{  read(hp, att, ER$ERAttribute.entity) == ent  }




procedure RA2A_matchAll() returns ();
  requires (forall att,rs: ref :: att!=null && read($srcHeap, att, alloc) && dtype(att) <: ER$ERAttribute && rs!=null && read($srcHeap, rs, alloc) && dtype(rs) <: ER$Relship ==>
 read($srcHeap, att, ER$ERAttribute.relship) == rs  ==>
getTarsBySrcs(Seq#Build(Seq#Singleton(att),rs)) ==null || !read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(att),rs)), alloc)); 
  modifies $tarHeap,$linkHeap;
// Rule Outcome
  ensures (forall att,rs: ref ::
att!=null && read($srcHeap, att, alloc) && dtype(att) <: ER$ERAttribute && rs!=null && read($srcHeap, rs, alloc) && dtype(rs) <: ER$Relship ==>
 read($srcHeap, att, ER$ERAttribute.relship) == rs  ==>
getTarsBySrcs(Seq#Build(Seq#Singleton(att),rs)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(att),rs)), alloc)
&& dtype(getTarsBySrcs(Seq#Build(Seq#Singleton(att),rs))) <: REL$RELAttribute);
// Frame Condition
  ensures (forall<alpha> $o : ref, $f: Field alpha ::
	($o == null 
	|| read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) 
	|| ((dtype($o) <: REL$RELAttribute) && Seq#Length(getTarsBySrcs_inverse($o)) == 2 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$ERAttribute && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: ER$Relship && $f==alloc )));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures $HeapSucc(old($linkHeap), $linkHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

function printGuard_RA2A(hp: HeapType, att: ref,rs: ref): bool
{  read(hp, att, ER$ERAttribute.relship) == rs  }




procedure RA2AK_matchAll() returns ();
  requires (forall att,rse: ref :: att!=null && read($srcHeap, att, alloc) && dtype(att) <: ER$ERAttribute && rse!=null && read($srcHeap, rse, alloc) && dtype(rse) <: ER$RelshipEnd ==>
 read($srcHeap, att, ER$ERAttribute.entity) == read($srcHeap, rse, ER$RelshipEnd.entity) && read($srcHeap, att, ER$ERAttribute.isKey) == true  ==>
getTarsBySrcs(Seq#Build(Seq#Singleton(att),rse)) ==null || !read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(att),rse)), alloc)); 
  modifies $tarHeap,$linkHeap;
// Rule Outcome
  ensures (forall att,rse: ref ::
att!=null && read($srcHeap, att, alloc) && dtype(att) <: ER$ERAttribute && rse!=null && read($srcHeap, rse, alloc) && dtype(rse) <: ER$RelshipEnd ==>
 read($srcHeap, att, ER$ERAttribute.entity) == read($srcHeap, rse, ER$RelshipEnd.entity) && read($srcHeap, att, ER$ERAttribute.isKey) == true  ==>
getTarsBySrcs(Seq#Build(Seq#Singleton(att),rse)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(att),rse)), alloc)
&& dtype(getTarsBySrcs(Seq#Build(Seq#Singleton(att),rse))) <: REL$RELAttribute);
// Frame Condition
  ensures (forall<alpha> $o : ref, $f: Field alpha ::
	($o == null 
	|| read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f) 
	|| ((dtype($o) <: REL$RELAttribute) && Seq#Length(getTarsBySrcs_inverse($o)) == 2 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$ERAttribute && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: ER$RelshipEnd && $f==alloc )));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures $HeapSucc(old($linkHeap), $linkHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

function printGuard_RA2AK(hp: HeapType, att: ref,rse: ref): bool
{  read(hp, att, ER$ERAttribute.entity) == read(hp, rse, ER$RelshipEnd.entity) && read(hp, att, ER$ERAttribute.isKey) == true  }


