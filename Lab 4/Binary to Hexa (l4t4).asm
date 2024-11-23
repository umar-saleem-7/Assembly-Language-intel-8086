.model small
.stack 100h
.386
.data
	str1 db 'Enter a binary number up to 16 digits: $'
	str2 db 'In Hex it is $'
	str3 db 10, 13, 'Illegal binary digit, try again: $'
	str4 db 10, 13, '$'
	
.code
	main proc
		mov ax, @data
		mov ds, ax
		; Empty the Bx register to receive input
		xor bx, bx
		; Dispaly str1
		lea dx, str1
		mov ah, 09h
		int 21h
		; counter
	xx:	mov cx, 0
		;Take input
again:	cmp cx, 16
		je aa
		mov ah, 01h
		int 21h
		cmp al, 13
		je tt
		cmp al, '0'
		je cc
		cmp al, '1'
		je cc
		jmp error1
		; compare input to check that it is 0 or 1
	cc:	sub al, 48
		rol bx, 1
		or bl, al
		
		inc cx
		jmp again
		
; diplay the Hexa number taken from input
	aa:	lea dx, str4
		mov ah, 09h
		int 21h
	tt:	lea dx, str2
		mov ah, 09h
		int 21h
		mov cx, 4
	ad: rol bx, 4
		mov dl, bl
		and dl, 0fh
		cmp dl, 9
		jbe digit
		add dl, 7
digit:	add dl, 48
		mov ah, 02h
		int 21h
		dec cx
		jnz ad
		jmp z
		
error1: ;Diplay Error
		lea dx, str3
		mov ah, 09h
		int 21h
		jmp xx
		; Termination
	z:	mov ah, 4ch
		int 21h
		
main endp
end main
