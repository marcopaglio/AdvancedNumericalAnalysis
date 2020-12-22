% Nel caso di n + 1 nodi uniformi in [-5; 5], utilizzare il programma dell'
% esercizio3 per uno studio (grafico, nell' intervallo dei nodi) della
% convergenza della successione {pn(x); n = 3; 4; 5; 6; ...} dei polinomi
% interpolanti la funzione f da cui sono letti i dati nel caso f(x) = 1\1+x^2
% e f(x) = sin(2x(pi_greco)).

% constants
max_n = 8;
a = -5;
b = 5;

for n = 2 : 2 : max_n
    i = 1 : n;
    x_i = cos((2 * i - 1) * pi / (2 * n)); % i-1 = 0 .. n-1
    nodes = x_i * (b - a) / 2 + ((a + b) / 2);
    ordinates = sin(2 * pi * nodes);

    % call LagrangeInterpolation
    [plotPoints, interpolation_values] = LagrangeInterpolation(a, b, nodes, ordinates);

    % draw lagrange interpolation's function        
    plot(plotPoints, interpolation_values, 'DisplayName', strcat('L_{', int2str(n-1), '}(x)'));
    hold on;
    plot(nodes, ordinates, 'o', 'DisplayName', strcat('n = ', int2str(n), ' nodes'));
    legend('-DynamicLegend');
    hold on;        
end

% draw real function        
func_values = sin(2 * pi * plotPoints);
plot(plotPoints, func_values, 'LineWidth', 1.3, 'DisplayName', 'sin(2*pi*x)');
legend('-DynamicLegend');
title('Lagrange interpolation with Chebyschev nodes for sin(2*pi*x)');
xlabel('x');

hold off;