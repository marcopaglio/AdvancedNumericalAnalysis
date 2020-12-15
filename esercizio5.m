% Nel caso di nodi di Chebyshev in [-5; 5], utilizzare il programma dell'
% esercizio3 per uno studio (grafico, nell' intervallo dei nodi) della
% convergenza della successione {pn(x); n = 3; 4; 5; 6; ...} dei polinomi
% interpolanti la funzione f da cui sono letti i dati nel caso f(x) = 1\1+x^2
% e f(x) = sin(2x(pi_greco)).

%symbolic function
x = sym('x');
f1 = 1 / (1 + x^2);
name_f1 = string(f1);
f2 = sin(2 * pi * x);
name_f2 = string(f2);

%constant
functions = [f1, f2];
function_names = [name_f1; name_f2];
max_n = 8;
a = -5;
b = 5;


for index_func = 1 : length(functions)
    figure;
    plotPoints = [];
    for n = 2 : 2 : max_n
        x_i = zeros(1, n);
        for i = 1 : n
            arg = (2 * i - 1) * pi / (2 * n); % i-1 = 0 .. n-1
            x_i(i) = cos(arg);
        end
        nodes = x_i * (b - a) / 2 + ((a + b) / 2);
        ordinates = subs(functions(index_func), x, nodes);
        
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
    func_values = subs(functions(index_func), x, plotPoints);
    plot(plotPoints, func_values, 'LineWidth', 1.5, 'DisplayName', function_names(index_func));
    legend('-DynamicLegend');
    title(strcat('Chebyschev interpolation for ', function_names(index_func)));
    xlabel('x');
    
    hold off;
    
end