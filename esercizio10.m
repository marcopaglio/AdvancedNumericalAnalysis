% Utilizzando la function di esercizio8, scrivere un programma che
% assegnati due vettori f = (f1; ... ; fn+1), g = (g1; ... ; gn+1) ed un 
% vettore di nodi = (nodi1; ... ; nodin+1) costruisce il polinomio interpolante 
% pn(nodii) = fi; p'n(nodii) = gi; i = 1; ... ; n + 1 e lo disegna
% insieme ai dati (incluse le "direzioni" interpolate).

%constant
num_nodes = 6;
nodes = 1: num_nodes;
f = [2, 8, 1, 7, 12, 21];
g = [0, 3, -2, 5, -6, 0];

%check same size
if num_nodes ~= length(nodes) || num_nodes ~= length(f) || num_nodes ~= length(g)
    error('Your nodes or values do not correspont to the number of nodes declareted!');
end

%calculate interpolation's points
a = min(nodes);
b = max(nodes);
epsilon = (b - a) / 100;
plotPoints = getPlotPoints(a, b, num_nodes);
plotPoints = unique([plotPoints, nodes]);

%call hermiteBasis
interpolation_values = zeros(1, length(plotPoints));
for j = 1 : num_nodes
    [u_base_values, v_base_values] = hermiteBasis(num_nodes, nodes, j, plotPoints);
    interpolation_values = interpolation_values + u_base_values * f(j) + v_base_values * g(j);
    
    %draw derivates
    node = nodes(j);
    abscissas_tangent = [node - epsilon, node, node + epsilon];
    ordinates_tangent = (abscissas_tangent - node) * g(j) + f(j);
    plot(abscissas_tangent, ordinates_tangent, 'color', 'black', 'HandleVisibility', 'off');
    hold on;
end

%draw functions
plot(plotPoints, interpolation_values);
hold on;
plot(nodes, f, 'o');
title('Hermite interpolating polynomial');
legend('Hermite polynomial', 'f samples');
ylabel(strcat('H_{', int2str(2*num_nodes - 1), '}(x)'));
xlabel('x');

hold off