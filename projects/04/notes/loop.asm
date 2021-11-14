// Create the sum of 1 + 2 + ... + RAM[0]
// store it on RAM[1]

    // final = RAM[0]
    @R0
    D=M
    @final
    M=D
    // count = 1
    @count
    M=1
    // sum = 0
    @sum
    M=0

(LOOP)
    // jump outside the loop if count > final
    @count
    D=M
    @final
    D=D-M
    @STOP
    D;JGT 

    // sum = sum + count
    @sum
    D=M
    @count
    D=D+M
    @sum
    M=D

    // count = count + 1
    @count
    M=M+1

    // loop
    @LOOP
    0;JMP    

(STOP)
    @sum
    D=M
    @R1
    M=D

(END)
    @END
    0;JMP