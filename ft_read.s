section .text
	global ft_read
	extern __errno_location

ft_read:
	mov rax, 0
	syscall
	test rax, rax
	jns .done

	mov r8, rax
	neg r8
	call __errno_location wrt ..plt
	mov [rax], r8
	mov rax, -1
	ret

	.done:
		ret
