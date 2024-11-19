.model small
.stack 100h
.data
	str1 db 100 dup('$')
	str2 db 'Enter a Character: $'
.code
	main proc
		mov ax, @data
		mov ds, ax
		
		mov dx, offset str2
		mov ah, 09h
		int 21h
		
		mov si, offset str1
		mov bx, si
		
	aa: mov ah, 01h
		int 21h
		
		cmp al, 13
		je bb
		
		mov [si], al
		
		inc si
		
		jmp aa
	bb:	mov ax, si
		sub ax, bx
		mov cx, ax
		
	cc:	dec si
		mov dl, [si]
		mov ah, 02h
		int 21h
		
		dec cx
		jnz cc
			
		mov ah, 4ch
		int 21h
main endp
end main
