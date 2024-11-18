#include "test.h"

void ft_strlen_test() {
	printf(MAJ "\nRunning ft_strlen_test()...\n" RESET);
	ASSERT(ft_strlen("Hello") == 5, "ft_strlen(\"Hello\") == 5");
	ASSERT(ft_strlen("") == 0, "ft_strlen(\"\") == 0");
	ASSERT(ft_strlen("1234567890") == 10, "ft_strlen(\"1234567890\") == 10");
}
