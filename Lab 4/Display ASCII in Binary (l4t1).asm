.model small
.stack 100h
.386
.data
	str1 db 'Enter a character: $'
	str2 db 10, 13, 'The ASCII code of $'
	str3 db ' in binary is $'
	str4 db 10 ,13, 'The number of 1 bit is $'
	count db 48
.code
	main proc
		mov ax, @data
		mov ds, ax
		; Display str1
		lea dx, str1
		mov ah, 09h
		int 21h
		;take input
		mov ah, 01h
		int 21h
		mov bl ,al
		; Display str2
		lea dx, str2
		mov ah, 09h
		int 21h
		;Display charcter
		mov dl, bl
		mov ah, 02h
		int 21h
		; Display str3
		lea dx, str3
		mov ah, 09h
		int 21h
		; Diaplay binary of character
		mov cx, 8
	bb:	rol bl, 1
		jc aa
		mov dl, '0'
		mov ah, 02h
		int 21h
		jmp cc
	aa:	mov dl, '1'
		mov ah, 02h
		int 21h
		inc count
	cc:	dec cx
		jnz bb
		; Display str4
		lea dx, str4
		mov ah, 09h
		int 21h
		; Diaplay number of 1 bit
		mov dl, count
		mov ah, 02h
		int 21h		
		; Termination of program
		mov ah, 4ch
		int 21h
		
main endp
end main
