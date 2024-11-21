section .text
	global ft_list_push_front
	extern malloc

ft_list_push_front:			; rdi = t_list **begin_list, rsi = void *data
	push rdi
	push rsi
	mov rdi, 16				; sizeof(t_list)
	xor rax, rax
	call malloc wrt ..plt
	pop rsi
	pop rdi
	cmp rax, 0				; if (!rax)
	jz .return
	mov [rax], rsi			; rax->data = data
	mov rdx, [rdi]			; rdx = *begin_list
	mov [rax + 8], rdx		; rax->next = *begin_list
	mov [rdi], rax			; *begin_list = rax

	.return:
		ret
