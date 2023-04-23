### Overview:
Study Assembly language and get to know Computers from the best possible lower level perspectives

### Setups:
To Assemble into byte code, we need assembler and debugger to debug and see the generated bytecode or run line by line. Also IDE
* Assembler : 
    - MASM32/64 from Visual Studio, or standalone MASM32 SDK.
    - GoASM for 64 and 32 bit. Also need header files to download and move inside GoASM's include directory to work with Easy Code IDE. https://www.godevtool.com/
* Debugger : x64dbg, https://x64dbg.com/
* IDE : Easy Code, https://www.godevtool.com/

Note: Best is to run all this inside VM. Install the MASM32 SDK. And Create a separate directory for the GoASM, Easy Code and the x64 debugger inside C directory.

### Environment Setup Success Test:
* masm32\bin\ml /c /coff masmtest.asm || to assable
* masm32\bin\link /subsystem:console masmtest.obj || linking generated object file to produce executable

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

### Project Basic Structure:
1. Setup processor and memory model (by including specific files)
    - like for x86 windows, "include \masm32\include\masm32rt.inc" will include/attach the file which will setup processor and memory model for a console application and include other windows specific libraries to do windows API call, ect.
2. Define Named Constant after ".Const", ie : answer EQU 43 || can also use "=" instated of EQU
2. The variables we don't need to initialize (or initialize later) will go after ".Data?" segment.
2. Define data after a ".Data" segment
3. Define code after the .Code segment
4. Define start of the program with entry point (label), ie, "start:". after this, write code to execute
5. End the program with name of the entry point label, ie, "end start"

```asm
include \masm32\include\masm32rt.inc
.data
Hello db "Hello World!", 0
.code
start:
    invoke StdOut, addr Hello
    invoke ExitProcess, 0
end start
```

```asm
.Const
answer
```

### Project Skeleton Structure of EasyCode IDE for windows console app:
```asm
.Const
; Define Name Constant Here
; like : number EQU 12
; or : number = 12

.Data?
; Define variable/s that don't need to be initialized, those maybe initialized later

.Data
; Define variable here

hInst		HINSTANCE	NULL	; initialize hInst variable with type and default value


.Code

start:
	Invoke GetModuleHandle, NULL	; API call to the windows OS to obtain instance handle
									; The handle is a DWORD value that contains the actual 
									; start address in memory of the EXE or DLL file
	
	Mov hInst, Eax		; insert value of hInst into Eax general perpose registers
	;=====================
	; Write your code here
	;=====================
	Invoke ExitProcess, 0 	; prefferred method of closing the program, 
							; it ensures any attatched dlls are properly closed down
							; 0 indicates, the program is exiting with no errors

End start		; will finaly close the program by the label name
``` 