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
% VERSIONE: Utilizza interpolazione di Lagrange per i nodi e unisce il
%           primo con l'ultimo con interpolazione di Hermite.

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

% uniform parameter
t_parameter = a : (b - a) / (n - 1) : b;

% call LagrangeInterpolation
[plotPoints_lagrange, x_interpolation_values_lagrange] = LagrangeInterpolation(a, t_parameter(n - 1), t_parameter(1 : n - 1), x_point(1 : n - 1));
[~, y_interpolation_values_lagrange] = LagrangeInterpolation(a, t_parameter(n - 1), t_parameter(1 : n - 1), y_point(1 : n - 1));

% calculate incremental ratio for last and first points
x_diff_num_1 = x_interpolation_values_lagrange(length(x_interpolation_values_lagrange)) - x_interpolation_values_lagrange(length(x_interpolation_values_lagrange) - 1);
y_diff_num_1 = y_interpolation_values_lagrange(length(y_interpolation_values_lagrange)) - y_interpolation_values_lagrange(length(y_interpolation_values_lagrange) - 1);
diff_denum_1 = plotPoints_lagrange(length(plotPoints_lagrange)) - plotPoints_lagrange(length(plotPoints_lagrange) - 1);
x_diff_num_2 = x_interpolation_values_lagrange(1) - x_interpolation_values_lagrange(2);
y_diff_num_2 = y_interpolation_values_lagrange(1) - y_interpolation_values_lagrange(2);
diff_denum_2 = plotPoints_lagrange(1) - plotPoints_lagrange(2);
x_derivate = [x_diff_num_1 / diff_denum_1, x_diff_num_2 / diff_denum_2];
y_derivate = [y_diff_num_1 / diff_denum_1, y_diff_num_2 / diff_denum_2];

% call HermiteInterpolation for last and first points
[plotPoints_hermite, x_interpolation_values_hermite] = HermiteInterpolation(t_parameter(n - 1), b, t_parameter(n - 1 : n), x_point(n - 1 : n), x_derivate);
[~, y_interpolation_values_hermite] = HermiteInterpolation(t_parameter(n - 1), b, t_parameter(n - 1 : n), y_point(n - 1 : n), y_derivate);

% get curve's plot points
plotPoints = [plotPoints_lagrange, plotPoints_hermite(2 : end)];
x_curve = beta / 2 + alfa * cos(2 * pi * plotPoints) + beta / 2 * cos(4 * pi * plotPoints);
y_curve = alfa * sin(2 * pi * plotPoints) + beta / 2 * sin(4 * pi * plotPoints);

% draw parameter interpolation (...in order to close the curve)
plot([x_interpolation_values_lagrange, x_interpolation_values_hermite], [y_interpolation_values_lagrange, y_interpolation_values_hermite]);
hold on;
plot(x_curve, y_curve);
hold on;
plot(x_point, y_point, 'o');

title(strcat('Uniform parameter Hermite interpolation of ', distributionType, ' distribution with ', int2str(n-1), ' points.'));
legend('Parameter interpolation', 'Real Limaçon', 'Points');
axis('equal');

hold off;