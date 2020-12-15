% Scrivere un programma di tipo function che assegnato un vettore uniforme di
% nodi x0;...; xn in [a; b] implementa e graficizza le prime 2 formule di 
% Newton-Cotes di tipo aperto e ne studia il grado di precisione n<=v<=2n+1.

% constants
a = 2;
b = 9;
maxN = 2;
f = @(x) 3 * x .^ 4 - 12 * x .^ 3 + x - 1;
% f = @(x) (x .^ 3 - 2 * x) / ((x - a) * (x - b));


% calculate real integral
realIntegralValue = integral(f, a, b);
disp(strcat('For ', func2str(f), ' in [', int2str(a), ',', int2str(b), ']'));
disp(strcat('The real integral value is: ', int2str(realIntegralValue), '.'));

for n = 1 : maxN
    k = 1 : n;
    nodes = a + k * (b - a) / (n + 1);
    funcSamples = f(nodes);
    plotPoints = getPlotPoints(a, b, length(nodes) + 2);
    plotPoints = unique([plotPoints, nodes]);
    
    % call close Newton-Cotes formula
    integralValue = NewtonCotes(a, b, nodes, funcSamples);
    
    % call lagrangeBasis for interpolation
    interpolationValues = zeros(1, length(plotPoints));
    for j = 1 : n
        baseValues = lagrangeBasis(n, nodes, j, plotPoints);
        interpolationValues = interpolationValues + baseValues * funcSamples(j);
    end
    
    % calculate real function values
    funcValues = f(plotPoints);
    
    % study of degree of preciseness
    v = getDegreeOfPreciseness(a, b, nodes);
    
    % show integral value
    disp(strcat('For n=', int2str(n+1), ' (', int2str(n+2), ' nodes and ', int2str(n), ...
                ' used), integral calculated is: ', num2str(integralValue), ...
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
    title(strcat('Integral approximation with open Newton-Cotes and ', int2str(n-1), ' nodes.'));
    legend(func2str(f), strcat('Real integral= ', num2str(realIntegralValue)), ...
            'interpolation function', strcat('Numerical integral= ', num2str(integralValue)), 'points');
    xlabel('x');
    
end

hold off;