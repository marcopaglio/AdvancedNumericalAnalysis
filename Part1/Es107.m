% Scrivere un programma di tipo function che assegnato un vettore di n + 1
% nodi di Chebyshev (numerati da 1 a n+1) in [a,b], costruisce e disegna il
% polinomio w_n+1 nell' intervallo dei nodi al variare di n = 4 : 2 : 12.

% constants
numNodes_values = 5 : 2 : 13;

% inputs
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

% check order and swap
if a > b
    a = a + b;
    b = a - b;
    a = a - b;
end

% create Chebyschev nodes and call getMonicPolynomial
for n_index = 1 : length(numNodes_values)
    figure;
        
    numNodes = numNodes_values(n_index);
    i = 1 : numNodes;
    x_i = cos((2 * i - 1) * pi / (2 * numNodes)); % i-1 = 0 .. n-1
    nodes = x_i * (b - a) / 2 + ((a + b) / 2);
    [plotPoints, monicPolynomialValues] = getMonicPolynomial(nodes, a, b);
    
    %draw monic polynomial
    plot(plotPoints, monicPolynomialValues);
    hold on;
    plot(nodes, zeros(1, numNodes), '*', 'DisplayName', 'nodes');
    
    title(strcat('Chebyschev monic polynomial for n= ', int2str(numNodes-1), '.'));
    xlabel('x');
    ylabel(strcat('w_{', int2str(numNodes), '}(x)'));
    
    hold off;
end