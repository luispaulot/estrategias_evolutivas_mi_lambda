function[pop, sucesso] = recombinacao(pop, n, n_populacao, A)
% utilizando o (mi + lambda)
%xi=1;
%sigmai=n+1;
sucesso=0;
maior=-1;
it=1;

filho=rand(1,n*2+1);

pai1 = randi(n_populacao,1,1); %rand de 1 a tamanho
pai2 = randi(n_populacao,1,1); %rand de 1 a tamanho

while (sucesso <=5) && (it==n_populacao)
	xi=1;
	sigmai=n+1;

	for i=1:3
		filho(xi)=(pop(pai1,xi)+pop(pai2,xi))/2;
		filho(sigmai)=(pop(pai1,sigmai) +pop(pai2,sigmai))/2;
		
		xi=xi+1;
		sigmai=sigmai+1;
	end

	filho=fo(filho, n, 1, A);
		
	if pop(pai1,sigmai) >= pop(pai2,sigmai) 	
		maior= pai1;
	else
		maior = pai2;
	end

	if filho(sigmai) < pop(maior,sigmai)	
		pop(maior,:)=filho;
		sucesso=sucesso+1
	end
	
	it=it+1;
	
end
