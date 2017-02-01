// ---------------------------------------------------------------
// -- Native library of ATL transformation framework -------------
// ---------------------------------------------------------------
  
const classifierTable : [String, String] ClassName;

var $srcHeap : HeapType where $IsGoodHeap($srcHeap);
var $tarHeap : HeapType where $IsGoodHeap($tarHeap);
var $linkHeap : HeapType where $IsGoodHeap($tarHeap);




procedure NTransientLink#setRule
	(stk: Seq BoxType, link: ref, ruleName: String) 
returns 
	(newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2; 
  requires $Unbox(Seq#Index(stk, Seq#Length(stk)-1)):String == ruleName;
  requires dtype(link) <: Native$TransientLink;
  modifies $linkHeap;
  ensures read($linkHeap, link, TransientLink#rule) == ruleName;
  ensures (forall<T> $f: Field T :: $f!=TransientLink#rule ==> 
	read($linkHeap, link, $f) == read(old($linkHeap), link, $f)
  );
  ensures (forall<alpha> $o: ref, $f: Field alpha :: { read($linkHeap, $o, $f) } $o != null && read(old($linkHeap), $o, alloc) ==> read($linkHeap, $o, $f) == read(old($linkHeap), $o, $f) || $o == link);
  ensures $HeapSucc(old($linkHeap), $linkHeap); 
  ensures newStk == Seq#Take(stk, Seq#Length(stk)-2);

  

procedure  NTransientLink#addSourceElement
	(stk: Seq BoxType, link: ref, key: String, val: ref) 
returns 
	(newStk: Seq BoxType);
  requires Seq#Length(stk) >= 3; 
  requires $Unbox(Seq#Index(stk, Seq#Length(stk)-1)):ref == val;
  requires $Unbox(Seq#Index(stk, Seq#Length(stk)-2)):String == key;
  requires $Unbox(Seq#Index(stk, Seq#Length(stk)-3)):ref == link;
  requires dtype(link) <: Native$TransientLink;
  modifies $linkHeap;
  ensures read($linkHeap, link, TransientLink#source) == Map#Build(old($linkHeap[link, TransientLink#source]), key, val);
  ensures (forall<T> $f: Field T :: $f!=TransientLink#source ==> 
	read($linkHeap, link, $f) == read(old($linkHeap), link, $f)
  );
  ensures (forall<alpha> $o: ref, $f: Field alpha :: { read($linkHeap, $o, $f) } $o != null && read(old($linkHeap), $o, alloc) ==> read($linkHeap, $o, $f) == read(old($linkHeap), $o, $f) || $o == link);
  ensures $HeapSucc(old($linkHeap), $linkHeap); 
  ensures newStk == Seq#Take(stk, Seq#Length(stk)-3);  

  
  
procedure NTransientLink#addTargetElement
	(stk: Seq BoxType, link: ref, key: String, val: ref) 
returns 
	(newStk: Seq BoxType);
  requires Seq#Length(stk) >= 3; 
  requires $Unbox(Seq#Index(stk, Seq#Length(stk)-1)):ref == val;
  requires $Unbox(Seq#Index(stk, Seq#Length(stk)-2)):String == key;
  requires $Unbox(Seq#Index(stk, Seq#Length(stk)-3)):ref == link;
  requires dtype(link) <: Native$TransientLink;
  modifies $linkHeap;
  ensures read($linkHeap, link, TransientLink#target) == Map#Build(old($linkHeap[link, TransientLink#target]), key, val);
  ensures (forall<T> $f: Field T :: $f!=TransientLink#target ==> 
	read($linkHeap, link, $f) == read(old($linkHeap), link, $f)
  );
  ensures (forall<alpha> $o: ref, $f: Field alpha :: { read($linkHeap, $o, $f) } $o != null && read(old($linkHeap), $o, alloc) ==> read($linkHeap, $o, $f) == read(old($linkHeap), $o, $f) || $o == link);
  ensures $HeapSucc(old($linkHeap), $linkHeap); 
  ensures newStk == Seq#Take(stk, Seq#Length(stk)-3);


procedure NTransientLink#getSourceElement
	(stk: Seq BoxType, link: ref, key: String) 
returns 
	(newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2; 
  requires $Unbox(Seq#Index(stk, Seq#Length(stk)-1)):String == key;
  requires $Unbox(Seq#Index(stk, Seq#Length(stk)-2)):ref == link;
  requires dtype(link) <: Native$TransientLink;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(Map#Elements($linkHeap[link, TransientLink#source])[key]));


procedure NTransientLink#getTargetElement
	(stk: Seq BoxType, link: ref, key: String) 
returns 
	(newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2; 
  requires $Unbox(Seq#Index(stk, Seq#Length(stk)-1)):String == key;
  requires $Unbox(Seq#Index(stk, Seq#Length(stk)-2)):ref == link;
  requires dtype(link) <: Native$TransientLink; 
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(Map#Elements($linkHeap[link, TransientLink#target])[key]));


// TODO: refactoring, heap is not used as a parameter.
procedure ASM#Resolve<alpha>(stk: Seq BoxType, heap: HeapType, e: alpha) returns (newStk: Seq BoxType);
  requires $Unbox(Seq#Index(stk, Seq#Length(stk)-2)) == Asm;
  ensures newStk == Seq#Build(
	Seq#Take(stk, Seq#Length(stk)-2), 
	ASM#Resolve#Sem($Unbox(Seq#Index(stk, Seq#Length(stk)-2)), $srcHeap, $tarHeap, e)
	);

function ASM#Resolve#Sem<alpha>(this: ref, iHeap: HeapType, oHeap: HeapType, elem: alpha) : BoxType;
	axiom (forall this:ref, iHeap, oHeap: HeapType, elem: String ::
		ASM#Resolve#Sem(this, iHeap, oHeap, elem) == $Box(elem)
	);
	axiom (forall this:ref, iHeap, oHeap: HeapType, elem: bool ::
		ASM#Resolve#Sem(this, iHeap, oHeap, elem) == $Box(elem)
	);	
	axiom (forall this:ref, iHeap, oHeap: HeapType, elem: int ::
		ASM#Resolve#Sem(this, iHeap, oHeap, elem) == $Box(elem)
	);
	axiom (forall this:ref, iHeap, oHeap: HeapType, elem: ref ::
		dtype(elem) != class._System.array ==>
		ASM#Resolve#Sem(this, iHeap, oHeap, elem) == $Box(getTarsBySrcs(Seq#Singleton(elem)))
	);
	axiom (forall this:ref, iHeap, oHeap: HeapType, elem: ref ::
		dtype(elem) == class._System.array ==>
		  _System.array.Length($Unbox(ASM#Resolve#Sem(this, iHeap, oHeap, elem))) == _System.array.Length(elem) 
		  && dtype($Unbox(ASM#Resolve#Sem(this, iHeap, oHeap, elem))) == class._System.array
		  && ( forall __i: int :: 0<=__i && __i<_System.array.Length(elem) ==>
              $Unbox(read(oHeap, $Unbox(ASM#Resolve#Sem(this, iHeap, oHeap, elem)), IndexField(__i))):ref == getTarsBySrcs(Seq#Singleton( $Unbox(read(iHeap, elem, IndexField(__i))): ref) )
		  ));
	
function invisble#getLinkbySources(s: Set ref): ref;
  axiom (forall s1,s2 : Set ref :: !Set#Equal(s1,s2) ==> 
	invisble#getLinkbySources(s1) != invisble#getLinkbySources(s2));
	
/* ------------------------------------------------------ */ 

function Fun#LIB#AllInstanceFrom(h:HeapType, t: ClassName): Seq ref;
  // the length of the return result is >=0; can be useful for termination proof.
  axiom (forall h:HeapType, t: ClassName :: 
    Seq#Length(Fun#LIB#AllInstanceFrom(h, t)) >= 0
  ); 
  // all the model elements contained by the return result are of type $t$ and are allocated
  axiom (forall h:HeapType, t: ClassName, i:int :: 
	( 0<=i && i<Seq#Length(Fun#LIB#AllInstanceFrom(h,t)) ) ==> 
		dtype( Seq#Index(Fun#LIB#AllInstanceFrom(h,t),i) ) <: t
		&& Seq#Index(Fun#LIB#AllInstanceFrom(h,t),i) != null
		&& read(h, Seq#Index(Fun#LIB#AllInstanceFrom(h,t),i), alloc)
  );
  // all the allocated ref that of type $t$ are contained by the return result. 
  axiom (forall h:HeapType, o: ref, t: ClassName :: 
	(o!=null && read(h, o, alloc) && dtype(o) <: t) <==>
		Seq#Contains(Fun#LIB#AllInstanceFrom(h,t),o)
  );
  // all the model elements contained by the return result are unique 
  axiom (forall h:HeapType, t: ClassName, i,j:int :: 
    ( (0<=i && i<Seq#Length(Fun#LIB#AllInstanceFrom(h, t))) && 
	  (0<=j && j<Seq#Length(Fun#LIB#AllInstanceFrom(h, t))) && i != j) ==>
		Seq#Index(Fun#LIB#AllInstanceFrom(h, t),i) != Seq#Index(Fun#LIB#AllInstanceFrom(h, t),j)
  ); 

  
procedure LIB#AllInstanceFrom(stk: Seq BoxType, h: HeapType) returns (newStk: Seq BoxType, res: Seq ref);
  ensures res == Fun#LIB#AllInstanceFrom(h, $Unbox(Seq#Index(stk, Seq#Length(stk)-2)));
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(res));
 
 
 
 
 
/* h refers to linkheap, r referes to the rule name */
function NTransientLinkSet#getLinksByRule(h:HeapType, rule: String): Seq ref;
  // the length of the return result is >=0; can be useful for termination proof.
  axiom (forall h:HeapType, r: String :: 
    Seq#Length(NTransientLinkSet#getLinksByRule(h, r)) >= 0
  ); 
  // unique links
  axiom (forall h:HeapType, r: String, i,j:int :: 
    ( (0<=i && i<Seq#Length(NTransientLinkSet#getLinksByRule(h,r))) && 
	  (i+1<=j && j<Seq#Length(NTransientLinkSet#getLinksByRule(h,r)) ) ==>
		Seq#Index(NTransientLinkSet#getLinksByRule(h, r),i) != Seq#Index(NTransientLinkSet#getLinksByRule(h, r),j)
  ));
  
		
//--------------------------------
//-------- Helper Function -------
//--------------------------------

function top(Seq BoxType): BoxType;
  axiom (forall stk: Seq BoxType :: top(stk) == Seq#Index(stk, Seq#Length(stk)-1));


  

procedure OCL#Object#Equal<T> (stk: Seq BoxType, o1: T, o2: T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	o1 == o2
  ));  



// ASM-specific
const System.reserved: ClassName;
const unique Asm: ref;
  axiom Asm != null;
  axiom dtype(Asm) <: System.reserved;
  axiom (forall h:HeapType::read(h,Asm,alloc));
const unique ASM.links : Field (Set ref);
const unique Native$TransientLink: ClassName;



	// see org.eclipse.m2m.atl.engine.emfvm.lib.TransientLink
const unique TransientLink#source: Field (Map String ref);
const unique TransientLink#target: Field (Map String ref);
const unique TransientLink#rule: Field String;
const unique _#native: String;
const unique _TransientLink: String;
  axiom classifierTable[_#native, _TransientLink] == Native$TransientLink;

