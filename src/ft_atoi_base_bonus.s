section .text
	global ft_atoi_base

ft_atoi_base:	; rdi = char *str, rsi = char *base
	xor rax, rax					; result
	xor rcx, rcx					; length of base
	push rbx
	xor rbx, rbx					; sign
	jmp .check_base

	.check_base_next_character:
		inc rcx

	.check_base:
		cmp BYTE [rsi + rcx], 0
		jz .check_base_final
		mov r8, rcx					; r8 = int j;

	.check_base_duplicate:
		inc r8
		cmp BYTE [rsi + r8], 0
		jz .check_base_character_format
		mov r10b, BYTE [rsi + r8]
		cmp BYTE [rsi + rcx], r10b
		je .return
		jmp .check_base_duplicate

	.check_base_character_format:
		cmp BYTE [rsi + rcx], 32	; comparing with ' '
		je .return
		cmp BYTE [rsi + rcx], 9		; comparing with '\t'
		je .return
		cmp BYTE [rsi + rcx], 10	; comparing with '\n'
		je .return
		cmp BYTE [rsi + rcx], 11	; comparing with '\v'
		je .return
		cmp BYTE [rsi + rcx], 12	; comparing with '\f'
		je .return
		cmp BYTE [rsi + rcx], 13	; comparing with '\r'
		je .return
		cmp BYTE [rsi + rcx], 43	; comparing with '+'
		je .return
		cmp BYTE [rsi + rcx], 45	; comparing with '-'
		je .return
		jmp .check_base_next_character

	.check_base_final:
		cmp rcx, 1
		jle .return					; base is too short
		xor r8, r8
		jmp .skip_whitespace

	.skip_whitespace_inc:
		inc r8

	.skip_whitespace:
		cmp BYTE [rdi + r8], 32		; skip ' '
		je .skip_whitespace_inc
		cmp BYTE [rdi + r8], 9		; skip '\t'
		je .skip_whitespace_inc
		cmp BYTE [rdi + r8], 10		; skip '\n'
		je .skip_whitespace_inc
		cmp BYTE [rdi + r8], 11		; skip '\v'
		je .skip_whitespace_inc
		cmp BYTE [rdi + r8], 12		; skip '\f'
		je .skip_whitespace_inc
		cmp BYTE [rdi + r8], 13		; skip '\r'
		je .skip_whitespace_inc
		jmp .check_sign

	.is_negative:
		xor bl, 0x00000001

	.is_positive:
		inc r8

	.check_sign:
		cmp BYTE [rdi + r8], 45
		je .is_negative
		cmp BYTE [rdi + r8], 43
		je .is_positive
		jmp .atoi

	.atoi_inc:
		inc r8

	.atoi:
		cmp BYTE [rdi + r8], 0
		je .return
		xor r9, r9
		jmp .atoi_find_in_base

	.atoi_find_in_base_inc:
		inc r9

	.atoi_find_in_base:
		mov r10b, BYTE [rsi + r9]
		cmp r10b, 0
		je .return
		cmp BYTE [rdi + r8], r10b
		jne .atoi_find_in_base_inc

	.atoi_add_to_total:
		mul rcx
		add rax, r9
		jmp .atoi_inc

	.return:
		mov rax, rax
		cmp rbx, 0
		je .return_end
		neg rax

	.return_end:
		pop rbx
		ret
