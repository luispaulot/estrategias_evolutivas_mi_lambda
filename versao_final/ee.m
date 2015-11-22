rastrigin = 1; %rastrigin = 1 com restrição, rastrigin = 0 sem restrição
n_populacao = 20; %tamanho da população
A = 10; %da função fitness 
n = 3; %dimensão do array / colunas hehe
prob_cruzamento = .6; %probabilidade de cruzamento
prob_mutacao = .2; %probabilidade de mutacao
%janela = 15;%janela de melhores fitness/O melhor+janela
tam_pop_filho = 50;
intervalo_xi = 5.12;
pop = gera_populacao(n_populacao, n, intervalo_xi);
RUNTIME = 60;
iter = 1;
timerID = tic;
m = 1000;
%iter < 10000 || 
%toc(timerID) < RUNTIME
while (iter < 10000)
	if rastrigin == 0
		pop = fo(pop, n, n_populacao, A);
	else
		pop = fo_restricao(pop, n, n_populacao, A);
	end
	pop_filhos = recombinacaov3(pop, n, n_populacao, A, tam_pop_filho);%recombinação
	if rastrigin == 0
		pop_filhos = fo(pop_filhos, n, tam_pop_filho, A); %calcula fitness da pop dos filhos
	else
		pop_filhos = fo_restricao(pop_filhos, n, tam_pop_filho, A); %calcula fitness da pop dos filhos
	end
	pop_filhos_mutados = mutacao(pop_filhos, tam_pop_filho, n); %Nova população com os filhos mutados
	if rastrigin == 0
		pop_filhos_mutados = fo(pop_filhos_mutados, n, tam_pop_filho, A); %calcula fitness da pop dos filhos
	else
		pop_filhos_mutados = fo_restricao(pop_filhos_mutados, n, tam_pop_filho, A); %calcula fitness da pop dos filhos
	end
	pop = selecao(pop_filhos, pop_filhos_mutados, tam_pop_filho, n, n_populacao);%faz a regra de 1/5 e seleciona os melhores para a prox geração
	%var(var(pop))
	resmed(iter) = mean(pop(:,n*2+1));
	resmin(iter) = min(pop(:,n*2+1));
	resmax(iter) = max(pop(:,n*2+1));
	if resmin(iter) < m
		m = resmin(iter);
		melhor = pop(1,:);
	end
	iter = iter+1;
end
toc(timerID)
plot(resmin, 'g')
hold on
plot(resmed, 'b')
hold on
plot(resmax, 'r')
legend('Minimo','Medio', 'Maximo')
media = mean(resmin)
minimo = min(resmin)
dpmed = std(resmed)
dpmin = std(resmin)
%pop = calculo_sigma(pop, n_populacao, n);
%atualiza x e sigma
