function[pop] = gera_populacao(n_populacao, n, intervalo_xi)
    pop = -intervalo_xi + (intervalo_xi+intervalo_xi)*rand(n_populacao,(n*2)+1);
    pop(:, n+1:n*2) = rand(n_populacao,3);
    pop(:, n*2+1)= 0; % zera a coluna do fitness e dos sigmas
end