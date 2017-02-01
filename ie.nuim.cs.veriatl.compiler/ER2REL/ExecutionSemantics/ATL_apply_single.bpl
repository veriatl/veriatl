
procedure S2S_apply(in: ref) returns();
free requires surj_tar_model($srcHeap, $tarHeap);
//free requires isValidSrc($srcHeap);
//free requires isInstTar($tarHeap);
// link info
free requires $linkHeap[in, alloc] == true;
free requires dtype(in) == Native$TransientLink;
// rule info
free requires $linkHeap[in, TransientLink#rule]==_S2S;  
free requires Map#Domain($linkHeap[in, TransientLink#source])[_s];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_s]) <: ER$ERSchema;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_s] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_s], alloc);

free requires Map#Domain($linkHeap[in, TransientLink#target])[_t];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#target])[_t]) <: REL$RELSchema;
free requires Map#Elements($linkHeap[in, TransientLink#target])[_t] != null;
free requires read($tarHeap, Map#Elements($linkHeap[in, TransientLink#target])[_t], alloc);

// Correspondence I/O
free requires getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_s])) == Map#Elements($linkHeap[in, TransientLink#target])[_t];
// Guard
free requires true ;
// isValid Source model, to cooperate with resolve function.

free requires dtype(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_s], ER$ERSchema.entities)) == class._System.array;
free requires dtype(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_s], ER$ERSchema.relships)) == class._System.array;
// isValid Target model, i.e. associations are populated with empty array.

free requires Seq#FromArray($tarHeap, read($tarHeap, Map#Elements($linkHeap[in, TransientLink#target])[_t], REL$RELSchema.relations)) == Seq#Empty();
free requires Seq#FromArray($tarHeap, read($tarHeap, Map#Elements($linkHeap[in, TransientLink#target])[_t], REL$RELSchema.relations)) == Seq#Empty();
// modifies
modifies $tarHeap;
// Rule outcome

ensures read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_s])), REL$RELSchema.name) == read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_s], ER$ERSchema.name);
ensures dtype(read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_s])), REL$RELSchema.relations)) == class._System.array
&&       read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_s])), REL$RELSchema.relations) != null
&&       read($tarHeap, read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_s])), REL$RELSchema.relations), alloc)
&&       (_System.array.Length(read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_s])), REL$RELSchema.relations)) == _System.array.Length(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_s], ER$ERSchema.entities)) + _System.array.Length(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_s], ER$ERSchema.relships)))
&&       ( forall __j: int :: 0<=__j && __j<_System.array.Length(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_s], ER$ERSchema.entities)) ==> $Unbox(read($tarHeap, read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_s])), REL$RELSchema.relations), IndexField(__j))): ref == getTarsBySrcs(Seq#Singleton( $Unbox(read($srcHeap, read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_s], ER$ERSchema.entities), IndexField(__j))): ref) ))
&&       ( forall __j: int :: 0<=__j && __j<_System.array.Length(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_s], ER$ERSchema.relships)) ==> $Unbox(read($tarHeap, read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_s])), REL$RELSchema.relations), IndexField(__j+_System.array.Length(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_s], ER$ERSchema.entities))))): ref == getTarsBySrcs(Seq#Singleton( $Unbox(read($srcHeap, read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_s], ER$ERSchema.relships), IndexField(__j))): ref) ));

ensures  true ;



// Frame 
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$ERSchema && ( dtype($o) <: REL$RELSchema && ($f == REL$RELSchema.name || $f == REL$RELSchema.relations || $f == REL$RELSchema.relations))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) && $o != getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_s])) ==> 
	(read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
  );
// Preserving
free ensures $HeapSucc(old($tarHeap), $tarHeap);
free ensures surj_tar_model($srcHeap, $tarHeap);

procedure E2R_apply(in: ref) returns();
free requires surj_tar_model($srcHeap, $tarHeap);
//free requires isValidSrc($srcHeap);
//free requires isInstTar($tarHeap);
// link info
free requires $linkHeap[in, alloc] == true;
free requires dtype(in) == Native$TransientLink;
// rule info
free requires $linkHeap[in, TransientLink#rule]==_E2R;  
free requires Map#Domain($linkHeap[in, TransientLink#source])[_s];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_s]) <: ER$Entity;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_s] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_s], alloc);

free requires Map#Domain($linkHeap[in, TransientLink#target])[_t];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#target])[_t]) <: REL$Relation;
free requires Map#Elements($linkHeap[in, TransientLink#target])[_t] != null;
free requires read($tarHeap, Map#Elements($linkHeap[in, TransientLink#target])[_t], alloc);

// Correspondence I/O
free requires getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_s])) == Map#Elements($linkHeap[in, TransientLink#target])[_t];
// Guard
free requires true ;
// isValid Source model, to cooperate with resolve function.

// isValid Target model, i.e. associations are populated with empty array.

// modifies
modifies $tarHeap;
// Rule outcome

ensures read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_s])), REL$Relation.name) == read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_s], ER$Entity.name);


// Frame 
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$Entity && ( dtype($o) <: REL$Relation && ($f == REL$Relation.name))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) && $o != getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_s])) ==> 
	(read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
  );
// Preserving
free ensures $HeapSucc(old($tarHeap), $tarHeap);
free ensures surj_tar_model($srcHeap, $tarHeap);

procedure R2R_apply(in: ref) returns();
free requires surj_tar_model($srcHeap, $tarHeap);
//free requires isValidSrc($srcHeap);
//free requires isInstTar($tarHeap);
// link info
free requires $linkHeap[in, alloc] == true;
free requires dtype(in) == Native$TransientLink;
// rule info
free requires $linkHeap[in, TransientLink#rule]==_R2R;  
free requires Map#Domain($linkHeap[in, TransientLink#source])[_s];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_s]) <: ER$Relship;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_s] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_s], alloc);

free requires Map#Domain($linkHeap[in, TransientLink#target])[_t];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#target])[_t]) <: REL$Relation;
free requires Map#Elements($linkHeap[in, TransientLink#target])[_t] != null;
free requires read($tarHeap, Map#Elements($linkHeap[in, TransientLink#target])[_t], alloc);

// Correspondence I/O
free requires getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_s])) == Map#Elements($linkHeap[in, TransientLink#target])[_t];
// Guard
free requires true ;
// isValid Source model, to cooperate with resolve function.

// isValid Target model, i.e. associations are populated with empty array.

// modifies
modifies $tarHeap;
// Rule outcome

ensures read($tarHeap, getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_s])), REL$Relation.name) == read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_s], ER$Relship.name);


// Frame 
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 1 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$Relship && ( dtype($o) <: REL$Relation && ($f == REL$Relation.name))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) && $o != getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_s])) ==> 
	(read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
  );
// Preserving
free ensures $HeapSucc(old($tarHeap), $tarHeap);
free ensures surj_tar_model($srcHeap, $tarHeap);

procedure EA2A_apply(in: ref) returns();
free requires surj_tar_model($srcHeap, $tarHeap);
//free requires isValidSrc($srcHeap);
//free requires isInstTar($tarHeap);
// link info
free requires $linkHeap[in, alloc] == true;
free requires dtype(in) == Native$TransientLink;
// rule info
free requires $linkHeap[in, TransientLink#rule]==_EA2A;  
free requires Map#Domain($linkHeap[in, TransientLink#source])[_att];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_att]) <: ER$ERAttribute;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_att] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_att], alloc);
free requires Map#Domain($linkHeap[in, TransientLink#source])[_ent];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_ent]) <: ER$Entity;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_ent] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_ent], alloc);

free requires Map#Domain($linkHeap[in, TransientLink#target])[_t];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#target])[_t]) <: REL$RELAttribute;
free requires Map#Elements($linkHeap[in, TransientLink#target])[_t] != null;
free requires read($tarHeap, Map#Elements($linkHeap[in, TransientLink#target])[_t], alloc);

// Correspondence I/O
free requires getTarsBySrcs(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_att]),Map#Elements($linkHeap[in, TransientLink#source])[_ent])) == Map#Elements($linkHeap[in, TransientLink#target])[_t];
// Guard
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_att], ER$ERAttribute.entity) == Map#Elements($linkHeap[in, TransientLink#source])[_ent] ;
// isValid Source model, to cooperate with resolve function.

// isValid Target model, i.e. associations are populated with empty array.

// modifies
modifies $tarHeap;
// Rule outcome

ensures read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_att]),Map#Elements($linkHeap[in, TransientLink#source])[_ent])), REL$RELAttribute.name) == read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_att], ER$ERAttribute.name);
ensures read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_att]),Map#Elements($linkHeap[in, TransientLink#source])[_ent])), REL$RELAttribute.isKey) == read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_att], ER$ERAttribute.isKey);
ensures read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_att]),Map#Elements($linkHeap[in, TransientLink#source])[_ent])), REL$RELAttribute.relation) == getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_ent]));


// Frame 
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 2 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$ERAttribute && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: ER$Entity && ( dtype($o) <: REL$RELAttribute && ($f == REL$RELAttribute.name || $f == REL$RELAttribute.isKey || $f == REL$RELAttribute.relation))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) && $o != getTarsBySrcs(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_att]),Map#Elements($linkHeap[in, TransientLink#source])[_ent])) ==> 
	(read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
  );
// Preserving
free ensures $HeapSucc(old($tarHeap), $tarHeap);
free ensures surj_tar_model($srcHeap, $tarHeap);

procedure RA2A_apply(in: ref) returns();
free requires surj_tar_model($srcHeap, $tarHeap);
//free requires isValidSrc($srcHeap);
//free requires isInstTar($tarHeap);
// link info
free requires $linkHeap[in, alloc] == true;
free requires dtype(in) == Native$TransientLink;
// rule info
free requires $linkHeap[in, TransientLink#rule]==_RA2A;  
free requires Map#Domain($linkHeap[in, TransientLink#source])[_att];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_att]) <: ER$ERAttribute;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_att] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_att], alloc);
free requires Map#Domain($linkHeap[in, TransientLink#source])[_rs];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_rs]) <: ER$Relship;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_rs] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_rs], alloc);

free requires Map#Domain($linkHeap[in, TransientLink#target])[_t];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#target])[_t]) <: REL$RELAttribute;
free requires Map#Elements($linkHeap[in, TransientLink#target])[_t] != null;
free requires read($tarHeap, Map#Elements($linkHeap[in, TransientLink#target])[_t], alloc);

// Correspondence I/O
free requires getTarsBySrcs(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_att]),Map#Elements($linkHeap[in, TransientLink#source])[_rs])) == Map#Elements($linkHeap[in, TransientLink#target])[_t];
// Guard
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_att], ER$ERAttribute.relship) == Map#Elements($linkHeap[in, TransientLink#source])[_rs] ;
// isValid Source model, to cooperate with resolve function.

// isValid Target model, i.e. associations are populated with empty array.

// modifies
modifies $tarHeap;
// Rule outcome

ensures read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_att]),Map#Elements($linkHeap[in, TransientLink#source])[_rs])), REL$RELAttribute.name) == read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_att], ER$ERAttribute.name);
ensures read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_att]),Map#Elements($linkHeap[in, TransientLink#source])[_rs])), REL$RELAttribute.isKey) == read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_att], ER$ERAttribute.isKey);
ensures read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_att]),Map#Elements($linkHeap[in, TransientLink#source])[_rs])), REL$RELAttribute.relation) == getTarsBySrcs(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_rs]));


// Frame 
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 2 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$ERAttribute && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: ER$Relship && ( dtype($o) <: REL$RELAttribute && ($f == REL$RELAttribute.name || $f == REL$RELAttribute.isKey || $f == REL$RELAttribute.relation))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) && $o != getTarsBySrcs(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_att]),Map#Elements($linkHeap[in, TransientLink#source])[_rs])) ==> 
	(read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
  );
// Preserving
free ensures $HeapSucc(old($tarHeap), $tarHeap);
free ensures surj_tar_model($srcHeap, $tarHeap);

procedure RA2AK_apply(in: ref) returns();
free requires surj_tar_model($srcHeap, $tarHeap);
//free requires isValidSrc($srcHeap);
//free requires isInstTar($tarHeap);
// link info
free requires $linkHeap[in, alloc] == true;
free requires dtype(in) == Native$TransientLink;
// rule info
free requires $linkHeap[in, TransientLink#rule]==_RA2AK;  
free requires Map#Domain($linkHeap[in, TransientLink#source])[_att];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_att]) <: ER$ERAttribute;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_att] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_att], alloc);
free requires Map#Domain($linkHeap[in, TransientLink#source])[_rse];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#source])[_rse]) <: ER$RelshipEnd;
free requires Map#Elements($linkHeap[in, TransientLink#source])[_rse] != null;
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_rse], alloc);

free requires Map#Domain($linkHeap[in, TransientLink#target])[_t];
free requires dtype(Map#Elements($linkHeap[in, TransientLink#target])[_t]) <: REL$RELAttribute;
free requires Map#Elements($linkHeap[in, TransientLink#target])[_t] != null;
free requires read($tarHeap, Map#Elements($linkHeap[in, TransientLink#target])[_t], alloc);

// Correspondence I/O
free requires getTarsBySrcs(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_att]),Map#Elements($linkHeap[in, TransientLink#source])[_rse])) == Map#Elements($linkHeap[in, TransientLink#target])[_t];
// Guard
free requires read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_att], ER$ERAttribute.entity) == read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_rse], ER$RelshipEnd.entity) && read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_att], ER$ERAttribute.isKey) == true ;
// isValid Source model, to cooperate with resolve function.

free requires dtype(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_rse], ER$RelshipEnd.relship)) != class._System.array;
// isValid Target model, i.e. associations are populated with empty array.

// modifies
modifies $tarHeap;
// Rule outcome

ensures read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_att]),Map#Elements($linkHeap[in, TransientLink#source])[_rse])), REL$RELAttribute.name) == read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_att], ER$ERAttribute.name);
ensures read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_att]),Map#Elements($linkHeap[in, TransientLink#source])[_rse])), REL$RELAttribute.isKey) == read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_att], ER$ERAttribute.isKey);
ensures read($tarHeap, getTarsBySrcs(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_att]),Map#Elements($linkHeap[in, TransientLink#source])[_rse])), REL$RELAttribute.relation) == getTarsBySrcs(Seq#Singleton(read($srcHeap, Map#Elements($linkHeap[in, TransientLink#source])[_rse], ER$RelshipEnd.relship)));


// Frame 
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	!read(old($tarHeap), $o, alloc) ==>
		 ( read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
	  || (dtype($o) == class._System.array));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) ==>
		(Seq#Length(getTarsBySrcs_inverse($o)) == 2 && dtype(Seq#Index(getTarsBySrcs_inverse($o), 0)) <: ER$ERAttribute && dtype(Seq#Index(getTarsBySrcs_inverse($o), 1)) <: ER$RelshipEnd && ( dtype($o) <: REL$RELAttribute && ($f == REL$RELAttribute.name || $f == REL$RELAttribute.isKey || $f == REL$RELAttribute.relation))) 
		|| (read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f)));
ensures (forall<alpha> $o: ref, $f: Field alpha :: 
	$o != null && read(old($tarHeap), $o, alloc) && $o != getTarsBySrcs(Seq#Build(Seq#Singleton(Map#Elements($linkHeap[in, TransientLink#source])[_att]),Map#Elements($linkHeap[in, TransientLink#source])[_rse])) ==> 
	(read($tarHeap, $o, $f) == read(old($tarHeap), $o, $f))
  );
// Preserving
free ensures $HeapSucc(old($tarHeap), $tarHeap);
free ensures surj_tar_model($srcHeap, $tarHeap);



