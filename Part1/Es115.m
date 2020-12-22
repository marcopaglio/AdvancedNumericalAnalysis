% Scrivere un programma che costruisce il polinomio parametrico interpolante
% con parametrizzazione arco della curva) dati sperimentali (sia
% uniformemente distribuiti che non).

% PRECISAZIONE: Rispetto alla parametrizzazione uniforme, quella ad arco di 
%               curva è mediamente migliore perchè si basa sul concetto che
%               punti più distanti siano stati trovati da t altrettanto distanti.
% PRECISAZIONE: n is number of different points, but we add the first point twice.

% VERSIONE: Limaçon

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

% arc length parameter
d = zeros(1, n);
D = 0;
for i = 2 : n
    d(i) = sqrt((x_point(i) - x_point(i-1)) ^ 2 + ((y_point(i) - y_point(i-1)) ^ 2));
    D = D + d(i);
end
t_parameter = zeros(1, n);
for i = 2 : n
    subD = d(1 : i);
    t_parameter(i) = sum(subD) / D;
end

% call lagrangeBasis
x_interpolation_values = zeros(1, length(plotPoints));
y_interpolation_values = zeros(1, length(plotPoints));
for j = 1 : n
    x_base_values = lagrangeBasis(t_parameter, j, plotPoints);
    x_interpolation_values = x_interpolation_values + x_base_values * x_point(j);
    
    y_base_values = lagrangeBasis(t_parameter, j, plotPoints);
    y_interpolation_values = y_interpolation_values + y_base_values * y_point(j);
end

% draw parameter interpolation (...in order to close the curve)
plot(x_curve, y_curve);
hold on;
plot(x_interpolation_values, y_interpolation_values);
hold on;
plot(x_point, y_point, 'o');

title(strcat('Arc length parameter interpolation of ', distributionType, ' distribution with- ', int2str(n-1), ' points.'));
legend('Parameter interpolation', 'Real Limaçon', 'Points');
axis('equal');

hold off;