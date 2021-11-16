// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(START)
    // screenpos = RAM[SCREEN]
    @SCREEN
    D=A
    @screenpos
    M=D

    // maxcount = 8192
    @8192
    D=A
    @maxcount
    M=D

    // count = 0
    @count
    M=0

    // color = 0 (0 means white, 1 means black)
    @color
    M=0

(LISTEN)
    @KBD
    D=M

    // if (kbd == 0) goto FILLWHITE
    @FILLWHITE
    D;JEQ

    // otherwise, goto FILLBLACK
    @FILLBLACK
    0;JMP

(FILLWHITE)
    @color
    M=0

    @PAINT
    0;JMP

(FILLBLACK)
    @color
    M=-1

    @PAINT
    0;JMP

(PAINT)
    // if (count == maxcount) goto START
    @count
    D=M
    @maxcount
    D=D-M
    @START
    D;JEQ

    // paint screen with saved color
    @color
    D=M
    @screenpos
    A=M
    M=D

    // updates screenpos
    @screenpos
    M=M+1

    // updates count
    @count
    M=M+1

    @PAINT
    0;JMP
