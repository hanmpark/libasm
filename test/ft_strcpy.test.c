#include <stdio.h>
#include <string.h>

extern char *ft_strcpy(char *dest, const char *src);

int main() {
	char dest1[100];
	char dest2[100];
	const char *src = "Hello, world!";

	printf("Testing for strcpy\n");
	printf("real:\n");
	printf("Copied string: %s\n", strcpy(dest1, src));
	printf("mine:\n");
	printf("Copied string: %s\n", ft_strcpy(dest2, src));

	return 0;
}
