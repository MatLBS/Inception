# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: matle-br <matle-br@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/07 21:07:58 by matle-br          #+#    #+#              #
#    Updated: 2024/11/15 17:15:30 by matle-br         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = inception

GREEN = \033[32m
YELLOW = \033[33m
ROUGE = \033[1;31m

RM = rm -f


all: docker compose up --remove-orphans

docker network create --driver=bridge myNetwork

#comamnde pour liberer un port
#sudo systemctl stop mariadb


clean :
	@$(RM) -r $(OBJ_DIR)
	@make clean --no-print-directory -C ./includes/libft

fclean : clean
	@$(RM) $(NAME) $(OBJ_DIR)
	@make fclean --no-print-directory -C ./includes/libft
	@echo "$(ROUGE)Fclean is running..."

re : fclean all

bonus : all

.PHONY: all clean fclean re
