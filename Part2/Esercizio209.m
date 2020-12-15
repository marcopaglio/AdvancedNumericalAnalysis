% Scrivere un programma Matlab di tipo function che dati in ingresso
% i vettori x = (x1; ... ; xm) e f = (f1; ... ; fm) costruisce e disegna il
% polinomio trigonomatrico interpolante di grado m nel caso m dispari.
% Si testi il programma con dati estratti uniformemente da x^2; sen^2(x);

%constants
num_nodes = 7;
degree = num_nodes;

x = 0 : 2 * pi / (num_nodes + 1) : 2*pi;
x = x(1 : num_nodes);

% X^2
disp('--- X^{2} ---');
f1 = x .^ 2;
[plotPoints, triPoly_values] = minLsqTrigonometricPolynomial(x, f1, degree);
func_real_values = plotPoints .^ 2;

% draw trigonometric polynomial interpolator and points of real function
figure;
plot(plotPoints, func_real_values, 'DisplayName', 'X^{2}');
hold on;
plot(x, f1, 'o', 'DisplayName', strcat('Function points (', int2str(num_nodes), ')'));
hold on;
plot(plotPoints, triPoly_values, '--', 'DisplayName', 'Closeness trigonometric polynomial');
legend('-DynamicLegend');
title('Minimum Least Square Trigonometric Polynomial Interpolator for X^{2}');
xlabel('X');
ylabel('function value');

% sin^2(X)
disp('--- sen^{2}(X) ---');
f2 = sin(x) .^ 2;
[plotPoints, triPoly_values] = minLsqTrigonometricPolynomial(x, f2, degree);
func_real_values = sin(plotPoints) .^ 2;

% draw trigonometric polynomial interpolator and points of real function
figure;
plot(plotPoints, func_real_values, 'DisplayName', 'sin^{2}(X)');
hold on;
plot(x, f2, 'o', 'DisplayName', strcat('Function points (', int2str(num_nodes), ')'));
hold on;
plot(plotPoints, triPoly_values, '--', 'DisplayName', 'Closeness trigonometric polynomial');
legend('-DynamicLegend');
title('Minimum Least Square Trigonometric Polynomial Interpolator for sin^{2}(X).');
xlabel('X');
ylabel('function value');

hold off;