.model small
.stack 100h
.386
.data
	str1 db 'Enter an algebraic expression: $'
	str2 db 'Too many left brackets, Begin again$'
	str3 db 10, 13, 'Too many right brackets, Begin again$'
	str4 db '"Expression is correct"$'
	str5 db 10, 13, 'Type Y if you want to continue or N for Stop: $'
	str6 db 10, 13, '$'

.code
	main proc
		mov ax, @data
		mov ds, ax
		
new:	lea dx, str1
		mov ah, 09h
		int 21h
		
		mov cx, 0
		
again:	mov ah, 01h
		int 21h
		
		cmp al, 13
		je exit
		
		cmp al, '('
		je aa
		
		cmp al, ')'
		je bb
		jmp cc
		
	aa:	push ax
		inc cx
		jmp cc
	
	bb:	pop	bx
		cmp bl, '('
		je ab
		jmp error1
		
	ab: dec cx			
	cc: jmp again
		
		
error1: lea dx, str3
		mov ah, 09h
		int 21h
		
		lea dx, str6
		mov ah, 09h
		int 21h
		
		jmp new

exit: 	cmp cx, 0
		je cor
		
		lea dx, str2
		mov ah, 09h
		int 21h
		
		lea dx, str6
		mov ah, 09h
		int 21h
		
		jmp new
		
cor: 	lea dx, str4
		mov ah, 09h
		int 21h
		
		lea dx, str5
		mov ah, 09h
		int 21h
		
		mov ah, 01h
		int 21h
		
		cmp al, 'Y'
		jne finish
		
		lea dx, str6
		mov ah, 09h
		int 21h
		
		jmp new
		
		
finish: mov ah, 4ch
		int 21h
		
main endp
end main
