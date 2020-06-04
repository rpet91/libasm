# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_strcpy.s                                        :+:    :+:             #
#                                                      +:+                     #
#    By: rpet <marvin@codam.nl>                       +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/03 14:32:50 by rpet          #+#    #+#                  #
#    Updated: 2020/06/04 12:50:34 by rpet          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

section	.text
	global _ft_strcpy

_ft_strcpy:						; rdi = dst & rsi = src
	xor rcx, rcx				; i = 0
loop:
	mov	dl, BYTE [rsi + rcx]	; set src[i] in dl
	mov BYTE [rdi + rcx], dl	; set dl in dst[i]
	cmp	BYTE [rsi + rcx], 0		; check if \0 in src is found
	je	return					; go to return
	inc	rcx						; i++
	jmp loop					; jump back to loop
return:
	mov rax, rdi				; set dst in rax
	ret
