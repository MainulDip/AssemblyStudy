;EasyCodeName=RegistersAndMemoryMasm,1
.Const
trouble EQU 0ABADDEEDh
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
 