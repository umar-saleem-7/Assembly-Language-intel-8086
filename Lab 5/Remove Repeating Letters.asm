.model small
.stack 100h
.386
.data
	str1 db 'Input: $'
	str2 db 'Output: $'
	str3 db 100 dup('$')
	
.code
	main proc
		mov ax, @data
		mov ds, ax
		
		lea si, str3
		
		mov cl, 0
		
		lea dx, str1
		mov ah, 09h
		int 21h
		
		mov ah, 01h
		int 21h
		
		push ax
		inc cl
		
again:	mov ah, 01h
		int 21h
		
		cmp al, 13
		je exit
		
		pop bx
		dec cl
		cmp bl, al
		je again
		
		push bx
		push ax
		
		inc cl
		inc cl
		jmp again
				
exit:	lea dx, str2
		mov ah, 09h
		int 21h
		
		cmp cl, 0
		je z
		
		mov ch, cl

xx:		pop bx
		mov [si], bl
		inc si
		dec cl
		jnz xx
		
		dec si
		
yy:		mov bl, [si]
		mov dl, bl
		mov ah, 02h
		int 21h
		
		dec si
		dec ch
		jnz yy

z:		mov ah, 4ch
		int 21h
		
main endp
end main
