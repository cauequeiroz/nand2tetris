export default {
    /*
    * Check if is a blank line
    * -------------------------------------------------------------------------- */
    isBlankLine(line) {
        return !line.trim().length;
    },

    /*
    * Check if is a label instruction line
    * -------------------------------------------------------------------------- */
    isLabelLine(line) {
        return line.startsWith('(');
    },

    /*
    * Check if is an address symbol (label or variable)
    * -------------------------------------------------------------------------- */
    isAddressSymbol(instruction) {
        return isNaN(instruction);
    },

    /*
    * Remove line/inline comments
    * -------------------------------------------------------------------------- */
    removeComments(line) {
        if (line.includes('//')) {
            line = line.split('//')[0];
        }
        
        return line.trim();
    },

    /*
    * Return 'destination' part of instruction
    * -------------------------------------------------------------------------- */
    getDest(instruction) {
        if (!instruction.includes('=')) {
            return '';
        }

        return instruction.split('=')[0];
    },

    /*
    * Return 'computation' part of instruction
    * -------------------------------------------------------------------------- */
    getComp(instruction) {
        if (instruction.includes('=')) {
            instruction = instruction.split('=')[1];
        }

        if (instruction.includes(';')) {
            instruction = instruction.split(';')[0];
        }

        return instruction;
    },

    /*
    * Return 'jump' part of instruction
    * -------------------------------------------------------------------------- */
    getJump(instruction) {
        if (!instruction.includes(';')) {
            return '';
        }

        return instruction.split(';')[1];
    },

    /*
    * Return label name
    * -------------------------------------------------------------------------- */
    getLabel(instruction) {
        return instruction.replace('(', '').replace(')', '');
    }
}