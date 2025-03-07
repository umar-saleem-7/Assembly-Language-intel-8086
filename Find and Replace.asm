.model small
.stack 100h
.data
	s1 db 'InputString: $'
	s2 db 'CharToFind: $'
	s3 db 10, 13, 'CharToReplace: $'
	s4 db 10, 13, 'ModifiedString: $'
	s5 db 100 dup('$')
	f db 0
	r db 0
.code
	main proc
		mov ax, @data
		mov ds, ax
		mov es, ax
		
		lea di, s5
		
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
		
		mov f, al
		
		lea dx, s3
		mov ah, 09h
		int 21h
		
		mov ah, 01h
		int 21h
		
		mov r, al
		
		lea dx, s4
		mov ah, 09h
		int 21h
		
		lea si, s5
		
		cld
bb:		lodsb
		mov dl, al
		cmp dl, f
		je replace
		
		mov ah, 02h
		int 21h
		
		jmp aa
		
replace:
		mov dl, r
		mov ah, 02h
		int 21h
		
aa:		loop bb
		
		mov ah, 4ch
		int 21h
				
main endp
end main
