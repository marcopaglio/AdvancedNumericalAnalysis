% Scrivere un programma di tipo function che assegnato un vettore uniforme di
% nodi x0; ... ; xn in [a; b] implementa e graficizza le prime 3 formule di
% Newton-Cotes di tipo chiuso e ne studia il grado di precisione n <= v <= 2n + 1.

% constants
a = -5;
b = 5;
maxN = 3;
f = @(x) 3 * x .^ 4 - 12 * x .^ 3 + x - 1;

% calculate real integral
realIntegralValue = integral(f, a, b);
disp(strcat('For ', func2str(f), ' in [', int2str(a), ',', int2str(b), ']'));
disp(strcat('The real integral value is: ', int2str(realIntegralValue), '.'));

for n = 1 : maxN
    k = 0 : n;
    nodes = a + k * (b - a) / n;
    funcSamples = f(nodes);
    plotPoints = getPlotPoints(a, b, length(nodes));
    plotPoints = unique([plotPoints, nodes]);
    
    % call close Newton-Cotes formula
    integralValue = NewtonCotes(a, b, nodes, funcSamples);
    
    % call lagrangeBasis for interpolation
    interpolationValues = zeros(1, length(plotPoints));
    for j = 1 : n + 1
        baseValues = lagrangeBasis(n + 1, nodes, j, plotPoints);
        interpolationValues = interpolationValues + baseValues * funcSamples(j);
    end
    
    % calculate real function values
    funcValues = f(plotPoints);
    
    % study of degree of preciseness
    v = getDegreeOfPreciseness(a, b, nodes);
    
    % show integral value
    disp(strcat('For n=', int2str(n), '(', int2str(n+1), ...
                ' nodes used), integral calculated is: ', num2str(integralValue), ...
                ' and degree of preciseness is: ', int2str(v), '.'));

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
    legend(func2str(f), strcat('Real integral= ', num2str(realIntegralValue)), ...
            'interpolation function', strcat('Numerical integral= ', num2str(integralValue)), 'points');
    xlabel('x');
    
end

hold off;