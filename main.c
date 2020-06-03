/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: rpet <marvin@codam.nl>                       +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/02 11:23:58 by rpet          #+#    #+#                 */
/*   Updated: 2020/06/03 10:27:30 by rpet          ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include "libasm.h"

int		main(void)
{
	printf("Mijn: %zu\n", ft_strlen(""));
	printf("Echt: %zu\n", strlen(""));
	printf("Mijn: %zu\n", ft_strlen("hoi daar"));
	printf("Echt: %zu\n", strlen("hoi daar"));
	return (0);
}
