% Scrivere un programma di tipo function che assegnato un vettore uniforme di
% nodi x0; ... ; xn in [a; b] implementa e graficizza (per f(x) = x sin(x)) 
% la regola dei trapezi e ne studia il grado di precisione.

% PRECISAZIONE: "graficizza" implica che venga costruita la funzione dalla
%               quale viene calcolato l'integrale numerico

% PRECISAZIONE: "studia il grado di precisione" implica di verificare che 
%               l'integrale numerico sia uguale (con una certa tolleranza) 
%               a quello esatto, calcolati rispetto alle basi (1, x, x^2...)
%               e in [a, b].

% OBIETTIVO: mostrare che la convergenza al crescere del g.d.p. è solo una 
%            condizione sufficiente.

% VERSIONE: utilizza compositeNewtonCotes valida per ogni n, m e con
%           formule aperte e chiuse di Newton-Cotes.

% constants
a = -pi/2;
b = pi/2;
n = 1;
m = 3;
f = @(x) x .* sin(x);
nameFunction = strrep(char(f), '@(x)', ' ');
nameFunction = erase(nameFunction, '.');

% calculate real integral
realIntegralValue = integral(f, a, b);
disp(strcat('For ', nameFunction, ' in [', int2str(a), ',', int2str(b), ']'));
disp(strcat('The real integral value is: ', int2str(realIntegralValue), '.'));

k = 0 : m * n;
nodes = a + k * (b - a) / (m * n);
funcSamples = f(nodes);

% call composite Newton-Cotes formula
[integralValue, degree, plotPoints, interpolationValues] = compositeNewtonCotes(n, m, nodes, funcSamples, a, b);

% calculate real function values
funcValues = f(plotPoints);

% show integral value
disp(strcat('For n=', int2str(n), '(', int2str(n+1), ...
            ' nodes used), integral calculated is: ', num2str(integralValue), ...
            ' and degree of preciseness is: ', int2str(degree), '.'));

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

title(strcat('Integral approximation with trapezoidal composite formula and ', int2str(m), ' sub-intervals.'));
legend(nameFunction, strcat('Real integral= ', num2str(realIntegralValue)), ...
        'interpolation function', strcat('Numerical integral= ', num2str(integralValue)),...
        strcat('points= ', int2str(m*n+1)));
xlabel('x');

hold off;