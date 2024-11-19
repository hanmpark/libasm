#include "test.h"

void ft_list_size_test() {
	printf(MAJ "\nRunning ft_list_size_test()...\n" RESET);
	t_list *list;
	int size;

	list = NULL;
	size = ft_list_size(list);
	ASSERT(size == 0, "ft_list_size(NULL) == 0");
	ft_list_push_front(&list, "Hello");
	size = ft_list_size(list);
	ASSERT(size == 1, "ft_list_size(list) == 1");
	ft_list_push_front(&list, "World");
	size = ft_list_size(list);
	ASSERT(size == 2, "ft_list_size(list) == 2");
	ft_list_push_front(&list, "!");
	size = ft_list_size(list);
	ASSERT(size == 3, "ft_list_size(list) == 3");

	while (list) {
		t_list *tmp = list;
		list = list->next;
		free(tmp);
	}

	size = ft_list_size(list);
	ASSERT(size == 0, "ft_list_size(list) == 0 (after freeing)");
}
