#include "test.h"

void ft_strcpy_test() {
	printf(MAJ "\nRunning ft_strcpy_test()...\n" RESET);
	char dest[100];
	ft_strcpy(dest, "Hello, World!");
	ASSERT(strcmp(dest, "Hello, World!") == 0, "ft_strcpy(dest, \"Hello, World!\") == \"Hello, World!\"");
	ft_strcpy(dest, "");
	ASSERT(strcmp(dest, "") == 0, "ft_strcpy(dest, \"\") == \"\"");
}
