; A boot sector that prints a message using the scrolling teletype interrupt

	mov	ah,	0x0e		; Indicates interrupt type
	mov	al,	'H'
	int	0x10 
	mov	al,	'e'
	int	0x10
	mov	al,	'l'
	int	0x10
	mov	al,	'l'
	int	0x10
	mov	al,	'o'
	int	0x10
	mov	al,	','
	int	0x10
	mov	al,	' '
	int	0x10
	mov	al,	'w'
	int	0x10
	mov	al,	'o'
	int	0x10
	mov	al,	'r'
	int	0x10
	mov	al,	'l'
	int	0x10
	mov	al,	'd'
	int	0x10
	mov	al,	'!'
	int	0x10
	mov	al,	0xd		; CR
	int	0x10
	mov	al,	0xa		; LF
	int	0x10

	jmp	$			; Start an infinite loop ($ = inst_pc)

; Padding and magic number to indicate boot sector

	times	510-($-$$) db 0
	dw	0xaa55
