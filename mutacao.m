function [pop] = mutacao(pop, n_populacao, n, perc_mutacao)
	qtde = perc_mutacao*n_populacao
	pause
	for j = 1:qtde
		rnd = randi(n_populacao,1,1); %rand de 1 a tamanho
		normal = randn;
		for i = 1:n
			pop(rnd, i) = pop(rnd, i)+pop(rnd, n+i)*normal;
		end
	end
end