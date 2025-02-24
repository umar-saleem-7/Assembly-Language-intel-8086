.model small
.stack 100h
.386
.data
	s1 db 'Enter numerator of first fraction: $'
	s2 db 'Enter denominator of first fraction: $'
	s3 db 'Enter numerator of second fraction: $'
	s4 db 'Enter denominator of second fraction: $'
	s5 db 'The result is: $'
	n1 dw '1'
	d1 dw '1'
	n2 dw '1'
	d2 dw '1'
	gcd dw '1'
	
.code
	main proc
		mov ax, @data
		mov ds, ax
		
		lea dx, s1
		mov ah, 09h
		int 21h
		
		call input
		mov n1, bx
		
		lea dx, s2
		mov ah, 09h
		int 21h
		
		call input
		mov d1, bx
		
		lea dx, s3
		mov ah, 09h
		int 21h
		
		call input
		mov n2, bx
		
		lea dx, s4
		mov ah, 09h
		int 21h
		
		call input
		mov d2, bx
		
		lea dx, s5
		mov ah, 09h
		int 21h
		
		call lcm
		
		mov gcd, ax
		
		mov ax, n1
		mov bx, d2
		mul bx
		
		mov n1, ax
		
		mov ax, n2
		mov bx, d1
		mul bx
		
		mov bx, n1
		add ax, bx
		
		mov bx, 10
		call output
		
		mov dl, '/'
		mov ah, 02h
		int 21h
		
		mov ax, gcd
		mov bx, 10
		
		call output
		
		mov ah, 4ch
		int 21h
		
	main endp
	
	lcm proc
		mov ax, d1
		mov bx, d2
	aa:	cmp dx, 0
		je ex
		
		mov dx, 0
		div bx
		
		mov ax, bx
		mov bx, dx
		jmp aa
		
	ex: mov gcd, ax
		mov ax, d1
		mov bx, d2
		mul bx
		mov bx, gcd
		mov dx, 0
		div bx
		ret
		
	lcm endp
	
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
		
end main