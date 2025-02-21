.model small
.stack 100h
.386
.data
	str1 db 'Enter a string: $'
	str2 db 'You Enter: $'
	str4 db 100 dup('$')
	
.code
	main proc
		mov ax, @data
		mov ds, ax
		
		lea si, str4
		; Display str1
		lea dx, str1
		mov ah, 09h
		int 21h
		mov cx, 0
	bb:	mov ah, 01h
		int 21h
		cmp al, 13
		je aa
		cmp al, 20h
		je aa
		
		push ax
		inc cx
		jmp bb
	
	aa: pop bx
		mov [si], bl
		inc si
		dec cx
		jnz aa
		
		cmp al, 13
		je exit
		
		mov bl, 32
		mov [si], bl
		inc si
		
		mov cx, 0
		jmp bb
		
		
exit: 	lea dx, str2
		mov ah, 09h
		int 21h
		
		lea dx, str4
		mov ah, 09h
		int 21h
		
		mov ah, 4ch
		int 21h
		
main endp
end main
