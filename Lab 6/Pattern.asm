.model small
.stack 100h
.386
.data
	s1 db 'Enter an odd number: $'
	s2 db 'Enter a three Characters String: $'
	s3 db 10, 13, '$'
	s4 db 10 dup('$')
	count dw '0'
	count1 dw '0'
	count2 dw '0'
.code
	main proc
		mov ax, @data
		mov ds, ax
		
		lea si, s4
		
		lea dx, s1
		mov ah, 09h
		int 21h
		
		call input
		
		mov count, bx
		
		mov cx, 3
		mov ax, bx
		sub ax, cx
		
		mov cx, 2
		mov dx, 0
		div cx
		
		mov count2, ax
		
		lea dx, s2
		mov ah, 09h
		int 21h
		
		mov cx, 3
		
again:	cmp cx, 0
		je exit
		
		mov ah, 01h
		int 21h
		
		and al, 11011111b
		
		mov [si], al
		inc si
		loop again
		
exit:	lea dx, s3
		mov ah, 09h
		int 21h
		
		cmp bx, 1
		je one_time
		
		mov ax, bx
		mov bx, 2
		mov dx, 0
		div bx
		
		mov count1, ax
		mov cx, count1
	aa: mov bx, count
	bb: mov dl, '*'
		mov ah, 02h
		int 21h
		
		dec bx
		jnz bb
		
		lea dx, s3
		mov ah, 09h
		int 21h
		
		dec cx
		jnz aa
		
		cmp count2, 0
		je nn
		mov cx, count2
	cc:	mov dl, '*'
		mov ah, 02h
		int 21h
		
		loop cc
		
	nn:	lea dx, s4
		mov ah, 09h
		int 21h
		
		cmp count2, 0
		je mm
		mov cx, count2
	ad:	mov dl, '*'
		mov ah, 02h
		int 21h
		
		loop ad
		
	mm:	lea dx, s3
		mov ah, 09h
		int 21h
		
		mov cx, count1
	ac: mov bx, count
	ba: mov dl, '*'
		mov ah, 02h
		int 21h
		
		dec bx
		jnz ba
		
		lea dx, s3
		mov ah, 09h
		int 21h
		
		dec cx
		jnz ac
		
		mov ah, 4ch
		int 21h
		
one_time:	mov dl, '*'
			mov ah, 02h
			int 21h
			
			lea dx, s3
			mov ah, 09h
			int 21h
			
			lea dx, s4
			mov ah, 09h
			int 21h
			
			lea dx, s3
			mov ah, 09h
			int 21h
			
			mov dl, '*'
			mov ah, 02h
			int 21h
			
			mov ah, 4ch
			int 21h
			
		
	main endp
	
	input proc
		mov ax, 0
		mov bx, 0
		mov cx, 0
		
again:	mov ah, 01h
		int 21h
		
		cmp al, 13
		je exit
		
		mov ah, 0
		sub al, 48
		
		mov cx, ax
		mov ax, bx
		mov bx, 10
		
		mul bx
		
		add ax, cx
		
		mov bx, ax
		
		jmp again
		
exit: 	ret
	
	input endp
	
end main