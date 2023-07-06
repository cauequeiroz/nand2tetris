    // max = R0
    @R0
    D=M
    @max
    M=D

    // i = 1
    @i
    M=1

    // result = 0
    @result
    M=0

(LOOP)  
    // if (i < max)
    @max
    D=M
    @i
    D=D-M
    @STOP
    D;JLT

    // result = result + i
    @i
    D=M
    @result
    M=D+M

    // i = i + 1
    @i
    M=D+1

    @LOOP
    0;JMP

(STOP)
    // R1 = result
    @result
    D=M
    @R1
    M=D

(END)
    @END
    0;JMP
