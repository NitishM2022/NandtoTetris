//Nitish Malluru 932007196
//done

// File name: palin.asm

// The program develops a Palindrome checker application. 
// The input to the program is a 5 digit integer A and is stored in RAM[0] (R0).
// A helper value of 10 is stored in RAM[8] (R8) by virtue of the tst file command.
// Number A is a positive integer.
// A has exactly 5 digits and no more no less.

// Program functions as follows: 
// Extract the individual digits from number A and store them in R2-R6 registers in that order.
// Result of 1 is stored in R1 if the number A is a Palindrome else result of 0 is stored in R1

// Put your code below this line

// Initialize R8 with the value 10
@10
D=A
@R8
M=D

//vars
@a
@b
@result
@quotient
@return

// setting b to 10
@R8
D=M
@b
M=D

//ex: 12345
@R2// 5
M=0
@R3// 4
M=0
@R4// 3
M=0
@R5// 2
M=0
@R6// 1
M=0

//how to call div
@R0
D=M
@a
M=D
D=M

@END// checks if a is 0
D;JEQ

//R2
//setting specific place to return
@RET
D=A
@return
M=D

@DIV//R2 div
0;JMP
(RET)

//set result to a and quotient to R2
@result
D=M
@a
M=D

@quotient
D=M
@R2
M=D

@a
D=M

@END// checks if a is 0
D;JEQ

//R3
//setting specific place to return
@RET1
D=A
@return
M=D

@DIV//R2 div
0;JMP
(RET1)

@result
D=M
@a
M=D

@quotient
D=M
@R3
M=D

@a
D=M

@END// checks if a is 0
D;JEQ

//R4
//setting specific place to return
@RET2
D=A
@return
M=D

@DIV//R2 div
0;JMP
(RET2)

@result
D=M
@a
M=D

@quotient
D=M
@R4
M=D

@a
D=M

@END// checks if a is 0
D;JEQ

//R5
//setting specific place to return
@RET3
D=A
@return
M=D

@DIV//R2 div
0;JMP
(RET3)

@result
D=M
@a
M=D

@quotient
D=M
@R5
M=D

@a
D=M

@END// checks if a is 0
D;JEQ

//R6
@a
D=M
@R6
M=D

//check palindrome
@R1
M=0

@R2
D=M
@R6
D=D-M
@TRUE
D;JEQ

@END
0;JMP

(TRUE)
@R3
D=M
@R5
D=D-M
@TRUE1
D;JEQ

@END
0;JMP

(TRUE1)
@R1
M=1

@END
0;JMP

//////////////////////////////////////////////////////////////
(DIV)
//start
@a
D=M

@result
M=0

//checks if B > A
@a
D=M

@b
D=D-M
@BGREAT
D;JLT

(LOOP2)
  @b
  D=M
  @a
  M=M-D

  @result
  M=M+1

  //check is a is 0 and set quotient to 0
  @a
  D=M
  @BGREAT3
  D;JEQ

  //check if current r0 less than B
  @b
  D=M
  @a
  D=M-D
  @BGREAT2
  D;JLT

@LOOP2
0;JMP


(BGREAT)
@b
D=M
@quotient
M=D

@return
A=M
0;JMP

(BGREAT2)
@a
D=M
@quotient
M=D

@return
A=M
0;JMP

(BGREAT3)
@0
D=A
@quotient
M=D

@return
A=M
0;JMP

(END)
@END
0;JMP
