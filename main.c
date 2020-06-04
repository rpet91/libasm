/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: rpet <marvin@codam.nl>                       +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/02 11:23:58 by rpet          #+#    #+#                 */
/*   Updated: 2020/06/04 13:51:35 by rpet          ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include "libasm.h"

int		main(void)
{
	char	dst1[100] = "";
	char	dst2[100] = "";

	printf("STRLEN:\n");
	printf("Mine: %zu\n", ft_strlen(""));
	printf("Real: %zu\n", strlen(""));
	printf("Mine: %zu\n", ft_strlen("hoi daar"));
	printf("Real: %zu\n", strlen("hoi daar"));

	printf("\n");

	printf("STRCPY:\n");
	printf("Mine: [%s]\n", ft_strcpy(dst1, "source"));
	printf("Real: [%s]\n", strcpy(dst2, "source"));

	printf("\n");

	printf("STRCMP:\n");
	printf("Mine: [%i]\n", ft_strcmp("test", "testt"));
	printf("Real: [%i]\n", strcmp("test", "testt"));
	return (0);
}
