% Scrivere un programma Matlab di tipo function che dati in ingresso
% i vettori x = (x1; ... ; xm) e f = (f1; ... ; fm) costruisce e disegna il
% polinomio trigonomatrico interpolante di grado m nel caso m dispari.
% Si testi il programma con dati estratti uniformemente da x^2; sen^2(x).

% PRECISAZIONE: la risoluzione va eseguita con la formula analitica
%               ottenuta dalle equazioni normali.
% VERSIONE: x^2.

% constants
num_nodes = 11;
degree = num_nodes;
n = floor(degree / 2);

i = 0 : num_nodes - 1;
x = 2 * pi * i / num_nodes;

% start working for X^2
disp('*** X^{2} ***');
f1 = x .^ 2;
[plotPoints, triPoly_values, min_value] = minLsqTrigonometricPolynomial(x, f1, degree);
func_real_values = plotPoints .^ 2;

% log the solution of min least square problem
disp('The solution of the least square linear problem is: ');
disp(min_value);

% calculate functions value analytically
analytical_func_value = getAnalyticalTrigonometricPolynomial(x, f1, degree, plotPoints);

% draw trigonometric polynomial interpolator and points of real function
figure;
plot(plotPoints, func_real_values, 'DisplayName', 'X^{2}');
hold on;
plot(x, f1, 'o', 'DisplayName', strcat('Points (', int2str(num_nodes), ')'));
hold on;
plot(plotPoints, analytical_func_value, '.-', 'DisplayName', 'Analytic approximation');
hold on;
plot(plotPoints, triPoly_values, '--', 'DisplayName', 'Closeness trigonometric polynomial');

title('Minimum Least Square Trigonometric Polynomial Interpolation for X^{2}');
legend('-DynamicLegend');
xlabel('X');
ylabel(strcat('f^{~}_{', int2str(n), '}(x)'));

hold off;