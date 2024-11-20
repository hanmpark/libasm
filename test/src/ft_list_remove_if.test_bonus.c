#include "test.h"

void	*return_data(int data) {
	int	*ptr = malloc(sizeof(int));
	*ptr = data;
	return (ptr);
}

void	print_list(t_list *list) {
	t_list	*tmp = list;

	while (tmp) {
		printf("%d -> ", *(int *)tmp->data);
		tmp = tmp->next;
	}
	printf("NULL\n");
}

void ft_list_remove_if_test() {
	printf(MAJ "\nRunning ft_list_remove_if_test()...\n" RESET);
	t_list	*list = NULL;
	t_list	*tmp = NULL;

	ft_list_push_front(&list, return_data(46));
	ft_list_push_front(&list, return_data(45));
	ft_list_push_front(&list, return_data(44));
	ft_list_push_front(&list, return_data(43));
	ft_list_push_front(&list, return_data(42));

	printf("\nlist is:\n");
	print_list(list);

	ft_list_remove_if(&list, (void *)42, &memcmp, free);

	// tmp = list;
	// ASSERT(memcmp(tmp->data, (void *)43, sizeof(void *)) == 0, "ft_list_remove_if(&list, (void *)42, &memcmp): list->data == (void *)43");
	// tmp = tmp->next;
	// ASSERT(memcmp(tmp->data, (void *)44, sizeof(void *)) == 0, "ft_list_remove_if(&list, (void *)42, &memcmp): list->next->data == (void *)44");

	// ft_list_remove_if(&list, (void *)45, &memcmp, free);

	// tmp = list;
	// tmp = tmp->next->next;
	// ASSERT(memcmp(tmp->data, (void *)46, sizeof(void *)) == 0, "ft_list_remove_if(&list, (void *)45, &memcmp): list->next->next->data == (void *)46");
}
