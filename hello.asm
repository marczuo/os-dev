; A boot sector that prints a message using the scrolling teletype interrupt

	[org	0x7c00]			; BIOS loads boot sector to 0x7c00

	mov	bx,	HELLO_MSG
	call	print_string
	mov	bx,	0xbeef
	call	print_hex
	mov	bx,	NEWLINE
	call	print_string

	jmp	$			; Start an infinite loop ($ = inst_pc)

; Function portion

%include "print_hex.asm" 

; Data portion

HELLO_MSG:
	
	db	"Hello, world!", 0xd, 0xa, "Here is a hex number, for fun: ", 0

NEWLINE:

	db	0xd, 0xa, 0

; Padding and magic number to indicate boot sector

	times	510-($-$$) db 0
	dw	0xaa55
