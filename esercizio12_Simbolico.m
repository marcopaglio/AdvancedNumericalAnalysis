% Scrivere un programma che assegnata una funzione f ed un intero n utilizzi
% la function di esercizio11 per costruire e disegnare il polinomio
% di Berstein Bn(f; n). Si testi programma con f(x) = 1/1+25x2, x in [-1; 1]
% ed n = 4; 5; 6; 7; 8; 9; 10.

!!WARNING: NON FUNZIONA IL PASSAGGIO DELLA FUNZIONE SIMBOLICA!!
% help function_handler

%symbolic function
x = sym('x');
f1 = @(x) 1 / (1 + 25 * x^2);
name_f1 = func2str(f1);
f2 = @(x) sin(2 * pi * x);
name_f2 = func2str(f2);

%constant
functions = {f1, f2};
function_names = [name_f1; name_f2];
min_n = 4;
max_n = 10;

%check order and swap
if min_n > max_n
    min_n = min_n + max_n;
    max_n = min_n - max_n;
    min_n = min_n - max_n;
end

%call bernsteinInterpolator
for index_func = 1 : length(functions)
    figure;
    disp(function_names(index_func));
    plotPoints = [];
    
    %input
    a = input('Left extreme of nodes: ');
    while isa(a, 'char')
        a = input('Value inserted is not a number! \nLeft extreme of nodes: ');
    end
    
    b = input('Right extreme of nodes: ');
    while isa(b, 'char')
        b = input('Value inserted is not a number! \nRight extreme of nodes: ');
    end
    while b <= a
        b = input('Right extreme must be bigger than left extreme (', num2str(a), '). \nRight extreme of nodes: ');
    end
    
    for n = min_n : max_n
        [plotPoints,interpolation_values] = bernsteinInterpolator(functions(index_func), n, a, b);
    end
    
    %draw real function
    func_values = subs(functions(index_func), x, plotPoints);
    plot(plotPoints, func_values, 'LineWidth', 1.5, 'DisplayName', function_names(index_func));
    legend('-DynamicLegend');
    title(strcat('Bernstein interpolation for ', function_names(index_func)));
    xlabel('x');
    
    hold off;
end

