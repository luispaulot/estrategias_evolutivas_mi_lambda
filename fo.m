function[pop] = fo(pop, n, n_populacao, A)
	for i = 1:n_populacao
		soma = 0;
		for j=1:n
			res = pop(i, j)^2-A*cos(2*pi*pop(i, j));
			soma = soma + res;
		end
		pop(i, n*2+1) = A*n+soma;
	end