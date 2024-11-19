#include "test.h"

void ft_list_sort_test() {
	printf(MAJ "\nRunning ft_list_sort_test()...\n" RESET);
	t_list *list;
	t_list *tmp;

	list = NULL;
	ft_list_push_front(&list, "a");
	ft_list_push_front(&list, "c");
	ft_list_push_front(&list, "b");
	ft_list_push_front(&list, "e");
	ft_list_push_front(&list, "d");

	printf("Before sort:\n");
	tmp = list;
	while (tmp) {
		printf("\t%s\n", (char *)tmp->data);
		tmp = tmp->next;
	}
	ft_list_sort(&list, ft_strcmp);
	printf("After sort:\n");
	tmp = list;
	while (tmp) {
		printf("\t%s\n", (char *)tmp->data);
		tmp = tmp->next;
	}

	tmp = list;
	ASSERT(strcmp(tmp->data, "a") == 0, "strcmp(tmp->data, \"a\") == 0");
	tmp = tmp->next;
	ASSERT(strcmp(tmp->data, "b") == 0, "strcmp(tmp->data, \"b\") == 0");
	tmp = tmp->next;
	ASSERT(strcmp(tmp->data, "c") == 0, "strcmp(tmp->data, \"c\") == 0");
	tmp = tmp->next;
	ASSERT(strcmp(tmp->data, "d") == 0, "strcmp(tmp->data, \"d\") == 0");
	tmp = tmp->next;
	ASSERT(strcmp(tmp->data, "e") == 0, "strcmp(tmp->data, \"e\") == 0");

	while (list) {
		tmp = list;
		list = list->next;
		free(tmp);
	}
}
