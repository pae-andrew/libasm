			section	.text
			global	_ft_strlen

_ft_strlen:									; rdi = str
			xor		rax, rax					; i = 0
			jmp		compare
increment:
			inc		rax						; i++
compare:
			cmp		BYTE [rdi + rax], 0		; if (str[i] == 0)
			jne		increment
done:
			ret								; return i
