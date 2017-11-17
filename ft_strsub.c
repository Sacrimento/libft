/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strsub.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abouvero <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/09 08:54:32 by abouvero          #+#    #+#             */
/*   Updated: 2017/11/17 09:51:14 by abouvero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <string.h>

char	*ft_strsub(char const *s, unsigned int start, size_t len)
{
	char			*new_s;
	unsigned int	i;
	size_t			j;

	j = 0;
	if (!s)
		return (NULL);
	if (!(new_s = (char*)malloc(sizeof(char) * (len + 1))))
		return (NULL);
	i = start;
	while (j < len)
	{
		new_s[j] = s[i];
		i++;
		j++;
	}
	new_s[j] = '\0';
	return (new_s);
}
