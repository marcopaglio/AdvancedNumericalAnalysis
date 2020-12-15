% Scrivere un programma di tipo function che assegnato un vettore uniforme di
% nodi x0;...; x2m in [a; b] implementa e graficizza (per f(x) = x sin(x)) 
% la regola di Simpson e ne studia il grado di precisione.

% IL GRADO DI PRECISIONE é IL MIN DEI SINGOLI GRADI?

% constants
a = -pi/2;
b = pi/2;
n = 2;
m = 2;
f = @(x) x .* sin(x);

% calculate real integral
realIntegralValue = integral(f, a, b);
disp(strcat('For ', func2str(f), ' in [', int2str(a), ',', int2str(b), ']'));
disp(strcat('The real integral value is: ', int2str(realIntegralValue), '.'));

k = 0 : m * n;
nodes = a + k * (b - a) / (m * n);
funcSamples = f(nodes);
plotPoints = getPlotPoints(a, b, length(nodes));
plotPoints = unique([plotPoints, nodes]);

% call close Newton-Cotes formula and compose values as sum
integralValue = 0;
interpolationValues = zeros(1, length(plotPoints));
v = zeros(1, m);
for i = 1 : m
    minIndex = (i - 1) * n + 1;
    maxIndex = i * n + 1;
    
    integralValue = integralValue + NewtonCotes(nodes(minIndex), nodes(maxIndex), ...
                                    nodes(minIndex : maxIndex), funcSamples(minIndex : maxIndex));
                                
    % call lagrangeBasis for interpolation
    indexes = find(plotPoints >= nodes(minIndex) & plotPoints < nodes(maxIndex));
    if i == m
       indexes = [indexes, find(plotPoints == nodes(maxIndex))];
    end
    for j = 1 : n + 1
        baseValues = lagrangeBasis(n + 1, nodes(minIndex : maxIndex), j, plotPoints(indexes));
        interpolationValues(indexes) = interpolationValues(indexes) + baseValues * funcSamples(minIndex - 1 + j);
    end
    
    % study of degree of preciseness
    v(i) = getDegreeOfPreciseness(nodes(minIndex), nodes(maxIndex), nodes(minIndex : maxIndex));
end

% calculate real function values
funcValues = f(plotPoints);

% show integral value
disp(strcat('For n=', int2str(n), '(', int2str(n+1), ...
            ' nodes used), integral calculated is: ', num2str(integralValue), ...
            ' and degree of preciseness is: ', int2str(min(v)), '.'));

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
title(strcat('Integral approximation with Simpson composite formula and ', int2str(m), ' sub-intervals.'));
legend(func2str(f), strcat('Real integral= ', num2str(realIntegralValue)), ...
        'interpolation function', strcat('Numerical integral= ', num2str(integralValue)),...
        strcat('points= ', int2str(m*n+1)));
xlabel('x');

hold off;