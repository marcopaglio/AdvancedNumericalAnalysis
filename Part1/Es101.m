% Scrivere un programma di tipo function che assegnato un vettore di n+1
% nodi (numerati da 1 a n+1) ed un intero j fra 1 e n+1 costruisce e 
% disegna la base di Lagrange l_j costruita sui nodi assegnati. Si effettui
% il disegno di l_j(x) per valori di x nell' intervallo dei nodi.

% constants
num_nodes = 3;
nodes = 1: num_nodes;
j = 3;

th = 'th';
if j == 1
    th = 'st';
end
if j == 2
    th = 'nd';
end
if j == 3
    th = 'rd';
end

% call lagrangeBasis
a = min(nodes);
b = max(nodes);
plotPoints = getPlotPoints(a, b, num_nodes);
base_values = lagrangeBasis(nodes, j, plotPoints);

% draw graphic
plot(plotPoints, base_values);
hold on;
plot(nodes, zeros(1, num_nodes), '*');
title(strcat(int2str(j), '^{', th, '} Lagrange basis with ', int2str(num_nodes), ' nodes'));
ylabel(strcat('l_{', int2str(j), '}(x)'));
xlabel('x');
