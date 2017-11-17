/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_list_push_back.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abouvero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/14 19:33:54 by abouvero          #+#    #+#             */
/*   Updated: 2017/11/14 19:39:49 by abouvero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include "libft.h"

t_list	*ft_list_push_back(void *data, t_list *list)
{
	t_list	*beginning;
	t_list	*elem;

	beginning = list;
	if (!(elem = ft_lstnew(data, sizeof(data))))
		return (NULL);
	while (list->next)
		list = list->next;
	list->next = elem;
	return (beginning);
}
