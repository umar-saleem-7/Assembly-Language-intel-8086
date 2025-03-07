.model small
.stack 100h
.data
	s1 db 'Enter a String: $'
	s2 db 'Enter a Substring: $'
	s3 db 'Output: $'
	s4 db 100 dup('$')
	s5 db 100 dup('$')
	s6 db 'Yes$'
	s7 db 'No$'
	count db 0
.code
	main proc
		mov ax, @data
		mov ds, ax
		mov es, ax
		
		lea dx, s1
		mov ah, 09h
		int 21h
		
		mov cl, 0
		lea di, s4
		cld
		
again:	mov ah, 01h
		int 21h
		
		cmp al, 13
		je exit1
		
		stosb
		
		inc cl
		jmp again
		
		
exit1:	lea dx, s2
		mov ah, 09h
		int 21h
		
		mov ch, 0
		lea di, s5
		cld
		
agan:	mov ah, 01h
		int 21h
		
		cmp al, 13
		je exit2
		
		stosb
		inc ch
		jmp agan
		
		
exit2:
		lea dx, s3
		mov ah, 09h
		int 21h
		
		mov count, ch
		lea si, s4
		lea di, s5
		
bb:		mov al, [si]
		mov ah, [di]
		cmp al, ah
		je aa
		inc si
		dec cl
		jnz bb
		jmp no
		
aa:		push si
		
	ab:	dec count
		jz yes
		
		inc si
		inc di
		
		mov al, [si]
		mov ah, [di]
		cmp al, ah
		je ab
		
		mov count, ch
		pop si
		lea di, s5
		inc si
		
		jmp bb
		
		
yes: 	lea dx, s6
		mov ah, 09h
		int 21h
		jmp ter
		
no:		lea dx, s7
		mov ah, 09h
		int 21h
		
ter:	mov ah, 4ch
		int 21h
		
main endp
end main
