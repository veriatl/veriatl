// print classifier const
const unique Families$Family: ClassName extends complete;
const unique Families$Family.fathers: Field ref;
const unique Families$Family.mothers: Field ref;
const unique Families$Family.daughters: Field ref;
const unique Families$Family.sons: Field ref;
const unique Families$Family.registeredIn: Field ref;
const unique Families$Family.lastName: Field String;
const unique Families$Member: ClassName extends complete;
const unique Families$Member.firstName: Field String;
const unique Families$Member.family: Field ref;
const unique Families$Member.livesIn: Field ref;
   axiom (forall r: ref :: dtype(r)!= Families$Member);
const unique Families$NamedElement: ClassName extends complete;
const unique Families$NamedElement.name: Field String;
   axiom (forall r: ref :: dtype(r)!= Families$NamedElement);
const unique Families$Service: ClassName extends complete;

const unique Families$Country: ClassName extends Families$NamedElement complete;
const unique Families$Country.families: Field ref;
const unique Families$Country.cities: Field ref;
const unique Families$Country.companies: Field ref;
const unique Families$Parent: ClassName extends Families$Member complete;
const unique Families$Parent.worksIn: Field ref;
const unique Families$Child: ClassName extends Families$Member complete;
const unique Families$Child.goesTo: Field ref;
const unique Families$Neighborhood: ClassName extends Families$NamedElement complete;
const unique Families$Neighborhood.contains: Field ref;
const unique Families$Neighborhood.schools: Field ref;
const unique Families$City: ClassName extends Families$NamedElement complete;
const unique Families$City.companies: Field ref;
const unique Families$City.neighborhoods: Field ref;
const unique Families$School: ClassName extends Families$NamedElement complete;
const unique Families$School.ordinary: Field ref;
const unique Families$School.special: Field ref;
const unique Families$School.students: Field ref;
const unique Families$Company: ClassName extends Families$NamedElement complete;
const unique Families$Company.employees: Field ref;
const unique Families$Company.isIn: Field ref;

// print classifier table
axiom classifierTable[_Families, _Country] == Families$Country;
axiom classifierTable[_Families, _Family] == Families$Family;
axiom classifierTable[_Families, _Parent] == Families$Parent;
axiom classifierTable[_Families, _Child] == Families$Child;
axiom classifierTable[_Families, _Neighborhood] == Families$Neighborhood;
axiom classifierTable[_Families, _City] == Families$City;
axiom classifierTable[_Families, _School] == Families$School;
axiom classifierTable[_Families, _Company] == Families$Company;
axiom classifierTable[_Families, _Member] == Families$Member;
axiom classifierTable[_Families, _NamedElement] == Families$NamedElement;
axiom classifierTable[_Families, _Service] == Families$Service;

// if src mm print valid src
function valid_src_model($h: HeapType): bool{
	(forall __country : ref ::
	  (__country!=null && read($h, __country, alloc) && dtype(__country) <: Families$Country ==> 
	    (read($h, __country, Families$Country.families)==null || (read($h, read($h, __country, Families$Country.families), alloc) && dtype(read($h, __country, Families$Country.families)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __country, Families$Country.families)) ==> 
	         ($Unbox(read($h, read($h, __country, Families$Country.families), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __country, Families$Country.families), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __country, Families$Country.families), IndexField(__i))): ref)<:Families$Family) ) ) )&&
	    (read($h, __country, Families$Country.cities)==null || (read($h, read($h, __country, Families$Country.cities), alloc) && dtype(read($h, __country, Families$Country.cities)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __country, Families$Country.cities)) ==> 
	         ($Unbox(read($h, read($h, __country, Families$Country.cities), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __country, Families$Country.cities), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __country, Families$Country.cities), IndexField(__i))): ref)<:Families$City) ) ) )&&
	    (read($h, __country, Families$Country.companies)==null || (read($h, read($h, __country, Families$Country.companies), alloc) && dtype(read($h, __country, Families$Country.companies)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __country, Families$Country.companies)) ==> 
	         ($Unbox(read($h, read($h, __country, Families$Country.companies), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __country, Families$Country.companies), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __country, Families$Country.companies), IndexField(__i))): ref)<:Families$Company) ) ) )
	  )
	)
	&&(forall __family : ref ::
	  (__family!=null && read($h, __family, alloc) && dtype(__family) <: Families$Family ==> 
	    (read($h, __family, Families$Family.fathers)==null || (read($h, read($h, __family, Families$Family.fathers), alloc) && dtype(read($h, __family, Families$Family.fathers)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __family, Families$Family.fathers)) ==> 
	         ($Unbox(read($h, read($h, __family, Families$Family.fathers), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __family, Families$Family.fathers), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __family, Families$Family.fathers), IndexField(__i))): ref)<:Families$Parent) ) ) )&&
	    (read($h, __family, Families$Family.mothers)==null || (read($h, read($h, __family, Families$Family.mothers), alloc) && dtype(read($h, __family, Families$Family.mothers)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __family, Families$Family.mothers)) ==> 
	         ($Unbox(read($h, read($h, __family, Families$Family.mothers), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __family, Families$Family.mothers), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __family, Families$Family.mothers), IndexField(__i))): ref)<:Families$Parent) ) ) )&&
	    (read($h, __family, Families$Family.daughters)==null || (read($h, read($h, __family, Families$Family.daughters), alloc) && dtype(read($h, __family, Families$Family.daughters)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __family, Families$Family.daughters)) ==> 
	         ($Unbox(read($h, read($h, __family, Families$Family.daughters), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __family, Families$Family.daughters), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __family, Families$Family.daughters), IndexField(__i))): ref)<:Families$Child) ) ) )&&
	    (read($h, __family, Families$Family.sons)==null || (read($h, read($h, __family, Families$Family.sons), alloc) && dtype(read($h, __family, Families$Family.sons)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __family, Families$Family.sons)) ==> 
	         ($Unbox(read($h, read($h, __family, Families$Family.sons), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __family, Families$Family.sons), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __family, Families$Family.sons), IndexField(__i))): ref)<:Families$Child) ) ) )&&
	    (read($h, __family, Families$Family.registeredIn)!=null && read($h, read($h, __family, Families$Family.registeredIn) ,alloc) ==>
	       dtype(read($h, __family, Families$Family.registeredIn)) <: Families$Neighborhood ) &&
	 true 
	  )
	)
	&&(forall __parent : ref ::
	  (__parent!=null && read($h, __parent, alloc) && dtype(__parent) <: Families$Parent ==> 
	    (read($h, __parent, Families$Parent.worksIn)!=null && read($h, read($h, __parent, Families$Parent.worksIn) ,alloc) ==>
	       dtype(read($h, __parent, Families$Parent.worksIn)) <: Families$Company ) 
	  )
	)
	&&(forall __child : ref ::
	  (__child!=null && read($h, __child, alloc) && dtype(__child) <: Families$Child ==> 
	    (read($h, __child, Families$Child.goesTo)!=null && read($h, read($h, __child, Families$Child.goesTo) ,alloc) ==>
	       dtype(read($h, __child, Families$Child.goesTo)) <: Families$School ) 
	  )
	)
	&&(forall __neighborhood : ref ::
	  (__neighborhood!=null && read($h, __neighborhood, alloc) && dtype(__neighborhood) <: Families$Neighborhood ==> 
	    (read($h, __neighborhood, Families$Neighborhood.contains)==null || (read($h, read($h, __neighborhood, Families$Neighborhood.contains), alloc) && dtype(read($h, __neighborhood, Families$Neighborhood.contains)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __neighborhood, Families$Neighborhood.contains)) ==> 
	         ($Unbox(read($h, read($h, __neighborhood, Families$Neighborhood.contains), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __neighborhood, Families$Neighborhood.contains), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __neighborhood, Families$Neighborhood.contains), IndexField(__i))): ref)<:Families$Family) ) ) )&&
	    (read($h, __neighborhood, Families$Neighborhood.schools)==null || (read($h, read($h, __neighborhood, Families$Neighborhood.schools), alloc) && dtype(read($h, __neighborhood, Families$Neighborhood.schools)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __neighborhood, Families$Neighborhood.schools)) ==> 
	         ($Unbox(read($h, read($h, __neighborhood, Families$Neighborhood.schools), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __neighborhood, Families$Neighborhood.schools), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __neighborhood, Families$Neighborhood.schools), IndexField(__i))): ref)<:Families$School) ) ) )
	  )
	)
	&&(forall __city : ref ::
	  (__city!=null && read($h, __city, alloc) && dtype(__city) <: Families$City ==> 
	    (read($h, __city, Families$City.companies)==null || (read($h, read($h, __city, Families$City.companies), alloc) && dtype(read($h, __city, Families$City.companies)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __city, Families$City.companies)) ==> 
	         ($Unbox(read($h, read($h, __city, Families$City.companies), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __city, Families$City.companies), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __city, Families$City.companies), IndexField(__i))): ref)<:Families$Company) ) ) )&&
	    (read($h, __city, Families$City.neighborhoods)==null || (read($h, read($h, __city, Families$City.neighborhoods), alloc) && dtype(read($h, __city, Families$City.neighborhoods)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __city, Families$City.neighborhoods)) ==> 
	         ($Unbox(read($h, read($h, __city, Families$City.neighborhoods), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __city, Families$City.neighborhoods), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __city, Families$City.neighborhoods), IndexField(__i))): ref)<:Families$Neighborhood) ) ) )
	  )
	)
	&&(forall __school : ref ::
	  (__school!=null && read($h, __school, alloc) && dtype(__school) <: Families$School ==> 
	    (read($h, __school, Families$School.ordinary)==null || (read($h, read($h, __school, Families$School.ordinary), alloc) && dtype(read($h, __school, Families$School.ordinary)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __school, Families$School.ordinary)) ==> 
	         ($Unbox(read($h, read($h, __school, Families$School.ordinary), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __school, Families$School.ordinary), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __school, Families$School.ordinary), IndexField(__i))): ref)<:Families$Service) ) ) )&&
	    (read($h, __school, Families$School.special)==null || (read($h, read($h, __school, Families$School.special), alloc) && dtype(read($h, __school, Families$School.special)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __school, Families$School.special)) ==> 
	         ($Unbox(read($h, read($h, __school, Families$School.special), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __school, Families$School.special), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __school, Families$School.special), IndexField(__i))): ref)<:Families$Service) ) ) )&&
	    (read($h, __school, Families$School.students)==null || (read($h, read($h, __school, Families$School.students), alloc) && dtype(read($h, __school, Families$School.students)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __school, Families$School.students)) ==> 
	         ($Unbox(read($h, read($h, __school, Families$School.students), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __school, Families$School.students), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __school, Families$School.students), IndexField(__i))): ref)<:Families$Child) ) ) )
	  )
	)
	&&(forall __company : ref ::
	  (__company!=null && read($h, __company, alloc) && dtype(__company) <: Families$Company ==> 
	    (read($h, __company, Families$Company.employees)==null || (read($h, read($h, __company, Families$Company.employees), alloc) && dtype(read($h, __company, Families$Company.employees)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __company, Families$Company.employees)) ==> 
	         ($Unbox(read($h, read($h, __company, Families$Company.employees), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __company, Families$Company.employees), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __company, Families$Company.employees), IndexField(__i))): ref)<:Families$Parent) ) ) )&&
	    (read($h, __company, Families$Company.isIn)==null || (read($h, read($h, __company, Families$Company.isIn), alloc) && dtype(read($h, __company, Families$Company.isIn)) <: class._System.array &&
	       (forall __i: int :: 0<=__i && __i<_System.array.Length(read($h, __company, Families$Company.isIn)) ==> 
	         ($Unbox(read($h, read($h, __company, Families$Company.isIn), IndexField(__i))): ref !=null 
	         && read($h, $Unbox(read($h, read($h, __company, Families$Company.isIn), IndexField(__i))): ref, alloc)
	         && dtype($Unbox(read($h, read($h, __company, Families$Company.isIn), IndexField(__i))): ref)<:Families$City) ) ) )
	  )
	)
	&&(forall __member : ref ::
	  (__member!=null && read($h, __member, alloc) && dtype(__member) <: Families$Member ==> 
	 true &&
	    (read($h, __member, Families$Member.family)!=null && read($h, read($h, __member, Families$Member.family) ,alloc) ==>
	       dtype(read($h, __member, Families$Member.family)) <: Families$Family ) &&
	    (read($h, __member, Families$Member.livesIn)!=null && read($h, read($h, __member, Families$Member.livesIn) ,alloc) ==>
	       dtype(read($h, __member, Families$Member.livesIn)) <: Families$City ) 
	  )
	)
	&&(forall __namedelement : ref ::
	  (__namedelement!=null && read($h, __namedelement, alloc) && dtype(__namedelement) <: Families$NamedElement ==> 
	 true 
	  )
	)
	&&(forall __service : ref ::
	  (__service!=null && read($h, __service, alloc) && dtype(__service) <: Families$Service ==> true
	  )
	)
} 
