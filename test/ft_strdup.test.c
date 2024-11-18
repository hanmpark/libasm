#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern char *ft_strdup(const char *s);

int main() {
	char *str = "Hello, World!";

	printf("Testing strdup\n");
	char *dup_str_1 = strdup(str);
	printf("real:\n%s\n", dup_str_1);
	free(dup_str_1);
	char *dup_str_2 = ft_strdup(str);
	printf("mine:\n%s\n\n", dup_str_2);
	free(dup_str_2);

	printf("Testing strdup with empty string\n");
	char *dup_str_3 = strdup("");
	printf("real:\n%s\n", dup_str_3);
	free(dup_str_3);
	char *dup_str_4 = ft_strdup("");
	printf("mine:\n%s\n\n", dup_str_4);
	free(dup_str_4);

	return 0;
}
