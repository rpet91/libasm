# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_list_push_front.s                               :+:    :+:             #
#                                                      +:+                     #
#    By: rpet <marvin@codam.nl>                       +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/10 15:15:09 by rpet          #+#    #+#                  #
#    Updated: 2020/06/10 15:29:02 by rpet          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_list_push_front
	extern	_malloc

_ft_list_push_front:
	push rdi			; save the list for later use
	push rsi			; data which we have to put in front
	call _malloc		; malloc for 16 bytes in rax
	cmp rax, 0			; check if malloc succeed
	je error

error:
	mov rax, 0;
	ret
return:
	ret
