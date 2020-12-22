% Utilizzando la function dell'esercizio 1, scrivere un programma che
% assegnato un vettore f = (f_1; ... ; f_n+1) e un vettore di nodi =
% (nodi_1; ... ; nodi_n+1)) costruisce il polinomio interpolante 
% e lo disegna insieme ai dati (per valori di x nell'intervallo dei nodi).

% constants
num_nodes = 6;
nodes = 1: num_nodes;
f = [2, 8, 1, 7, 12, 21];

% call LagrangeInterpolation
a = min(nodes);
b = max(nodes);
[plotPoints, interpolation_values] = LagrangeInterpolation(a, b, nodes, f);

% draw functions
plot(plotPoints, interpolation_values);
hold on;
plot(nodes, f, 'o');
title('Lagrange interpolation polynomial');
legend('Lagrange polynomial', 'f samples');
ylabel(strcat('L_{', int2str(num_nodes - 1), '}(x)'));
xlabel('x');

hold off;