#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <errno.h>

extern ssize_t ft_read(int fd, void *buf, size_t count);

int main() {
	int fd;
	int ret;
	char buf[256];

	fd = open("utils/test.txt", O_RDONLY);
	ret = read(fd, buf, 100);
	buf[ret] = 0;
	printf("Testing for read\n");
	printf("real:\n");
	printf("Number of bytes: %d\n%s\n", ret, buf);
	close(fd);

	fd = open("utils/test.txt", O_RDONLY);
	ret = ft_read(fd, buf, 100);
	buf[ret] = 0;
	printf("mine:\n");
	printf("Number of bytes: %d\n%s\n\n", ret, buf);
	close(fd);

	ret = read(-1, buf, 100);
	fprintf(stdout, "real:\nNumber of bytes: %d | errno: %d = %s\n", ret, errno, strerror(errno));
	ret = ft_read(-1, buf, 100);
	fprintf(stdout, "mine:\nNumber of bytes: %d | errno: %d = %s\n\n", ret, errno, strerror(errno));
	close(fd);

	return 0;
}
