; A function that allows us to print strings
; Input: a string whose address is saved in bx

print_string:

	pusha
	mov	ah,	0x0e		; Scrolling teletype

print_string_loop_start:

	mov	al,	[bx]
	cmp	al,	0
	je	print_string_loop_end
	int	0x10
	add	bx,	1
	jmp	print_string_loop_start

print_string_loop_end:

	popa
	ret
