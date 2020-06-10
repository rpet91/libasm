# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_strdup.s                                        :+:    :+:             #
#                                                      +:+                     #
#    By: rpet <marvin@codam.nl>                       +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/08 12:42:21 by rpet          #+#    #+#                  #
#    Updated: 2020/06/10 15:50:53 by rpet          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_strdup
	extern	_ft_strlen
	extern	_ft_strcpy
	extern	_malloc

_ft_strdup:
	push rbp					; save rbp on the stack
	mov rbp, rsp				; put rsp in rbp
	sub rsp, 16					; allocate memory on the stack
	mov [rsp], rdi				; copy address of rdi in rsp for later use
	call _ft_strlen				; set len in rax
	inc rax						; add 1 to rax for the \0
	mov rdi, rax				; set rax in rdi
	call _malloc				; allocate memory on the heap
	cmp rax, 0					; check if malloc succeed
	je end						; go to end if not
	mov rdi, rax				; set the allocated memory in rdi
	mov rsi, [rsp]				; set the point of the str in rsi
	call _ft_strcpy				; copy rsi in rdi and put it in rax
end:
	add rsp, 16					; free/deallocate the allocated memory
	mov rsp, rbp				; rax will point to rsp 
	pop rbp						; retrieve rbp
	ret
