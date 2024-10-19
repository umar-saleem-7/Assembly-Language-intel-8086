.model small
.stack 100h
.data
	chr db '?'
.code
	main proc
		mov ax, @data
		mov ds, ax
		mov dl, chr
		mov ah, 02h
		int 21h
		mov ah, 01h
		int 21h
		mov bl, al
		mov ah, 01h
		int 21h
		mov bh, al
		mov dl, 10
		mov ah, 2
		int 21h
		mov dl, 13
		mov ah, 2
		int 21h
		cmp bh, bl
		jb aa
		mov dl, bl
		mov ah, 02h
		int 21h
		mov dl, bh
		mov ah, 02h
		int 21h
		jmp bb
	aa: mov dl, bh
		mov ah, 02h
		int 21h
		mov dl, bl
		mov ah, 02h
		int 21h
	bb:	mov ah, 4ch
		int 21h
main endp
end main
