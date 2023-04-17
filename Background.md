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


### Binary Addition:
* 1 + 1 = 10 || 1 + 0 = 1 || 0 + 0 = 0
* 1 + 0 + 1 = 10 || 1 + 1 + 1 = 11 || 1010 + 0101 = 1111 || 0110 + 1010 = 10000

### Hexadecimal (Base 16):
* 0-9 A-F || values from 0 to 15
* denotes with 0x.......
* 4bit's max value is F (15). So 1byte (8bit) can hold a maximum of 2 hex digits.
* Conversion: As 1hex digit is 4bit, conversion will done on each 4bit separately. like 
=> 1110 1000 = E [8+4+2+0 = 14] and 8 [8+0+0+0 = 8] = E8 [written like 0xE8]
=> 1010 0001 = 0xA1
=> 0xAF02 = 1010 1111 0000 0010
=> 0xFF02 = 1111 1111 0000 0010
=> 102 (decimal/base 10) = 0110 0110 (Binary) = 0x66 (Hex) 

### 2's Complement:
* Way to store negative Signed number in binary inside Computer Memory. Signed means either positive (0) or negative (1). For 8bit signed binary, the left most bit is allocated for signing info (positive or negative || 0 or 1), so we get 7 bit to represent the actual value.
* If Uppermost (left most) bit (MBS) = 0, then it's positive.
* If Uppermost (left most) bit = 1, then negative. For Negative binary to decimal conversion, the algorithm is
 - reverse bits
 - then add 1 on the reversed bit
 - then convert to decimal

 * Conversion = Signed 10000000 = (left most bit's 0 represents negative value so reversing other 7 bits and adding 1) 111 1111 + 1 = 1000 0000 = -128 [ highest signed negative value 8bit can hold  ]
 * Conversion = Signed 01111111 = (as left most bit is 0, its positive, so no reversing is necessary) 64 + 32 + 16 + 8 + 4 + 2 + 1 = 127

 * MSB = Most Significant Bit (left most bit) and LSB = List Significant Bit (Right Most Bit)

 * Convert -8 to Signed Binary : 
 as we have to allocate the MSB for Signing information, 4 bits is not enough, so lets do it using 8bit. First present the unsigned representation of 8 using 7bit, keeping left most bit intact. Then reverser the 7 unsigned bits and add 1 to do the final conversion. The left most bit should remain intact as Signed information.
 => -8 = 1 000 1000 => 1 111 0111 + 1 = 1 111 1000
### Characters:
* ASCII : 8bits, for letter/numbers MSB = 0
* UTF-8
* UTF-16
* Unicode/UTF-32

### Registers:
This are primary means of moving data to another program.

### Computer Organization:
* It all starts with the bit - 1 or 0
* Basic unit of memory is Byte (8bit - minimum amount of data to move)
* ASCII is 1 byte
* Unicode is 1 or 2, 4 bytes
### Assembly Units:
- word = 2 bytes
- double word = 4 bytes (32bit)
- quadword = 8 bytes (64bit )

### CPU Workflow and Components:
 - fetch : fetch data from disc, registry, primary memory (ram)
 - decode : decode the binary commands/instructions (moving/jumping/calling, etc)
 - execute : execute the decoded instructions
 - store result 
 - fetch again and repeat and repeat continuously

* Registers: are CPU components. These are little chunks of memory that are available while cpu is executing instructions to store result. Also it figures out what instructions to execute next.
* Flags : these are also cpu registers. Those throw execution event by either success (1) or failure (0) so we can know what happened (carry, overflow) upon the execution.

### CPU Families x86:
* 8086 : 16bit registers, AX, BX, CX, DX, SI, DI, BP, SP, CS, DS, SS, ES, IP
* 80386 (x386): extends to 32bit mode. Extends the registers: EAX, EBX, ...
* 80486 : faster
* MMX : new instruction for multimedia

### Registers:
It's a very high-speed piece of memory inside CPU's. Measures in clock speed
- 2.6 GHz Clock Speed = 2.6 billion ops (operations) per second

### IP/EIP Register:
- IP/EIP = Instruction Pointer or "Extended Instruction Pointer" for the stack.
- Those control instruction execution.
- points to the current instruction to be executed
- Cannot be modified directly
- Increments after instruction is executed or throw Exception or Jump/Break/Continue, etc.
- Used to mean control of the program for security/exploitation in Assembly 

* Works like conditionals and or looping (if/else/while/do-while/switch, etc)

### Flags Registers:
Those store info about a previous instruction that was executed. like
- Carry Flag (CF): after doing binary calculation if it carry anything (1) for the next calculation. like 1 + 1 in binary carry 1 and end up resulting 0001 + 0001 = 0010 
- Overflow (OF) : if the previous calculation result overflow the allocated memory
- Sign Flag (SF) : previous Signed (negative/positive) info
- Zero Flag (ZF) : if the subtraction calculation resulted to 0

### Segment Registers:
Segments are used to store info about Where elements are located.
- CS : Code (program/instructions) segment, read only, as code doesn't meant to be changed on it's own.
- DS : Data (variables) segment, read/write, as variable changes through-out the application execution.
- SS : Stack segment
- ES, FS, GS : Extra segments
### Virtual Memory:
It's the process of mapping memory addresses used by a program (virtual addresses) to physical address in computer memory.
 - Appears to process as a contiguous block of memory 
* OS manages mapping of virtual to real address space
* Benefits:
 - Memory isolation (security)
 - Use more memory than physically able (paging)
 - Applications do not have ot manage shared memory space
 - Can help prevent relative addressing

* Page Table : When processor access memory, it consults a page table. Page table tells processor which physical address to use. 