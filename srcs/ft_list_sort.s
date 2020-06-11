# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_list_sort.s                                     :+:    :+:             #
#                                                      +:+                     #
#    By: rpet <marvin@codam.nl>                       +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/11 13:41:54 by rpet          #+#    #+#                  #
#    Updated: 2020/06/11 16:10:56 by rpet          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_list_sort

_ft_list_sort:
	cmp rdi, 0
	je return
	cmp rsi, 0
	je return
	mov r10, [rdi]			; set the list in r8
	mov rdi, [rdi]			; set the first element from list in rdi
	jmp check_end_list
next_element:
	mov	rdi, [rdi + 8]		; list->next
check_end_list:
	cmp rdi, 0				; check if element is end of list
	je return
compare_loop:
	mov r11, [rdi + 8]		; 2nd element to compare takes list->next
	cmp r11, 0				; check if the second element is end of the list
	je return
	push rdi				; save the current list
	push rsi				; save the pointer to function
	mov r14, rsi			; r10 takes the pointer to function
	mov rdi, [rdi]			; put first element in first argument
	mov rsi, [r11]			; put second element in second argument
	call r14				; call the compare function
	pop rsi
	pop rdi
	cmp rax, 0				; check if the compare was equal
	je next_element
	jg swap
	jmp next_element
swap:
	mov r12, [rdi]			; set the first element in tmp1
	mov r13, [r11]			; set the second element in tmp2
	mov [r11], r12			; set tmp1 in second element
	mov [rdi], r13			; set tmp2 in first element
	mov rdi, r10
	jmp compare_loop
return:
	mov rax, 0
	ret
