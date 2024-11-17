section .text
	global ft_strcpy

ft_strcpy:
	xor rcx, rcx

	.loop:
		mov al, BYTE [rsi + rcx]
		test al, al
		jz .done
		mov BYTE [rdi + rcx], al
		inc rcx
		jmp .loop

	.done:
		mov rax, rdi
		ret
