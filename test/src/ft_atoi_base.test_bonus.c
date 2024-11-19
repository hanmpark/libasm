#include "test.h"

void ft_atoi_base_test() {
	printf(MAJ "\nRunning ft_atoi_base_test()...\n" RESET);

	ASSERT(ft_atoi_base("0", "01") == 0, "ft_atoi_base(\"0\", \"01\") == 0");
	ASSERT(ft_atoi_base("1", "01") == 1, "ft_atoi_base(\"1\", \"01\") == 1");
	ASSERT(ft_atoi_base("10", "01") == 2, "ft_atoi_base(\"10\", \"01\") == 2");
	ASSERT(ft_atoi_base("11", "01") == 3, "ft_atoi_base(\"11\", \"01\") == 3");

	ASSERT(ft_atoi_base("1", "0123456789") == 1, "ft_atoi_base(\"1\", \"0123456789\") == 1");
	ASSERT(ft_atoi_base("10", "0123456789") == 10, "ft_atoi_base(\"10\", \"0123456789\") == 10");
	ASSERT(ft_atoi_base("11", "0123456789") == 11, "ft_atoi_base(\"11\", \"0123456789\") == 11");
	ASSERT(ft_atoi_base("-1", "0123456789") == -1, "ft_atoi_base(\"-1\", \"0123456789\") == -1");

	ASSERT(ft_atoi_base("1", "0123456789ABCDEF") == 1, "ft_atoi_base(\"1\", \"0123456789ABCDEF\") == 1");
	ASSERT(ft_atoi_base("A", "0123456789ABCDEF") == 10, "ft_atoi_base(\"A\", \"0123456789ABCDEF\") == 10");
	ASSERT(ft_atoi_base("B", "0123456789ABCDEF") == 11, "ft_atoi_base(\"B\", \"0123456789ABCDEF\") == 11");
	ASSERT(ft_atoi_base("F", "0123456789ABCDEF") == 15, "ft_atoi_base(\"F\", \"0123456789ABCDEF\") == 15");
}
