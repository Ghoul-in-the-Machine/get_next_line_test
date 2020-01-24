/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: sde-zwar <sde-zwar@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/01/06 20:21:10 by sde-zwar       #+#    #+#                */
/*   Updated: 2020/01/19 17:10:56 by sde-zwar      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"
#include <stdio.h>
#include <fcntl.h>

void	ft_putendl_fd(char *s, int fd)
{
	int i;

	if (s == NULL)
		return ;
	i = 0;
	while (s[i])
	{
		write(fd, &s[i], 1);
		i++;
	}
	write(fd, "\n", 1);
}

void		ft_exit(const char *str)
{
	if (str)
		ft_putendl_fd((char *)str, 2);
	exit(1);
}

int			main(int argc, char **argv)
{
	char	*line;
	int		fd;
	int		status;
	int		i;
	int		fd_count;

	i = 1;
	fd_count = 1;
	printf("BUFFER_SIZE = %d\n", BUFFER_SIZE);
	printf("___First FD___ \n\n");
	while (i < argc)
	{
		if ((fd = open(argv[i], O_RDONLY)) == -1)
			ft_exit("Error: Can't open file");
		while ((status = get_next_line(fd, &line)) > 0)
		{
			printf("FD %d - Status %d |%s|\n", fd, status, line);
			free(line);
		}
		printf("FD %d - EOF %d    |%s|\n", fd, status, line);
		i++;
		if (i < argc && fd_count < (i + 1))
		{
			if (fd_count == 1)
				printf("\n___%dst change of FD___ \n\n", fd_count);
			if (fd_count == 2)
				printf("\n___%dnd change of FD___ \n\n", fd_count);
			if (fd_count == 3)
				printf("\n___%drd change of FD___ \n\n", fd_count);
			if (fd_count > 3)
				printf("\n___%dth change of FD___ \n\n", fd_count);
			fd_count++;
		}
	}
	return (0);
}
