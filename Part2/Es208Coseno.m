% Scrivere un programma Matlab di tipo function che dati in ingresso i
% vettori x = (x1; ... ; xm) e f = (f1; ... ; fm) costruisce e disegna il 
% polinomio trigonometrico di migliore approssimazione ai minimi quadrati
% di grado 2n+1 <= m. Si testi il programma con dati estratti uniformemente
% da x^2 + x - 10 e cos(2x).

% VERSIONE: cos(2x).

% constants
degree = 9;
num_nodes = 20;
n = floor(degree / 2);

i = 0 : num_nodes - 1;
x = 2 * pi * i / num_nodes;

% start working for cos(2X)
disp('*** cos(2X) ***');
f2 = cos(2 * x);
[plotPoints, triPoly_values, min_value] = minLsqTrigonometricPolynomial(x, f2, degree);
func_real_values = cos(2 * plotPoints);

% log the solution of min least square problem
disp('The solution of the least square linear problem is: ');
disp(min_value);

% calculate functions value analytically
analytical_func_value = getAnalyticalTrigonometricPolynomial(x, f2, degree, plotPoints);

% draw trigonometric polynomial approximation and the real function
figure;

plot(plotPoints, func_real_values, 'DisplayName', 'cos(2X)');
hold on;
plot(x, f2, 'o', 'DisplayName', strcat('Points (', int2str(num_nodes), ')'));
hold on;
plot(plotPoints, analytical_func_value, '.-', 'DisplayName', 'Analytic approximation');
hold on;
plot(plotPoints, triPoly_values, '--', 'DisplayName', 'Closeness trigonometric polynomial');
legend('-DynamicLegend');
title(strcat('Minimum Least Square Trigonometric Polynomial in vector space of dim-', int2str(degree), ' for cos(2X).'));
xlabel('X');
ylabel(strcat('f^{~}_{', int2str(n), '}(x)'));

hold off;