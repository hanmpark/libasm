section .text
	global ft_list_size

ft_list_size:
	xor rcx, rcx

	.loop:
		cmp rdi, 0
		je .return
		inc rcx
		mov rdi, [rdi + 8]
		jmp .loop

	.return:
		mov rax, rcx
		ret
