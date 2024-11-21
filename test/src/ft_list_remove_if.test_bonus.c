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

int ft_cmp(void *a, void *b) {
	return (*(int *)a - *(int *)b);
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

	int value = 42;
	ft_list_remove_if(&list, &value, &ft_cmp, &free);

	value = 43;
	tmp = list;
	ASSERT(ft_cmp(tmp->data, &value) == 0, "ft_list_remove_if(&list, (void *)42, &ft_cmp): list->data == (void *)43");
	tmp = tmp->next;
	value = 44;
	ASSERT(ft_cmp(tmp->data, &value) == 0, "ft_list_remove_if(&list, (void *)42, &ft_cmp): list->next->data == (void *)44");

	value = 45;
	ft_list_remove_if(&list, &value, &ft_cmp, free);

	tmp = list->next->next;
	value = 46;
	ASSERT(ft_cmp(tmp->data, &value) == 0, "ft_list_remove_if(&list, (void *)45, &ft_cmp): list->next->next->data == (void *)46");

	ft_list_remove_if(&list, &value, &ft_cmp, free);

	t_list *new_list = NULL;

	ft_list_push_front(&new_list, return_data(44));
	ft_list_push_front(&new_list, return_data(43));

	ASSERT(ft_list_size(list) == ft_list_size(new_list), "ft_list_remove_if(&list, (void *)46, &ft_cmp): list->size == new_list->size");
	tmp = list;
	t_list *tmp2 = new_list;
	ASSERT(ft_cmp(tmp->data, tmp2->data) == 0, "ft_list_remove_if(&list, (void *)46, &ft_cmp): list->data == new_list->data");
	tmp = tmp->next;
	tmp2 = tmp2->next;
	ASSERT(ft_cmp(tmp->data, tmp2->data) == 0, "ft_list_remove_if(&list, (void *)46, &ft_cmp): list->next->data == new_list->next->data");

	while (list) {
		tmp = list;
		list = list->next;
		free(tmp->data);
		free(tmp);
	}

	while (new_list) {
		tmp = new_list;
		new_list = new_list->next;
		free(tmp->data);
		free(tmp);
	}
}
