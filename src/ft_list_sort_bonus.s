global ft_list_sort

section .text
ft_list_sort:					; rdi t_list **begin_list, rsi int (*cmp)()
	mov r10, rsi
	mov r11, [rdi]
	jmp .outer_loop

	.increment_outer_loop:
		mov r11, [r11 + 8]		; *begin_list = (*begin_list)->next

	.outer_loop:
		cmp r11, 0				; if (*begin_list == NULL)
		je .return
		mov rcx, [r11 + 8]		; rcx = *begin_list->next

	.inner_loop:
		cmp rcx, 0				; if (begin_list->next == NULL)
		je .return
		mov rdi, [r11]			; rdi = *begin_list
		mov rsi, [rcx]			; rsi = begin_list->next
		push rcx
		push r10
		push r11
		call r10				; saving the registers and calling cmp
		pop r11
		pop r10
		pop rcx
		cmp rax, 0
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
