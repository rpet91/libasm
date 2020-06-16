# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_list_remove_if_bonus.s                          :+:    :+:             #
#                                                      +:+                     #
#    By: rpet <marvin@codam.nl>                       +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/15 08:56:02 by rpet          #+#    #+#                  #
#    Updated: 2020/06/16 13:22:45 by rpet          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_list_remove_if
	extern _free

;rdi = **begin_list
;rsi = element to compare with for removal
;rdx = pointer to compare function
;r8 = current element
;r9 = tmp
;r10 = previous element
;r11 = freeing element

_ft_list_remove_if:
	cmp rdi, 0
	je return
	cmp rsi, 0
	je return
	cmp rdx, 0
	je return
	mov r8, [rdi]			; r8 = first element
	jmp compare_loop
next_element:
	mov r10, r8				; previous = current element
	mov r8, [r8 + 8]		; cur->next
compare_loop:
	cmp r8, 0
	je return
	push rdx
	push rsi
	push rdi
	push r8
	push r9
	push r10
	mov rdi, [r8]			; put the data from the element in rdi
	call rdx				; call compare function
	pop r10
	pop r9
	pop r8
	pop rdx
	pop rsi
	pop rdi
	cmp rax, 0				; check if compare is equal
	jne next_element		; if not equal, go to the next_element
	cmp r8, [rdi]			; check if it is the first element of the list
	jne create_new_link		; if not, create a new link
	mov r9, [r8 + 8]		; *begin_list -> next
	mov [rdi], r9			; rdi is now the new begin of the list
	jmp free_element
create_new_link:
	mov r9, [r8 + 8]		; tmp = cur->next
	mov [r10 + 8], r9		; link the previous element with cur->next
free_element:
	mov r11, r8				; put r8 in tmp
	mov r8, [r8 + 8]		; r8 = cur->next
	push rdx
	push rsi
	push rdi
	push r8
	push r9
	push r10
	mov rdi, r11			; put r8 in rdi so it can be freed
	call _free				; free element
	pop r10
	pop r9
	pop r8
	pop rdx
	pop rsi
	pop rdi
	jmp compare_loop
return:
	ret
