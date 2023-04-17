### Background:
Study of the building block of Computer's Computation.

### How Processor Works:
* Begin with logic gates: AND (0010), NOT (0001), OR (0100)
 - Each gate receives binary input: 1 or 0
* Then, there are Adder. Multiple Combination of Adders are digital circuits used to perform addition. They are 2 types
 - Half-Adder: two input signals, outputs carry and sum
 - Full-Adder: adds binary numbers, outputs carry and sum as well
* From addition, multiplication, division, shift, subtraction, etc are performed
* After this, if 6 (0110) and 2 (0010) are send for addition, processor will interpret it like => 0100 0110 0010 || first is the Logic gate, 2nd 6 and then 2. This is the sequence of operations.

### Why Assembly:
To add 6 and 2 by writing 0100 0110 0010 is okey, but for complex operations it's not viable. Here comes the Assembly, this the second lowest level after binary. It has mnemonics that map to machine code (binary) to perform operation. These are written for a specific architecture, like i385, ARM, Sparc, PS3, etc.

### Different Assemblers:
- MASM : Microsoft Macro Assembler
- TASM : Turbo Assembler
- NASM : Netwide Assembler
- GNU Assembler

### Terms:
* OPCODE : Operation Code is used to tell processor do something keeping the program counter, load next instruction (opcode and previously calculated data) and repeat until finished.
* Binary Prefix
 - ADD, SUB, MUL, MOVE
* Truth Tables: All combinations of possible input to all combination of possible output


### Binary Conversion:
* Each bit is 2^n (2 to the power n) starting from n = 0. So the lowest value in 8bit (1byte) binary is 2^0 = 1 and highest value is 2^7 = 128 . So the maximum total unsigned (positive number) value could be represented by an 8 bit number is 128 + 64 + 32 + 16 + 8 + 4 + 2 + 1 = 255.

|   128   |   64   |   32   |   16   |   8   |   4   |   2   |   1   ||
|   ---   |   ---  |   ---  |  ---   |  ---  |  ---  |  ---  |  ---  |  ---  |
|   2^7   |   2^6  |   2^5  |  2^4   |  2^3  |  2^2  |  2^1  |  2^0  |    |
|   ---   |   ---  |   ---  |  ---   |  ---  |  ---  |  ---  |  ---  |  ---  |
|    1    |    1   |    1   |   1    |   1   |   1   |   1   |   1   |  => 1111 1111 = 255  |
|    0    |    1   |    1   |   0    |   0   |   0   |   0   |   1   |  => 0110 0001 = 0 + 64 + 32 + 0 + 0 + 0 + 0 + 1 = 97   |
|   ---   |   ---  |   ---  |  ---   |  ---  |  ---  |  ---  |  ---  |  ---  |

NB: 1 will carry the 2^n value and 0 will skip, then all the carried values are counted as addition to get the decimal number or vice-versa. so the value of 10 in binary 8bit is 00001010 (where first 1 from left is 8 and second 1 is 2)


* But for Signed (2's complement) value, it can ranges from -128 to 127. As the 8th (last) bit is allocated to store sign info. For negative it's 1 and positive 0. Hence 01111111 = 127 and 10000000 = -128 [negative decimal (base 10) numbers are converted into binary or vise-versa using 2's complement algorithm ]