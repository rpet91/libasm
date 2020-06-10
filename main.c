/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: rpet <marvin@codam.nl>                       +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/02 11:23:58 by rpet          #+#    #+#                 */
/*   Updated: 2020/06/10 10:07:04 by rpet          ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include <stdlib.h>
#include "libasm.h"

int		main(void)
{
	char	dst1[100] = "";
	char	dst2[100] = "";
	int		fd = open("Makefile", O_RDONLY);
	char	str[1337];

	printf("----- STRLEN: -----\n");
	printf("Mine: %zu\n", ft_strlen(""));
	printf("Real: %zu\n", strlen(""));
	printf("\n");
	printf("Mine: %zu\n", ft_strlen("Hello world!"));
	printf("Real: %zu\n", strlen("Hello world!"));

	printf("\n");

	printf("----- STRCPY: -----\n");
	printf("Mine: [%s]\n", ft_strcpy(dst1, "Copy me timbers"));
	printf("Real: [%s]\n", strcpy(dst2, "Copy me timbers"));
	printf("\n");
	printf("Mine: [%s]\n", ft_strcpy(dst1, "And now this."));
	printf("Real: [%s]\n", strcpy(dst2, "And now this."));

	printf("\n");

	printf("----- STRCMP: -----\n");
	printf("Mine: [%i]\n", ft_strcmp("test", "testing"));
	printf("Real: [%i]\n", strcmp("test", "testing"));
	printf("\n");
	printf("Mine: [%i]\n", ft_strcmp("correct", "correct"));
	printf("Real: [%i]\n", strcmp("correct", "correct"));
	printf("\n");
	printf("Mine: [%i]\n", ft_strcmp("wrong", "soup"));
	printf("Real: [%i]\n", strcmp("wrong", "soup"));

	printf("\n");

	printf("----- WRITE: -----\n");
	errno = 0;
	printf("{%zi} ", ft_write(42, "test\n", 5));
	printf("Mine: [%i]\n", errno);
	perror("Error message");
	errno = 0;
	printf("{%zi} ", write(42, "test\n", 5));
	printf("Real: [%i]\n", errno);
	perror("Error message");
	printf("\n");
	errno = 0;
	printf("{%zi} ", ft_write(2, "correct test\n", 13));
	printf("Mine: [%i]\n", errno);
	perror("Error message");
	errno = 0;
	printf("{%zi} ", write(2, "correct test\n", 13));
	printf("Real: [%i]\n", errno);
	perror("Error message");

	printf("\n");

	printf("----- READ: -----\n");
	errno = 0;
	printf("{%zi} ", ft_read(fd, str, 100));
	printf("Mine: [%i]\n", errno);
	perror("Error message");
	errno = 0;
	printf("{%zi} ", read(fd, str, 100));
	printf("Real: [%i]\n", errno);
	perror("Error message");
	printf("\n");
	errno = 0;
	printf("{%zi} ", ft_read(42, str, 100));
	printf("Mine: [%i]\n", errno);
	perror("Error message");
	errno = 0;
	printf("{%zi} ", read(42, str, 100));
	printf("Real: [%i]\n", errno);
	perror("Error message");

	printf("\n");

	printf("----- STRDUP: -----\n");
	printf("Mine: [%s]\n", ft_strdup("testing"));
	printf("Real: [%s]\n", strdup("testing"));
	printf("\n");
	printf("Mine: [%s]\n", ft_strdup(""));
	printf("Real: [%s]\n", strdup(""));
	printf("\n");
	return (0);
}
