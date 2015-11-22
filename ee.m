n_populacao = 30; %tamanho da população
A = 10; %da função fitness 
n = 3; %dimensão do array / colunas hehe
n_elite = 10;
prob_cruzamento = .6; %probabilidade de cruzamento
prob_mutacao = .2; %probabilidade de mutacao
%janela = 15;%janela de melhores fitness/O melhor+janela
intervalo_xi = 5.12;
pop = gera_populacao(n_populacao, n, intervalo_xi);
%pop = calculo_sigma(pop, n_populacao, n);
sucesso = 0;
it= 1;
while (sucesso <=5) && (it==n_populacao)
	pop = fo(pop, n, n_populacao, A);
	[pop, sucesso] = recombinacao(pop, n, n_populacao, A);
	pop = mutacao(pop, n_populacao, n, prob_mutacao);
	pop = fo(pop, n, n_populacao, A);

	it=it+1;
end
sucesso
it

%atualiza x e sigma