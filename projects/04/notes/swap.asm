// Swap values from R0 -> R1 and R1 -> R0

    // saves r0 to temp
    @R0
    D=M
    @temp
    M=D 

    // saves r1 on r0
    @R1
    D=M
    @R0
    M=D

    // saves temp on r1
    @temp
    D=M
    @R1
    M=D

(END)
    @END
    0;JMP

