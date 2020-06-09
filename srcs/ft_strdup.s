# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_strdup.s                                        :+:    :+:             #
#                                                      +:+                     #
#    By: rpet <marvin@codam.nl>                       +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/08 12:42:21 by rpet          #+#    #+#                  #
#    Updated: 2020/06/09 08:05:22 by rpet          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_strdup
	extern	_ft_strlen
	extern	_ft_strcpy
	extern	_malloc

_ft_strdup:
	call _ft_strlen				; set length str in rax
	inc rax						; add 1 to rax for the \0
	push rdi					; save rdi for later use
	mov rdi, rax				; set amount of rax in rdi
	call _malloc
	cmp rax, 0					; check if malloc succeed
	je error					; go to error if not
	pop rdi						; get rdi back
	mov rsi, rdi				; set the str rsi
	mov rdi, rax				; set the allocated memory in rdi
	call _ft_strcpy				; copy rsi in rdi
	ret
error:
	mov rax, 0
	pop rdi
	ret
