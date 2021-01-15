% Nel caso di n + 1 nodi uniformi in [-5; 5], utilizzare il programma dell'
% esercizio3 per uno studio (grafico, nell' intervallo dei nodi) della
% convergenza della successione {pn(x); n = 3; 4; 5; 6; ...} dei polinomi
% interpolanti la funzione f da cui sono letti i dati nel caso f(x) = 1\1+x^2
% e f(x) = sin(2x(pi_greco)).

% constants
max_numNodes = 28;
a = -5;
b = 5;
step = 6;

for numNodes = 4 : step : max_numNodes
    i = 1 : numNodes;
    x_i = cos((2 * i - 1) * pi / (2 * numNodes)); % i-1 = 0 .. n-1
    nodes = x_i * (b - a) / 2 + ((a + b) / 2);
    ordinates = 1 ./ (1 + nodes .^ 2);

    % call LagrangeInterpolation
    [plotPoints, interpolation_values] = LagrangeInterpolation(a, b, nodes, ordinates);
        
    % draw lagrange interpolation's function        
    plot(plotPoints, interpolation_values, 'DisplayName', strcat('L_{', int2str(numNodes-1), '}(x)'));
    hold on;
    plot(nodes, ordinates, 'o', 'DisplayName', strcat(int2str(numNodes), ' nodes'));
    legend('-DynamicLegend');
    hold on;        
end

% draw real function        
func_values = 1 ./ (1 + plotPoints .^ 2);
plot(plotPoints, func_values, '--', 'LineWidth', 1.3, 'DisplayName', '1 /1 + x^{2}');
legend('-DynamicLegend');
title('Lagrange interpolation with Chebyschev nodes for 1 /1 + x^{2}');
xlabel('x');

hold off;