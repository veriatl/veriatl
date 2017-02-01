
function valid_src_model($h: HeapType): bool{


(forall __erschema : ref ::
  (__erschema!=null && read($h, __erschema, alloc) && dtype(__erschema) <: ER$ERSchema ==> 
    (read($h, __erschema, ER$ERSchema.entities)!=null &&
       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __erschema, ER$ERSchema.entities)) ==> 
         ($Unbox(read($h, read($h, __erschema, ER$ERSchema.entities), IndexField(__i))): ref !=null 
         && read($h, $Unbox(read($h, read($h, __erschema, ER$ERSchema.entities), IndexField(__i))): ref, alloc)
         && dtype($Unbox(read($h, read($h, __erschema, ER$ERSchema.entities), IndexField(__i))): ref)<:ER$Entity) ))
        
     &&(read($h, __erschema, ER$ERSchema.relships)!=null &&
       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __erschema, ER$ERSchema.relships)) ==> 
         ($Unbox(read($h, read($h, __erschema, ER$ERSchema.relships), IndexField(__i))): ref !=null 
         && read($h, $Unbox(read($h, read($h, __erschema, ER$ERSchema.relships), IndexField(__i))): ref, alloc)
         && dtype($Unbox(read($h, read($h, __erschema, ER$ERSchema.relships), IndexField(__i))): ref)<:ER$Relship) ))
        
     && true 
       
  )
)

&&

(forall __entity : ref ::
  (__entity!=null && read($h, __entity, alloc) && dtype(__entity) <: ER$Entity ==> 
     true 
     &&(read($h, __entity, ER$Entity.attrs)!=null &&
       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __entity, ER$Entity.attrs)) ==> 
         ($Unbox(read($h, read($h, __entity, ER$Entity.attrs), IndexField(__i))): ref !=null 
         && read($h, $Unbox(read($h, read($h, __entity, ER$Entity.attrs), IndexField(__i))): ref, alloc)
         && dtype($Unbox(read($h, read($h, __entity, ER$Entity.attrs), IndexField(__i))): ref)<:ER$ERAttribute) ))
        
     &&(read($h, __entity, ER$Entity.ends)!=null &&
       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __entity, ER$Entity.ends)) ==> 
         ($Unbox(read($h, read($h, __entity, ER$Entity.ends), IndexField(__i))): ref !=null 
         && read($h, $Unbox(read($h, read($h, __entity, ER$Entity.ends), IndexField(__i))): ref, alloc)
         && dtype($Unbox(read($h, read($h, __entity, ER$Entity.ends), IndexField(__i))): ref)<:ER$RelshipEnd) ))
        
     &&(read($h, __entity, ER$Entity.schema)!=null && read($h, read($h, __entity, ER$Entity.schema) ,alloc) ==>
       dtype(read($h, __entity, ER$Entity.schema)) <: ER$ERSchema ) 
       
  )
)

&&

(forall __relship : ref ::
  (__relship!=null && read($h, __relship, alloc) && dtype(__relship) <: ER$Relship ==> 
     true 
     &&(read($h, __relship, ER$Relship.attrs)!=null &&
       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __relship, ER$Relship.attrs)) ==> 
         ($Unbox(read($h, read($h, __relship, ER$Relship.attrs), IndexField(__i))): ref !=null 
         && read($h, $Unbox(read($h, read($h, __relship, ER$Relship.attrs), IndexField(__i))): ref, alloc)
         && dtype($Unbox(read($h, read($h, __relship, ER$Relship.attrs), IndexField(__i))): ref)<:ER$ERAttribute) ))
        
     &&(read($h, __relship, ER$Relship.ends)!=null &&
       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __relship, ER$Relship.ends)) ==> 
         ($Unbox(read($h, read($h, __relship, ER$Relship.ends), IndexField(__i))): ref !=null 
         && read($h, $Unbox(read($h, read($h, __relship, ER$Relship.ends), IndexField(__i))): ref, alloc)
         && dtype($Unbox(read($h, read($h, __relship, ER$Relship.ends), IndexField(__i))): ref)<:ER$RelshipEnd) ))
        
     &&(read($h, __relship, ER$Relship.schema)!=null && read($h, read($h, __relship, ER$Relship.schema) ,alloc) ==>
       dtype(read($h, __relship, ER$Relship.schema)) <: ER$ERSchema ) 
       
  )
)

&&

(forall __relshipend : ref ::
  (__relshipend!=null && read($h, __relshipend, alloc) && dtype(__relshipend) <: ER$RelshipEnd ==> 
     true 
     &&(read($h, __relshipend, ER$RelshipEnd.relship)!=null && read($h, read($h, __relshipend, ER$RelshipEnd.relship) ,alloc) ==>
       dtype(read($h, __relshipend, ER$RelshipEnd.relship)) <: ER$Relship ) 
     &&(read($h, __relshipend, ER$RelshipEnd.entity)!=null && read($h, read($h, __relshipend, ER$RelshipEnd.entity) ,alloc) ==>
       dtype(read($h, __relshipend, ER$RelshipEnd.entity)) <: ER$Entity ) 
       
  )
)

&&

(forall __erattribute : ref ::
  (__erattribute!=null && read($h, __erattribute, alloc) && dtype(__erattribute) <: ER$ERAttribute ==> 
     true 
     &&(read($h, __erattribute, ER$ERAttribute.entity)!=null && read($h, read($h, __erattribute, ER$ERAttribute.entity) ,alloc) ==>
       dtype(read($h, __erattribute, ER$ERAttribute.entity)) <: ER$Entity ) 
     &&(read($h, __erattribute, ER$ERAttribute.relship)!=null && read($h, read($h, __erattribute, ER$ERAttribute.relship) ,alloc) ==>
       dtype(read($h, __erattribute, ER$ERAttribute.relship)) <: ER$Relship ) 
     && true 
       
  )
)

} 
