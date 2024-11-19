section .text
	global ft_list_push_front
	extern malloc

ft_list_push_front:	; rdi = t_list **begin_list, rsi = void *data
	push rdi
	push rsi
	mov rdi, 16
	xor rax, rax
	call malloc wrt ..plt
	pop rsi
	pop rdi
	cmp rax, 0
	jz .return
	mov [rax], rsi
	mov rdx, [rdi]
	mov [rax + 8], rdx
	mov [rdi], rax

	.return:
		ret
