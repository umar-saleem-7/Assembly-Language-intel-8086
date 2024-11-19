.model small
.stack 100h
.data
	str1 db 'Enter two digits:$'
	str2 db 'Enter operator:$'
	str3 db 'Sum is $'
	str4 db 'Difference is $'
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
		sub bl, 48
		
		mov ah, 01h
		int 21h
		mov bh, al
		sub bh, 48
		
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
		
		cmp al, '+'
		jne aa
		
		mov dl, 10
		mov ah, 2
		int 21h
		mov dl, 13
		mov ah, 2
		int 21h
				
		add bl, bh
		add bl, 48
		
		mov dx, offset str3
		mov ah, 09h
		int 21h
		
		mov dl, bl
		mov ah, 02h
		int 21h
		jmp bb
		
	aa: mov dl, 10
		mov ah, 2
		int 21h
		mov dl, 13
		mov ah, 2
		int 21h
		
		cmp bl, bh
		ja cc
		
		sub bh, bl
		add bh, 48
		
		mov dx, offset str4
		mov ah, 09h
		int 21h
		
		mov dl, bh
		mov ah, 02h
		int 21h
		jmp bb
		
	cc:	sub bl, bh
		add bl, 48
		
		mov dx, offset str4
		mov ah, 09h
		int 21h
		
		mov dl, bl
		mov ah, 02h
		int 21h
		jmp bb
		
	bb:	mov ah, 4ch
		int 21h
main endp
end main
