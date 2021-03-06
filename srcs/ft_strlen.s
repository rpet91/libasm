# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_strlen.s                                        :+:    :+:             #
#                                                      +:+                     #
#    By: rpet <marvin@codam.nl>                       +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/03 10:52:20 by rpet          #+#    #+#                  #
#    Updated: 2020/06/04 08:04:35 by rpet          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

section	.text
	global	_ft_strlen

_ft_strlen:
	xor rax, rax				; i = 0
loop:
	cmp	BYTE [rdi + rax], 0		; check if \0 is found
	je	return					; go to return
	inc rax						; i++
	jmp	loop					; jump back to loop
return:
	ret							; return i
