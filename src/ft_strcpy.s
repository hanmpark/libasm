section .text
	global ft_strcpy

ft_strcpy:
	xor rcx, rcx

	.loop:
		mov al, BYTE [rsi + rcx]
		mov BYTE [rdi + rcx], al
		test al, al
		jz .done
		inc rcx
		jmp .loop

	.done:
		mov rax, rdi
		ret
