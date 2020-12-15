% Scrivere un programma di tipo function che assegnato un vettore di
% n+1 nodi di Chebyshev (numerati da 1 a n+1) in [a,b], costruisce e disegna
% il polinomio w_n+1 nell' intervallo dei nodi al variare di n = 4, 6, 8, 10, 12.

%constants
n_values = 4 : 2 : 12;

%inputs
a = input('Choose first extreme: ');
while isa(a, 'char')
    strError = 'Value inserted is not a number! \First extreme: ';
    a = input(strError);
end

b = input('Choose second extreme: ');
while isa(b, 'char')
    strError = 'Value inserted is not a number! \Second extreme: ';
    b = input(strError);
end

%check validity
while b == a
    strError = strcat('Your extremes cannot be equal (', num2str(a), '). \nPlease, choose a different extreme: ');
    b = input(strError);
end

%check order and swap
if a > b
    a = a + b;
    b = a - b;
    a = a - b;
end

%create Chebyschev nodes and call monicPolynomial
for n_index = 1 : length(n_values)
    n = n_values(n_index);
    x_i = zeros(1, n);
    for i = 1 : n
        arg = (2 * i - 1) * pi / (2 * n); % i-1 = 0 .. n-1
        x_i(i) = cos(arg);
    end
    nodes = x_i * (b - a) / 2 + ((a + b) / 2);
    [plotPoints, plotValues] = monicPolynomial(n, nodes, a, b);
    %draw monic polynomial
    monic_polynomial_degree = strcat('w_{', int2str(n), '}(x)');
    plot(plotPoints, plotValues, 'DisplayName', monic_polynomial_degree);
    title('Chebyschev monic polynomial');
    xlabel('x');
    legend('-DynamicLegend');
    hold on;
end

hold off;