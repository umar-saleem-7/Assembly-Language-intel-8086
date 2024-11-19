.model small
.stack 100h
.data
	str1 db 'Enter a number (0-9):$'
	var1 db 48
.code
	main proc
		mov ax, @data
		mov ds, ax
		
		mov dx, offset str1
		mov ah, 09h
		int 21h
		
		mov ah, 01h
		int 21h
		
		sub al, 47
		
		mov cl, al
	
	aa:	mov dl, 10
		mov ah, 2
		int 21h
		mov dl, 13
		mov ah, 2
		int 21h
		
		mov dl, var1
		mov ah, 02h
		int 21h
		
		inc var1
		dec cl

		jnz aa
		mov ah, 4ch
		int 21h
main endp
end main
