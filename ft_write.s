			section	.text
			global	_ft_write

_ft_write:								; rdi = fd, rsi = buffer, rdx = bytes
			mov		rax, 0x2000004
			syscall
			ret
