.model small
.stack 100h
.data
	str1 db 'Enter the 1st number(0to9):$'
	str2 db 'Enter the 2nd number(0to9):$'
	str3 db 'Sorry you have entered a wrong character.$'
	str4 db 'Do you want to exit (y) or restsrt(n):$'
	str5 db 'First Number is greater than second number$'
	
.code
	main proc
		mov ax, @data
		mov ds, ax
		
	ac:	mov dx, offset str1
		mov ah, 09h
		int 21h
		
		mov ah, 01h
		int 21h
		mov bl, al
		sub bl, 48
		
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
		sub bh, 48
		
		mov dl, 10
		mov ah, 2
		int 21h
		mov dl, 13
		mov ah, 2
		int 21h
		
		cmp bl, 0
		jae aa
		
		mov dx, offset str3
		mov ah, 09h
		int 21h
		
		mov dl, 10
		mov ah, 2
		int 21h
		mov dl, 13
		mov ah, 2
		int 21h
		
		jmp cc
		
	aa:	cmp bh, 9
		jbe bb
		
		mov dx, offset str3
		mov ah, 09h
		int 21h
		
		mov dl, 10
		mov ah, 2
		int 21h
		mov dl, 13
		mov ah, 2
		int 21h
		
		jmp cc
	
	bb:	cmp bl, bh
		ja ae
		sub bh, bl
		mov cl, bh
		add cl, 1
		mov ch, bl
		add ch, 48
		
	ad: mov dl, ch
		mov ah, 02h
		int 21h
		
		mov dl, 10
		mov ah, 2
		int 21h
		mov dl, 13
		mov ah, 2
		int 21h
		
		inc ch
		dec cl
		jnz ad
		jmp cc
	
	ae: mov dx, offset str5
		mov ah, 09h
		int 21h
		
		mov dl, 10
		mov ah, 2
		int 21h
		mov dl, 13
		mov ah, 2
		int 21h
		
		jmp cc
		
	
	cc: mov dx, offset str4
		mov ah, 09h
		int 21h
		
		mov ah, 01h
		int 21h
		
		cmp al, 'y'
		je ab
		
		mov dl, 10
		mov ah, 2
		int 21h
		mov dl, 13
		mov ah, 2
		int 21h
		
		jmp ac
		
	ab:	mov ah, 4ch
		int 21h
main endp
end main
