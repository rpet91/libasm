# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_strcmp.s                                        :+:    :+:             #
#                                                      +:+                     #
#    By: rpet <marvin@codam.nl>                       +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/04 08:29:02 by rpet          #+#    #+#                  #
#    Updated: 2020/06/04 13:49:54 by rpet          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strcmp

_ft_strcmp:						; rsi = s1 & rdi = s2
	xor rcx, rcx				; i = 0
loop:
	mov dl, BYTE [rsi + rcx]	; set s1[i] in dl
	cmp dl, BYTE [rdi + rcx]	; compare s1[i] with s2[i]
	jne	dif						; if not equal go to dif
	cmp dl, 0					; check if dl is \0
	je	end_str					; if \0 is found go to end_str
	inc rcx						; i++
	jmp loop					; jump to loop
dif:
	cmp dl, BYTE [rdi + rcx]	;
	ja	lower					; if s1[i] is lower than s2[i] go to lower
	mov rax, 1					; else set rax to 1
	ret
lower:
	mov rax, -1					; s2[i] > s1[i]
	ret
end_str:
	cmp BYTE [rdi + rcx], 0		; check if dst[i] is \0
	je	equal					; if true, strings are equal
	jne	dif
equal:
	mov rax, 0					; no difference, return 0
	ret
