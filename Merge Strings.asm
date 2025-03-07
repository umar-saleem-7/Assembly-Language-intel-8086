.model small
.stack 100h
.data
	s1 db 'Enter String 1: $'
	s2 db 'Enter String 2: $'
	s3 db 'Enter Integer: $'
	s4 db 10, 13, 'New String is: $'
	s5 db 100 dup('$')
	s6 db 100 dup('$')
	s7 db 100 dup('$')
	integer db 0
	count db 48
.code
	main proc
		mov ax, @data
		mov ds, ax
		mov es, ax
		
		lea dx, s1
		mov ah, 09h
		int 21h
		
		lea di, s5
		cld
again:	mov ah, 01h
		int 21h
		
		cmp al, 13
		je exit1
		
		stosb
		jmp again
		
		
exit1:	lea dx, s2
		mov ah, 09h
		int 21h
		
		lea di, s6
		cld
		
agan:	mov ah, 01h
		int 21h
		
		cmp al, 13
		je exit2
		
		stosb
		jmp agan
		
exit2:
		lea dx, s3
		mov ah, 09h
		int 21h
		
		mov ah, 01h
		int 21h
		
		mov cl, al
		sub cl, 48
		
		lea si, s6
		
		lea dx, s4
		mov  ah, 09h
		int 21h
		
aa:		mov dl, [si]
		mov ah, 02h
		int 21h
		
		inc si
		dec cl
		jnz aa
		
		lea dx, s5
		mov ah, 09h
		int 21h
		
		mov dx, si
		mov ah, 09h
		int 21h
		
		mov ah, 4ch
		int 21h
		
main endp
end main
