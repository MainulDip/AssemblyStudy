;EasyCodeName=DataTypesGoAsm1,1
.Const

.Data

hInst	DQ		0

slot1 db 5
slot2 db 2
slot3 db 3

settings db 3 DUP 1 ; 3 byte array each with value = 1

plug1 db 02Fh ; setting hex value requires h suffix, 0 prefix is optional
plug2 db 16h

rotten db ? ; question mark after the variable declaration will stop it from being initialized at this state in GoAsm

; GoAsm doesn't have string data type, but it recognise string as sequence of byte
welcome db 'Enigma style file encryptor', 0Dh, 0Ah ; after array of bytes, 0Dh and 0Ah are carriage return and line feed
; it declares an array of bytes with the length of charecters (27). We can also combine data declaration on the same line (see 0Dh, 0Ah)

; Declaring Quad Word (64bit) with dq
rotor1 dq 01F46C8037B9AD25Eh
rotor2 dq 0EFA87B439D5216C0h
rotor3 dq 00F732D168C4BA59Eh
rotor4 dq 0F0E8143CA2695B9Dh
rotor5 dq 0AB8736E1F0C295D4h

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
	Ret
EndF
