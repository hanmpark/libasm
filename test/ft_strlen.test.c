#include <stdio.h>
#include <string.h>

extern size_t ft_strlen(const char *s);

int main() {
    const char *str = "Hello, world!";

	printf("Testing for strlen\n");
	printf("real:\n");
	printf("Length with \"Hello,world!\": %zu\n", strlen(str));
	printf("mine:\n");
    printf("Length with \"Hello,world!\": %zu\n", ft_strlen(str));

    return 0;
}
