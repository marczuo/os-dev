; A function that allows us to print hex numbers
; Input: a hex word saved in bx

print_hex:

	pusha
	mov	ax,	bx
	mov	bx,	HEX_OUT
	add	bx,	5		; Skip to the end of the string

print_hex_loop_start:			; Convert a number to its hex

	cmp	ax,	0
	je	print_hex_loop_end
	push	bx
	mov	bx,	ax
	and	bx,	0xf		; Extract the last hex digit
	add	bx,	HEX_CHARS
	mov	cx,	[bx]		; Fetch the corresponding hex char
	pop	bx
	mov	[bx],	cl		; Write to the corresponding digit
	sub	bx,	1		
	shr	ax,	4		; Get rid of the last digit of ax
	jmp	print_hex_loop_start

print_hex_loop_end:

	mov	bx,	HEX_OUT
	call	print_string
	popa
	ret

; Includes

%include "print_string.asm"

; Global variables

HEX_OUT:
	
	db	"0x0000", 0

HEX_CHARS:

	db	"0123456789ABCDEF", 0
