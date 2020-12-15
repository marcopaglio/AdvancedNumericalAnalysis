% Scrivere un programma di tipo function che assegnato un vettore di n+1
% nodi (numerati da 1 a n+1) costruisce e disegna per j da 1 a n+1
% una coppia di base di Hermite {Uj ; Vj} nell' intervallo dei nodi. Si fissi
% inizialmente n = 1.

%constant
num_nodes = 5;
nodes = 1: num_nodes;
a = min(nodes);
b = max(nodes);

%calculate interpolation's points
plotPoints = getPlotPoints(a, b, num_nodes);
plotPoints = unique([plotPoints, nodes]);

%call hermiteBasis
for j = 1 : num_nodes
    [u_base_values, v_base_values] = hermiteBasis(num_nodes, nodes, j, plotPoints);
    
    %draw graphic
    u_base_name = strcat('U_{', int2str(j), '}(x)');
    plot(plotPoints, u_base_values, 'DisplayName', u_base_name);
    hold on;
    v_base_name = strcat('V_{', int2str(j), '}(x)');
    plot(plotPoints, v_base_values, '-.', 'DisplayName', v_base_name);
    hold on;
end

plot(nodes, zeros(1, num_nodes), '+', 'LineWidth', 1.5, 'color', 'y', 'DisplayName', 'nodes');
legend('-DynamicLegend');
title(strcat('Hermite Basis for ', int2str(num_nodes), ' nodes'));
xlabel('x');

hold off;