#include "test.h"

void ft_strcmp_test() {
	printf(MAJ "\nRunning ft_strcmp_test()...\n" RESET);
	ASSERT(ft_strcmp("", "") == 0, "ft_strcmp('', '') == 0");
	ASSERT(ft_strcmp("a", "a") == 0, "ft_strcmp('a', 'a') == 0");
	ASSERT(ft_strcmp("a", "b") < 0, "ft_strcmp('a', 'b') < 0");
	ASSERT(ft_strcmp("b", "a") > 0, "ft_strcmp('b', 'a') > 0");
}
