# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_list_remove_if_bonus.s                          :+:    :+:             #
#                                                      +:+                     #
#    By: rpet <marvin@codam.nl>                       +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/15 08:56:02 by rpet          #+#    #+#                  #
#    Updated: 2020/06/16 14:57:18 by rpet          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_list_remove_if
	extern _free

; rdi = **begin_list
; rsi = data to compare with
; rdx = pointer to compare function
; r8 = previous element
; r9 = current element
; r10 = tmp

_ft_list_remove_if:
	cmp rdi, 0
	je return
	cmp rsi, 0
	je return
	cmp rdx, 0
	je return
	mov r9, [rdi]		 ; r9 = first element of the list
	jmp compare_loop
next_element:
	mov r8, r9			; previous = cur element
	mov r9, [r9 + 8]	; cur = cur->next
compare_loop:
	cmp r9, 0			; check if the list is 0
	je return
	push rdx
	push rsi
	push rdi
	push r8
	push r9
	mov rdi, [r9]		; put the data from the element in rdi
	call rdx			; call the compare function
	pop r9
	pop r8
	pop rdi
	pop rsi
	pop rdx
	cmp rax, 0			; check if compare is equal
	jne next_element	; if not equal, go to next_element
	cmp r9, [rdi]		; check if it is the first element of the list
	jne make_new_link	; if not, create a new link
	mov rcx, [r9 + 8]	; *begin_list -> list
	mov [rdi], rcx		; rdi is now the new begin of the list
	jmp free_element
make_new_link:
	mov rcx, [r9 + 8]	; put cur->next in rcx
	mov [r8 + 8], rcx	; link the previous with the next element
free_element:
	mov r10, r9			; put cur in tmp so it can be freed
	mov r9, [r9 + 8]	; cur = cur->next
	push rdx
	push rsi
	push rdi
	push r8
	push r9
	mov rdi, r10		; put the temp in rdi for free argument
	call _free			; free element
	pop r9
	pop r8
	pop rdi
	pop rsi
	pop rdx
	jmp compare_loop
return:
	ret
