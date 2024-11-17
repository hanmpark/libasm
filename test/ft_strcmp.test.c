#include <stdio.h>
#include <string.h>

extern int ft_strcmp(const char *s1, const char *s2);

int main() {
	const char *s1 = "Hdllo, world!";
	const char *s2 = "Hello, world!";

	printf("Testing for strcmp\n");
	printf("real:\n");
	printf("Result with \"Hello, world!\" and \"Hello, world!\": %d\n", strcmp(s1, s2));
	printf("mine:\n");
	printf("Result with \"Hello, world!\" and \"Hello, world!\": %d\n", ft_strcmp(s1, s2));

	return 0;
}
