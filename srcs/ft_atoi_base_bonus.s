# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_atoi_base_bonus.s                               :+:    :+:             #
#                                                      +:+                     #
#    By: rpet <marvin@codam.nl>                       +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/09 10:48:25 by rpet          #+#    #+#                  #
#    Updated: 2020/06/15 15:52:20 by rpet          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_atoi_base

_ft_atoi_base:
	xor rax, rax				; rax = 0
	cmp rdi, 0					; check if str is 0
	je end						; if zero jump to end
	cmp rsi, 0					; check if base is 0
	je end						; if zero jump to end
	xor rdx, rdx				; using rdx for sign (neg/pos)
	xor r15, r15				; base_len = 0
	xor rcx, rcx				; i = 0
	jmp check_base
inc_base_index1:
	inc r15						; base_len++
check_base:
	cmp BYTE [rsi + r15], 0		; check if \0 is found in base
	je check_base_len			; if found, base has valid chars
	mov r14, r15				; put cur base index in tmp
inc_check_base_dup:
	inc r14						; tmp base index++
check_base_dup:
	cmp BYTE [rsi + r14], 0		; check if \0 is found in base + 1
	je check_valid_chars
	mov r13b, [rsi + r14]		; put cur base char in r13b
	cmp BYTE [rsi + r15], r13b	; check if there are duplicate chars in base
	je end
	jmp inc_check_base_dup
check_valid_chars:
	cmp BYTE [rsi + r15], 45	; check if a - is found
	je end
	cmp BYTE [rsi + r15], 43	; check if a + is found
	je end
	cmp BYTE [rsi + r15], 32	; check if a space is found
	je end
	cmp BYTE [rsi + r15], 9		; check if \t is found
	je end
	cmp BYTE [rsi + r15], 10	; check if \n is found
	je end
	cmp BYTE [rsi + r15], 11	; check if \r is found
	je end
	cmp BYTE [rsi + r15], 12	; check if \v is found
	je end
	cmp BYTE [rsi + r15], 13	; check if \f is found
	je end
	jmp inc_base_index1			; go back to base_inc
check_base_len:
	cmp r15, 1					; check if the base len is 1 or less
	jle end						; if not true, base has valid len
	jmp white_space				; check for white spaces
inc_white_space:
	inc rcx						; i++;
white_space:
	cmp BYTE [rdi + rcx], 32	; check if space is found
	je inc_white_space
	cmp BYTE [rdi + rcx], 9		; check the other white spaces (9 -13)
	jl check_sign
	cmp BYTE [rdi + rcx], 13
	jg check_sign
	jmp inc_white_space
check_sign:
	cmp BYTE [rdi + rcx], 45	; check if a - is found
	je neg_sign
	cmp BYTE [rdi + rcx], 43	; check if a + is found
	je inc_str_index
	jmp atoi_nb
neg_sign:
	mov rdx, 1					; set value to -1
inc_str_index:
	inc rcx
atoi_nb:
	cmp BYTE [rdi + rcx], 0		; check if \0 is found in str
	je end
	xor r12, r12				; set index in str to 0
	jmp convert_nb_with_base
inc_base_index2:
	inc r12
convert_nb_with_base:
	mov	r11b, BYTE [rsi +r12]	; put cur str char in r11b
	cmp r11b, 0					; check if \0 is found
	je end						; if found, we got our return value
	cmp BYTE [rdi + rcx], r11b	; check if cur str char exist in base
	jne	inc_base_index2			; if equal, convert it with the base
create_return_value:
	;mul r15
	imul rax, r15				; multiply rax with our base length
	add rax, r12				; add cur number to our rax
	jmp inc_str_index
end:
	cmp rdx, 0					; check if number has to be negative
	je return
	neg rax						; if rdx = 1, rax = -rax
return:
	ret
