// create a array with 10 positions, filled with -1 at RAM[100]

    // arr = 100
    @100
    D=A
    @arr
    M=D

    // length = 10
    @10
    D=A
    @length
    M=D

    // pos = 0
    @pos
    M=0

(LOOP)
    // if (pos == length) goto END
    @pos
    D=M
    @length
    D=D-M
    @END
    D;JEQ

    // goto RAM[arr + pos] and fill with -1
    @arr
    D=M
    @pos
    A=D+M
    M=-1

    // update pos
    @pos
    M=M+1

    @LOOP
    0;JMP

(END)
    @END
    0;JMP
