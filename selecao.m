function [selecao] = selecao(pop_filhos, pop_filhos_mutados, n_populacao, n)
	pop_filhos = x = sortrows(pop_filhos, n*2+1);
	pop_filhos_mutados = x = sortrows(pop_filhos_mutados, n*2+1);
	sucesso = 0;
	for i = 1: n_populacao
		if (pop_filhos(i, n*2+1) < pop_filhos_mutados(i, n*2+1))
			selecao(i,:) = pop_filhos(i,:);
		else
			selecao(i,:) = pop_filhos_mutados(i,:);
			sucesso = sucesso+1;
			sucesso
		end
	end
	
	k = sucesso/n_populacao
	if(k < .2)
		for i = 1: n_populacao
			selecao(i, n+1:n*2) = selecao(i, n+1:n*2)*.82;
		end
		selecao
	else
		for i = 1: n_populacao
			selecao(i, n+1:n*2) = selecao(i, n+1:n*2)/.82;
		end
	end
end