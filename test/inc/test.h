#ifndef TEST_H
# define TEST_H

# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <unistd.h>
# include <fcntl.h>
# include <sys/stat.h>
# include <errno.h>

# include "assembly.h"

# define GREEN	"\033[32m"
# define RED	"\033[31m"
# define RESET	"\033[0m"
# define MAJ	"\033[1m"

# define ASSERT(test, msg) \
	do { \
		if (test) { \
			printf(GREEN "[PASS] " RESET "%s\n", msg); \
		} else { \
			printf(RED "[FAIL] " RESET "%s\n", msg); \
		} \
	} while (0)

void	ft_strlen_test();
void	ft_strcpy_test();
void	ft_strcmp_test();
void	ft_write_test();
void	ft_read_test();
void	ft_strdup_test();
void	ft_atoi_base_test();
void	ft_list_push_front_test();
void	ft_list_size_test();

#endif
