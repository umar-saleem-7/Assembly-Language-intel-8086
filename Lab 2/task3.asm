.model small
.stack 100h
.data
	chr db 'A'
.code
	main proc
		mov ax, @data
		mov ds, ax
		mov dl, chr
		mov ah, 02h
		int 21h
		mov ah, 4ch
		int 21h
main endp
end main
