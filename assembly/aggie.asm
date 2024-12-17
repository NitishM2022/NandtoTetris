//Nitish Malluru 932007196

// File name: aggie.asm

// The program runs an infinite loop that listens to the keyboard input. As soon as a 
// key press is detected, the program exits the wait loop and proceeds to draw the 
// graphic as described in the project document. 
// You will need to draw the triangles pixel by pixel because HACK asm has no 
// utilities for drawing shapes.
// State any assumptions made in your program 

// Assumptions (as applicable)

// Put your code below this line


(KEYBOARD)
@24576
D=M

@WINDOW
D;JGT

@KEYBOARD
0;JMP


(WINDOW)
//////////////////////////////////////////////////////////////////
//top half
//set up edge values

@0
D=A

@R0
M=D
@R1
M=D
@R2
M=D
@R3
M=D
@R4
M=D
@R5
M=D
@R6
M=D
@R7
M=D

@1
D=A
@R0
M=M-D
D=-M

@R7
M=M+D
M=M+D
M=M+D
M=M+D
D=M

@R6
M=M+D
M=M+D
M=M+D
M=M+D
D=M

@R5
M=M+D
M=M+D
M=M+D
M=M+D
D=M

@R4
M=M+D
M=M+D
M=M+D
M=M+D
D=M

@R3
M=M+D
M=M+D
M=M+D
M=M+D
D=M

@R2
M=M+D
M=M+D
M=M+D
M=M+D
D=M

@R1
M=M+D
M=M+D
M=M+D
M=M+D
D=M

@R7
M=M-1
@R6
M=M-1
@R5
M=M-1
@R4
M=M-1
@R3
M=M-1
@R2
M=M-1
@R1
M=M-1

@SCREEN
D=A
@addr
M=D // addr = 16384

// (screen’s base address)
@128
D=A
@rows
M=D // n = RAM[0]
@i
M=0

@15
D=A
@cols
M=D

@0
D=A
@count
M=0

@8
D=A
@eight
M=D

(LOOP)    
    @count
    M=M+1

    //create temp address
    @addr
    D=M
    @taddr
    M=D

    (LOOP1)
        //stop mechanism
        @taddr
        D=M
        @addr
        D=D-M
        @cols
        D=D-M

        @CONTINUE
        D;JEQ


        @taddr
        A=M
        M=-1 // RAM[addr]=1111111111111111

        @taddr
        M=M+1
    @LOOP1
    0;JMP

    (CONTINUE)

    //edging
    @count
    D=M
    @tcount
    M=D

    D=M-1
    @A
    D;JEQ

    D=D-1
    @B
    D;JEQ

    D=D-1
    @C
    D;JEQ

    D=D-1
    @D
    D;JEQ

    D=D-1
    @E
    D;JEQ

    D=D-1
    @F
    D;JEQ

    D=D-1
    @G
    D;JEQ

    D=D-1
    @H
    D;JEQ


    (COMEBACK)
    @i
    M=M+1 // i = i + 1
    @32
    D=A
    @addr
    M=D+M // addr = addr + 32

    //must reduce number of cols after 8 times
    @count
    D=M
    @eight
    D=D-M

    @reduce
    D;JEQ    

    (BACK)
    @i
    D=M
    @rows
    D=D-M
    @FIRST
    D;JEQ // if i>n goto END
@LOOP
0;JMP // goto LOOP


(reduce)
    @cols
    M=M-1
    @count
    M=0
@BACK
0;JMP


(A)
@R0
D=M
@taddr
A=M
M=D
@COMEBACK
0;JMP

(B)
@R1
D=M
@taddr
A=M
M=D
@COMEBACK
0;JMP


(C)
@R2
D=M
@taddr
A=M
M=D
@COMEBACK
0;JMP


(D)
@R3
D=M
@taddr
A=M
M=D
@COMEBACK
0;JMP


(E)
@R4
D=M
@taddr
A=M
M=D
@COMEBACK
0;JMP


(F)
@R5
D=M
@taddr
A=M
M=D
@COMEBACK
0;JMP


(G)
@R6
D=M
@taddr
A=M
M=D
@COMEBACK
0;JMP

(H)
@R7
D=M
@taddr
A=M
M=D
@COMEBACK
0;JMP


//////////////////////////////////////////////////////////////////
//bottom half
(FIRST)
@0
D=A

@R8
M=D
@R9
M=D
@R10
M=D
@R11
M=D
@R12
M=D
@R13
M=D
@R14
M=D
@R15
M=D

@R15
M=-1
D=-1

@R14
M=M+D
M=M+D
M=M+D
M=M+D
D=M

@R13
M=M+D
M=M+D
M=M+D
M=M+D
D=M

@R12
M=M+D
M=M+D
M=M+D
M=M+D
D=M

@R11
M=M+D
M=M+D
M=M+D
M=M+D
D=M

@R10
M=M+D
M=M+D
M=M+D
M=M+D
D=M

@R9
M=M+D
M=M+D
M=M+D
M=M+D
D=M

@R8
M=M+D
M=M+D
M=M+D
M=M+D
D=M

// @R9
// M=M-1
// @R9
// M=M-1
// @R10
// M=M-1
// @R11
// M=M-1
// @R12
// M=M-1
// @R13
// M=M-1
// @R14
// M=M-1

// (screen’s base address)
@128
D=A
@rows
M=D // n = RAM[0]
@i
M=0

@0
D=A
@cols
M=D

@0
D=A
@count
M=0

@8
D=A
@eight
M=D

(LOOP2)
    @31
    D=A
    @addr
    M=M+D
    
    @count
    M=M+1

    //create temp address
    @addr
    D=M
    @taddr
    M=D

    (LOOP3)
        //stop mechanism
        @taddr
        D=M
        @addr
        D=M-D
        @cols
        D=D-M

        @CONTINUE2
        D;JEQ

        @taddr
        A=M
        M=-1 // RAM[addr]=1111111111111111

        @taddr
        M=M-1
    @LOOP3
    0;JMP

    (CONTINUE2)

    //edging
    @count
    D=M
    @tcount
    M=D

    D=M-1
    @A1
    D;JEQ

    D=D-1
    @B1
    D;JEQ

    D=D-1
    @C1
    D;JEQ

    D=D-1
    @D1
    D;JEQ

    D=D-1
    @E1
    D;JEQ

    D=D-1
    @F1
    D;JEQ

    D=D-1
    @G1
    D;JEQ

    D=D-1
    @H1
    D;JEQ


    (COMEBACK2)
    @i
    M=M+1 // i = i + 1
    @1
    D=A
    @addr
    M=D+M // addr = addr + 1

    //must reduce number of cols after 8 times
    @count
    D=M
    @eight
    D=D-M

    @reduce1
    D;JEQ    

    (BACK1)
    @i
    D=M
    @rows
    D=D-M
    @END
    D;JEQ // if i>n goto END
@LOOP2
0;JMP // goto LOOP


(reduce1)
    @cols
    M=M+1
    @count
    M=0
@BACK1
0;JMP


(A1)
@R8
D=M
@taddr
A=M
M=D
@COMEBACK2
0;JMP

(B1)
@R9
D=M
@taddr
A=M
M=D
@COMEBACK2
0;JMP


(C1)
@R10
D=M
@taddr
A=M
M=D
@COMEBACK2
0;JMP


(D1)
@R11
D=M
@taddr
A=M
M=D
@COMEBACK2
0;JMP


(E1)
@R12
D=M
@taddr
A=M
M=D
@COMEBACK2
0;JMP


(F1)
@R13
D=M
@taddr
A=M
M=D
@COMEBACK2
0;JMP


(G1)
@R14
D=M
@taddr
A=M
M=D
@COMEBACK2
0;JMP

(H1)
@R15
D=M
@taddr
A=M
M=D
@COMEBACK2
0;JMP


(END)
@END // program’s end
0;JMP // infinite loop
