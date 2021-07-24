			section	.text
			global	_ft_strcmp

_ft_strcmp:									; rdi = s1, rsi = s2
			xor		rcx, rcx				; i = 0
			cmp		rdi, 0					; !s1
			jz		check_null
			cmp		rsi, 0					; !s2
			jz		check_null
			jmp		check
check_null:
			cmp		rdi, rsi
			jz		equal					; s1 == s2 (NULL)
			jg		s1_greater				; s2 == NULL
			jmp		s2_greater				; s1 == NULL
compare:
			mov		dl, BYTE [rsi + rcx]	; tmp = s2[i]
			cmp		BYTE [rdi + rcx], dl	; s1[i] == tmp
			jne		last_char
increment:
			inc		rcx
check:
			cmp		BYTE [rdi + rcx], 0		; !s1[i]
			je		last_char
			cmp		BYTE [rsi + rcx], 0		; !s2[i]
			je		last_char
			jmp		compare
last_char:
			mov		dl, BYTE [rdi + rcx]	; cmp = s1[i]
			sub		dl, BYTE [rsi + rcx]	; cmp -= s2[i]
			cmp		dl, 0					; cmp == 0
			jz		equal
			jl		s2_greater
s1_greater:
			mov		rax, 1					; ret > 0
			ret
s2_greater:
			mov		rax, -1					; ret < 0
			ret
equal:
			mov		rax, 0					; ret = 0
			ret