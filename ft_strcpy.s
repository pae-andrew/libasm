			section	.text
			global	_ft_strcpy

_ft_strcpy:									; rdi = dst, rsi = src
			xor		rcx, rcx				; i = 0
			cmp		rsi, 0
			jz		return					; if (!dst)
			jmp		copy
increment:
			inc		rcx						; i++
copy:
			mov		dl, BYTE [rsi + rcx]	
			mov		BYTE [rdi + rcx], dl
			cmp		dl, 0
			jnz		increment				; if (src[i] != 0)
return:
			mov		rax, rdi				; return dst
			ret
