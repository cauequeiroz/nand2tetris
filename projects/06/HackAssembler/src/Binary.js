export default {
    /*
    * Return binary instruction equivalent to 'destination' command
    * -------------------------------------------------------------------------- */
    getDest(command) {
        const minemonics = {
            'M': '001',
            'D': '010',
            'A': '100',
            'MD': '011',
            'DM': '011',
            'AM': '101',
            'MA': '101',
            'AD': '110',
            'DA': '110',
            'AMD': '111',
            'ADM': '111',
            'MAD': '111',
            'MDA': '111',
            'DMA': '111',
            'DAM': '111'
        };

        return minemonics[command]
            ? minemonics[command]
            : '000'
    },

    /*
    * Return binary instruction equivalent to 'computation' command
    * -------------------------------------------------------------------------- */
    getComp(command) {
        const minemonics = {
            '0': '0101010',
            '1': '0111111',
            '-1': '0111010',
            'D': '0001100',
            'A': '0110000',
            'M': '1110000',
            '!D': '0001101',
            '!A': '0110001',
            '!M': '1110001',
            '-D': '0001111',
            '-A': '0110011',
            '-M': '1110011',
            'D+1': '0011111',
            'A+1': '0110111',
            'M+1': '1110111',
            'D-1': '0001110',
            'A-1': '0110010',
            'M-1': '1110010',
            'D+A': '0000010',
            'D+M': '1000010',
            'D-A': '0010011',
            'D-M': '1010011',
            'A-D': '0000111',
            'M-D': '1000111',
            'D&A': '0000000',
            'D&M': '1000000',
            'D|A': '0010101',
            'D|M': '1010101'
        };

        return minemonics[command]
    },

    /*
    * Return binary instruction equivalent to 'jump' command
    * -------------------------------------------------------------------------- */
    getJump(command) {
        const minemonics = {
            'JGT': '001', 
            'JEQ': '010', 
            'JGE': '011', 
            'JLT': '100', 
            'JNE': '101', 
            'JLE': '110', 
            'JMP': '111' 
        };

        return minemonics[command]
            ? minemonics[command]
            : '000'
    },

    /*
    * Return the 15-bit binary version of the given decimal number
    * -------------------------------------------------------------------------- */
    decimalToBinary(decimal) {
        const generateBinary = (number, bitcount) => {
            if (bitcount < 0) return '';
            
            let powerOfTwo = Math.pow(2, bitcount);
            let bit = '0';
            let nextNumber = number;
        
            if (number >= powerOfTwo) {
                bit = '1';
                nextNumber -= powerOfTwo;
            }
        
            return bit + generateBinary(nextNumber, bitcount - 1);
        };

        return generateBinary(decimal, 14);
    },
}