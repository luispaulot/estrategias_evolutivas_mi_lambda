function[pop] = fo(pop, n, n_populacao, A)
	penalS = 50;
	penalR = 50;
	%calcula função objetivo
	for i = 1:n_populacao
		sumINE = 0;
		sumEQU = 0;
		soma = 0;
		%função objeto
		for j=1:n
			res = pop(i, j)^2-A*cos(2*pi*pop(i, j));
			soma = soma + res;
		end
		pop(i, n*2+1) = A*n+soma;
		
		%Restrição 1: sen(2*pi*xi) + 0,5 <= 0
		for j = 1:n
			if (sin(2*pi*pop(i, j)+.5) > 0)
				sumINE = sumINE + pop(i, j)^2;
			end
		end
		%Restrição 1: cos(2*pi*xi) + 0,5 <= 0
		for j = 1:n
			if (cos(2*pi*pop(i, j)+.5) ~= 0)
				sumEQU = sumEQU + pop(i, j)^2;
			end
		end
		%verifica restrições
		%if (sumINE > 0 | sumEQU > 0)
			FValue = pop(i, n*2+1) +(penalR * sumINE) + (penalS * sumEQU);
			pop(i, n*2+1) = FValue;
		%end
	end