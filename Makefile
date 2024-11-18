AS				= nasm
ASFLAGS			= -f elf64
CC				= gcc
BIN_DIR			= bin/
OBJ_DIR			= obj/
TEST_OBJ_DIR	= test/obj/

SRCS			= ${addprefix src/, ft_strlen.s \
									ft_strcpy.s \
									ft_strcmp.s \
									ft_write.s \
									ft_read.s \
									ft_strdup.s}
OBJS			= ${SRCS:src/%.s=${OBJ_DIR}%.o}

TEST_SRCS		= ${addprefix test/src/, ft_strlen.test.c \
											ft_strcmp.test.c \
											ft_strcpy.test.c \
											ft_write.test.c \
											ft_read.test.c \
											ft_strdup.test.c \
											main.c}
TEST_OBJS		= ${TEST_SRCS:test/src/%.c=${TEST_OBJ_DIR}%.o}

NAME			= libasm.a
TEST_EXEC		= test_functions

all: ${NAME}

# Rule to create the static library
${NAME}: ${OBJS}
	ar rc ${NAME} ${OBJS}
	ranlib ${NAME}

# Rule to compile assembly source files into object files
${OBJ_DIR}%.o: src/%.s
	@mkdir -p ${OBJ_DIR}
	${AS} ${ASFLAGS} $< -o $@

# Rule to compile C test files into object files
${TEST_OBJ_DIR}%.o: test/src/%.c
	@mkdir -p ${TEST_OBJ_DIR}
	${CC} -I test/inc -c $< -o $@

# Rule to build the test executable
${TEST_EXEC}: ${NAME} ${TEST_OBJS}
	@mkdir -p ${BIN_DIR}
	${CC} -o ${BIN_DIR}${TEST_EXEC} ${TEST_OBJS} ${NAME}

clean:
	rm -f ${OBJS} ${TEST_OBJS}
	rm -rf ${OBJ_DIR} ${TEST_OBJ_DIR}

fclean: clean
	rm -rf ${NAME} ${BIN_DIR}

re: fclean all

test: ${TEST_EXEC}
	./${BIN_DIR}${TEST_EXEC}

.PHONY: all clean fclean re
