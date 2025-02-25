% Nel caso di n + 1 nodi uniformi in [-5; 5], utilizzare il programma dell'
% esercizio 3 per uno studio (grafico, nell' intervallo dei nodi) della
% convergenza della successione {pn(x); n = 3; 4; 5; 6; ...} dei polinomi
% interpolanti la funzione f da cui sono letti i dati nel caso f(x) = 1/1+x^2
% e f(x) = sin(2x(pi_greco)).

% symbolic functions
x = sym('x');
f1 = 1 / (1 + x^2);
name_f1 = string(f1);
f2 = sin(2 * pi * x);
name_f2 = string(f2);

% constants
functions = [f1, f2];
function_names = [name_f1; name_f2];
max_n = 7;
a = -5;
b = 5;

for index_func = 1 : length(functions)
    figure;
    
    for n = 3 : max_n
        step = (b - a) / n;
        nodes = a : step : b;
        ordinates = subs(functions(index_func), x, nodes);
        
        % call LagrangeInterpolation
        [plotPoints, interpolation_values] = LagrangeInterpolation(a, b, nodes, ordinates);
        
        % draw lagrange interpolation's function        
        plot(plotPoints, interpolation_values, 'DisplayName', strcat('L_{', int2str(n), '}(x)'));
        hold on;
        plot(nodes, ordinates, 'o', 'DisplayName', strcat(int2str(n+1), ' nodes'));
        legend('-DynamicLegend');
        hold on;        
    end
    
    % draw real function        
    func_values = subs(functions(index_func), x, plotPoints);
    plot(plotPoints, func_values, '--', 'LineWidth', 1.3, 'DisplayName', function_names(index_func));
    legend('-DynamicLegend');
    title(strcat('Lagrange interpolation with uniform nodes for ', function_names(index_func)));
    xlabel('x');
    
    hold off;
end