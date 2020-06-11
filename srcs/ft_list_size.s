# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_list_size.s                                     :+:    :+:             #
#                                                      +:+                     #
#    By: rpet <marvin@codam.nl>                       +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/11 11:17:46 by rpet          #+#    #+#                  #
#    Updated: 2020/06/11 12:46:49 by rpet          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_list_size

_ft_list_size:
	xor rax, rax				; size = 0
loop_list:
	cmp rdi, 0					; check if end of list is found
	je return
	mov rdi, [rdi + 8]			;
	inc rax						; size++
	jmp loop_list
return:
	ret
