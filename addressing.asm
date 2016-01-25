; This example demonstrates addressing

	mov	ah,	0x0e
	mov	bx,	my_data
	add	bx,	0x7c00
	mov	al,	[bx]
	int	0x10

my_data:
	db "X"


; Padding and magic number to indicate boot sector

	times	510-($-$$) db 0
	dw	0xaa55
