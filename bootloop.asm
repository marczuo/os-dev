; Looping boot sector

loop_start: jmp loop_start

times 510-($-$$) db 0

dw 0xaa55
