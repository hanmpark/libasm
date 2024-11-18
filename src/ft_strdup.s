section .text
	global ft_strdup
	extern malloc
	extern ft_strlen
	extern ft_strcpy
	extern __errno_location

ft_strdup:
	.set_length:
		call ft_strlen
		inc rax

	.set_memory:
		push rdi
		mov rdi, rax
		call malloc wrt ..plt
		test rax, rax
		jz .error

	.copy:
		pop rsi
		mov rdi, rax
		call ft_strcpy
		ret

	.error:
		call __errno_location wrt ..plt
		mov DWORD [rax], 12
		mov rax, 0
		pop rdi
		ret
