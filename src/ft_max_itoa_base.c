/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_max_itoa_base.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abouvero <abouvero@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/01/05 13:15:47 by abouvero          #+#    #+#             */
/*   Updated: 2018/01/05 17:09:00 by abouvero         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/libft.h"

#include <stdio.h>

static char		*init_base(char *basetype)
{
	char	c;
	int		i;

	c = '0';
	i = 0;
	while (i < 10)
		basetype[i++] = c++;
	c = 'a';
	while (i < 16)
		basetype[i++] = c++;
	return (basetype);
}

static int		count_digit(intmax_t value, int base)
{
	int		length;

	length = 0;
	while (value != 0)
	{
		value -= value % base;
		value /= base;
		length++;
	}
	return (length);
}

char			*ft_max_itoa_base(intmax_t temp, int base)
{
	int			negative;
	int			length;
	char		*str;
	char		*basetype;
	uintmax_t	value;

	negative = (temp < 0 && base == 10) ? 1 : 0;
	value = (temp < 0) ? -temp : temp;
	basetype = ft_strnew(16);
	basetype = init_base(basetype);
	length = count_digit(value, base) + negative;
	str = ft_strnew(count_digit(value, base) + negative);
	str[length--] = '\0';
	(value == 0) ? (str[length--] = 0) : 0;
	negative ? str[0] = '-' : 0;
	while (value != 0)
	{
		str[length--] = basetype[value % base];
		value -= value % base;
		value /= base;
	}
	ft_strdel(&basetype);
	return (str);
}