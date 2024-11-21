section .text
	global ft_list_remove_if
	extern free

ft_list_remove_if:					; rdi = t_list **begin_list, rsi = void *data_ref, rdx = int (*cmp)(), rcx = void (*free_fct)()
	push rdi						; [rsp + 24] = **begin_list
	push rsi						; [rsp + 16] = *data_ref
	push rdx						; [rsp + 8] = cmp
	push rcx						; [rsp] = free_fct
	mov r8, [rdi]					; r8 = *begin_list (current)
	xor r9, r9						; r9 = NULL (previous)

	.check_args:
		cmp rdi, 0
		je .return
		cmp rsi, 0
		je .return
		cmp rdx, 0
		je .return
		cmp rcx, 0
		je .return

	.loop:
		cmp r8, 0
		je .return
		mov rdi, [r8]
		mov rsi, [rsp + 16]
		push r8
		push r9
		sub rsp, 8
		call [rsp + 32]				; cmp(current->data, data_ref)
		add rsp, 8
		pop r9
		pop r8
		cmp rax, 0					; if (current->data == data_ref)
		je .remove
		mov r9, r8					; previous = current
		mov r8, [r8 + 8]			; current = current->next
		jmp .loop

	.remove:						; [r9 + 8] == previous->next needs to point to the current->next
		cmp r9, 0
		je .remove_first
		mov r10, [r8 + 8]			; r10 = current->next
		mov [r9 + 8], r10			; previous->next = r10
		jmp .free

	.remove_first:					; [rsp + 24] == **begin_list needs to point to the current-next
		mov r10, [r8 + 8]			; r10 = current->next
		mov r11, [rsp + 24]			; r11 = **begin_list
		mov [r11], r10				; r11 = r10

	.free:
		mov rdi, [r8]
		push r8
		push r9
		sub rsp, 8
		call [rsp + 24]				; free(current->data)
		add rsp, 8
		pop r9
		pop r8
		mov rdi, r8
		mov r8, [r8 + 8]			; current = current->next
		push r8
		push r9
		sub rsp, 8
		call free wrt ..plt			; free(current)
		add rsp, 8
		pop r9
		pop r8
		jmp .loop

	.return:
		pop rcx
		pop rdx
		pop rsi
		pop rdi
		ret
