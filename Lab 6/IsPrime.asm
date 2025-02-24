.model small
.stack 100h
.data
	s1 db 'Enter number: $'
	s2 db 'Number is prime $'
	s3 db 'Number is not prime $'
.code
	main proc
		mov ax, @data
		mov ds, ax
		
		lea dx, s1
		mov ah, 09h
		int 21h
		
		call input
		
		cmp bx, 1
		je not_prime
		
		cmp bx, 2
		je prime
		
		mov ax, bx
		mov cx, 2
		mov dx, 0
		div cx
		
		mov cx, ax
		inc cx
bb:		cmp cx, 1
		je prime
		mov ax, bx
		mov dx, 0
		div cx
		
		cmp dx, 0
		je not_prime
		
		dec cx
		jnz bb
		
prime:	lea dx, s2
		mov ah, 09h
		int 21h
		jmp zz
		
not_prime:	lea dx, s3
		mov ah, 09h
		int 21h
		
zz:		mov ah, 4ch
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
