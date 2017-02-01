
procedure S2S_applyAll() returns();
  requires surj_tar_model($srcHeap, $tarHeap);
  requires (forall s: ref :: s!=null && read($srcHeap, s, alloc) && dtype(s) <: ER$ERSchema ==>
 true  ==>
getTarsBySrcs(Seq#Singleton(s)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Singleton(s)), alloc)
&& dtype(getTarsBySrcs(Seq#Singleton(s))) <: REL$RELSchema);
  modifies $tarHeap;
// Rule outcome


  ensures (forall s: ref :: s!=null && read($srcHeap, s, alloc) && dtype(s) <: ER$ERSchema ==>
 true  ==>
read($tarHeap, getTarsBySrcs(Seq#Singleton(s)), REL$RELSchema.name) == read($srcHeap, s, ER$ERSchema.name));
  ensures (forall s: ref :: s!=null && read($srcHeap, s, alloc) && dtype(s) <: ER$ERSchema ==>
 true  ==>
dtype(read($tarHeap, getTarsBySrcs(Seq#Singleton(s)), REL$RELSchema.relations)) == class._System.array
&&       read($tarHeap, getTarsBySrcs(Seq#Singleton(s)), REL$RELSchema.relations) != null
&&       read($tarHeap, read($tarHeap, getTarsBySrcs(Seq#Singleton(s)), REL$RELSchema.relations), alloc)
&&       (_System.array.Length(read($tarHeap, getTarsBySrcs(Seq#Singleton(s)), REL$RELSchema.relations)) == _System.array.Length(read($srcHeap, s, ER$ERSchema.entities)) + _System.array.Length(read($srcHeap, s, ER$ERSchema.relships)))
&&       ( forall __j: int :: 0<=__j && __j<_System.array.Length(read($srcHeap, s, ER$ERSchema.entities)) ==> $Unbox(read($tarHeap, read($tarHeap, getTarsBySrcs(Seq#Singleton(s)), REL$RELSchema.relations), IndexField(__j))): ref == getTarsBySrcs(Seq#Singleton( $Unbox(read($srcHeap, read($srcHeap, s, ER$ERSchema.entities), IndexField(__j))): ref) ))
&&       ( forall __j: int :: 0<=__j && __j<_System.array.Length(read($srcHeap, s, ER$ERSchema.relships)) ==> $Unbox(read($tarHeap, read($tarHeap, getTarsBySrcs(Seq#Singleton(s)), REL$RELSchema.relations), IndexField(__j+_System.array.Length(read($srcHeap, s, ER$ERSchema.entities))))): ref == getTarsBySrcs(Seq#Singleton( $Unbox(read($srcHeap, read($srcHeap, s, ER$ERSchema.relships), IndexField(__j))): ref) )));

  ensures (forall s: ref :: s!=null && read($srcHeap, s, alloc) && dtype(s) <: ER$ERSchema ==>
 true  ==>
 true );



// Frame property
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$ERSchema && ( dtype($o) <: REL$RELSchema && ($f == REL$RELSchema.name || $f == REL$RELSchema.relations || $f == REL$RELSchema.relations))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

procedure E2R_applyAll() returns();
  requires surj_tar_model($srcHeap, $tarHeap);
  requires (forall s: ref :: s!=null && read($srcHeap, s, alloc) && dtype(s) <: ER$Entity ==>
 true  ==>
getTarsBySrcs(Seq#Singleton(s)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Singleton(s)), alloc)
&& dtype(getTarsBySrcs(Seq#Singleton(s))) <: REL$Relation);
  modifies $tarHeap;
// Rule outcome


  ensures (forall s: ref :: s!=null && read($srcHeap, s, alloc) && dtype(s) <: ER$Entity ==>
 true  ==>
read($tarHeap, getTarsBySrcs(Seq#Singleton(s)), REL$Relation.name) == read($srcHeap, s, ER$Entity.name));


// Frame property
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$Entity && ( dtype($o) <: REL$Relation && ($f == REL$Relation.name))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

procedure R2R_applyAll() returns();
  requires surj_tar_model($srcHeap, $tarHeap);
  requires (forall s: ref :: s!=null && read($srcHeap, s, alloc) && dtype(s) <: ER$Relship ==>
 true  ==>
getTarsBySrcs(Seq#Singleton(s)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Singleton(s)), alloc)
&& dtype(getTarsBySrcs(Seq#Singleton(s))) <: REL$Relation);
  modifies $tarHeap;
// Rule outcome


  ensures (forall s: ref :: s!=null && read($srcHeap, s, alloc) && dtype(s) <: ER$Relship ==>
 true  ==>
read($tarHeap, getTarsBySrcs(Seq#Singleton(s)), REL$Relation.name) == read($srcHeap, s, ER$Relship.name));


// Frame property
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$Relship && ( dtype($o) <: REL$Relation && ($f == REL$Relation.name))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

procedure EA2A_applyAll() returns();
  requires surj_tar_model($srcHeap, $tarHeap);
  requires (forall att,ent: ref :: att!=null && read($srcHeap, att, alloc) && dtype(att) <: ER$ERAttribute && ent!=null && read($srcHeap, ent, alloc) && dtype(ent) <: ER$Entity ==>
 read($srcHeap, att, ER$ERAttribute.entity) == ent  ==>
getTarsBySrcs(Seq#Build(Seq#Singleton(att),ent)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(att),ent)), alloc)
&& dtype(getTarsBySrcs(Seq#Build(Seq#Singleton(att),ent))) <: REL$RELAttribute);
  modifies $tarHeap;
// Rule outcome


  ensures (forall att,ent: ref :: att!=null && read($srcHeap, att, alloc) && dtype(att) <: ER$ERAttribute && ent!=null && read($srcHeap, ent, alloc) && dtype(ent) <: ER$Entity ==>
 read($srcHeap, att, ER$ERAttribute.entity) == ent  ==>
read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(att),ent)), REL$RELAttribute.name) == read($srcHeap, att, ER$ERAttribute.name));
  ensures (forall att,ent: ref :: att!=null && read($srcHeap, att, alloc) && dtype(att) <: ER$ERAttribute && ent!=null && read($srcHeap, ent, alloc) && dtype(ent) <: ER$Entity ==>
 read($srcHeap, att, ER$ERAttribute.entity) == ent  ==>
read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(att),ent)), REL$RELAttribute.isKey) == read($srcHeap, att, ER$ERAttribute.isKey));
  ensures (forall att,ent: ref :: att!=null && read($srcHeap, att, alloc) && dtype(att) <: ER$ERAttribute && ent!=null && read($srcHeap, ent, alloc) && dtype(ent) <: ER$Entity ==>
 read($srcHeap, att, ER$ERAttribute.entity) == ent  ==>
read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(att),ent)), REL$RELAttribute.relation) == getTarsBySrcs(Seq#Singleton(ent)));


// Frame property
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 2 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$ERAttribute && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: ER$Entity && ( dtype($o) <: REL$RELAttribute && ($f == REL$RELAttribute.name || $f == REL$RELAttribute.isKey || $f == REL$RELAttribute.relation))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

procedure RA2A_applyAll() returns();
  requires surj_tar_model($srcHeap, $tarHeap);
  requires (forall att,rs: ref :: att!=null && read($srcHeap, att, alloc) && dtype(att) <: ER$ERAttribute && rs!=null && read($srcHeap, rs, alloc) && dtype(rs) <: ER$Relship ==>
 read($srcHeap, att, ER$ERAttribute.relship) == rs  ==>
getTarsBySrcs(Seq#Build(Seq#Singleton(att),rs)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(att),rs)), alloc)
&& dtype(getTarsBySrcs(Seq#Build(Seq#Singleton(att),rs))) <: REL$RELAttribute);
  modifies $tarHeap;
// Rule outcome


  ensures (forall att,rs: ref :: att!=null && read($srcHeap, att, alloc) && dtype(att) <: ER$ERAttribute && rs!=null && read($srcHeap, rs, alloc) && dtype(rs) <: ER$Relship ==>
 read($srcHeap, att, ER$ERAttribute.relship) == rs  ==>
read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(att),rs)), REL$RELAttribute.name) == read($srcHeap, att, ER$ERAttribute.name));
  ensures (forall att,rs: ref :: att!=null && read($srcHeap, att, alloc) && dtype(att) <: ER$ERAttribute && rs!=null && read($srcHeap, rs, alloc) && dtype(rs) <: ER$Relship ==>
 read($srcHeap, att, ER$ERAttribute.relship) == rs  ==>
read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(att),rs)), REL$RELAttribute.isKey) == read($srcHeap, att, ER$ERAttribute.isKey));
  ensures (forall att,rs: ref :: att!=null && read($srcHeap, att, alloc) && dtype(att) <: ER$ERAttribute && rs!=null && read($srcHeap, rs, alloc) && dtype(rs) <: ER$Relship ==>
 read($srcHeap, att, ER$ERAttribute.relship) == rs  ==>
read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(att),rs)), REL$RELAttribute.relation) == getTarsBySrcs(Seq#Singleton(rs)));


// Frame property
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 2 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$ERAttribute && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: ER$Relship && ( dtype($o) <: REL$RELAttribute && ($f == REL$RELAttribute.name || $f == REL$RELAttribute.isKey || $f == REL$RELAttribute.relation))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);

procedure RA2AK_applyAll() returns();
  requires surj_tar_model($srcHeap, $tarHeap);
  requires (forall att,rse: ref :: att!=null && read($srcHeap, att, alloc) && dtype(att) <: ER$ERAttribute && rse!=null && read($srcHeap, rse, alloc) && dtype(rse) <: ER$RelshipEnd ==>
 read($srcHeap, att, ER$ERAttribute.entity) == read($srcHeap, rse, ER$RelshipEnd.entity) && read($srcHeap, att, ER$ERAttribute.isKey) == true  ==>
getTarsBySrcs(Seq#Build(Seq#Singleton(att),rse)) !=null 
&& read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(att),rse)), alloc)
&& dtype(getTarsBySrcs(Seq#Build(Seq#Singleton(att),rse))) <: REL$RELAttribute);
  modifies $tarHeap;
// Rule outcome


  ensures (forall att,rse: ref :: att!=null && read($srcHeap, att, alloc) && dtype(att) <: ER$ERAttribute && rse!=null && read($srcHeap, rse, alloc) && dtype(rse) <: ER$RelshipEnd ==>
 read($srcHeap, att, ER$ERAttribute.entity) == read($srcHeap, rse, ER$RelshipEnd.entity) && read($srcHeap, att, ER$ERAttribute.isKey) == true  ==>
read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(att),rse)), REL$RELAttribute.name) == read($srcHeap, att, ER$ERAttribute.name));
  ensures (forall att,rse: ref :: att!=null && read($srcHeap, att, alloc) && dtype(att) <: ER$ERAttribute && rse!=null && read($srcHeap, rse, alloc) && dtype(rse) <: ER$RelshipEnd ==>
 read($srcHeap, att, ER$ERAttribute.entity) == read($srcHeap, rse, ER$RelshipEnd.entity) && read($srcHeap, att, ER$ERAttribute.isKey) == true  ==>
read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(att),rse)), REL$RELAttribute.isKey) == read($srcHeap, att, ER$ERAttribute.isKey));
  ensures (forall att,rse: ref :: att!=null && read($srcHeap, att, alloc) && dtype(att) <: ER$ERAttribute && rse!=null && read($srcHeap, rse, alloc) && dtype(rse) <: ER$RelshipEnd ==>
 read($srcHeap, att, ER$ERAttribute.entity) == read($srcHeap, rse, ER$RelshipEnd.entity) && read($srcHeap, att, ER$ERAttribute.isKey) == true  ==>
read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(att),rse)), REL$RELAttribute.relation) == getTarsBySrcs(Seq#Singleton(read($srcHeap, rse, ER$RelshipEnd.relship))));


// Frame property
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
  ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 2 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$ERAttribute && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: ER$RelshipEnd && ( dtype($o) <: REL$RELAttribute && ($f == REL$RELAttribute.name || $f == REL$RELAttribute.isKey || $f == REL$RELAttribute.relation))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
  free ensures $HeapSucc(old($tarHeap), $tarHeap);
  free ensures surj_tar_model($srcHeap, $tarHeap);



