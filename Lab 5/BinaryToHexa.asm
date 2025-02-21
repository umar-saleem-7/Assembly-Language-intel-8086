.model small
.stack 100h
.386
.data
	str1 db 'Enter a 8-digit binary number: $'
	str2 db 'Entered binary numbers in Hexa are: $'
	str3 db 10, 13, '$'
	str4 db 5 dup('0')
.code
	main proc
		mov ax, @data
		mov ds, ax
		lea si, str4
		
		mov ch, 5
		; Take binary number as input
	aa:	call BinaryInput
		; Mov cursor to next line
		lea dx, str3
		mov ah, 09h
		int 21h
		; Write number in array
		mov [si], bl
		inc si
		dec ch
		jnz aa
		
		mov ch, 5
		lea si, str4
		; Dispaly str2
		lea dx, str2
		mov ah, 09h
		int 21h
		; DIsplay Hexa output
	bb:	lea dx, str3
		mov ah, 09h
		int 21h
		call HexadecimalOutput
		inc si
		dec ch
		jnz bb
		
		mov ah, 4ch
		int 21h
		
	main endp
	
	BinaryInput proc
		xor bl, bl
		; Dispaly str1
		lea dx, str1
		mov ah, 09h
		int 21h
		; counter
		mov cl, 8 
		;Take input
again:	mov ah, 01h
		int 21h
		; compare input to check that it is 0 or 1
		sub al, 48
		rol bx, 1
		or bl, al
		
		dec cl
		jnz again
		
		ret
	BinaryInput endp
	
	HexadecimalOutput proc
		mov cl, 2
		mov bl, [si]
	cc: rol bl, 4
		mov dl, bl
		and dl, 0fh
		cmp dl, 9
		jbe digit
		add dl, 7
digit:	add dl, 48
		mov ah, 02h
		int 21h
		dec cl
		jnz cc
		
		ret
	HexadecimalOutput endp
	
end main
