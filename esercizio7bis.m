% Scrivere un programma di tipo function che assegnato un intervallo
% [a,b] ed un intero n costruisce e disegna i 3 polinomi monici w(^u)_n+1, w(^T)_n+1
% e w(^r)_n+1 rispettivamente associati ai nodi uniformi, Chebyshev e random
% in [a; b]. Si confrontino i risultati al variare di n = 4; 8; 12.

%constants
n_values = 4 : 4 : 12;
a = -3;
b = 13;

%check validity
if isa(a, 'char') || isa(b, 'char') || b == a
    strError = strcat('Your extremes must be different numbers.');
    error(strError);
end

%check order and swap
if a > b
    a = a + b;
    b = a - b;
    a = a - b;
end

%create nodes and call monicPolynomial
for j = 1 : length(n_values)
    figure;
    n = n_values(j);
    
    %uniform nodes
    uniformStep = (b - a) / (n - 1);
    nodes = a : uniformStep : b;
    [uniformPlotPoints, uniformPlotValues] = monicPolynomial(n, nodes, a, b);
    plot(uniformPlotPoints, uniformPlotValues, '-');
    hold on;
    
    %Chebyschev nodes
    x_i = zeros(1, n);
    for i = 1 : n
        arg = (2 * i - 1) * pi / (2 * n); % i-1 = 0 .. n-1
        x_i(i) = cos(arg);
    end
    nodes = (x_i * (b - a) / 2) + ((a + b) / 2);
    [chebyschevPlotPoints, chebyschevPlotValues] = monicPolynomial(n, nodes, a, b);
    plot(chebyschevPlotPoints, chebyschevPlotValues, '--');
    hold on;
    
    %random nodes
    nodes = a + rand(1, n) * (b - a);
    [randomPlotPoints, randomPlotValues] = monicPolynomial(n, nodes, a, b);
    plot(randomPlotPoints, randomPlotValues, '-.');

    legend('Uniform', 'Chebyschev', 'Random');
    title(strcat('Monic polynomials for n = ', int2str(n), '.'));
    xlabel('x');
end

hold off;