// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

    @counter
    M=0
    @result
    M=0
    @R2
    M=0

    // R0 < R1?
    @R0
    D=M
    @R1
    D=D-M
    @R1_IS_SMALLER
    D;JGT 
    
(R0_IS_SMALLER) // @counter_limit = R0, @sum_reference = R1
    @R0
    D=M
    @counter_limit
    M=D

    @R1
    D=M
    @sum_reference
    M=D

    @LOOP
    0;JMP

(R1_IS_SMALLER) // @counter_limit = R1, @sum_reference = R0
    @R1
    D=M
    @counter_limit
    M=D

    @R0
    D=M
    @sum_reference
    M=D

(LOOP)
    // if (counter == counter_limit) goto @STOP
    @counter_limit
    D=M
    @counter
    D=D-M
    @STOP
    D;JEQ

    // else
    @sum_reference
    D=M
    @result
    M=D+M // result += sum_reference
    @counter
    M=M+1 // counter += 1
    @LOOP
    0;JMP // goto @LOOP

(STOP)
    @result
    D=M
    @R2
    M=D

(END)
    @END
    0;JMP
    





