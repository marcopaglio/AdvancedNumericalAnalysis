% Scrivere un programma di tipo function che assegnato un intervallo [a,b] 
% ed un intero n costruisce e disegna i 3 polinomi monici w(^u)_n+1, w(^T)_n+1
% e w(^r)_n+1 rispettivamente associati ai nodi uniformi, Chebyshev e random
% in [a; b]. Si confrontino i risultati al variare di n = 4 : 4 : 12.

% constants
n_values = 4 : 4 : 12;
a = -3;
b = 13;

% create nodes and call monicPolynomial
for j = 1 : length(n_values)
    figure;
    
    n = n_values(j);
    
    % uniform nodes
    uniformStep = (b - a) / n;
    nodes = a : uniformStep : b;
    [uniformPlotPoints, uniformMonicPolynomialValues] = getMonicPolynomial(nodes, a, b);
    
    % Chebyschev nodes
    i = 1 : n + 1;
    x_i = cos((2 * i - 1) * pi / (2 * (n + 1))); % i-1 = 0 .. n-1
    nodes = (x_i * (b - a) / 2) + ((a + b) / 2);
    [chebyschevPlotPoints, chebyschevMonicPolynomialValues] = getMonicPolynomial(nodes, a, b);
    
    %random nodes
    nodes = a + rand(1, n + 1) * (b - a);
    [randomPlotPoints, randomMonicPolynomialValues] = getMonicPolynomial(nodes, a, b);
    
    % draw monic polynomials
    plot(uniformPlotPoints, uniformMonicPolynomialValues, '-');
    hold on;
    plot(chebyschevPlotPoints, chebyschevMonicPolynomialValues, '--');
    hold on;
    plot(randomPlotPoints, randomMonicPolynomialValues, '-.');

    legend('Uniform', 'Chebyschev', 'Random');
    title(strcat('Monic polynomials for n= ', int2str(n), '.'));
    xlabel('x');
end

hold off;