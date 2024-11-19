.model small
.stack 100h
.data
	count db 48
	str1 db 100 dup('$')
	str2 db 'Enter a String:$'
	str3 db 'Vowel Characters are: $'
.code
	main proc
		mov ax, @data
		mov ds, ax
		
		mov dx, offset str2
		mov ah, 09h
		int 21h
		
		mov si, offset str1
		
	aa: mov ah, 01h
		int 21h
		
		cmp al, 'a'
		jne ab
		inc count
		jmp aa
		
	ab:	cmp al, 'e'
		jne ac
		inc count
		jmp aa
		
	ac:	cmp al, 'i'
		jne ad
		inc count
		jmp aa
		
	ad:	cmp al, 'o'
		jne ae
		inc count
		jmp aa
		
	ae:	cmp al, 'u'
		jne af
		inc count
		jmp aa
		
	af:	cmp al, 'A'
		jne ag
		inc count
		jmp aa
		
	ag:	cmp al, 'E'
		jne ai
		inc count
		jmp aa
		
	ai:	cmp al, 'I'
		jne aj
		inc count
		jmp aa
		
	aj:	cmp al, 'O'
		jne ak
		inc count
		jmp aa
		
	ak:	cmp al, 'U'
		jne am
		inc count
		
	am:	cmp al, 13
		je cc
		inc si
		jmp aa 
		
	cc: mov dx, offset str3
		mov ah, 09h
		int 21h
		
		mov dl, count
		mov ah, 02h
		int 21h
		
		mov ah, 4ch
		int 21h
main endp
end main
