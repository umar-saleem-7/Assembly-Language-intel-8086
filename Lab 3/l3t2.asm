.model small
.stack 100h
.data
	str1 db 'Enter first digit:$'
	str2 db 'Enter second digit:$'
	str3 db 'Error! Sum is greater than 9$'
	str4 db 'The sum is $'
.code
	main proc
		mov ax, @data
		mov ds, ax
		
		mov dx, offset str1
		mov ah, 09h
		int 21h
		
		mov ah, 01h
		int 21h
		mov bl, al
		
		mov dl, 10
		mov ah, 2
		int 21h
		mov dl, 13
		mov ah, 2
		int 21h
		
		mov dx, offset str2
		mov ah, 09h
		int 21h
		
		mov ah, 01h
		int 21h
		mov bh, al
		
		mov dl, 10
		mov ah, 2
		int 21h
		mov dl, 13
		mov ah, 2
		int 21h
		
		add bl, bh
		sub bl, 48
		mov al, bl
		
		cmp bl, 9
		ja aa
		
		mov dx, offset str4
		mov ah, 09h
		int 21h
		mov dl, al
		mov ah, 02h
		int 21h
		jmp bb
		
	aa:	mov dx, offset str3
		mov ah, 09h
		int 21h
		
		
	bb:	mov ah, 4ch
		int 21h
main endp
end main
