.model small
.stack 100h
.386
.data
	str1 db 'Enter a character: $'
	str2 db 10, 13, 'The ASCII code of $'
	str3 db ' in HEX is $'
.code
	main proc
		mov ax, @data
		mov ds, ax
		; Dispaly str1
	aa:	lea dx, str1
		mov ah, 09h
		int 21h
		; Take input
		mov ah, 01h
		int 21h
		mov bl ,al
		cmp bl, 13
		je bb
		;Display str2
		lea dx, str2
		mov ah, 09h
		int 21h
		; Display character
		mov dl, bl
		mov ah, 02h
		int 21h
		; Display str3
		lea dx, str3
		mov ah, 09h
		int 21h
		; Dispaly HEX of character
		mov cx, 2
	ad: rol bl, 4
		mov dl, bl
		and dl, 0fh
		cmp dl, 9
		jbe digit
		add dl, 7
digit:	add dl, 48
		mov ah, 02h
		int 21h
		dec cx
		jnz ad
		; Move cursor to next line
		mov dl, 10
		mov ah, 02h
		int 21h
		mov dl, 13
		mov ah, 02h
		int 21h

		jmp aa
		; Program Termination
	bb: mov ah, 4ch
		int 21h
		
main endp
end main