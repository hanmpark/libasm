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
OBJ				= ${SRCS:src/%.s=${OBJ_DIR}%.o}

SRCS_BONUS		= ${addprefix src/, ft_atoi_base_bonus.s \
									ft_list_push_front_bonus.s \
									ft_list_size_bonus.s \
									ft_list_sort_bonus.s \
									ft_list_remove_if_bonus.s}

OBJ_BONUS		= ${SRCS_BONUS:src/%.s=${OBJ_DIR}%.o}

ifdef BONUS
	OBJS		= ${OBJ} ${OBJ_BONUS}
else
	OBJS		= ${OBJ}
endif

TEST_SRCS		= ${addprefix test/src/, ft_strlen.test.c \
											ft_strcmp.test.c \
											ft_strcpy.test.c \
											ft_write.test.c \
											ft_read.test.c \
											ft_strdup.test.c \
											main.c \
											ft_atoi_base.test_bonus.c \
											ft_list_push_front.test_bonus.c \
											ft_list_size.test_bonus.c \
											ft_list_sort.test_bonus.c \
											ft_list_remove_if.test_bonus.c}

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
	${CC} -o ${BIN_DIR}${TEST_EXEC} ${TEST_OBJS} -L. -lasm

clean:
	rm -f ${OBJ} ${OBJ_BONUS} ${TEST_OBJS}
	rm -rf ${OBJ_DIR} ${TEST_OBJ_DIR}

fclean: clean
	rm -rf ${NAME} ${BIN_DIR}

re: fclean all

test:  bonus ${TEST_EXEC}
	${BIN_DIR}${TEST_EXEC}

bonus:
	${MAKE} BONUS=1

.PHONY: all clean fclean re test bonus
