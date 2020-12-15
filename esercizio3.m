% Utilizzando la function lagrangeBasis, scrivere un programma che
% assegnato un vettore di nodi (f = (f_1; ... ; f_n+1); nodi =
% (nodi1; ... ; nodin+1)) costruisce il polinomio interpolante 
% e lo disegna insieme ai dati (per valori di x nell'intervallo dei nodi).

%constant
num_nodes = 6;
nodes = 1: num_nodes;
f = [2, 8, 1, 7, 12, 21];

%check same size
if num_nodes ~= length(nodes) || num_nodes ~= length(f)
    error('Your nodes or values do not correspont to the number of nodes declareted!');
end

%calculate interpolation's points
a = min(nodes);
b = max(nodes);
plotPoints = getPlotPoints(a, b, num_nodes);
plotPoints = unique([plotPoints, nodes]);

%call lagrangeBasis
interpolation_values = zeros(1, length(plotPoints));
for j = 1 : num_nodes
    base_values = lagrangeBasis(num_nodes, nodes, j, plotPoints);
    interpolation_values = interpolation_values + base_values * f(j);
end

%draw functions
plot(plotPoints, interpolation_values);
hold on;
plot(nodes, f, 'o');
title('Lagrange interpolating polynomial');
legend('Lagrange polynomial', 'f samples');
ylabel(strcat('L_{', int2str(num_nodes - 1), '}(x)'));
xlabel('x');

hold off;