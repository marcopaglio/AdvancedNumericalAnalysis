% Scrivere un programma che assegnata una funzione f ed un intero n utilizzi
% la function di esercizio11 per costruire e disegnare il polinomio
% di Berstein Bn(f; n). Si testi programma con f(x) = 1/1+25x2, x in [-1; 1]
% ed n = 4; 5; 6; 7; 8; 9; 10.

%constant
min_n = 4;
max_n = 10;
a = -5;
b = 5;

%check order and swap
if min_n > max_n
    min_n = min_n + max_n;
    max_n = min_n - max_n;
    min_n = min_n - max_n;
end
if a > b
    a = a + b;
    b = a - b;
    a = a - b;
end

plotPoints = [];
for n = min_n : max_n
    nodes = (0: n) * (b - a) / n  + a;
    ordinates = 1 ./ (1 + 25 * nodes.^2); %1 / 1 + 25 * x^2

    %call bernsteinBasis
    plotPoints = getPlotPoints(a, b, n);
    plotPoints = unique([plotPoints, nodes]);
    interpolation_values = zeros(1, length(plotPoints));
    for i = 0 : n
        base_values = bernsteinBasis(n, a, b, i, plotPoints);
        interpolation_values = interpolation_values + base_values * ordinates(i + 1);
    end

    %draw bernstein interpolation's function        
    plot(plotPoints, interpolation_values, 'DisplayName', strcat('n = ', int2str(n)));
    hold on;
    plot(nodes, ordinates, 'o', 'DisplayName', strcat(int2str(n+1), ' nodes'));
    legend('-DynamicLegend');
    hold on;        
end

%draw real function        
func_values = 1 ./ (1 + 25 * plotPoints.^2);
plot(plotPoints, func_values, 'LineWidth', 1.5, 'DisplayName', strcat('1 /1 + 25 * x^{', int2str(2), '}'));
legend('-DynamicLegend');
title(strcat('Bernstein interpolation for 1 /1 + 25 * x^{', int2str(2), '}'));
xlabel('x');

hold off;