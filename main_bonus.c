/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main_bonus.c                                       :+:    :+:            */
/*                                                     +:+                    */
/*   By: rpet <marvin@codam.nl>                       +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/09 09:54:33 by rpet          #+#    #+#                 */
/*   Updated: 2020/06/16 15:34:25 by rpet          ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include <stdlib.h>
#include "libasm.h"

void	print_list(t_list *list)
{
	int	i = 0;

	while (list)
	{
		printf("Data %i: [%s]\n", i, (char*)list->data);
		list = list->next;
		i++;
	}
	printf("\n");
}

static void	ft_atoi_base_test(void)
{
	printf("Test 1: [%i]\n", ft_atoi_base("482901", "0123456789")); //base 10
	printf("Test 2: [%i]\n", ft_atoi_base("  -1234", "0123456789")); //base 10 neg
	printf("Test 3: [%i]\n", ft_atoi_base(" \t +1234", "0123456789")); //base 10 pos
	printf("Test 4: [%i]\n", ft_atoi_base("+abcd", "abcdefg")); //base 7
	printf("Test 5: [%i]\n", ft_atoi_base("invalid", "base")); //invalid char in str
	printf("Test 6: [%i]\n", ft_atoi_base("1234", "1")); //base too short
	printf("Test 7: [%i]\n", ft_atoi_base(NULL, "0123456789")); //0 str
	printf("Test 8: [%i]\n", ft_atoi_base("482901", NULL)); //0 base
	printf("Test 9: [%i]\n", ft_atoi_base("lol", "hello")); //invalid base
	printf("Test10: [%i]\n", ft_atoi_base("lol", "helo")); //base 4
	printf("\n");
}

int		main(void)
{
	t_list	*list;

	list = NULL;
	printf("----- ATOI_BASE: -----\n");
	ft_atoi_base_test();
	printf("----- LIST_PUSH_FRONT: -----\n");
	ft_list_push_front(&list, "O");
	ft_list_push_front(&list, "C");
	ft_list_push_front(&list, "M");
	ft_list_push_front(&list, "E");
	ft_list_push_front(&list, "R");
	print_list(list);
	printf("----- LIST_SIZE: -----\n");
	printf("Size: [%i]\n\n", ft_list_size(list));
	printf("----- LIST_SORT: -----\n");
	ft_list_sort(&list, &strcmp);
	print_list(list);
	printf("----- LIST_REMOVE_IF: -----\n");
	ft_list_remove_if(&list, "R", &strcmp);
	print_list(list);
	return (0);
}
