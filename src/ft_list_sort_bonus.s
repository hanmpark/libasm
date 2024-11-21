section .text
	global ft_list_sort

ft_list_sort:					; rdi t_list **begin_list, rsi int (*cmp)()
	mov r10, rsi				; r10 = cmp
	mov r11, [rdi]				; r11 = *begin_list (current)
	jmp .outer_loop

	.increment_outer_loop:
		mov r11, [r11 + 8]		; *current = current->next

	.outer_loop:
		cmp r11, 0				; if (current == NULL)
		je .return
		mov rcx, [r11 + 8]		; rcx = current->next

	.inner_loop:
		cmp rcx, 0				; if (rcx == NULL)
		je .return
		mov rdi, [r11]			; rdi = current->data
		mov rsi, [rcx]			; rsi = rcx->data (current->next->data)
		push rcx
		push r10
		push r11
		call r10				; saving the registers and calling cmp
		pop r11
		pop r10
		pop rcx
		cmp rax, 0				; if (cmp(current->data, current->next->data) <= 0)
		jle .go_to_next
		jmp .swap

	.swap:
		mov r8, [r11]
		mov r9, [rcx]
		mov [r11], r9
		mov [rcx], r8

	.go_to_next:
		mov rcx, [rcx + 8]
		cmp rcx, 0
		je .increment_outer_loop
		jmp .inner_loop

	.return:
		ret
