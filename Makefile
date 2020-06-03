# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: rpet <marvin@codam.nl>                       +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/03 08:38:57 by rpet          #+#    #+#                  #
#    Updated: 2020/06/03 10:41:34 by rpet          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a
SRCSDIR = srcs/
OBJSDIR = objs/
_SRCS = ft_strlen.s
_OBJS = $(_SRCS:.s=.o)
SRCS = $(addprefix $(SRCSDIR),$(_SRCS))
OBJS = $(addprefix $(OBJSDIR),$(_OBJS))
NA = nasm
NAFLAGS = -f macho64
CC = gcc
FLAGS = -Wall -Werror -Wextra
INCLUDES = libasm.h

$(OBJSDIR)%.o: $(SRCSDIR)%.s
	mkdir -p objs
	$(NA) $(NAFLAGS) -o $@ $<

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

test: all
	$(CC) $(FLAGS) -I.$(INCLUDES) -L. -lasm -o test main.c

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)
	rm -f test

re: fclean all

.PHONY: all clean fclean re
