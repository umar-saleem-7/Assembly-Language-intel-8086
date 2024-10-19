.model small
.stack 100h
.data
	chr db '*'
.code
	main proc
		mov ax, @data
		mov ds, ax
	    mov cx, 10
	aa: mov bx, 10
	bb: mov dl, chr
		mov ah, 02h
		int 21h
		dec bx
		jnz bb
		mov dl, 10
		mov ah, 2
		int 21h
		mov dl, 13
		mov ah, 2
		int 21h
		dec cx
		jnz aa
		mov ah, 4ch
		int 21h
main endp
end main
