% Scrivere un programma Matlab di tipo function che dati in ingresso
% i vettori x = (x1; ... ; xm) e f = (f1; ... ; fm) costruisce e disegna il
% polinomio trigonomatrico interpolante di grado m nel caso m dispari.
% Si testi il programma con dati estratti uniformemente da x^2; sen^2(x).

% PRECISAZIONE: la risoluzione va eseguita con la formula analitica
%               ottenuta dalle equazioni normali.
% VERSIONE: sen^2(x).

% constants
num_nodes = 7;
degree = num_nodes;
n = floor(degree / 2);

i = 0 : num_nodes - 1;
x = 2 * pi * i / num_nodes;

% start working for sin^2(X)
disp('*** sen^{2}(X) ***');
f2 = sin(x) .^ 2;
[plotPoints, triPoly_values, min_value] = minLsqTrigonometricPolynomial(x, f2, degree);
func_real_values = sin(plotPoints) .^ 2;

% log the solution of min least square problem
disp('The solution of the least square linear problem is: ');
disp(min_value);

% calculate functions value analytically
analytical_func_value = getAnalyticalTrigonometricPolynomial(x, f2, degree, plotPoints);

% draw trigonometric polynomial interpolator and points of real function
figure;
plot(plotPoints, func_real_values, 'DisplayName', 'sin^{2}(X)');
hold on;
plot(x, f2, 'o', 'DisplayName', strcat('Points (', int2str(num_nodes), ')'));
hold on;
plot(plotPoints, analytical_func_value, '.-', 'DisplayName', 'Analytic approximation');
hold on;
plot(plotPoints, triPoly_values, '--', 'DisplayName', 'Closeness trigonometric polynomial');

title('Minimum Least Square Trigonometric Polynomial Interpolation for sin^{2}(X).');
legend('-DynamicLegend');
xlabel('X');
ylabel(strcat('f^{~}_{', int2str(n), '}(x)'));

hold off;