% Utilizzando la function di cui al punto 1 verificare (graficamente) le pro-
% prieta' di tutte le basi `l_j(x); j fra 1 e n+1 (cardinalita' e partizione
% dell' unita).

%constant
num_extremes = 2;

%inputs
num_nodes = input('Number of nodes: ');
while isa(num_nodes, 'char') || num_nodes <= 0 || floor(num_nodes) ~= num_nodes
    num_nodes = input('Value must be a number bigger than 0 and not decimal! \nNumber of nodes: ');
end

min_value = input('Left extreme of nodes: ');
while isa(min_value, 'char')
    min_value = input('Value inserted is not a number! \nLeft extreme of nodes: ');
end

max_value = input('Right extreme of nodes: ');
while isa(max_value, 'char')
    max_value = input('Value inserted is not a number! \nRight extreme of nodes: ');
end
while max_value <= min_value
    max_value = input(strcat('Right extreme must be bigger than left extreme (', num2str(min_value), '). \nRight extreme of nodes: '));
end


%randomically creation of nodes
nodes = min_value + (rand(1, num_nodes - num_extremes) * (max_value - min_value));
nodes = [nodes, min_value, max_value];

%check different nodes
num_diff = length(nodes) - length(unique(nodes));
while num_diff ~= 0
    new_nodes = min_value + (rand(1, num_diff) * (max_value - min_value));
    nodes = [unique(nodes), new_nodes];
    num_diff = length(nodes) - length(unique(nodes));
end

%create and draw lagrange's basis 
plotPoints = getPlotPoints(min_value, max_value, num_nodes);
plotPoints = unique([plotPoints, nodes]);
base_values_sum = zeros(1, length(plotPoints));
for j = 1 : num_nodes
    base_values = lagrangeBasis(num_nodes, nodes, j, plotPoints);
    base_values_sum = base_values_sum + base_values;
    
    basis_name = strcat('l_{', int2str(j), '}(x)');
    plot(plotPoints, base_values, 'DisplayName', basis_name);
    hold on;
end

%draw sum of lagrange' basis (in order to verify unity)
plot(plotPoints, base_values_sum, 'DisplayName', 'basis sum');
hold on;
plot(nodes, zeros(1, num_nodes), '+', 'LineWidth', 1.5, 'color', 'y', 'DisplayName', 'nodes');
legend('-DynamicLegend');
title('Lagrange Basis');
xlabel('x');

hold off