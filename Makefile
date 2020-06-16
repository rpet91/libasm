# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: rpet <marvin@codam.nl>                       +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/03 08:38:57 by rpet          #+#    #+#                  #
#    Updated: 2020/06/16 14:58:21 by rpet          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a
SRCSDIR = srcs/
OBJSDIR = objs/
_OBJS = ft_strlen.o \
		ft_strcpy.o \
		ft_strcmp.o \
		ft_write.o \
		ft_read.o \
		ft_strdup.o
_BONUS_OBJS = ft_atoi_base_bonus.o \
			  ft_list_push_front_bonus.o \
			  ft_list_size_bonus.o \
			  ft_list_sort_bonus.o \
			  ft_list_remove_if_bonus.o
OBJS = $(addprefix $(OBJSDIR),$(_OBJS))
BONUS_OBJS = $(addprefix $(OBJSDIR),$(_BONUS_OBJS))
NA = nasm
NAFLAGS = -f macho64
CC = gcc
FLAGS = -Wall -Werror -Wextra
INCLUDES = libasm.h

ifeq ($(BONUS),1)
	OBJS += $(BONUS_OBJS)
endif

$(OBJSDIR)%.o: $(SRCSDIR)%.s
	@mkdir -p objs
	$(NA) $(NAFLAGS) -o $@ $<

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

test: all
	$(CC) $(FLAGS) -I.$(INCLUDES) -L. -lasm -o test main.c

test_bonus: bonus
	$(CC) $(FLAGS) -I.$(INCLUDES) -L. -lasm -o test_bonus main_bonus.c

clean:
	rm -f $(OBJS)
	rm -f $(BONUS_OBJS)

fclean: clean
	rm -f $(NAME)
	rm -f test
	rm -f test_bonus
	rm -rf objs

re: fclean all

bonus:
	@make BONUS=1

.PHONY: all clean fclean re bonus
