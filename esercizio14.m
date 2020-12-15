% Scrivere un programma che costruisce il polinomio parametrico inter-
% polante (con parametrizzazione uniforme) dati estratti da una curva
% parametrica a scelta (sia uniformemente distribuiti che non).
% Limaçon

% constants
alfa = 0.5;
beta = 1;
% NB: n is number of different points, but we add the first point twice...
n = 6;
a = 0;
b = 1;

answer = input('Do you want to take points uniformally [1] or randomically [2]? ');
while answer ~= 1 && answer ~= 2
    answer = input('You can only choose between Uniform [1] or Random [2] distribution: ');
end
if answer == 1
    distributionType = 'Uniform';
    t_parameter = a : (b - a) / n : b;
    t_parameter = t_parameter(1: n);
else
    distributionType = 'Random';
    t_parameter = rand(1, n) * b - a;        
    while length(t_parameter) ~= length(unique(t_parameter))
        t_parameter = [unique(t_parameter), rand(1, n - length(unique(t_parameter))) * b - a];
    end
    t_parameter = sort(t_parameter);
end

% create interpolation's points
x_point = beta / 2 + alfa * cos(2 * pi * t_parameter) + beta / 2 * cos(4 * pi * t_parameter);
y_point = alfa * sin(2 * pi * t_parameter) + beta / 2 * sin(4 * pi * t_parameter);
plot(x_point, y_point, 'o');
hold on;

plotPoints = getPlotPoints(a, b, n);
plotPoints = unique([plotPoints, t_parameter]);

% draw the real curve
x_curve = beta / 2 + alfa * cos(2 * pi * plotPoints) + beta / 2 * cos(4 * pi * plotPoints);
y_curve = alfa * sin(2 * pi * plotPoints) + beta / 2 * sin(4 * pi * plotPoints);
plot(x_curve, y_curve);
hold on;

%uniform parameter
t = a : (b - a) / n : b;
t = t(1: n);

% call lagrangeBasis
x_interpolation_values = zeros(1, length(plotPoints));
y_interpolation_values = zeros(1, length(plotPoints));
for j = 1 : n
    x_base_values = lagrangeBasis(n, t, j, plotPoints);
    x_interpolation_values = x_interpolation_values + x_base_values * x_point(j);
    
    y_base_values = lagrangeBasis(n, t, j, plotPoints);
    y_interpolation_values = y_interpolation_values + y_base_values * y_point(j);
end

% draw parameter interpolation (...in order to close the curve)
plot([x_interpolation_values, x_interpolation_values(1)], [y_interpolation_values, y_interpolation_values(1)]);
axis('equal');
title(strcat('Uniform parameter interpolation of- ', distributionType, ' distribution with- ', int2str(n), ' points.'));
legend('Points', 'Real Limaçon', 'Parameter interpolation');
hold off;
