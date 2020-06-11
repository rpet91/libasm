# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_list_push_front.s                               :+:    :+:             #
#                                                      +:+                     #
#    By: rpet <marvin@codam.nl>                       +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/10 15:15:09 by rpet          #+#    #+#                  #
#    Updated: 2020/06/11 12:30:00 by rpet          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_list_push_front
	extern	_malloc

_ft_list_push_front:	; rdi = **list, rsi = *data
	cmp rdi, 0
	je return
	push rdi			; save the list
	push rsi			; save the data
	push rbp			; save the old base pointer
	mov rdi, 16			; need 16 bytes for the malloc
	mov rbp, rsp		; point the top of the stack to the base
	and rsp, - 16		; stack allignment
	call _malloc		; malloc for 16 bytes in rax
	mov rsp, rbp		; place the new base pointer in the stack pointer
	pop rbp
	pop rsi
	pop rdi
	cmp rax, 0			; check if malloc succeed
	je return
	mov [rax], rsi		; put the data in rax
	mov r10, [rdi]		; put the list in r15
	mov [rax + 8], r10	; place the list after data
	mov [rdi], rax		; place the new list in rdi
return:
	ret
