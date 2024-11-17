AS=nasm
ASFLAGS=-f elf64
LD=gcc
SRCS=
OBJS = ${SRCS:.s=.o}

NAME=libasm.a

all: ${NAME}

${NAME}: ${OBJS}
	ar rc ${NAME} ${OBJS}

%.o: %.s
	${AS} ${ASFLAGS} $< -o $@

clean:
	rm -f ${OBJS}

fclean: clean
	rm -f ${NAME}

re: fclean all

.PHONY: all clean fclean re
