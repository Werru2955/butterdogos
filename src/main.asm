org 0x7C00
bits 16


%define ENDL 0x0D, 0x0A

start:
	jmp main

;Prints to screen

puts:
	;save registers we're modifying
	push si
	push ax
.loop:
	lodsb 
	or al, al
	jz .done
	
	
	mov ah, 0x0e
	mov bh, 0
	int 0x10
	jmp .loop
.done:
	pop ax
	pop si
	ret

main:

	; setup data segments
	mov ax, 0 
	mov ds, ax
	mov es, ax
	
	mov ss, ax
	mov sp, 0x7C00 ;pointer to the beginning of the program.
	
	
	mov si, msg_hello
	call puts
	hlt
.halt:
	jmp .halt

msg_hello: db 'Hello ReactOS discord.', ENDL, 0

times 510-($-$$) db 0
dw 0AA55h