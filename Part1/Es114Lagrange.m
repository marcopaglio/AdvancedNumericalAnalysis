% Scrivere un programma che costruisce il polinomio parametrico interpolante
% (con parametrizzazione uniforme) dati estratti da una curva parametrica a
% scelta (sia uniformemente distribuiti che non).

% PRECISAZIONE: "uniformemente distribuiti" è il caso ottimale, in quanto a
%               t uniformi vengono associati altrettanto punti estratti
%               uniformemente.
% PRECISAZIONE: "random" è il caso reale, e mostra che scegliendo t uniformi
%               è molto difficile avere una curva che si attiene alla realtà
%               perchè è altrettanto improbabile che i punti estratti
%               siano ad essi conformi.
% PRECISAZIONE: n is number of different points, but we add the first point twice.

% VERSIONE: Limaçon
% VERSIONE: Utilizza solo interpolazione di Lagrange.

% constants
alfa = 0.5;
beta = 1;
n = 6;
a = 0;
b = 1;

answer = input('Do you want to take points uniformally [1] or randomically [2]? ');
while answer ~= 1 && answer ~= 2
    answer = input('You can only choose between Uniform [1] or Random [2] distribution: ');
end
if answer == 1
    distributionType = ' Uniform';
    t = a : (b - a) / (n - 1) : b;
else
    distributionType = ' Random';
    t = unique([rand(1, n - 2) * b - a, a, b]);        
    while length(t) ~= n
        t = unique([t, rand(1, n - length(unique(t))) * b - a]);
    end
    t = sort(t);
end

% get curve's points
x_point = beta / 2 + alfa * cos(2 * pi * t) + beta / 2 * cos(4 * pi * t);
y_point = alfa * sin(2 * pi * t) + beta / 2 * sin(4 * pi * t);

% get plot points
plotPoints = getPlotPoints(a, b, n);
plotPoints = unique([plotPoints, t]);

% get curve's plot points
x_curve = beta / 2 + alfa * cos(2 * pi * plotPoints) + beta / 2 * cos(4 * pi * plotPoints);
y_curve = alfa * sin(2 * pi * plotPoints) + beta / 2 * sin(4 * pi * plotPoints);

% uniform parameter
t_parameter = a : (b - a) / (n - 1) : b;

% call LagrangeInterpolation
[plotPoints, x_interpolation_values] = LagrangeInterpolation(a, b, t_parameter, x_point);
[~, y_interpolation_values] = LagrangeInterpolation(a, b, t_parameter, y_point);

% draw parameter interpolation (...in order to close the curve)
plot(x_interpolation_values, y_interpolation_values);
hold on;
plot(x_curve, y_curve);
hold on;
plot(x_point, y_point, 'o');

title(strcat('Uniform parameter Lagrange interpolation of ', distributionType, ' distribution with ', int2str(n-1), ' points.'));
legend('Parameter interpolation', 'Real Limaçon', 'Points');
axis('equal');

hold off;