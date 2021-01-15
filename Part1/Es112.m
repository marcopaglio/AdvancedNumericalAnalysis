% Scrivere un programma che assegnata una funzione f ed un intero n utilizzi
% la function dell'esercizio 11 per costruire e disegnare il polinomio di
% Berstein Bn(f; n). Si testi programma con f(x) = 1/1+25x2, x in [-1; 1]
% ed n = 4 : 10.

% constants
min_n = 4;
max_n = 10;
a = -1;
b = 1;

% check order and swap
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

figure;
for n = min_n : max_n
    nodes = (0 : n) * (b - a) / n  + a;
    ordinates = 1 ./ (1 + 25 * nodes .^ 2); %1/1+25*x^2

    % call BernsteinInterpolation
    [plotPoints, interpolation_values] = BernsteinInterpolation(a, b, n, ordinates);

    % draw Bernstein interpolation's function        
    plot(plotPoints, interpolation_values, 'DisplayName', strcat('P_{B_{', int2str(n), '}}'));
    hold on;
    plot(nodes, ordinates, 'o', 'DisplayName', strcat(int2str(n+1), ' nodes'));
    legend('-DynamicLegend');
    hold on;        
end

% draw real function        
func_values = 1 ./ (1 + 25 * plotPoints.^2);
plot(plotPoints, func_values, '--', 'LineWidth', 1.3, 'DisplayName', strcat('1 / 1+25x^{', int2str(2), '}'));
legend('-DynamicLegend');
title(strcat('Bernstein interpolation for 1 / 1+25x^{', int2str(2), '}'));
xlabel('x');

hold off;