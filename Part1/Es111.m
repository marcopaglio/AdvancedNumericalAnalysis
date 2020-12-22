% Scrivere un programma di tipo function che assegnato un intero n ed un
% intervallo [a; b] costruisce e disegna le n+1 basi di Berstein in [a; b].

% constants
num_extremes = 2;

% inputs
degree = input('Degree of polynomial: ');
while isa(degree, 'char') || degree < 0 || floor(degree) ~= degree
    degree = input('Value must be a number bigger than 0 and not decimal! \nDegree of polynomial: ');
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

% create and draw Bernstein's bases 
plotPoints = getPlotPoints(min_value, max_value, degree + 1);

base_values_sum = zeros(1, length(plotPoints));
for i = 0 : degree
    base_values = bernsteinBasis(degree, min_value, max_value, i, plotPoints);
    base_values_sum = base_values_sum + base_values;
    
    basis_name = strcat('B_{', int2str(i), '}^{', int2str(degree), '}(x)');
    plot(plotPoints, base_values, '-.', 'DisplayName', basis_name);
    hold on;
end

% draw sum of Bernstein's bases (in order to verify unity)
plot(plotPoints, base_values_sum, 'LineWidth', 1.3, 'DisplayName', 'basis sum');
legend('-DynamicLegend');
title('Bernstein Basis');
xlabel('x');
ylim([-1 2]);

hold off