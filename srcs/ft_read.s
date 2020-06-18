# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_read.s                                          :+:    :+:             #
#                                                      +:+                     #
#    By: rpet <marvin@codam.nl>                       +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/08 10:11:12 by rpet          #+#    #+#                  #
#    Updated: 2020/06/16 15:53:33 by rpet          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

section	.text
	global	_ft_read
	extern	___error

_ft_read:				; rdi = fd, rsi = text, rdx = amount of bytes
	mov rax, 0x02000003	; syscall for read
	syscall				; execute the reading
	jc error			; if write failed go to error
	ret
error:
	mov rdi, rax		; set rax in rdi
	push rdx			; stack allignment
	call ___error
	pop rdx
	mov [rax], rdi		; link the error nb with the correct message
	mov rax, -1			; set -1 in rax
	ret
