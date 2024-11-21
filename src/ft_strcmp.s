section .text
	global ft_strcmp

ft_strcmp:							; rdi = const char *s1, rsi = const char *s2
	xor rcx, rcx

	.loop:
		mov al, BYTE [rdi + rcx]
		mov bl, BYTE [rsi + rcx]
		cmp al, 0
		je .done
		cmp al, bl
		jne .done
		inc rcx
		jmp .loop

	.done:
		movzx rax, al
		movzx rbx, bl
		sub rax, rbx
		ret

	.done_end:
		xor rax, rax
		ret
