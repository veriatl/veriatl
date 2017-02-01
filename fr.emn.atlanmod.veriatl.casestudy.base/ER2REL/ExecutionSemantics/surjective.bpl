function surj_tar_model($s: HeapType, $t: HeapType): bool{



(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == REL$RELSchema ==>
   
   		

(exists s: ref :: 
s!=null && read($s, s, alloc) && dtype(s) <: ER$ERSchema 
 &&  true  &&
  getTarsBySrcs(Seq#Singleton(s)) == t)

   
)


&&


(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == REL$Relation ==>
   
   		

(exists s: ref :: 
s!=null && read($s, s, alloc) && dtype(s) <: ER$Entity 
 &&  true  &&
  getTarsBySrcs(Seq#Singleton(s)) == t)

   ||
   		

(exists s: ref :: 
s!=null && read($s, s, alloc) && dtype(s) <: ER$Relship 
 &&  true  &&
  getTarsBySrcs(Seq#Singleton(s)) == t)

   
)


&&


true


&&


(forall t: ref :: 
  t!=null && read($t, t, alloc) && dtype(t) == REL$RELAttribute ==>
   
   		

(exists att,ent: ref :: 
att!=null && read($s, att, alloc) && dtype(att) <: ER$ERAttribute 
 && ent!=null && read($s, ent, alloc) && dtype(ent) <: ER$Entity 
 &&  read($s, att, ER$ERAttribute.entity) == ent  &&
  getTarsBySrcs(Seq#Build(Seq#Singleton(att),ent)) == t)

   ||
   		

(exists att,rs: ref :: 
att!=null && read($s, att, alloc) && dtype(att) <: ER$ERAttribute 
 && rs!=null && read($s, rs, alloc) && dtype(rs) <: ER$Relship 
 &&  read($s, att, ER$ERAttribute.relship) == rs  &&
  getTarsBySrcs(Seq#Build(Seq#Singleton(att),rs)) == t)

   ||
   		

(exists att,rse: ref :: 
att!=null && read($s, att, alloc) && dtype(att) <: ER$ERAttribute 
 && rse!=null && read($s, rse, alloc) && dtype(rse) <: ER$RelshipEnd 
 &&  read($s, att, ER$ERAttribute.entity) == read($s, rse, ER$RelshipEnd.entity) && read($s, att, ER$ERAttribute.isKey) == true  &&
  getTarsBySrcs(Seq#Build(Seq#Singleton(att),rse)) == t)

   
)


&&


true


&&


true



}