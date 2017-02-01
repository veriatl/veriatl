procedure driver();
modifies $tarHeap, $linkHeap;
requires valid_src_model($srcHeap);

requires  
(

forall s1,s2:ref :: {read($srcHeap,s1,alloc),read($srcHeap,s2,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, ER$ERSchema), s1) && Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, ER$ERSchema), s2)
     ==> s1 != s2 ==> read($srcHeap, s1, ER$ERSchema.name) != read($srcHeap, s2, ER$ERSchema.name)
  
) 
;

requires  
(

forall s:ref :: {read($srcHeap,s,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, ER$ERSchema), s)
     ==> 
(

forall r1,r2:ref, __r1,__r2:int :: 
  0<= __r1 && __r1  < __r2 && __r2  <_System.array.Length(read($srcHeap, s, ER$ERSchema.relships)) &&
     $Unbox(read($srcHeap, read($srcHeap, s, ER$ERSchema.relships), IndexField(__r1))): ref == r1  &&  $Unbox(read($srcHeap, read($srcHeap, s, ER$ERSchema.relships), IndexField(__r2))): ref == r2 
      ==> r1 != r2 ==> read($srcHeap, r1, ER$Relship.name) != read($srcHeap, r2, ER$Relship.name)
  
) 

  
) 
;

requires  
(

forall s:ref :: {read($srcHeap,s,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, ER$ERSchema), s)
     ==> 
(

forall e1,e2:ref, __e1,__e2:int :: 
  0<= __e1 && __e1  < __e2 && __e2  <_System.array.Length(read($srcHeap, s, ER$ERSchema.entities)) &&
     $Unbox(read($srcHeap, read($srcHeap, s, ER$ERSchema.entities), IndexField(__e1))): ref == e1  &&  $Unbox(read($srcHeap, read($srcHeap, s, ER$ERSchema.entities), IndexField(__e2))): ref == e2 
      ==> e1 != e2 ==> read($srcHeap, e1, ER$Entity.name) != read($srcHeap, e2, ER$Entity.name)
  
) 

  
) 
;

requires  
(

forall s:ref :: {read($srcHeap,s,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, ER$ERSchema), s)
     ==> 
(

forall r:ref, __r:int :: 
  0<= __r && __r  <_System.array.Length(read($srcHeap, s, ER$ERSchema.relships)) &&
     $Unbox(read($srcHeap, read($srcHeap, s, ER$ERSchema.relships), IndexField(__r))): ref == r 
      ==> 
(

forall e:ref, __e:int :: 
  0<= __e && __e  <_System.array.Length(read($srcHeap, s, ER$ERSchema.entities)) &&
     $Unbox(read($srcHeap, read($srcHeap, s, ER$ERSchema.entities), IndexField(__e))): ref == e 
      ==> r != e ==> read($srcHeap, r, ER$Relship.name) != read($srcHeap, e, ER$Entity.name)
  
) 

  
) 

  
) 
;

requires  
(

forall e:ref :: {read($srcHeap,e,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, ER$Entity), e)
     ==> 
(

forall a1,a2:ref, __a1,__a2:int :: 
  0<= __a1 && __a1  < __a2 && __a2  <_System.array.Length(read($srcHeap, e, ER$Entity.attrs)) &&
     $Unbox(read($srcHeap, read($srcHeap, e, ER$Entity.attrs), IndexField(__a1))): ref == a1  &&  $Unbox(read($srcHeap, read($srcHeap, e, ER$Entity.attrs), IndexField(__a2))): ref == a2 
      ==> read($srcHeap, a1, ER$ERAttribute.name) == read($srcHeap, a2, ER$ERAttribute.name) ==> a1 == a2
  
) 

  
) 
;

requires  
(

forall r:ref :: {read($srcHeap,r,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, ER$Relship), r)
     ==> 
(

forall a1,a2:ref, __a1,__a2:int :: 
  0<= __a1 && __a1  < __a2 && __a2  <_System.array.Length(read($srcHeap, r, ER$Relship.attrs)) &&
     $Unbox(read($srcHeap, read($srcHeap, r, ER$Relship.attrs), IndexField(__a1))): ref == a1  &&  $Unbox(read($srcHeap, read($srcHeap, r, ER$Relship.attrs), IndexField(__a2))): ref == a2 
      ==> read($srcHeap, a1, ER$ERAttribute.name) == read($srcHeap, a2, ER$ERAttribute.name) ==> a1 == a2
  
) 

  
) 
;

requires  
(

forall e:ref :: {read($srcHeap,e,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($srcHeap, ER$Entity), e)
     ==> !(

forall a:ref, __a:int :: 
  0<= __a && __a  <_System.array.Length(read($srcHeap, e, ER$Entity.attrs)) &&
     $Unbox(read($srcHeap, read($srcHeap, e, ER$Entity.attrs), IndexField(__a))): ref == a 
      ==> !(read($srcHeap, a, ER$ERAttribute.isKey))
  
) 
  
) 
;










ensures  
(

forall r:ref :: {read($tarHeap,r,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, REL$Relation), r)
     ==> 
(

forall a1,a2:ref, __a1,__a2:int :: 
  0<= __a1 && __a1  < __a2 && __a2  <_System.array.Length(read($tarHeap, r, REL$Relation.attrs)) &&
     $Unbox(read($tarHeap, read($tarHeap, r, REL$Relation.attrs), IndexField(__a1))): ref == a1  &&  $Unbox(read($tarHeap, read($tarHeap, r, REL$Relation.attrs), IndexField(__a2))): ref == a2 
      ==> read($tarHeap, a1, REL$RELAttribute.name) == read($tarHeap, a2, REL$RELAttribute.name) ==> a1 == a2
  
) 

  
) 
;

