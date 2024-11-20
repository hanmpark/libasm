section .text
	global ft_list_remove_if
	extern free

ft_list_remove_if:				; rdi = t_list **begin_list, rsi = void *data_ref, rdx = int (*cmp)(), rcx = void (*free_fct)()
	push rbp
	push rbx
	push r12
	mov rbp, [rdi]				; rbp = *begin_list (current)
	mov rbx, rsi				; rbx = *data_ref
	xor r12, r12				; r12 = NULL (previous pointer)
	cmp rdi, 0
	jz .return
	cmp rdx, 0
	jz .return
	cmp rcx, 0
	jz .return

	.inc_loop:
		mov rbp, [rbp + 8]

	.loop:
		cmp rbp, 0				; if (current == NULL)
		jz .return
		mov r12, rbp			; r12 = current
		mov r8, rsi
		push rdi
		push rsi
		push rdx
		push rcx
		mov rdi, [rbp]
		mov rsi, rbx
		call r8
		pop rcx
		pop rdx
		pop rsi
		pop rdi
		cmp rax, 0
		jz .remove_data

	.remove_data:
		push rdi
		push rsi
		push rdx
		push rcx
		mov rdi, [rbp]
		call rcx				; free_fct(current->data)
		pop rcx
		pop rdx
		pop rsi
		pop rdi

	.remove_list:
		mov r8, [rbp + 8]		; r8 = current->next
		push rdi
		push rsi
		push rdx
		push rcx
		mov rdi, rbp
		call free wrt ..plt		; free(current)
		pop rcx
		pop rdx
		pop rsi
		pop rdi
		cmp r12, 0				; if (previous == NULL)
		jz .inc_loop

	.set_previous_next:
		; set previous pointer to the next one
		mov rbp, r8				; current = r8 (current->next)
		mov [r12 + 8], rbp		; previous->next = current
		jmp .loop

	.return:
		pop r12
		pop rbx
		pop rbp
		ret
