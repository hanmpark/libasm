#include <stdio.h>
#include <unistd.h>
#include <errno.h>

extern ssize_t ft_write(int fd, const void *buf, size_t count);

int main() {
	const char *str = "Hello, world!";

	printf("Testing for write\n");
	printf("real:\n");
	printf(" Return value: %zd\n", write(1, str, 13));
	printf("mine:\n");
	printf(" Return value: %zd\n\n", ft_write(1, str, 13));

	printf("Testing for write with invalid fd\n");
	printf("real:\n");
	printf("Return value: %zd\n", write(-1, str, 13));
	printf("errno: %d\n", errno);
	printf("mine:\n");
	printf("Return value: %zd\n", ft_write(-1, str, 13));
	printf("errno: %d\n", errno);

	return 0;
}
