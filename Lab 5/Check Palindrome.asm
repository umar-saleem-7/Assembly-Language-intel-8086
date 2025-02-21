.model small
.stack 100h
.386
.data
	str1 db 'Input String: $'
	str2 db 'Output: $'
	str3 db 100 dup('$')
	str4 db 'String is palindrome$'
	str5 db 'String is not palindrome$'
.code
	main proc
		mov ax, @data
		mov ds, ax
		
		lea dx, str1
		mov ah, 09h
		int 21h
		
		lea si, str3
		
		mov cx, 0
		
again:	mov ah, 01h
		int 21h
		
		cmp al, 13
		je exit
		
		mov [si], al
		inc si
		
		push ax
		inc cx
		
		jmp again
		
		
exit:	lea si, str3

		lea dx, str2
		mov ah, 09h
		int 21h
	
aa:		pop bx
		cmp [si], bl
		jne no_p
		
		inc si
		dec cx
		jnz aa
			
		lea dx, str4
		mov ah, 09h
		int 21h
		
		jmp z
		
no_p:	lea dx, str5
		mov ah, 09h
		int 21h
		
z:		mov ah, 4ch
		int 21h
		
main endp
end main
