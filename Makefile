# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: gbouwen <marvin@codam.nl>                    +#+                      #
#                                                    +#+                       #
#    Created: 2020/01/09 14:43:41 by gbouwen       #+#    #+#                  #
#    Updated: 2020/01/17 11:59:47 by gbouwen       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

SOURCE_FILES =	ft_printf.c utils_struct.c check_flags.c check_conversions.c \
		   		utils_print.c utils_print_2.c get_len.c print_d_i.c \
				print_u.c print_x.c print_p.c print_rest.c

OBJECT_FILES = $(SOURCE_FILES:.c=.o)

GREEN = \033[38;5;2m
NORMAL = \033[38;5;255m
RED = \033[38;5;1m
BLUE = \033[38;5;4m

all: $(NAME)

%.o: %.c
	@echo "$(GREEN)Compiling:$(NORMAL)"
	gcc -Wall -Wextra -Werror -c -o $@ $<

$(NAME): $(OBJECT_FILES)
	@echo "$(BLUE)Adding to library...$(NORMAL)"
	@ar rc $(NAME) $(OBJECT_FILES)
	@echo "$(GREEN)Successfully added to library!$(NORMAL)"

clean:
	@echo "$(RED)Removing all object files...$(NORMAL)"
	@/bin/rm -f $(OBJECT_FILES)
	@echo "$(GREEN)Succesfully removed all object files!"

fclean: clean
	@echo "$(RED)Removing library...$(NORMAL)"
	@/bin/rm -f $(NAME)
	@echo "$(GREEN)Successfully removed library!$(NORMAL)"

re: fclean all

.PHONY: all clean fclean re
