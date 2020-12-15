% Nel caso di n + 1 nodi uniformi in [-5; 5], utilizzare il programma dell'
% esercizio3 per uno studio (grafico, nell' intervallo dei nodi) della
% convergenza della successione {pn(x); n = 3; 4; 5; 6; ...} dei polinomi
% interpolanti la funzione f da cui sono letti i dati nel caso f(x) = 1\1+x^2
% e f(x) = sin(2x(pi_greco)).

%constant
max_n = 8;
a = -5;
b = 5;

plotPoints = [];
for n = 2 : 2 : max_n
    x_i = zeros(1, n);
    for i = 1 : n
        arg = (2 * i - 1) * pi / (2 * n); % i-1 = 0 .. n-1
        x_i(i) = cos(arg);
    end
    nodes = x_i * (b - a) / 2 + ((a + b) / 2);
    ordinates = sin(2 * pi * nodes); %sin(2*pi*x)

    %call lagrangeBasis
    plotPoints = getPlotPoints(a, b, n);
    plotPoints = unique([plotPoints, nodes]);
    interpolation_values = zeros(1, length(plotPoints));
    for j = 1 : n
        base_values = lagrangeBasis(n, nodes, j, plotPoints);
        interpolation_values = interpolation_values + base_values * ordinates(j);
    end

    %draw lagrange interpolation' s function        
    nodes_interpolation = strcat('n = ', int2str(n));
    plot(plotPoints, interpolation_values, 'DisplayName', nodes_interpolation);
    hold on;
    plot(nodes, ordinates, 'o', 'DisplayName', strcat(nodes_interpolation, ' nodes'));
    legend('-DynamicLegend');
    hold on;        
end

%draw real function        
func_values = sin(2 * pi * plotPoints);
plot(plotPoints, func_values, 'LineWidth', 1.5, 'DisplayName', 'sin(2*pi*x)');
legend('-DynamicLegend');
title('Chebyschev interpolation for sin(2*pi*x)');
xlabel('x');

hold off;