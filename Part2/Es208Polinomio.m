% Scrivere un programma Matlab di tipo function che dati in ingresso i
% vettori x = (x1; ... ; xm) e f = (f1; ... ; fm) costruisce e disegna il 
% polinomio trigonometrico di migliore approssimazione ai minimi quadrati
% di grado 2n+1 <= m. Si testi il programma con dati estratti uniformemente
% da x^2 + x - 10 e cos(2x).

% VERSIONE: x^2 + x - 10.

% constants
degree = 5;
num_nodes = 8;
n = floor(degree / 2);

%CANGED
i = 0 : num_nodes - 1;
x = 2 * pi * i / num_nodes;

% start working for X^2 + X - 10
disp('*** X^{2}+X-10 ***');
f1 = x .^ 2 + x - 10;
[plotPoints, triPoly_values, min_value] = minLsqTrigonometricPolynomial(x, f1, degree);
func_real_values = plotPoints .^ 2 + plotPoints - 10;

% log the solution of min least square problem
disp('The solution of the least square linear problem is: ');
disp(min_value);

% calculate functions value analytically
analytical_func_value = getAnalyticalTrigonometricPolynomial(x, f1, degree, plotPoints);

% draw trigonometric polynomial approximation and the real function
figure;
plot(plotPoints, func_real_values, 'DisplayName', 'X^{2}+ X-10');
hold on;
plot(x, f1, 'o', 'DisplayName', strcat('Points (', int2str(num_nodes), ')'));
hold on;
plot(plotPoints, analytical_func_value, '.-', 'DisplayName', 'Analytic approximation');
hold on;
plot(plotPoints, triPoly_values, '--', 'DisplayName', 'Closeness trigonometric polynomial');

title(strcat('Minimum Least Square Trigonometric Polynomial in vector space of dim-', int2str(degree), ' for X^{2}+ X-10.'));
legend('-DynamicLegend');
xlabel('X');
ylabel(strcat('f^{~}_{', int2str(n), '}(x)'));

hold off;