.model small
.stack 100h
.data
	string db 'Umar$'
.code
	main proc
		mov ax, @data
		mov ds, ax
		mov dx, offset string
		mov ah, 09h
		int 21h
		mov ah, 4ch
		int 21h
main endp
end main
