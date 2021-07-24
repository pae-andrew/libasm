			section	.text
			global	_ft_read

_ft_read:								; rdi = fd, rsi = buffer, rdx = bytes
			mov		rax, 0x2000003
			syscall
			ret
