% Assegnato il vettore x = [0 : n], si utilizzi la function dell'esercizio 
% 2 e si studi con un grafico il comportamento dei pesi al variare di 
% n = 2; ... ; 20.

% constants
maxN = 20;
a = 0;
b = 10;

for n = 2 : maxN
    x = a : (b - a) / n : b;
    weights = getWeights(a, b, x, 0);
    
    disp(strcat('For n=', int2str(n), ' weights are: '));
    disp(weights);
    figure;
    bar(weights);
    title(strcat('Weights of quadrature formulas for n=', int2str(n)));
    xlabel('w_{i}');
    ylabel('weights value');

    hold off;
end
