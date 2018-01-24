// -- DafnyPrelude Extension for OCL
// -- AUTHOR: ZHENG CHENG
// -- DATE: 2015





// ---------------------------------------------------------------
// Axiom of FieldOfDecl, 
// ---------------------------------------------------------------
// the commented expression is not true for type system with inheritance.
axiom (forall<T> cl : ClassName, nm: NameFamily :: 
   {FieldOfDecl(cl, nm): Field T}
   /*DeclType(FieldOfDecl(cl, nm): Field T) == cl && */ 
   DeclName(FieldOfDecl(cl, nm): Field T) == nm);

   
// ---------------------------------------------------------------
// OCL: Any 
// ---------------------------------------------------------------
// check the value of input is undefined or not. 
// Notice: String is tricky based on its modelling of sequence of integer, so it is always defined. 
// A direct outcome is VeriATL forces value of string to be defined on models, i.e. set to empty string by default.
function Any#IsUndefined<T>(HeapType,T): bool;
  axiom (forall h:HeapType,i: int :: !Any#IsUndefined(h,i) );
  axiom (forall h:HeapType,b: bool :: !Any#IsUndefined(h,b) );
  axiom (forall h:HeapType,s: String :: !Any#IsUndefined(h,s) );
  axiom (forall h:HeapType,r: ref :: Any#IsUndefined(h,r) <==> (r==null || !read(h,r,alloc)) );



   
// ---------------------------------------------------------------
// OCL: String 
// We model each string as a sequence of int.
// each character has a integer representation (ASCII), e.g. 'A' = 65, 'a' = 97
// ---------------------------------------------------------------

type String = Seq Char;
type Char = int;


// return an upper case copy of input
function String#ToUpper(String): String;
  axiom (forall s: String :: { Seq#Length(String#ToUpper(s)) }
	Seq#Length(String#ToUpper(s)) == Seq#Length(s));
  axiom (forall s: String, i: int :: { Seq#Index(String#ToUpper(s),i) }
	(0 <= i && i < Seq#Length(s) ==> 
		((97 <= Seq#Index(s,i) && Seq#Index(s,i) <= 122 ==> Seq#Index(s,i) == Seq#Index(String#ToUpper(s),i) + 32) &&
		 (97 > Seq#Index(s,i) || Seq#Index(s,i) > 122 ==> Seq#Index(s,i) == Seq#Index(String#ToUpper(s),i))) 
	) 
  );

// return an lower case copy of input  
function String#ToLower(String): String;
  axiom (forall s: String :: { Seq#Length(String#ToLower(s)) }
	Seq#Length(String#ToLower(s)) == Seq#Length(s));
  axiom (forall s: String, i: int :: { Seq#Index(String#ToLower(s),i) }
	(0 <= i && i < Seq#Length(s) ==> 
		((65 <= Seq#Index(s,i) && Seq#Index(s,i) <= 90 ==> Seq#Index(s,i) == Seq#Index(String#ToLower(s),i) - 32) &&
		 (65 > Seq#Index(s,i) || Seq#Index(s,i) > 90 ==> Seq#Index(s,i) == Seq#Index(String#ToLower(s),i))) 
	) 
  );

// return a boolean value stating whether src starts with prefix.
function String#StartsWith(src: String, prefix: String): bool;
  axiom (forall s: String, pf: String :: { String#StartsWith(s,pf) }
	String#StartsWith(s,pf) <==> 
		(forall i: int :: { Seq#Index(s,i) } { Seq#Index(pf,i) }
			0 <= i && i < Seq#Length(pf) ==> Seq#Index(s,i) == Seq#Index(pf,i))
  );

// return a boolean value stating whether src ends with suffix.  
function String#EndsWith(src: String, suffix: String): bool;
  axiom (forall s: String, sf: String :: { String#EndsWith(s,sf) }
	String#EndsWith(s,sf) <==> 
		(forall i: int :: { Seq#Index(s,i) } { Seq#Index(sf,i) }
			0 <= i && i < Seq#Length(sf) ==> Seq#Index(s,i+Seq#Length(s)-Seq#Length(sf)) == Seq#Index(sf,i))
  );  

// returns the substring of $s$ starting from the character indexed by $lower$ to the character indexed by $upper$. 
function String#Substring(s: String, lower: int, upper: int): String;
  axiom (forall s: String, l: int, u: int ::
	String#Substring(s,l,u) == Seq#Drop(Seq#Take(s,u),l)
  );



// ---------------------------------------------------------------
// OCL: Set Extension
// ---------------------------------------------------------------
  
// returns difference of two sets
function Set#DifferenceOne<T>(Set T, T): Set T;
//TODO: Double check
  axiom (forall<T> a: Set T, x: T, o: T :: { Set#DifferenceOne(a,x)[o] }
    Set#DifferenceOne(a,x)[o] <==> o!=x && a[o]);	
  axiom (forall<T> a: Set T, x: T :: { Set#DifferenceOne(a, x) }
    !Set#DifferenceOne(a, x)[x]);

// returns whether the object $o$ is included in $s$.
function Set#Includes<T>(Set T, T): bool;  
  axiom (forall<T> a: Set T, x: T :: { Set#Includes(a, x) }
    Set#Includes(a, x) <==> a[x]);

// returns whether the object $o$ is excluded from $s$.
function Set#Excludes<T>(Set T, T): bool;
  axiom (forall<T> a: Set T, x: T :: { Set#Excludes(a, x) }
    Set#Excludes(a, x) <==> !a[x]);

// returns whether $s$ is empty.	
function Set#IsEmpty<T>(Set T): bool;
  axiom (forall<T> a: Set T :: { Set#IsEmpty(a) }
    Set#IsEmpty(a) <==> (Set#Equal(a, Set#Empty())));

// returns whether $s$ is not empty.
function Set#NotEmpty<T>(Set T): bool;  
  axiom (forall<T> a: Set T :: { Set#NotEmpty(a) }
    Set#NotEmpty(a) <==> (!Set#Equal(a, Set#Empty())));

// ---------------------------------------------------------------
// OCL: Bag Extension
// ---------------------------------------------------------------
// return a new bag that as same as $s$ except the occurrence $o$ decreased by 1.
function MultiSet#DifferenceOne<T>(MultiSet T, T): MultiSet T;
// pure containment axiom 
axiom (forall<T> a: MultiSet T, x: T, o: T :: { MultiSet#DifferenceOne(a,x)[o] }
  0 < MultiSet#DifferenceOne(a,x)[o] <==> o != x && 0 < a[o]);
// deleting from bag decreases count by one
axiom (forall<T> a: MultiSet T, x: T :: { MultiSet#DifferenceOne(a, x) }
  a[x] > 0 ==> MultiSet#DifferenceOne(a, x)[x] == a[x] - 1);
// other elements unchanged
axiom (forall<T> a: MultiSet T, x: T, y: T :: { MultiSet#DifferenceOne(a, x), a[y] }
  x != y ==> a[y] == MultiSet#DifferenceOne(a, x)[y]);
  
// returns whether the object $o$ is included in/from $s$.
function MultiSet#Includes<T>(MultiSet T, T): bool;  
  axiom (forall<T> a: MultiSet T, x: T :: { MultiSet#Includes(a, x) }
    MultiSet#Includes(a, x) <==> (a[x]>0));

// returns whether the object $o$ is excluded in/from $s$.	
function MultiSet#Excludes<T>(MultiSet T, T): bool;
  axiom (forall<T> a: MultiSet T, x: T :: { MultiSet#Excludes(a, x) }
    MultiSet#Excludes(a, x) <==> (a[x]==0));

// returns whether $s$ is empty. 	
function MultiSet#IsEmpty<T>(MultiSet T): bool;
  axiom (forall<T> a: MultiSet T :: { MultiSet#IsEmpty(a) }
    MultiSet#IsEmpty(a) <==> (MultiSet#Equal(a, MultiSet#Empty())));

// returns whether $s$ is not empty. 	
function MultiSet#NotEmpty<T>(MultiSet T): bool;  
  axiom (forall<T> a: MultiSet T :: { MultiSet#NotEmpty(a) }
    MultiSet#NotEmpty(a) <==> (!MultiSet#Equal(a, MultiSet#Empty())));  
  
// ---------------------------------------------------------------
// OCL: Seq Extension
// ---------------------------------------------------------------
// returns a new sequence with the element $o$ prepended to $s$
function Seq#Prepend<T>(Seq T, T): Seq T;  
  axiom (forall<T> a: Seq T, x: T :: { Seq#Prepend(a, x) }
    Seq#Equal(Seq#Prepend(a, x), Seq#Append(Seq#Singleton(x), a))); 

// returns the first element of $s$ (OCLUndefined if $s$ is empty).
// TODO: cases when a == Seq#Empty() 	
function Seq#First<T>(Seq T): T;  
  axiom (forall<T> a: Seq T :: { Seq#First(a) }
  a != Seq#Empty() ==> (Seq#First(a) == Seq#Index(a,0)) ); 

// returns the last element of $s$ (OCLUndefined if $s$ is empty).
// TODO: cases when a == Seq#Empty()   
function Seq#Last<T>(Seq T): T;  
  axiom (forall<T> a: Seq T :: { Seq#Last(a) }
  a != Seq#Empty() ==> (Seq#Last(a) == Seq#Index(a,Seq#Length(a)-1)) );   

// returns a new sequence with the element $o$ added at index $n$ of $s$.  
function Seq#InsertAt<T>(Seq T, int, T): Seq T;
  axiom (forall<T> a: Seq T, n: int, x: T :: { Seq#InsertAt(a, n, x) }
    n<Seq#Length(a) ==> 
	  Seq#Equal(Seq#InsertAt(a, n, x), Seq#Append(Seq#Build(Seq#Take(a,n),x), Seq#Drop(a,n))));
  axiom (forall<T> a: Seq T, n: int, x: T :: { Seq#InsertAt(a, n, x) }
    n==Seq#Length(a) ==> 
	  Seq#Equal(Seq#InsertAt(a, n, x), Seq#Build(a, x))); 	  

// returns $s$ starting from the element indexed by $lower$ to the element indexed by $upper$.	  
function Seq#Subsequence<T>(Seq T, int, int): Seq T;
  axiom (forall<T> a: Seq T, lo: int, hi: int :: { Seq#Subsequence(a, lo, hi) }
    Seq#Equal(Seq#Subsequence(a,lo,hi), Seq#Drop(Seq#Take(a,hi),lo))); 

// returns whether the object $o$ is excluded in/from $s$	
function Seq#NotContains<T>(Seq T, T): bool;
  axiom (forall<T> a: Seq T, x: T :: { Seq#NotContains(a, x) }
    Seq#NotContains(a, x) <==> !Seq#Contains(a,x));

// returns whether $s$ is empty.	
function Seq#IsEmpty<T>(Seq T): bool;
  axiom (forall<T> a: Seq T:: { Seq#IsEmpty(a) }
    Seq#IsEmpty(a) <==> (Seq#Equal(a, Seq#Empty())));

// returns whether $s$ is not empty.	
function Seq#NotEmpty<T>(Seq T): bool;  
  axiom (forall<T> a: Seq T :: { Seq#NotEmpty(a) }
    Seq#NotEmpty(a) <==> (!Seq#Equal(a, Seq#Empty()))); 

// ---------------------------------------------------------------
// OCL: OrderedSet
// ---------------------------------------------------------------
// returns a new ordered set with the element $o$ append to $s$, if $o$ is not in $s$.
function OrderedSet#Append<T>(Seq T, T): Seq T;  
  axiom (forall<T> a: Seq T, x: T :: { OrderedSet#Append(a, x) }
    Seq#Contains(a, x) ==>
      Seq#Equal(OrderedSet#Append(a, x), a)); 
  axiom (forall<T> a: Seq T, x: T :: { OrderedSet#Append(a, x) }
    !Seq#Contains(a, x) ==>
      Seq#Equal(OrderedSet#Append(a, x), Seq#Build(a, x))); 

// returns a new ordered set with the element $o$ prepend to $s$, if $o$ is not in $s$.	  
function OrderedSet#Prepend<T>(Seq T, T): Seq T;  
  axiom (forall<T> a: Seq T, x: T :: { OrderedSet#Prepend(a, x) }
    Seq#Contains(a, x) ==>
      Seq#Equal(OrderedSet#Prepend(a, x), a)); 
  axiom (forall<T> a: Seq T, x: T :: { OrderedSet#Prepend(a, x) }
    !Seq#Contains(a, x) ==>
      Seq#Equal(OrderedSet#Prepend(a, x), Seq#Append(Seq#Singleton(x), a))); 

// returns a new ordered set with the element $o$ added at index $n$ of $s$, if $o$ is not in $s$.	  
function OrderedSet#InsertAt<T>(Seq T, int, T): Seq T;  
  axiom (forall<T> a: Seq T, n: int, x: T :: { OrderedSet#InsertAt(a, n, x) }
    Seq#Contains(a, x) ==>
      Seq#Equal(OrderedSet#InsertAt(a,n,x), a)); 
  axiom (forall<T> a: Seq T, n: int, x: T :: { OrderedSet#InsertAt(a, n, x) }
    !Seq#Contains(a, x) && n<Seq#Length(a) ==>
      Seq#Equal(OrderedSet#InsertAt(a,n,x), Seq#Append(Seq#Build(Seq#Take(a,n),x), Seq#Drop(a,n)))); 
  axiom (forall<T> a: Seq T, n: int, x: T :: { OrderedSet#InsertAt(a, n, x) }
    !Seq#Contains(a, x) && n==Seq#Length(a)==>
      Seq#Equal(OrderedSet#InsertAt(a,n,x), Seq#Build(a, x)));
  
// ---------------------------------------------------------------
// OCL: Sequence - Generic Iterators, 
// see 'testLibOCL.bpl' for example of its application
// TODO: consider refactoring
// ---------------------------------------------------------------
// returns a boolean value stating whether there is exactly one element of the source collection for which body evaluates to true;
function Iterator#One<T>(s: Seq T, h: HeapType, f:[T,HeapType]bool): bool;
	axiom  (forall<T> s: Seq T, h: HeapType, f:[T,HeapType]bool :: { Iterator#One(s,h,f) } 
		Iterator#One(s,h,f) <==> Seq#Length(Iterator#Select(0,Seq#Length(s)-1,s,h,f)) == 1);

// returns one element of the source collection for which body evaluates to true. If body never evaluates to true, the operation returns null;		
function Iterator#Any<T>(s: Seq T, h: HeapType, f:[T,HeapType]bool): T;
	axiom  (forall<T> s: Seq T, h: HeapType, f:[T,HeapType]bool :: 
		Iterator#Any(s,h,f) == null <==> 
			(forall i: int :: 0<=i && i<Seq#Length(s) ==> !f[Seq#Index(s,i),h]));
	axiom  (forall<T> s: Seq T, h: HeapType, f:[T,HeapType]bool :: 
		Iterator#Any(s,h,f) != null <==> 
			f[Iterator#Any(s,h,f),h] && Seq#Contains(s, Iterator#Any(s,h,f)));

// returns the subset of the source collection for which body evaluates to true;	
function Iterator#Select<T>(lo: int, hi: int, s: Seq T, h: HeapType, f:[T, HeapType]bool): Seq T;
	// forward induction axiom, when filter expression evaluates to true.
	axiom (forall<T> lo: int, hi: int, s: Seq T, h:HeapType, f:[T, HeapType]bool :: {Iterator#Select(lo,hi,s,h,f)}
		lo<hi && f[Seq#Index(s,lo), h] ==>
		Iterator#Select(lo,hi,s,h,f) == Seq#Append(Seq#Singleton(Seq#Index(s,lo)),Iterator#Select(lo+1,hi,s,h,f))	
	);
	// forward induction axiom, when filter expression evaluates to false.
	axiom (forall<T> lo: int, hi: int, s: Seq T, h: HeapType, f:[T, HeapType]bool :: {Iterator#Select(lo,hi,s,h,f)}
		lo<hi && !f[Seq#Index(s,lo), h] ==>
		Iterator#Select(lo,hi,s,h,f) == Iterator#Select(lo+1,hi,s,h,f)
	);
    // backward induction axiom, when filter expression evaluates to true.
	axiom (forall<T> lo: int, hi: int, s: Seq T, h: HeapType, f:[T, HeapType]bool :: {Iterator#Select(lo,hi,s,h,f)}
		lo<hi && f[Seq#Index(s,hi-1), h]==>
		Iterator#Select(lo,hi,s,h,f) == Seq#Append(Iterator#Select(lo,hi-1,s,h,f), Seq#Singleton(Seq#Index(s,hi-1)))
	); 
	// backward induction axiom, when filter expression evaluates to false.
	axiom (forall<T> lo: int, hi: int, s: Seq T, h: HeapType, f:[T, HeapType]bool :: {Iterator#Select(lo,hi,s,h,f)}
		lo<hi && !f[Seq#Index(s,hi-1), h] ==>
		Iterator#Select(lo,hi,s,h,f) == Iterator#Select(lo,hi-1,s,h,f)
	);
	// splitting axiom
	axiom (forall<T> mid:int, lo: int, hi: int, s: Seq T, h: HeapType, f:[T, HeapType]bool :: {Iterator#Select(lo,mid,s,h,f), Iterator#Select(lo,hi,s,h,f)} {Iterator#Select(lo,mid,s,h,f), Iterator#Select(mid,hi,s,h,f)}
		lo<=mid && mid<=hi ==>
		Iterator#Select(lo,hi,s,h,f) == Seq#Append(Iterator#Select(lo,mid,s,h,f),Iterator#Select(mid,hi,s,h,f))
	);
	// consequence axiom
	axiom (forall<T> i:int, lo: int, hi: int, s: Seq T, h: HeapType, f:[T, HeapType]bool :: {Seq#Index(Iterator#Select(lo,hi,s,h,f),i)}
		0<=i && i<Seq#Length(Iterator#Select(lo,hi,s,h,f)) ==> f[Seq#Index(Iterator#Select(lo,hi,s,h,f),i), h]
	);

// returns a collection of elements which results in applying body to each element of the source collection;			
function Iterator#Collect<T,R>(s: Seq T, h: HeapType, f:[T,HeapType]R): Seq R;
	axiom (forall<T,R> s: Seq T, h: HeapType, f:[T,HeapType]R :: { Iterator#Collect(s,h,f) } 
		Seq#Length(s) == Seq#Length(Iterator#Collect(s,h,f))); 
	axiom (forall<T,R> s: Seq T, h: HeapType, f:[T,HeapType]R, i: int :: {Seq#Index(Iterator#Collect(s,h,f),i)}
		0<=i && i<Seq#Length(s) ==> f[Seq#Index(s,i),h] == Seq#Index(Iterator#Collect(s,h,f),i));

// returns the subset of the source collection for which body evaluates to false
function Iterator#Reject<T>(lo: int, hi: int, s: Seq T, h: HeapType, f:[T,HeapType]bool): Seq T;
	axiom (forall<T> lo: int, hi: int, s: Seq T, h:HeapType, f:[T, HeapType]bool :: {Iterator#Reject(lo,hi,s,h,f)}
		lo<hi && !f[Seq#Index(s,lo), h] ==>
		Iterator#Reject(lo,hi,s,h,f) == Seq#Append(Seq#Singleton(Seq#Index(s,lo)),Iterator#Reject(lo+1,hi,s,h,f))	
	);	
	axiom (forall<T> lo: int, hi: int, s: Seq T, h: HeapType, f:[T, HeapType]bool :: {Iterator#Reject(lo,hi,s,h,f)}
		lo<hi && f[Seq#Index(s,lo), h] ==>
		Iterator#Reject(lo,hi,s,h,f) == Iterator#Reject(lo+1,hi,s,h,f)
	);
	axiom (forall<T> lo: int, hi: int, s: Seq T, h: HeapType, f:[T, HeapType]bool :: {Iterator#Reject(lo,hi,s,h,f)}
		lo<hi && !f[Seq#Index(s,hi-1), h]==>
		Iterator#Reject(lo,hi,s,h,f) == Seq#Append(Iterator#Reject(lo,hi-1,s,h,f), Seq#Singleton(Seq#Index(s,hi-1)))
	); 
	axiom (forall<T> lo: int, hi: int, s: Seq T, h: HeapType, f:[T, HeapType]bool :: {Iterator#Reject(lo,hi,s,h,f)}
		lo<hi && f[Seq#Index(s,hi-1), h] ==>
		Iterator#Reject(lo,hi,s,h,f) == Iterator#Reject(lo,hi-1,s,h,f)
	);
	axiom (forall<T> mid:int, lo: int, hi: int, s: Seq T, h: HeapType, f:[T, HeapType]bool :: {Iterator#Reject(lo,mid,s,h,f), Iterator#Reject(lo,hi,s,h,f)} {Iterator#Reject(lo,mid,s,h,f), Iterator#Reject(mid,hi,s,h,f)}
		lo<=mid && mid<=hi ==>
		Iterator#Reject(lo,hi,s,h,f) == Seq#Append(Iterator#Reject(lo,mid,s,h,f),Iterator#Reject(mid,hi,s,h,f))
	);
	axiom (forall<T> i:int, lo: int, hi: int, s: Seq T, h: HeapType, f:[T, HeapType]bool :: {Seq#Index(Iterator#Reject(lo,hi,s,h,f),i)}
		0<=i && i<Seq#Length(Iterator#Reject(lo,hi,s,h,f)) ==> !f[Seq#Index(Iterator#Reject(lo,hi,s,h,f),i), h]
	);
	


// returns a boolean value stating whether body evaluates to true for all elements of the source collection;	
function Iterator#Forall<T>(lo: int, hi: int, s: Seq T, h: HeapType, f:[T, HeapType]bool): bool;
	axiom (forall<T> lo: int, hi: int, s: Seq T, h:HeapType, f:[T, HeapType]bool :: {Iterator#Forall(lo,hi,s,h,f)}
		lo<hi && f[Seq#Index(s,lo), h] ==>
		(Iterator#Forall(lo,hi,s,h,f) <==> Iterator#Forall(lo+1,hi,s,h,f))	
	);
	axiom (forall<T> lo: int, hi: int, s: Seq T, h:HeapType, f:[T, HeapType]bool :: {Iterator#Forall(lo,hi,s,h,f)}
		lo<hi && !f[Seq#Index(s,lo), h] ==>
		!Iterator#Forall(lo,hi,s,h,f) 
	);
	axiom (forall<T> lo: int, hi: int, s: Seq T, h: HeapType, f:[T, HeapType]bool :: {Iterator#Forall(lo,hi,s,h,f)}
		lo<hi && f[Seq#Index(s,hi-1), h]==>
		(Iterator#Forall(lo,hi,s,h,f) <==> Iterator#Forall(lo,hi-1,s,h,f))	
	); 
	axiom (forall<T> lo: int, hi: int, s: Seq T, h: HeapType, f:[T, HeapType]bool :: {Iterator#Forall(lo,hi,s,h,f)}
		lo<hi && !f[Seq#Index(s,hi-1), h] ==>
		!Iterator#Forall(lo,hi,s,h,f) 
	);
	axiom (forall<T> mid:int, lo: int, hi: int, s: Seq T, h: HeapType, f:[T, HeapType]bool :: {Iterator#Forall(lo,mid,s,h,f), Iterator#Forall(lo,hi,s,h,f)} {Iterator#Forall(lo,mid,s,h,f), Iterator#Forall(mid,hi,s,h,f)}
		lo<=mid && mid<=hi ==>
		(Iterator#Forall(lo,hi,s,h,f) <==> (Iterator#Forall(lo,mid,s,h,f) && Iterator#Forall(mid,hi,s,h,f)))
	);

// returns a boolean value stating whether body evaluates to true for at least one element of the source collection;	
function Iterator#Exists<T>(lo: int, hi: int, s: Seq T, h: HeapType, f:[T, HeapType]bool): bool;
	axiom (forall<T> lo: int, hi: int, s: Seq T, h:HeapType, f:[T, HeapType]bool :: {Iterator#Exists(lo,hi,s,h,f)}
		lo<hi && f[Seq#Index(s,lo), h] ==>
		Iterator#Exists(lo,hi,s,h,f)
	);
	axiom (forall<T> lo: int, hi: int, s: Seq T, h:HeapType, f:[T, HeapType]bool :: {Iterator#Exists(lo,hi,s,h,f)}
		lo<hi && !f[Seq#Index(s,lo), h] ==>
		(Iterator#Exists(lo,hi,s,h,f) <==> Iterator#Exists(lo+1,hi,s,h,f))
	);
	axiom (forall<T> lo: int, hi: int, s: Seq T, h:HeapType, f:[T, HeapType]bool :: {Iterator#Exists(lo,hi,s,h,f)}
		lo<hi && f[Seq#Index(s,hi-1), h] ==>
		Iterator#Exists(lo,hi,s,h,f)
	);
	axiom (forall<T> lo: int, hi: int, s: Seq T, h:HeapType, f:[T, HeapType]bool :: {Iterator#Exists(lo,hi,s,h,f)}
		lo<hi && !f[Seq#Index(s,hi-1), h] ==>
		(Iterator#Exists(lo,hi,s,h,f) <==> Iterator#Exists(lo,hi-1,s,h,f))
	);
	axiom (forall<T> mid:int, lo: int, hi: int, s: Seq T, h: HeapType, f:[T, HeapType]bool :: {Iterator#Exists(lo,mid,s,h,f), Iterator#Exists(lo,hi,s,h,f)} {Iterator#Exists(lo,mid,s,h,f), Iterator#Exists(mid,hi,s,h,f)}
		lo<=mid && mid<=hi ==>
		(Iterator#Exists(lo,hi,s,h,f) <==> (Iterator#Exists(lo,mid,s,h,f) && Iterator#Exists(mid,hi,s,h,f)))
	);
	

function Iterator#isUnique<T,R>(s: Seq T, h: HeapType, f:[T, HeapType]R): bool;
	axiom (forall<T,R> s: Seq T, h: HeapType, f:[T, HeapType]R :: {Iterator#isUnique(s,h,f)}
		Iterator#isUnique(s,h,f) <==> (forall i,j: int :: 0<=i && i<j && j <Seq#Length(s) ==> f[Seq#Index(s,i),h]!=f[Seq#Index(s,j),h])
	);



// ---------------------------------------------------------------
// -- OCL ASM Wrapper Starts
// -- USED BY ASM2BOOGIE COMPILER
// -- AUTHOR: ZHENG CHENG
// ---------------------------------------------------------------

	

// ---------------------------------------------------------------
// -- OCL Wrapper: Any, 8 operations             ---------------------
// ---------------------------------------------------------------
// # todo: isUndefined for ref only at the moment
procedure OCLAny#IsUndefined(stk: Seq BoxType, __h:HeapType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk)>=1;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	$Unbox(Seq#Index(stk,Seq#Length(stk)-1)): ref == null || !read(__h, $Unbox(Seq#Index(stk,Seq#Length(stk)-1)): ref ,alloc)
  )));
  
  


procedure OCLAny#Equal<T>(stk: Seq BoxType,o1:T,o2:T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk)>=2;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	o1 == o2
  )));

procedure OCLAny#NotEqual<T>(stk: Seq BoxType,o1:T,o2:T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk)>=2;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	o1 != o2
  )));
  
procedure OCLAny#IsTypeof(stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk)>=2;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	dtype($Unbox(Seq#Index(stk,Seq#Length(stk)-2)): ref) == $Unbox(Seq#Index(stk,Seq#Length(stk)-1)): ClassName
  )));  
  
procedure OCLAny#IsKindof(stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk)>=2;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	dtype($Unbox(Seq#Index(stk,Seq#Length(stk)-2)): ref) <: $Unbox(Seq#Index(stk,Seq#Length(stk)-1)): ClassName
  )));  

procedure OCLAny#Type(stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk)>=1;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	dtype($Unbox(Seq#Index(stk,Seq#Length(stk)-2)): ref)
  )));  


procedure OCLAny#Not(stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk)>=1;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	!($Unbox(Seq#Index(stk,Seq#Length(stk)-1)): bool)
  )));

procedure OCLAny#And(stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk)>=2;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	($Unbox(Seq#Index(stk,Seq#Length(stk)-2)): bool) &&
	($Unbox(Seq#Index(stk,Seq#Length(stk)-1)): bool)
  )));
  
// ---------------------------------------------------------------
// -- OCL Wrapper: Boolean, 5 operations             ---------------------
// ---------------------------------------------------------------


procedure OCL#Boolean#Not (stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 1;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(!($Unbox(Seq#Index(stk,Seq#Length(stk)-1)):bool)));  

procedure OCL#Boolean#And (stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	($Unbox(Seq#Index(stk,Seq#Length(stk)-2)):bool) && 
	($Unbox(Seq#Index(stk,Seq#Length(stk)-1)):bool)
  ));  
 
procedure OCL#Boolean#Or (stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	($Unbox(Seq#Index(stk,Seq#Length(stk)-2)):bool) || 
	($Unbox(Seq#Index(stk,Seq#Length(stk)-1)):bool)
  ));

procedure OCL#Boolean#Xor (stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	(($Unbox(Seq#Index(stk,Seq#Length(stk)-2)):bool) || ($Unbox(Seq#Index(stk,Seq#Length(stk)-1)):bool)) &&
	!(($Unbox(Seq#Index(stk,Seq#Length(stk)-2)):bool) && ($Unbox(Seq#Index(stk,Seq#Length(stk)-1)):bool))
  ));    

procedure OCL#Boolean#Implies (stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	!($Unbox(Seq#Index(stk,Seq#Length(stk)-2)):bool) ||
	($Unbox(Seq#Index(stk,Seq#Length(stk)-1)):bool)
  ));  

// ---------------------------------------------------------------
// -- OCL Wrapper: Integer, 11 operations             ---------------------
// ---------------------------------------------------------------


procedure OCL#Integer#LT (stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	($Unbox(Seq#Index(stk,Seq#Length(stk)-2)):int) <
	($Unbox(Seq#Index(stk,Seq#Length(stk)-1)):int)
  )); 


procedure OCL#Integer#GT (stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	($Unbox(Seq#Index(stk,Seq#Length(stk)-2)):int) >
	($Unbox(Seq#Index(stk,Seq#Length(stk)-1)):int)
  )); 
  
procedure OCL#Integer#LE (stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	($Unbox(Seq#Index(stk,Seq#Length(stk)-2)):int) <=
	($Unbox(Seq#Index(stk,Seq#Length(stk)-1)):int)
  )); 

procedure OCL#Integer#GE (stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	($Unbox(Seq#Index(stk,Seq#Length(stk)-2)):int) >=
	($Unbox(Seq#Index(stk,Seq#Length(stk)-1)):int)
  ));   
  
procedure OCL#Integer#EQ (stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	($Unbox(Seq#Index(stk,Seq#Length(stk)-2)):int) ==
	($Unbox(Seq#Index(stk,Seq#Length(stk)-1)):int)
  ));   

procedure OCL#Integer#NEQ (stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	($Unbox(Seq#Index(stk,Seq#Length(stk)-2)):int) !=
	($Unbox(Seq#Index(stk,Seq#Length(stk)-1)):int)
  ));     
   
  
procedure OCL#Integer#ADD (stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	($Unbox(Seq#Index(stk,Seq#Length(stk)-2)):int) +
	($Unbox(Seq#Index(stk,Seq#Length(stk)-1)):int)
  ));  
  
procedure OCL#Integer#SUB (stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	($Unbox(Seq#Index(stk,Seq#Length(stk)-2)):int) -
	($Unbox(Seq#Index(stk,Seq#Length(stk)-1)):int)
  ));  

procedure OCL#Integer#MULTI (stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	($Unbox(Seq#Index(stk,Seq#Length(stk)-2)):int) *
	($Unbox(Seq#Index(stk,Seq#Length(stk)-1)):int)
  ));    

procedure OCL#Integer#DIV (stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	($Unbox(Seq#Index(stk,Seq#Length(stk)-2)):int) div
	($Unbox(Seq#Index(stk,Seq#Length(stk)-1)):int)
  )); 
  
procedure OCL#Integer#MOD (stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	($Unbox(Seq#Index(stk,Seq#Length(stk)-2)):int) mod
	($Unbox(Seq#Index(stk,Seq#Length(stk)-1)):int)
  )); 

// ---------------------------------------------------------------
// -- OCL Wrapper: String, 7 operations             ---------------------
// ---------------------------------------------------------------
procedure OCL#String#Size (stk: Seq BoxType, s1: String) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 1;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	Seq#Length(s1)
  )); 

procedure OCL#String#ToUpper (stk: Seq BoxType, s1: String) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 1;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	String#ToUpper(s1)
  ));

procedure OCL#String#ToLower (stk: Seq BoxType, s1: String) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 1;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	String#ToLower(s1)
  ));
  
procedure OCL#String#Concat (stk: Seq BoxType, s1: String, s2: String) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	Seq#Append(s1, s2)
  ));
  
procedure OCL#String#StartsWith (stk: Seq BoxType, s1: String, s2: String) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	String#StartsWith(s1, s2)
  ));
  
procedure OCL#String#EndsWith (stk: Seq BoxType, s1: String, s2: String) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	String#EndsWith(s1, s2)
  ));
  
procedure OCL#String#Substring (stk: Seq BoxType, s1: String, lo: int, hi: int) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 3;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-3), $Box(
	String#Substring(s1,lo,hi)
  ));
  
// ---------------------------------------------------------------
// -- OCL Wrapper: Set, 12 operations                 ---------------------
// ---------------------------------------------------------------
procedure OCL#Set#Union<T> (stk: Seq BoxType, s1: Set T, s2: Set T ) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	Set#Union(s1, s2)
  ));   

procedure OCL#Set#Intersection<T> (stk: Seq BoxType, s1: Set T, s2: Set T ) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	Set#Intersection(s1, s2)
  ));  

procedure OCL#Set#Difference<T> (stk: Seq BoxType, s1: Set T, s2: Set T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	Set#Difference(s1, s2)
  ));


procedure OCL#Set#Including<T> (stk: Seq BoxType, s: Set T, e: T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	Set#UnionOne(s, e)
  )); 

procedure OCL#Set#Excluding<T> (stk: Seq BoxType, s: Set T, e: T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	Set#DifferenceOne(s, e)
  )); 

procedure OCL#Set#Includes<T> (stk: Seq BoxType, s1: Set T, o: T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	Set#Includes(s1, o)
  )); 

procedure OCL#Set#Excludes<T> (stk: Seq BoxType, s1: Set T, o: T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	Set#Excludes(s1, o)
  )); 
  
procedure OCL#Set#IsEmpty<T> (stk: Seq BoxType, s1: Set T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 1;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	Set#IsEmpty(s1)
  ));   
  
procedure OCL#Set#NotEmpty<T> (stk: Seq BoxType, s1: Set T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 1;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	Set#NotEmpty(s1)
  ));    
  
  
procedure OCL#Set#SymetricDifference<T> (stk: Seq BoxType, s1: Set T, s2: Set T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	Set#Difference(Set#Union(s1, s2), Set#Intersection(s1,s2))
  )); 
  
procedure OCL#Set#asSet<T> (stk: Seq BoxType, s1: Set T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 1;
  ensures newStk == stk;


 
// ---------------------------------------------------------------
// -- OCL Wrapper: Bag, 7 operations                 ---------------------
// ---------------------------------------------------------------

procedure OCL#Bag#Including<T> (stk: Seq BoxType, b: MultiSet T, e: T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	MultiSet#UnionOne(b, e)
  )); 

  
procedure OCL#Bag#Excluding<T> (stk: Seq BoxType, b: MultiSet T, e: T) returns (newStk: Seq BoxType);  
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	MultiSet#DifferenceOne(b, e)
  )); 

procedure OCL#Bag#Includes<T> (stk: Seq BoxType, b: MultiSet T, e: T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	MultiSet#Includes(b, e)
  )); 
  
procedure OCL#Bag#Excludes<T> (stk: Seq BoxType, b: MultiSet T, e: T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	MultiSet#Excludes(b, e)
  )); 

procedure OCL#Bag#IsEmpty<T> (stk: Seq BoxType, b: MultiSet T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 1;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	MultiSet#IsEmpty(b)
  )); 
  
procedure OCL#Bag#NotEmpty<T> (stk: Seq BoxType, b: MultiSet T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 1;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	MultiSet#NotEmpty(b)
  )); 


procedure OCL#Bag#AsBag<T> (stk: Seq BoxType, b: MultiSet T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 1;
  ensures newStk == stk;
  


// ---------------------------------------------------------------
// -- OCL Wrapper: OrderSet, 12 operations            ---------------------
// OrderSet are modelled as Sequence.
// ---------------------------------------------------------------

procedure OCL#OrderedSet#Append<T> (stk: Seq BoxType, s1: Seq T, e: T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	OrderedSet#Append(s1,e)
  )));
  
procedure OCL#OrderedSet#Prepend<T> (stk: Seq BoxType, s1: Seq T, e: T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	OrderedSet#Prepend(s1,e)
  )));


// insert e(-1) into rank n(-2) of s1(-3).  
procedure OCL#OrderedSet#InsertAt<T> (stk: Seq BoxType, s1: Seq T, n: int, e: T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 3;
  requires n <= Seq#Length(s1);
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	OrderedSet#InsertAt(s1,n,e)
  )));
  
procedure OCL#OrderedSet#Suborderedset<T> (stk: Seq BoxType, s1: Seq T, lo: int, hi: int) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 3;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-3), $Box(
	Seq#Subsequence(s1,lo,hi)
  )));   
  
procedure OCL#OrderedSet#At<T> (stk: Seq BoxType, s1: Seq T, n: int) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	Seq#Index(s1,n)))); 
  
procedure OCL#OrderedSet#First<T> (stk: Seq BoxType, s1: Seq T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk)>=1;
  requires s1!=Seq#Empty();
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	Seq#First(s1)))); 

procedure OCL#OrderedSet#Last<T> (stk: Seq BoxType, s1: Seq T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk)>=1;
  requires s1!=Seq#Empty();
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	Seq#Last(s1))));   
  
procedure OCL#OrderedSet#Size<T> (stk: Seq BoxType, s1: Seq T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk)>=1;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	Seq#Length(s1))));     
  
  
procedure OCL#OrderedSet#Includes<T> (stk: Seq BoxType, s1: Seq T, n: T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	Seq#Contains(s1,n))));   
	
procedure OCL#OrderedSet#Excludes<T> (stk: Seq BoxType, s1: Seq T, n: T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	Seq#NotContains(s1,n))));  
  
procedure OCL#OrderedSet#IsEmpty<T> (stk: Seq BoxType, s1: Seq T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk)>=1;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	Seq#IsEmpty(s1))));    

procedure OCL#OrderedSet#NotEmpty<T> (stk: Seq BoxType, s1: Seq T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk)>=1;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	Seq#NotEmpty(s1))));  	
  
  
  
// ---------------------------------------------------------------
// -- OCL Wrapper: Sequence, 13 operations           ---------------------
// ---------------------------------------------------------------
procedure OCL#Seq#Union<T> (stk: Seq BoxType, s1: Seq T, s2: Seq T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk)>=2;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	Seq#Append(s1, s2)
  ))); 
  
procedure OCL#Seq#Append<T> (stk: Seq BoxType, s1: Seq T, e: T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	Seq#Build(s1, e)
  ))); 
  
procedure OCL#Seq#Prepend<T> (stk: Seq BoxType, s1: Seq T, e: T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	Seq#Prepend(s1, e)
  ))); 

 
procedure OCL#Seq#InsertAt<T> (stk: Seq BoxType, s1: Seq T, n: int, e: T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 3;
  requires n <= Seq#Length(s1);
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	Seq#InsertAt(s1,n,e)
  )));

procedure OCL#Seq#Subsequence<T> (stk: Seq BoxType, s1: Seq T, lo: int, hi: int) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 3;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-3), $Box(
	Seq#Subsequence(s1,lo,hi)
  )));  
  
procedure OCL#Seq#At<T> (stk: Seq BoxType, s1: Seq T, n: int) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  requires n<Seq#Length(s1);
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	Seq#Index(s1,n)
  ))); 

procedure OCL#Seq#First<T> (stk: Seq BoxType, s1: Seq T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk)>=1;
  requires s1!=Seq#Empty();
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	Seq#First(s1)
  ))); 

procedure OCL#Seq#Last<T> (stk: Seq BoxType, s1: Seq T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk)>=1;
  requires s1!=Seq#Empty();
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	Seq#Last(s1)
  ))); 
  
procedure OCL#Seq#Size<T> (stk: Seq BoxType, s1: Seq T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk)>=1;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	Seq#Length(s1))));     
  
  
procedure OCL#Seq#Includes<T> (stk: Seq BoxType, s1: Seq T, n: T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	Seq#Contains(s1,n))));   
	
procedure OCL#Seq#Excludes<T> (stk: Seq BoxType, s1: Seq T, n: T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 2;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(
	Seq#NotContains(s1,n))));  
  
procedure OCL#Seq#IsEmpty<T> (stk: Seq BoxType, s1: Seq T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk)>=1;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	Seq#IsEmpty(s1))));    

procedure OCL#Seq#NotEmpty<T> (stk: Seq BoxType, s1: Seq T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk)>=1;
  ensures (newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box(
	Seq#NotEmpty(s1))));  	
	
procedure OCL#Seq#AsSeq<T> (stk: Seq BoxType, s1: Seq T) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) >= 1;
  ensures newStk == stk;    

  



