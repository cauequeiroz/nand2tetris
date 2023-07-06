// Program: Add2.asm
// Computes: RAM[2] = RAM[0] + RAM[1]
// Usage: put values in RAM[0], RAM[1]

@R0
D=M

@R1
D=D+M

@R2
M=D

@6
0;JMP