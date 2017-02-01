// print classifier const
const unique Persons$Community: ClassName extends complete;
const unique Persons$Community.persons: Field ref;
const unique Persons$Community.townHalls: Field ref;
const unique Persons$Community.associations: Field ref;
const unique Persons$Person: ClassName extends complete;
const unique Persons$Person.fullName: Field String;
   axiom (forall r: ref :: dtype(r)!= Persons$Person);
const unique Persons$NamedElement: ClassName extends complete;
const unique Persons$NamedElement.name: Field String;
   axiom (forall r: ref :: dtype(r)!= Persons$NamedElement);

const unique Persons$Man: ClassName extends Persons$Person complete;
const unique Persons$Woman: ClassName extends Persons$Person complete;
const unique Persons$TownHall: ClassName extends Persons$NamedElement complete;
const unique Persons$TownHall.workers: Field ref;
const unique Persons$TownHall.committee: Field ref;
const unique Persons$TownHall.districts: Field ref;
const unique Persons$Association: ClassName extends Persons$NamedElement complete;
const unique Persons$Association.committee: Field ref;
const unique Persons$Committee: ClassName extends Persons$NamedElement complete;
const unique Persons$District: ClassName extends Persons$NamedElement complete;
const unique Persons$District.facilities: Field ref;
const unique Persons$Facility: ClassName extends Persons$NamedElement complete;
const unique Persons$Facility.members: Field ref;
   axiom (forall r: ref :: dtype(r)!= Persons$Facility);
const unique Persons$SpecialFacility: ClassName extends Persons$Facility complete;
const unique Persons$OrdinaryFacility: ClassName extends Persons$Facility complete;

// print classifier table
axiom classifierTable[_Persons, _Community] == Persons$Community;
axiom classifierTable[_Persons, _Person] == Persons$Person;
axiom classifierTable[_Persons, _Man] == Persons$Man;
axiom classifierTable[_Persons, _Woman] == Persons$Woman;
axiom classifierTable[_Persons, _TownHall] == Persons$TownHall;
axiom classifierTable[_Persons, _Association] == Persons$Association;
axiom classifierTable[_Persons, _NamedElement] == Persons$NamedElement;
axiom classifierTable[_Persons, _Committee] == Persons$Committee;
axiom classifierTable[_Persons, _District] == Persons$District;
axiom classifierTable[_Persons, _Facility] == Persons$Facility;
axiom classifierTable[_Persons, _SpecialFacility] == Persons$SpecialFacility;
axiom classifierTable[_Persons, _OrdinaryFacility] == Persons$OrdinaryFacility;

// if src mm print valid src
