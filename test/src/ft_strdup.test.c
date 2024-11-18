#include "test.h"

void ft_strdup_test() {
	printf(MAJ "\nRunning ft_strdup_test()...\n" RESET);
	char *str = ft_strdup("Hello, World!");
	ASSERT(strcmp(str, "Hello, World!") == 0, "ft_strdup(\"Hello, World!\") == \"Hello, World!\"");
	free(str);
	str = ft_strdup("");
	ASSERT(strcmp(str, "") == 0, "ft_strdup(\"\") == \"\"");
	free(str);
}
