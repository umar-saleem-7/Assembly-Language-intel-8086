.model small
.stack 100h
.data
	s1 db 'Number is: $'
	s2 db 'Reversed Number is: $'
	s3 db 50 dup('?')
	count db 0
.code
	main proc
		mov ax, @data
		mov ds, ax
		
		lea si, s3
		
		lea dx, s1
		mov ah, 09h
		int 21h
		
		call input
		
		mov ax, bx
		mov bx, 10
		
		call reverse
		
		lea dx, s2
		mov ah, 09h
		int 21h
		
		mov ax, bx
		mov bx, 10
		
		call output
		
		mov ah, 4ch
		int 21h
		
		
	main endp
	
	reverse proc
		
		
again:	cmp ax, 0
		je pri
		
		mov dx, 0
		div bx
		
		mov [si], dl
		inc si
		inc count
		jmp again
		
pri:	lea si, s3
		mov ax, 0
		mov bx, 0
		mov cx, 0
		
print:	mov al, [si]
		mov ah, 0
				
		mov cx, ax
		mov ax, bx
		mov bx, 10
		
		mul bx
		
		add ax, cx
		
		mov bx, ax
		
		inc si
		dec count
		jnz print
		
		ret
		
	reverse endp
	
	output proc
		
		mov cx, 0	
		
again:	cmp ax, 0
		je print
		
		mov dx, 0
		div bx
		
		push dx
		inc cx
		jmp again
		
print:	pop dx
		cmp dl, 9
		jbe dig
		add dl, 7
dig:	add dl, 48
		mov ah, 02h
		int 21h
		
		dec cx
		jnz print
		
		ret
		
	output endp
		
		
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
