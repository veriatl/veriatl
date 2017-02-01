// -----------------------------------------------------
// -- Proof System for ASM Instruction Set -------------
// -----------------------------------------------------
  
  
function OpCode#Aux#InitStk(): Seq BoxType;
  axiom OpCode#Aux#InitStk() == (Seq#Empty(): Seq BoxType);
 
//Instr: push  
procedure OpCode#Push(stk: Seq BoxType, s: String) returns (newStk: Seq BoxType);
  ensures newStk == Seq#Build(stk, $Box(s));

  
//Instr: pushi  
procedure OpCode#Pushi(stk: Seq BoxType, i: int) returns (newStk: Seq BoxType);
  ensures newStk == Seq#Build(stk, $Box(i));  
  
//Instr: pushf  
procedure OpCode#Pushf(stk: Seq BoxType) returns (newStk: Seq BoxType);
  ensures newStk == Seq#Build(stk, $Box(false));

//Instr: pusht
procedure OpCode#Pusht(stk: Seq BoxType) returns (newStk: Seq BoxType);
  ensures newStk == Seq#Build(stk, $Box(true));
  
//Instr: pop 
procedure OpCode#Pop(stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) > 0;
  ensures newStk == Seq#Take(stk, Seq#Length(stk)-1);
  
//Instr: store
procedure OpCode#Store<T>(stk: Seq BoxType) returns(newStk: Seq BoxType, topVal: T);
  requires Seq#Length(stk) > 0;
  ensures newStk == Seq#Take(stk, Seq#Length(stk)-1);
  ensures topVal == $Unbox(Seq#Index(stk, Seq#Length(stk)-1));
  
//Instr: load
procedure OpCode#Load<T>(stk: Seq BoxType, v: T) returns (newStk: Seq BoxType);
  ensures newStk == Seq#Build(stk, $Box(v));
 
//Instr: Swap
procedure OpCode#Swap(stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) > 1;
  ensures newStk == Seq#Build(Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), Seq#Index(stk, Seq#Length(stk)-1)), Seq#Index(stk, Seq#Length(stk)-2));
 
//Instr: Dup
procedure OpCode#Dup(stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) > 0;
  ensures newStk == Seq#Build(stk, Seq#Index(stk, Seq#Length(stk)-1));
 
//Instr: Dup_x1
procedure OpCode#DupX1(stk: Seq BoxType) returns (newStk: Seq BoxType);
  requires Seq#Length(stk) > 1;
  ensures newStk == Seq#Build(Seq#Build(Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), Seq#Index(stk, Seq#Length(stk)-1)), Seq#Index(stk, Seq#Length(stk)-2)), Seq#Index(stk, Seq#Length(stk)-1));

  
//Instr: New, [compile mechanism]
/*
	assert Seq#Length(stk) >= 2;
	havoc _placehold;
    assume _placehold != null && !read($xHeap, _placehold, alloc) && dtype(_placehold) == 
	classifierTable[($Unbox(Seq#Index(stk, Seq#Length(stk)-1)): String), 
					($Unbox(Seq#Index(stk, Seq#Length(stk)-2)): String)];
	$xHeap := update($xHeap, _placehold, alloc, true);
	assume $IsGoodHeap($xHeap);
	stk := Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), $Box(_placehold));
*/


// Instr: get  [compile mechanism]
/*
	assert Seq#Length(stk) >= 1;
	assert $Unbox(Seq#Index(stk, Seq#Length(stk)-1)) != null;
	stk := Seq#Build(Seq#Take(stk, Seq#Length(stk)-1), $Box($xHeap[$Unbox(Seq#Index(stk, Seq#Length(stk)-1)), FieldOfDecl(dtype($Unbox(Seq#Index(stk, Seq#Length(stk)-1))), _placeholder): Field (_infered)]));
*/
  

//Instr: set [compile mechanism]
/*

if(isCollection(FieldOfDecl(dtype($Unbox(Seq#Index(stk, Seq#Length(stk)-2))), _placeholder): Field (_infered))){
	havoc $newCol;
	assume dtype($newCol) == class._System.array;
	assume $newCol != null && read($tarHeap, $newCol, alloc);
	assume Seq#FromArray($tarHeap,$newCol) == Seq#Append(Seq#FromArray($tarHeap, read($tarHeap, $Unbox(Seq#Index(stk, Seq#Length(stk)-2)), FieldOfDecl(dtype($Unbox(Seq#Index(stk, Seq#Length(stk)-2))), _placeholder): Field (_infered))), Seq#FromArray($tarHeap,$Unbox(Seq#Index(stk, Seq#Length(stk)-1)));

	assert Seq#Length(stk) >= 2;
	assert $Unbox(Seq#Index(stk, Seq#Length(stk)-2)) != null;
	$tarHeap := update($tarHeap, $Unbox(Seq#Index(stk, Seq#Length(stk)-2)), 
					FieldOfDecl(dtype($Unbox(Seq#Index(stk, Seq#Length(stk)-2))), _placeholder): Field (_infered), 
					$newCol
					);
	assume $IsGoodHeap($tarHeap);
	stk := Seq#Take(stk, Seq#Length(stk)-2);	
}else{
	assert Seq#Length(stk) >= 2;
	assert $Unbox(Seq#Index(stk, Seq#Length(stk)-2)) != null;
	$xHeap := update($xHeap, $Unbox(Seq#Index(stk, Seq#Length(stk)-2)), 
					FieldOfDecl(dtype($Unbox(Seq#Index(stk, Seq#Length(stk)-2))), _placeholder): Field (_infered), 
					$Unbox(Seq#Index(stk, Seq#Length(stk)-1)));
	assume $IsGoodHeap($xHeap);
	stk := Seq#Take(stk, Seq#Length(stk)-2);
}
*/

   
// Instr: findme
procedure OpCode#Findme(stk: Seq BoxType) returns(newStk: Seq BoxType);
  requires Seq#Length(stk) > 1;
  ensures newStk == Seq#Build(Seq#Take(stk, Seq#Length(stk)-2), 
							  $Box(classifierTable[($Unbox(Seq#Index(stk, Seq#Length(stk)-1)): String), 
												   ($Unbox(Seq#Index(stk, Seq#Length(stk)-2)): String)]));

// Instr: getASM  
procedure OpCode#GetASM(stk: Seq BoxType) returns(newStk: Seq BoxType);
  ensures newStk == Seq#Build(stk, $Box(Asm));
  