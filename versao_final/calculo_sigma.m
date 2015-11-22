function [pop] = calculo_sigma(pop, n_populacao, n)
	numero = rand();
	raiz = sqrt(n);
	for j = 1:n_populacao
		for i = 1:n
			delta_n = norm(pop(j, i) - numero);
			sigma = delta_n/raiz;
			pop(j, n+i) = sigma; 
		end
	end
end