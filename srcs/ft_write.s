# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_write.s                                         :+:    :+:             #
#                                                      +:+                     #
#    By: rpet <marvin@codam.nl>                       +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/04 14:32:33 by rpet          #+#    #+#                  #
#    Updated: 2020/06/08 11:05:12 by rpet          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

section	.text
	global	_ft_write
	extern	___error

_ft_write:				; rdi = fd, rsi = text, rdx = amount of bytes
	mov rax, 0x02000004	; syscall for write
	syscall				; execute the writing
	jc error			; if write failed go to error
	ret
error:
	mov rdi, rax		; set rax in rdi
	call ___error
	mov [rax], rdi		; link the error nb with the correct message
	mov rax, -1			; set -1 in rax
	ret
