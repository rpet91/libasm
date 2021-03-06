# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_strcmp.s                                        :+:    :+:             #
#                                                      +:+                     #
#    By: rpet <marvin@codam.nl>                       +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/04 08:29:02 by rpet          #+#    #+#                  #
#    Updated: 2020/06/15 14:03:05 by rpet          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strcmp

_ft_strcmp:						; rsi = s1 & rdi = s2
	xor rcx, rcx
	xor rax, rax				; i = 0;
loop:
	mov cl, BYTE [rsi + rax]	; set s1[i] in cl
	cmp cl, BYTE [rdi + rax]	; compare cl with s1[i]
	ja lower					; cl < s1[i]
	jb greater					; cl > s1[i]
	cmp cl, 0					; check if \0 is found
	je return
	inc rax
	jmp loop
greater:
	mov rax, 1
	ret
lower:
	mov rax, -1
	ret
return:
	mov rax, 0
	ret
