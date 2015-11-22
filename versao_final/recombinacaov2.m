function[filho] = recombinacaov2(pop, n, n_populacao, A, tam_pop_filho)
% utilizando o (mi + lambda)
%xi=1;
%sigmai=n+1;
sucesso=0;
maior=-1;
it=1;
filho=rand(tam_pop_filho,n*2+1);



for i = 1:tam_pop_filho
	cara_novo = rand(1, n*2+1);
	pai1 = randi(n_populacao,1,1); %rand de 1 a tamanho
	pai2 = randi(n_populacao,1,1); %rand de 1 a tamanho
	for j = 1:n
		new = (pop(pai1, j)-pop(pai2, j))*randn;		
		cara_novo(1,j) = new;
	end
	filho(i,:) = cara_novo(1,:);
end