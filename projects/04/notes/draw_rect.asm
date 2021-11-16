// Draw a rectangle on screen with 16px by RAM[0]px

    // screenpos = RAM[SCREEN]
    @SCREEN
    D=A
    @screenpos
    M=D

    // height = RAM[0] (rect height)
    @R0
    D=M
    @height
    M=D

    // count = 0
    @count
    M=0

(LOOP)
    // if height == count, goto end
    @count
    D=M
    @height
    D=D-M
    @END
    D;JEQ

    // draw a line
    @screenpos
    A=M
    M=-1

    // updates screenpos
    @32
    D=A
    @screenpos
    M=M+D

    // updates count   
    @count
    M=M+1

    @LOOP
    0;JMP

(END)
    @END
    0;JMP
