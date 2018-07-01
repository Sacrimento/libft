# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abouvero <abouvero@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/07 11:47:22 by abouvero          #+#    #+#              #
#    Updated: 2018/01/16 17:21:11 by abouvero         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =libft.a
CFLAGS =-Wall -Werror -Wextra

SRC_CHARCHECKER = ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c
SRC_STRALLOCS = ft_strjoin.c ft_strnew.c ft_strsplit.c ft_strsub.c ft_strtrim.c
SRC_STRSETTER = ft_strcat.c ft_strlcat.c ft_strncat.c ft_strclr.c ft_strcpy.c ft_strmap.c ft_strmapi.c ft_strncpy.c ft_strtoupper.c \
				ft_tolower.c ft_toupper.c
SRC_STRTOOLS = ft_strchr.c ft_strcmp.c ft_strequ.c ft_striter.c ft_striter.c ft_striteri.c ft_strlen.c ft_strncmp.c ft_strnequ.c \
			   ft_strnstr.c ft_strrchr.c ft_strstr.c
SRC_CONVERT = ft_atoi.c ft_itoa.c ft_max_itoa_base.c ft_umax_itoa_base.c
SRC_OIPUT = ft_putchar.c ft_putwchar.c ft_putstr.c ft_putendl.c ft_putnbr.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c \
			ft_printf/c_conv.c ft_printf/colorise.c ft_printf/flags.c ft_printf/format_validation.c ft_printf/ft_printf.c ft_printf/get_struct.c \
			ft_printf/precision.c ft_printf/redirect_comp.c ft_printf/redirect.c ft_printf/str_converter.c ft_printf/width.c
SRC_ALLOC = ft_memalloc.c ft_memdel.c ft_strdel.c ft_strdup.c
SRC_LISTS = ft_lstnew.c ft_lstdelone.c ft_lstdel.c ft_lstadd.c ft_lstiter.c ft_lstmap.c ft_list_size.c ft_list_at.c \
			ft_list_last.c ft_list_pop_front.c ft_list_pop_back.c ft_list_push_front.c ft_list_push_back.c
SRC_MEM = ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c ft_memchr.c ft_memcmp.c

INC_NAME = libft.h get_next_line.h ft_printf.h
DSRC_CHARCHECKER = $(addprefix charchecker_functions/, $(SRC_CHARCHECKER))
DSRC_STRALLOCS = $(addprefix strallocs_functions/, $(SRC_STRALLOCS))
DSRC_STRSETTER = $(addprefix strsetter_functions/, $(SRC_STRSETTER))
DSRC_STRTOOLS = $(addprefix strtools_functions/, $(SRC_STRTOOLS))
DSRC_CONVERT = $(addprefix convert_functions/, $(SRC_CONVERT))
DSRC_OIPUT = $(addprefix OIput_functions/, $(SRC_OIPUT))
DSRC_ALLOC = $(addprefix alloc_functions/, $(SRC_ALLOC))
DSRC_LISTS = $(addprefix lists_functions/, $(SRC_LISTS))
DSRC_MEM = $(addprefix mem_functions/, $(SRC_MEM))

SRC_NAME =$(DSRC_CHARCHECKER) $(DSRC_STRALLOCS) $(DSRC_STRSETTER) $(DSRC_STRTOOLS) $(DSRC_CONVERT) $(DSRC_OIPUT) $(DSRC_ALLOC) $(DSRC_LISTS) $(DSRC_MEM)
OBJ_NAME = $(SRC_NAME:.c=.o)

OBJDIR =./obj/
INCDIR =./includes/
SRCDIR =./src/

SRC = $(addprefix $(SRCDIR), $(SRC_NAME))
INC = $(addprefix $(INCDIR), $(INC_NAME))
OBJ = $(addprefix $(OBJDIR), $(OBJ_NAME))

_RED=$(shell tput setaf 1)
_GREEN=$(shell tput setaf 2)
_CYAN=$(shell tput setaf 6)
_END=$(shell tput sgr0)

.PHONY: all, re, clean, fclean, norme

all: $(NAME)

$(NAME): $(OBJ)
	@ar rcs $(NAME) $^
	@echo "$(_GREEN)$(NAME) compiled$(_END)"

$(OBJDIR)%.o: $(SRCDIR)%.c
	@mkdir -p $(OBJDIR)
	@mkdir -p $(OBJDIR)charchecker_functions $(OBJDIR)strallocs_functions $(OBJDIR)strsetter_functions \
				$(OBJDIR)strtools_functions $(OBJDIR)convert_functions $(OBJDIR)OIput_functions $(OBJDIR)alloc_functions \
				$(OBJDIR)lists_functions $(OBJDIR)mem_functions $(OBJDIR)OIput_functions/ft_printf
	@printf "$(_CYAN)Compiling $@$(_END)\r"
	@$(CC) -o $@ -c $< $(CFLAGS) -I $(INCDIR)
	@printf "                                                              \r"

norme:
	norminette $(SRC) $(INC) | grep "Error\|Warning"
	@echo "$(_CYAN)Norme checked$(_END)"

clean:
	@rm -rf $(OBJDIR)
	@echo "$(_RED)Removed object files$(_END)"

fclean: clean 
	@rm -f $(NAME)
	@echo "$(_RED)Removed $(NAME)$(_END)"

re: fclean all
