(LOOP)
    @KBD
    D=M // check key press saving @kbd at D-Register

    @END
    D;JNE // if @kb != 0, finish

    @LOOP
    0;JMP // else, back to loop

(END)
    @END
    0;JMP
