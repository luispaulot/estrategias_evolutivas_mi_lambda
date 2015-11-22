function[pop] = fo_restricao(pop, n, n_populacao, A)
	penalS = 350;
	penalR = 50;
	%calcula função objetivo
	%if n>5
	%	penalS = 850;
	%end
	for i = 1:n_populacao
		sumINE = 0;
		sumEQU = 0;
		soma = 0;
		for j=1:n
			res = pop(i, j)^2-A*cos(2*pi*pop(i, j));
			soma = soma + res;
		end
		pop(i, n*2+1) = A*n+soma;
		%Restrição 1: sen(2*pi*xi) + 0,5 <= 0
		for j = 1:n
			sumAUX = sin(2*pi*pop(i, j))+.5;
			%sumAUX=pop(i,n*2+1);
			if (sumAUX > 0)
				sumINE = sumINE+sumAUX^2;
			end
		end
		%Restrição 1: cos(2*pi*xi) + 0,5 <= 0
		for j = 1:n
			sumAUX = cos(2*pi*pop(i, j))+.5;
			if (sumAUX~=0)
				sumEQU = sumEQU+sumAUX^2;
			end
		end
		FValue = pop(i, n*2+1) +(penalR * sumINE) + (penalS * sumEQU);
		pop(i, n*2+1) = FValue;
	end
end