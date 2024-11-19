.model small
.stack 100h
.data
	str1 db 100 dup('$')
	str2 db 'Enter a String: $'
	str3 db 'Now String is: $'
	str4 db 100 dup('$')
.code
	main proc
		mov ax, @data
		mov ds, ax
		lea dx, str2
		mov ah, 09h
		int 21h
		lea si, str1
		lea di, str4
input:	mov cx, 0
again:	mov ah, 01h
		int 21h
		cmp al, 13
		je invert
		cmp al, 32
		je invert
		mov [si], al
		inc si
		inc cx
		jmp again
		
invert:	dec si
invrt:	mov bl, [si]
		mov [di], bl
		inc di
		dec si
		dec cx
		jnz invrt
		cmp al, 13
		je exit
		mov bl, ' '
		mov [di], bl
		inc di
		jmp input
		
exit:	
		lea dx, str3
		mov ah, 09h
		int 21h
		
		lea dx, str4
		mov ah, 09h
		int 21h
				
		mov ah, 4ch
		int 21h
		
main endp
end main
