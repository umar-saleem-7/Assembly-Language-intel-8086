.model small
.stack 100h
.386
.data
	s1 db 'Enter operand 1: $'
	s2 db 'Enter operand 2: $'
	s3 db 'Enter operator: $'
	s4 db 10, 13, 'Answer is: $'
	s5 db 10, 13, '$'
.code
	main proc
		mov ax, @data
		mov ds, ax
		
again:	lea dx, s1
		mov ah, 09h
		int 21h
		
		call input
		
		cmp al, 'x'
		je exit
		
		push bx
		
		lea dx, s2
		mov ah, 09h
		int 21h
		
		call input
		
		pop cx
		
		lea dx, s3
		mov ah, 09h
		int 21h
		
		mov ah, 01h
		int 21h
		
		lea dx, s4
		mov ah, 09h
		int 21h
				
		cmp al, '+'
		je addd
		
		cmp al, '-'
		je subb
		
		cmp al, '*'
		je mull
		
		cmp al, '%'
		je divv
		
				
addd:	add cx, bx
		mov ax, cx
		mov bx, 10
		
		call output
		
		lea dx, s5
		mov ah, 09h
		int 21h
		
		jmp again
	
subb:	sub cx, bx
		mov ax, cx
		mov bx, 10
		
		call output
		
		lea dx, s5
		mov ah, 09h
		int 21h
		
		jmp again
		
mull: 	mov ax, cx
		mul bx
		mov bx, 10
		
		call output
		
		lea dx, s5
		mov ah, 09h
		int 21h
		
		jmp again
		
divv:	mov ax, cx
		mov dx, 0
		div bx
		
		mov ax, dx
		mov bx, 10
		
		call output
		
		lea dx, s5
		mov ah, 09h
		int 21h
		
		jmp again
		
exit:	mov ah, 4ch
		int 21h
		
	main endp
	
	input proc
		mov ax, 0
		mov bx, 0
		mov cx, 0
		
again:	mov ah, 01h
		int 21h
		
		cmp al, 'x'
		je ex
		
		cmp al, 13
		je ex
		
		mov ah, 0
		sub al, 48
		
		mov cx, ax
		mov ax, bx
		mov bx, 10
		
		mul bx
		
		add ax, cx
		
		mov bx, ax
		
		jmp again
		
ex: 	ret
	
	input endp
	
	output proc
		
		mov cx, 0	
		
again:	cmp ax, 0
		je pri
		
		mov dx, 0
		div bx
		
		push dx
		inc cx
		jmp again
		
pri:	cmp cx, 0
		je exi
		
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
		
exi:	mov dl, '0'
		mov ah, 02h
		int 21h
		
		ret
		
	output endp

end main
