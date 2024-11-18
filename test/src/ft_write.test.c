#include "test.h"

void ft_write_test() {
	printf(MAJ "\nRunning ft_write_test()...\n" RESET);
	ssize_t ret = ft_write(1, "Hello, World!\n", 15);
	ASSERT(ret == 15, "ft_write(1, \"Hello, World!\", 15) == 15");
	ret = ft_write(-1, "Hello, World!\n", 15);
	ASSERT(ret == -1, "ft_write(-1, \"Hello, World!\", 15) == -1");
	ASSERT(errno == EBADF, "errno == EBADF");
	ret = ft_write(1, NULL, 15);
	ASSERT(ret == -1, "ft_write(1, NULL, 15) == -1");
	ASSERT(errno == EFAULT, "errno == EFAULT");
}
