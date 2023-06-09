.Const

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
