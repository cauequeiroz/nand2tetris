import readlines from 'n-readlines';
import fs from 'fs';

import Parser from './Parser.js';
import Binary from './Binary.js';

/*
 * Read a .asm file and, line by line, converts to a valid 
 * machine language instruction. Save the output into a .hack file.
 * -------------------------------------------------------------------------- */
const main = () => {
    let FileReader = new readlines(process.argv.slice(2)[0]);
    let FileWriter = fs.createWriteStream('../out/out.hack', { flags: 'w' });

    let line = null;    

    while (line = FileReader.next()) {
        let instruction = Parser.removeComments(line.toString('ascii'));

        if (Parser.isBlankLine(instruction)) {
            continue;
        }

        if (instruction.startsWith('@')) {
            instruction = convertInstructionA(instruction);
        } else {
            instruction = convertInstructionC(instruction);
        }        

        FileWriter.write(`${instruction}\n`);
    }

    FileWriter.end();
};

/*
 * Convert instruction of type A (address instructions)
 * -------------------------------------------------------------------------- */
const convertInstructionA = instruction => {
    return "0" + Binary.decimalToBinary(instruction.slice(1));
};

/*
 * Convert instruction of type C (command instructions)
 * -------------------------------------------------------------------------- */
const convertInstructionC = instruction => {
    const dest = Parser.getDest(instruction);
    const comp = Parser.getComp(instruction);
    const jump = Parser.getJump(instruction);

    const destBinary = Binary.getDest(dest);
    const compBinary = Binary.getComp(comp);
    const jumpBinary = Binary.getJump(jump);

    return "111" + compBinary + destBinary + jumpBinary;
};

main();