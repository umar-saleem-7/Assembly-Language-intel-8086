.model small
.stack 100h
.data
	s1 db 'myStr: $'
	s2 db 'ch: $'
	s3 db 10, 13, 'Modified String: $'
	s4 db 100 dup('$')
	s5 db 100 dup('$')
	char db 0
.code
	main proc
		mov ax, @data
		mov ds, ax
		mov es, ax
		
		lea di, s4
		
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
		
		mov ah, 01h
		int 21h
		
		mov char, al
		
		lea dx, s3
		mov ah, 09h
		int 21h
		
		lea di, s5
		lea si, s4
		cld
		
bb:		lodsb
		cmp al, char
		je aa
		stosb
		loop bb
		jmp ter
aa:		loop bb

ter: 	lea dx, s5
		mov ah, 09h
		int 21h
		
		mov ah, 4ch
		int 21h
		
main endp
end main
