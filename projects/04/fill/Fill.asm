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

// Put your code here.

    @color
    M=0

    @SCREEN
    D=A
    @next_screen_address
    M=D

(LISTEN_KEYBOARD)
    @KBD
    D=M // check key press saving @kbd at D-Register

    @SET_COLOR_BLACK
    D;JNE // if @kb != 0, goto @SET_COLOR_BLACK

    @SET_COLOR_WHITE
    0;JMP // else, goto @SET_COLOR_WHITE

(SET_COLOR_BLACK)
    @color
    M=-1
    @FILL_SCREEN
    0;JMP

(SET_COLOR_WHITE)
    @color
    M=0    

(FILL_SCREEN)
    // if screen already filled, return
    @color
    D=M
    @next_screen_address
    A=M
    D=D-M
    @LISTEN_KEYBOARD
    D;JEQ

    // if end of screen address, exit
    @KBD
    D=A
    @next_screen_address
    D=D-M
    @FINISH_FILL_SCREEN
    D;JEQ

    // Fill @next_screen_address with @color
    @color
    D=M
    @next_screen_address
    A=M
    M=D

    // @next_screen_address++
    @next_screen_address
    M=M+1
    @FILL_SCREEN
    0;JMP

(FINISH_FILL_SCREEN)
    @SCREEN
    D=A
    @next_screen_address
    M=D
    @LISTEN_KEYBOARD
    0;JMP