section .text
	global ft_write
	extern __errno_location

ft_write:
	cmp rsi, 0
	je .invalid_buffer
	mov rax, 1
	syscall
	cmp rax, 0
	jge .done

	.error:
		mov r8, rax
		neg r8
		call __errno_location wrt ..plt
		mov [rax], r8
		mov rax, -1
		ret

	.invalid_buffer:
		mov r8, 22
		call __errno_location wrt ..plt
		mov [rax], r8
		mov rax, -1
		ret

	.done:
		ret
