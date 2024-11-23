.model small
.stack 100h
.386
.data
	str1 db 'Enter a hex number (0 to FFFF): $'
	str2 db 'In binary it is: $'
	str3 db 10, 13, 'Illegal hex digit, try again: $'
	str4 db 10, 13, '$'
	
.code
	main proc
		mov ax, @data
		mov ds, ax
		; Display str1
		lea dx, str1
		mov ah, 09h
		int 21h
		; empty bx register
		xor bx, bx
		; counter
ad:		mov cx, 0
		;Take input
again:	cmp cx, 4
		je ac
		mov ah, 01h
		int 21h
		cmp al, 13
		je tt
		; compare input to check that it is letter or digit
		cmp al, '0'
		jae aa
	aa:	cmp al, '9'
		jbe bb
	bb:	cmp al, 'A'
		jae cc
	cc:	cmp al, 'F'
		jbe ab
		jmp error1
		; sub 55 if letter and sub 48 if digit
	ab: cmp al, '9'
		jbe dig
		sub al, 7
dig:	sub al, 48
		rol bx, 4
		or bl, al
		
		inc cx
		jmp again
		
; diplay the binary number taken from input
	ac:	lea dx, str4
		mov ah, 09h
		int 21h
	tt:	lea dx, str2
		mov ah, 09h
		int 21h
		mov cx, 16
		
	yy:	rol bx, 1
		jc zz
		mov dl, '0'
		mov ah, 02h
		int 21h
		jmp xx
	zz:	mov dl, '1'
		mov ah, 02h
		int 21h
	xx:	dec cx
		jnz yy
		jmp z

		
		
error1:	;Diplay Error
		lea dx, str3
		mov ah, 09h
		int 21h
		jmp ad
		
z:		;Termination
		mov ah, 4ch
		int 21h
	
main endp
end main
