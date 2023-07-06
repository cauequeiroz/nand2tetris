// Flips the values of RAM[0] and RAM[1]

// Save RAM[0] to @temp
    @R0
    D=M
    @temp
    M=D

// Replace RAM[0] with RAM[1]
    @R1
    D=M
    @R0
    M=D

// Replace RAM[1] with @temp
    @temp
    D=M
    @R1
    M=D

// End.
(END)
    @END
    0;JMP