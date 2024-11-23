.model small
.stack 100h
.386
.data
	str1 db 'Enter a binary number up to 8 digits: $'
	str2 db 'The binary sum is: $'
	str3 db 10, 13, '$'
	str4 db 10, 13, 'Illegal binary number, try again: $'
.code
	main proc
		mov ax, @data
		mov ds, ax
	hh:	mov ch, 0
	xx:	cmp ch, 2
		je zz
		mov bh, bl
		; Empty the Bx register to receive input
		xor bl, bl
		;Dispaly str1
		lea dx, str1
		mov ah, 09h
		int 21h
		inc ch
		; counter
		mov cl, 0
		;Take input
again:	cmp cl, 8
		je aa
		mov ah, 01h
		int 21h
		cmp al, 13
		je aa
		cmp al, '0'
		je cc
		cmp al, '1'
		je cc
		jmp error1
		; compare input to check that it is 0 or 1
	cc:	sub al, 48
		rol bl, 1
		or bl, al
		inc cl
		jmp again
		
	aa:	; Move cursor to next line
		lea dx, str3
		mov ah, 09h
		int 21h
		jmp xx
		
	; Add two numbers	
	zz: lea dx, str2
		mov ah, 09h
		int 21h
		add bl, bh
		jnc gg
		; Print overflow flag
		mov dl, '1'
		mov ah, 02h
		int 21h	
		; Display binary of sum
	gg:	mov cx, 8
		
	qq:	rol bl, 1
		jc mm
		mov dl, '0'
		mov ah, 02h
		int 21h
		jmp kk
	mm:	mov dl, '1'
		mov ah, 02h
		int 21h
	kk:	dec cx
		jnz qq
		jmp z
		
error1: ;Diplay Error
		lea dx, str4
		mov ah, 09h
		int 21h
		mov dl, 10
		mov ah, 02h
		int 21h
		mov dl, 13
		mov ah, 02h
		int 21h
		
		jmp hh
		; Termination
	z:	mov ah, 4ch
		int 21h
		
main endp
end main
