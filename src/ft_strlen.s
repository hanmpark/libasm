section .text
	global ft_strlen

ft_strlen:
	xor rcx, rcx					; set the counter to 0

	.loop:
		mov al, BYTE [rdi + rcx]	; checking the current character
		test al, al					; check if the current character is NULL
		jz .done					; if it is, return the counter
		inc rcx						; increment the counter
		jmp .loop					; repeat

	.done:
		mov rax, rcx				; move the counter to rax
		ret							; return the counter
