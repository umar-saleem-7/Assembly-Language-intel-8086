.model small
.stack 100h
.data
	s1 db 'Enter a string: $'
	s2 db 'After TrimStart', 10,13, 'String: $'
	s3 db 100 dup('$')
	s4 db 100 dup('$')
.code
	main proc
		mov ax, @data
		mov ds, ax
		mov es, ax
		
		lea di, s3
		
		lea dx, s1
		mov ah, 09h
		int 21h
	
		mov cx, 0
		cld
again:	mov ah, 01h
		int 21h
		
		cmp al, 13
		je exit
		
		stosb
		inc cx
		jmp again
		
exit:	lea dx, s2
		mov ah, 09h
		int 21h
		
		lea si, s3
		lea di, s4

		cld
		
aa:		lodsb
		dec cx
		cmp al, ' '
		je aa
		
		cmp cx, 0
		je ter
		
		stosb
		
bb:		lodsb
		stosb
		loop bb
		
ter:	lea dx, s4
		mov ah, 09h
		int 21h
		
	
		mov ah, 4ch
		int 21h
		
main endp
end main
		