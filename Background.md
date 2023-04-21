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
- MASM32 and MASM64 : Microsoft Assembler for 32 and 64 bit. Comes with Visual Studio, but can be use standalone using 3rd party MASM32 SDK.
- TASM : Turbo Assembler
- NASM : Netwide Assembler, known mostly for Linux
- GNU Assembler
- GoASM : Go Based 64 bit

### Terms:
* OPCODE : Operation Code is used to tell processor do something keeping the program counter, load next instruction (opcode and previously calculated data) and repeat until finished.

* Binary Prefix
 - ADD, SUB, MUL, MOVE

* Truth Tables: All combinations of possible input to all combination of possible output

* BUS: Binary Unit System, is a communication system that transfers data between components inside a computer or between computers

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

### CPU Registers:
the processor includes some internal memory storage locations, called registers.
It's a very high-speed piece of memory inside CPU's, way faster than RAM. Measures in clock speed
- 2.6 GHz Clock Speed = 2.6 billion ops (operations) per second.

* registers are grouped into three categories
 1. #### General Registers:
  sub-division of this are : 
    ###### Data Registers: 
    EAX,  EBX, ECX, EDX. Lower halves of the 32-bit registers can be used as four 16-bit data registers: AX, BX, CX and DX. Also Lower and higher halves of the above-mentioned four 16-bit registers (AX, BX, CX, DX) can be used as eight 8-bit data registers: AH, AL, BH, BL, CH, CL, DH, and DL.

        - Primary Accumulator (EAX) : used in input/output and most arithmetic instructions. It is 32bit, where lower half is AX(16bit), AX can be broken down by AH(8bit) and AL(8bit). A high and A low.
        - Base register (EBX): could be used in indexed addressing. its lower half BX (16bit) = BH + BL 
        - Count register (ECX): store the loop count in iterative operations. its lower half CX (16bit) = CH + CL 
        - Data register (EDX): used in input/output operations. It is also used with AX register along with DX for multiply and divide operations involving large values. its lower half DX (16bit) = DH + DL 
    
    ###### Pointer Registers: 3 types:
      - IP : instruction Pointer, stores the offset address of the next instruction to be executed. IP in association with the CS register (as CS:IP) gives the complete address of the current instruction in the code segment.
      - SP : Stack Pointer, provides the offset value within the program stack. SP in association with the SS register (SS:SP) refers to be current position of data or address within the program stack.
      - BP : Base Pointer, helps in referencing the parameter variables passed to a subroutine. The address in SS register is combined with the offset in BP to get the location of the parameter. BP can also be combined with DI and SI as base register for special addressing.

    ###### Index Registers: 
    are used for indexed addressing and sometimes used in addition and subtraction. There are two sets of index pointers
      - ESI: (Extended) Source Index, used as source index for string operations
      - EDI: (Extended) Destination Index, used as destination index for string operation.

 2. #### Control Registers / Flags Registers:
  The 32-bit instruction pointer register and the 32-bit flags register combined are considered as the control registers.

    Many instructions involve comparisons and mathematical calculations and change the status of the flags and some other conditional instructions test the value of these status flags to take the control flow to other location. Some Flag bits are

    - Carry Flag (CF): after doing binary calculation if it carry anything (1) for the next calculation. like 1 + 1 in binary carry 1 and end up resulting 0001 + 0001 = 0010 
    - Overflow (OF) : if the previous calculation result overflow the allocated memory
    - Sign Flag (SF) : previous Signed (negative/positive) info
    - Zero Flag (ZF) : if the subtraction calculation resulted to 0
 
 3. #### Segment Registers:
Segment registers are basically memory pointers located inside the CPU. These are specific areas defined in a program for containing data, code and stack. They store starting address of the code/data/stack/extra Segment.

    - CS : Code (program/instructions) segment, read only. It contains all the instructions to be executed.
    - DS : Data segment, read/write, It contains data, constants and work areas.
    - SS : Stack segment : It contains data and return addresses of procedures or subroutines. It is implemented as a 'stack' data structure.
    - ES, FS, GS : Extra segments

### IP/EIP Register More:
IP is Instruction Pointer. Its function is the same as PC (program counter) in other microprocessor which is to point to the next instruction to be fetched by BIU (Bus Interface Unit) unit to be feed into EU (execution unit) unit. 

* BUS: Binary Unit System, is a communication system that transfers data between components inside a computer or between computers

Characters: 

- IP/EIP = Instruction Pointer or "Extended Instruction Pointer" for the stack.
- Those control instruction execution.
- points to the current instruction to be executed
- Cannot be modified directly
- Increments after instruction is executed or throw Exception or Jump/Break/Continue, etc.
- Used to mean control of the program for security/exploitation in Assembly 

* Works like conditionals and or looping (if/else/while/do-while/switch, etc)

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




### Logical Operators:
* Bitwise AND (&): Both operand have to be 1 to produce 1. 0 AND 0 = 0 , 1 AND 1 = 1, 1 & 0 = 0
    0101 & 0011 = 0001 // 5 AND 3 = 1
    0101 & 0100 = 0100 // 5 AND 4 = 4
    0011 & 0100 = 0 // 3 AND 4 = 0
* Bitwise OR: If at lest single operand is 1, it will generate 1 

* Bitwise NOT: Opposite of the given bit. 0 becomes 1 and vise versa
* Bitwise XOR: If both operand are no mach then the result will be 1, like, 1 XOR 0 = 1, 1 XOR 1 = 0. Used in Encryption, Reverse Engineering, or testing if both operand are same in which case it will return all 0s.

### Programs:
* Bytes stored on a disk.
 - OS searches the path
 - if program exists
   - load into ram, allocate virtual memory which are mapped with the ram
   - create process with PID (process ID)
   - execute process
   - OS handles resources : Disk IO, input, output, task switching



### RISC (ARM) vs CICS (x86):
* Reduced Instruction Set
 - smaller op (operation) codes
 - more instructions
 - use less power
* Complex Instruction Set
 - larger op codes
 - fewer instructions but complex
 - power hungry
 - 

### Assembly Mnemonics:
Mnemonics are the names for the symbols used in assembly language. A phrase, symbol, or word used to define or identify a computing function is known as a mnemonic. Assembly language enables programmers to write code that corresponds to the machine instructions that a given processor may execute. Those are mapped to the binary. Mnemonics are followed by operands.

* Mnemonics allow us to call/execute opcode/instruction by symbol/letters instead of raw binary. Higher level than binary. Those can remain the same for different machine.


* Example: add eax, ebx // here add is the Mnemonic and eax, ebx are operands.

### Assembly Operands:
Each assembly language statement is split into an opcode/mnemonic and an operand . The opcode is the instruction that is executed by the CPU and the operand is the data or memory location used to execute that instruction.

* typically Operands modify a register or a memory location. Its data/value is hard coded and increment affects the register.

ex: add eax, ebx || add eax, 7


### Assembler vs Compiler:
* Assembler:
    - approximatey 1-to-1 assembly to machine code
    - machine dependent : x86, ARM, SPARC, x86-x64 will vary
* Compiler:
    - 1 higher level line may generate many machine/assembly instruction
    - more portable
    - int x = x + 7; // will generate several lines of ASM

### CPU Instruction categories:
* Load and store
* Computational
* Logical
* Control flow

### Advanced Instruction Group:
* Advanced Encryption Standard (AES)
* 128-bit packed decimal instructions
* 256-bit or more vector instructions