# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vvaucoul <vvaucoul@student.42.Fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/11 15:13:10 by vvaucoul          #+#    #+#              #
#    Updated: 2022/04/11 15:21:28 by vvaucoul         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = makegen

CXX = clang++
CXXFLAGS = -g3 -fsanitize # -Wall -Wextra -Werror -std=c++98

OBJ_DIR = objs

SRCS = $(wildcard srcs/*.cpp)
OBJS = $(SRCS:.cpp=.o)

%.o: %.cpp
	printf "Compiling %s...\n" $<
	$(CXX) $(CXXFLAGS) -c $< -o $@

all: $(NAME)

$(NAME): $(OBJS)
	@mkdir -p $(OBJ_DIR)
	$(CXX) $(OBJS) $(CXXFLAGS) -o $(NAME)

re: fclean all

clean:
	@rm -rf $(OBJS)

fclean: clean
	@rm -rf $(NAME)

.PHONY: all clean re fclean