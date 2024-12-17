//Nitish Malluru 932007196

// File name: calc.asm

// The program develops a calculator application. 
// The operands a and b are integer numbers stored in RAM[0] (R0) and RAM[1] (R1), respectively.
// The operation choice c is stored in RAM[2] (R2), respectively
// if c == 1, do a + b
// if c == 2, do a - b
// if c == 3, do a * b
// if c == 4, do a / b
// For Addition and Subtraction operations the operands a and b can be positive or negative.
// For Multiplication operation only ONE operand can be negative.
// For Division operation BOTH operands must be positive and must be greater than 0.
// Store the final result (quotient for Division) in RAM[3] (R3). Only the Division operation 
// stores the remainder in RAM[4] (R4).


// Put your code below this line
//set 1024 to 0
@1024
M=0

@R2
D=M

@ADD
D=D-1;JEQ

@SUB
D=D-1;JEQ

@MULT
D=D-1;JEQ

@DIV
D=D-1;JEQ

(ADD)// Addition
@R0
D=M
@R1
D=D+M
@R3
M=D

@END
0;JMP

(SUB)// Subtraction
@R0
D=M
@R1
D=D-M
@R3
M=D

@END
0;JMP

(MULT)// Multiplication
@R0
D=M
@ANEGM
D;JLT

@R1
D=M
@NEGBM
D;JLT

@M
0;JMP

(ANEGM)
@R1
D=M
@BNEGM
D;JLT

(M)
@R1
D=M

@R3
M=0

(LOOP)
  @END
  D;JEQ

  @R0
  D=M
  @R3
  M=M+D

  @1
  M=M-1
  D=M

  @LOOP
  0;JMP


(BNEGM)
@FAIL
0;JMP

(NEGBM)//B neg A pos
@R0
D=M
@NEGAM
D;JLT

@R0
D=M

@R3
M=0 // Initialize memory location 3 to 0

(LOOP1)
  // If r0 is 0, exit the loop
  @END
  D;JEQ

  // Add r1 to the value at memory location 3
  @R1
  D=M
  @R3
  M=M+D

  // Decrement r0
  @R0
  M=M-1
  D=M

  // Jump back to the beginning of the loop
  @LOOP1
  0;JMP

(NEGAM)
@FAIL
0;JMP

(DIV)// Division
@R0
D=M
@FAIL
D;JLE

@R1
D=M
@FAIL
D;JLE

//start
@R0
D=M

@R3
M=0

//checks if B > A
@R0
D=M

@R1
D=D-M
@BGREAT
D;JLT

(LOOP2)
  @R1
  D=M
  @R0
  M=M-D

  @R3
  M=M+1
  
  //check is a is 0 and set quotient to 0
  @R0
  D=M
  @BGREAT3
  D;JEQ

  //check if current r0 less than B
  @R1
  D=M
  @R0
  D=M-D
  @BGREAT2
  D;JLT

@LOOP2
0;JMP


(BGREAT)
@R1
D=M
@R4
M=D

@END
0;JMP

(BGREAT2)
@R0
D=M
@R4
M=D

@END
0;JMP

(BGREAT3)
@0
D=A
@R4
M=D

@END
0;JMP

(FAIL)// Failure
@1024
M=-1
@END
0;JMP

(END)
@END
0;JMP