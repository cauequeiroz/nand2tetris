    // array_position = @SCREEN
    @SCREEN
    D=A
    @array_position
    M=D

    // total_items = R0
    @R0
    D=M
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

    // RAM[array_position] = -1
    @array_position
    A=M
    M=-1

    // count += 1
    @count
    M=M+1

    // @array_position += 32
    @32
    D=A
    @array_position
    M=D+M

    @LOOP
    0;JMP

(END)
    @END
    0;JMP
