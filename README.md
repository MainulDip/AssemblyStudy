### Overview:
Study Assembly language and get to know Computers from the best possible lower level perspectives

### Setups

### Instructions:
* Signature: [label:] mnemonic [operand(s)] [;comment]
* Mnemonic's
    - mov , add , sub , mul , jmp , call
* Comment : semicolon till the end of the line. it's single line. ; is a nasm comment.

### Sample Instructions:
* mov ebx, 7 ; moves 7 into the ebx register, ebx and 7 are operands
* mov eax, ebx ; moves the value in ebx to eax
* inc eax ; increment eax or eax++
* dec eax ; decrement eax


### Directives:
It's not actual instructions. Kind of preprocessor directive in C. It tell the assembler to do something. like
- set the size of the stack
- define memory
- define constants
```asm
%define SIZE 7 
mov eax, SIZE  ; move 7 to eax

; same as

mov eax, 7
```

### Data Directives:
* db: Define byte(8bit), Ascii char
* dw: Define word, 2 bytes or 16 bits, Unicode, two chars, etc
* dd: Define double word, 4 bytes, Pointers in a 32bit machine
* dq : Quad-Word, 64bit