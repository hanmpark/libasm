#include "test.h"

void ft_list_push_front_test() {
	printf(MAJ "\nRunning ft_list_push_front_test()...\n" RESET);
	t_list *list = NULL;
	int data = 42;

	ft_list_push_front(&list, &data);
	ASSERT(list->data == &data, "ft_list_push_front(&list, &data): list->data == &data");
	ASSERT(list->next == NULL, "ft_list_push_front(&list, &data): list->next == NULL");

	data = 43;
	ft_list_push_front(&list, &data);
	ASSERT(list->data == &data, "ft_list_push_front(&list, &data): list->data == &data");
	ASSERT(list->next->data == &data, "ft_list_push_front(&list, &data): list->next->data == &data");

	while (list) {
		t_list *tmp = list;
		list = list->next;
		free(tmp);
	}
}
