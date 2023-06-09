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

### Memory and Registers:
```asm
.Const
trouble EQU 0ABADDEEDh ; a constant of hex value, suffix h is required
.Data?

.Data

hInst		HINSTANCE	NULL
buffer db 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' ; define byte (8bit)
bword dw 25 ; define word (16bit)
bdouble dd 0DEADBEEFh ; define double word (32bit)

.Code

start:
	Invoke GetModuleHandle, NULL
	Mov hInst, Eax
	;=====================
	; Write your code here
	;=====================
	
	mov al,[buffer] ; storing first charecture of buffer variable to the lower 8bit of eax regirster as al
	mov al,[buffer+1] ; storing lecond charecture of the buffer var to the same lower 8bit of eax register
	mov ax, bword ; storing bword into the lower 16bit of eax register as ax (ax = ah + al)
	mov eax, bdouble ; storing bdouble into the eax (32) register. eax = 16(higher) + ax(lower)	
	mov eax, trouble ; storing trouble into eax
	mov bdouble, eax ; store the value of eax back into memory/ram (bdouble variable)		
							
	Invoke ExitProcess, 0
End start
```

### Assembly Data Types (GoAsm64):
there is db, dw, dd, dq. Those define 8, 16, 32, 64 bits.
```asm
; declaring a variable of 1 byte using db 
slot1 db 5

; declaring 3 byte array each with value = 1 on a single line
settings db 3 DUP 1

; setting hex value requires h suffix, 0 prefix is optional
plug1 db 02Fh
plug2 db 16h

; question mark after the variable declaration will stop it from being
; initialized at this state in GoAsm
rotten db ? 

; GoAsm doesn't have string data type, but it recognize string as sequence 
; of byte

welcome db 'Enigma style file encryptor', 0Dh, 0Ah 

; after array of bytes, 0Dh and 0Ah are carriage return and line feed
; it declares an array of bytes with the length of charecters (27). We can 
; also combine data declaration on the same line (see 0Dh, 0Ah)

; Declaring Quad Word (64bit) with dq
rotor1 dq 01F46C8037B9AD25Eh
```

### Assembly Struct:
```asm
.Data

hInst	DQ		0

plug1 db 02Fh ; setting hex value requires h suffix, 0 prefix is optional
plug2 db 16h

rotten db ? ; question mark after the variable declaration will stop it from being initialized at this state in GoAsm

; GoAsm doesn't have string data type, but it recognise string as sequence of byte
welcome db 'Enigma style file encryptor', 0Dh, 0Ah ; after array of bytes, 0Dh and 0Ah are carriage return and line feed
; it declares an array of bytes with the length of charecters (27). We can also combine data declaration on the same line (see 0Dh, 0Ah)

;==========================================
;Rotors which prvide keystream
;==========================================
rotor struct
	hex dq
	notch db	
EndS
	

; Declaring Quad Word (64bit) with dq
rotor1 rotor <01F46C8037B9AD25Eh, 0Fh>
rotor2 rotor <0EFA87B439D5216C0h, 03h>
rotor3 rotor <00F732D168C4BA59Eh, 0Dh>
rotor4 rotor <0F0E8143CA2695B9Dh, 00h>
rotor5 rotor <0AB8736E1F0C295D4h, 03h>

;==============================================
;Encryptor slots into which rotors are placed
;==============================================
slot struct
	rotty rotor
	rotno db
	rotstart db	
EndS

slot1 slot
slot2 slot
slot3 slot
	

.Code

start:
	Invoke GetModuleHandleA, 0
	Mov [hInst], Rax
	Invoke Main
	Invoke ExitProcess, 0

Main Frame
	;=====================
	; Write your code here
	;=====================
	
	mov rax, [rotor5.hex] ; store first char of rotor5.hex
	mov [slot1.rotty.hex], rax ; store the value that is stored in rax register
	
	mov al, [rotor5.notch] ; store first char of rotor5.hex
	mov [slot1.rotty.notch], al ; get the value in al and store it in slot1.rotty.notch
	
	mov b[slot1.rotno], 5 ; if size is not set, the prefix b/w/d/q can set size explicitly
	mov b[slot1.rotstart], 0Ah
	
	mov rbx, [slot1.rotty.hex] ; storing first char of slot1.rotty.hex into rbx register
	
	Ret
EndF
```
### Move and Exchange Instructions:
* mov destination, source
	- mov eax, esi ; register to register
	- mov eax, [quantity] ; move memory to register
	- mov [qty], eax ; register to memory