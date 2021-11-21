import readlines from 'n-readlines';
import fs from 'fs';

import Parser from './Parser.js';
import Binary from './Binary.js';
import PreDefinedSymbolTable from './PreDefinedSymbolTable.js';

let SymbolTable = {
    memory: { ...PreDefinedSymbolTable },
    nextAvailableAddress: 16
};

const main = () => {
    getLabelAddresses();
    generateHackFile();
};

/*
 * Scan .asm file to save all label addresses at SymbolTable.
 * -------------------------------------------------------------------------- */
const getLabelAddresses = () => {
    let FileReader = new readlines(process.argv.slice(2)[0]);

    let line = null;
    let addressCount = 0;    

    while (line = FileReader.next()) {
        let instruction = Parser.removeComments(line.toString('ascii'));

        if (Parser.isBlankLine(instruction)) {
            continue;
        }

        if (Parser.isLabelLine(instruction)) {
            SymbolTable.memory[Parser.getLabel(instruction)] = addressCount;
        } else {
            addressCount++;
        }
    }
};

/*
 * Read a .asm file and, line by line, converts to a valid 
 * machine language instruction. Save the output into a .hack file.
 * -------------------------------------------------------------------------- */
const generateHackFile = () => {
    let FileReader = new readlines(process.argv.slice(2)[0]);
    let FileWriter = fs.createWriteStream('../out/out.hack', { flags: 'w' });

    let line = null;    

    while (line = FileReader.next()) {
        let instruction = Parser.removeComments(line.toString('ascii'));

        if (Parser.isBlankLine(instruction) || Parser.isLabelLine(instruction)) {
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
const convertInstructionA = (instruction) => {
    instruction = instruction.slice(1);
    
    if (Parser.isAddressSymbol(instruction)) {
        if (SymbolTable.memory[instruction] != undefined) {
            instruction = SymbolTable.memory[instruction];
        } else {
            let address = SymbolTable.nextAvailableAddress
            
            SymbolTable.memory[instruction] = address;
            SymbolTable.nextAvailableAddress++;

            instruction = address;
        }
    }
    
    return "0" + Binary.decimalToBinary(instruction);
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