% Scrivere un programma di tipo function che assegnato un vettore uniforme di
% nodi x0; ... ; xn in [a; b] implementa e graficizza le prime 3 formule di
% Newton-Cotes di tipo chiuso e ne studia il grado di precisione n <= v <= 2n + 1.

% PRECISAZIONE: "graficizza" implica che venga costruita la funzione dalla
%               quale viene calcolato l'integrale numerico

% PRECISAZIONE: "studia il grado di precisione" implica di verificare che 
%               l'integrale numerico sia uguale (con una certa tolleranza) 
%               a quello esatto, calcolati rispetto alle basi (1, x, x^2...)
%               e in [a, b].

% constants
a = -5;
b = 5;
maxN = 3;
f = @(x) 3 * x .^ 4 - 12 * x .^ 3 + x - 1;
nameFunction = strrep(char(f), '@(x)', ' ');
nameFunction = erase(nameFunction, '.');

% calculate real integral
realIntegralValue = integral(f, a, b);
disp(strcat('For ', nameFunction, ' in [', int2str(a), ',', int2str(b), ']'));
disp(strcat('The real integral value is: ', int2str(realIntegralValue), '.'));

for n = 1 : maxN
    k = 0 : n;
    nodes = a + k * (b - a) / n;
    funcSamples = f(nodes);
    
    % call Lagrange Interpolation
    [plotPoints, interpolationValues] = LagrangeInterpolation(a, b, nodes, funcSamples);
    
    % call close Newton-Cotes formula
    integralValue = NewtonCotes(a, b, nodes, funcSamples);
    
    % study of degree of preciseness
    v = getDegreeOfPreciseness(a, b, nodes);    
   
    % show integral value
    disp(strcat('For n=', int2str(n), '(', int2str(n+1), ...
                ' nodes used), integral calculated is: ', num2str(integralValue), ...
                ' and degree of preciseness is: ', int2str(v), '.'));
                
    % evaluate real function
    funcValues = f(plotPoints);

    % draw functions
    figure;
    plot(plotPoints, funcValues);
    hold on;
    ar1 = area(plotPoints, funcValues);
    ar1.FaceAlpha = 0.6;
    ar1.EdgeAlpha = 0;
    hold on;
    plot(plotPoints, interpolationValues, '--', 'lineWidth', 1.5);
    hold on;
    ar2 = area(plotPoints, interpolationValues);
    ar2.FaceAlpha = 0.3;
    ar2.EdgeAlpha = 0;
    hold on;
    plot(nodes, funcSamples, 'o');
    
    title(strcat('Integral approximation with close Newton-Cotes and ', int2str(n+1), ' nodes.'));
    legend(nameFunction, strcat('Real integral= ', num2str(realIntegralValue)), ...
            'interpolation function', strcat('Numerical integral= ', num2str(integralValue)), 'points');
    xlabel('x');
    
end

hold off;