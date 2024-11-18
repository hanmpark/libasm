#include "test.h"

void ft_read_test() {
	printf(MAJ "\nRunning ft_read_test()...\n" RESET);
	int fd;
	int ret;
	char buf[256];

	fd = open("test/utils/test.txt", O_RDONLY);
	ret = ft_read(fd, buf, 100);
	buf[ret] = 0;
	ASSERT(ret == 100, "ft_read(fd, buf, 100) == 100");
	close(fd);
	ret = read(-1, buf, 100);
	ASSERT(ret == -1, "read(-1, buf, 100) == -1");
	ASSERT(errno == EBADF, "errno == EBADF");
}
