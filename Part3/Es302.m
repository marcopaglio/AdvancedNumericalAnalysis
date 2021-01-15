% Scrivere un programma di tipo function che assegnato un vettore di nodi 
% x0;...; xn calcola i pesi della corrispondente formula interpolatoria 
% sum{i=0...n}(w_i * f(x_i)) utilizzando una funzione dell'esercizio 1.

% PRECISAZIONE: peso i-esimo = integrale in [a,b] della base di Lagrange i-esima

x = 0: 30/3 :30;
weights = getWeights(min(x), max(x), x, 0);

disp('For x: ');
disp(x);
disp('Weights are: ');
disp(weights);