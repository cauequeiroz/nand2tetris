    // array_start = 100
    @100
    D=A
    @array_start
    M=D

    // total_items = 10
    @10
    D=A
    @total_items
    M=D

    // count = 0
    @count
    M=0

(LOOP)
    // if (count == total_items) finish
    @total_items
    D=M
    @count
    D=D-M
    @END
    D;JEQ

    // RAM[array_start + count] = -1
    @array_start
    D=M
    @count
    A=D+M
    M=-1

    // count += 1
    @count
    M=M+1

    @LOOP
    0;JMP

(END)
    @END
    0;JMP
