% Scrivere un programma Matlab di tipo function che dati in ingresso
% i vettori x = (x1; ... ; xm) e f = (f1; ... ; fm) costruisce e disegna il
% polinomio trigonometrico interpolante di grado m nel caso m pari. Si
% testi il programma con dati estratti uniformemente da tan(x) ed e^x.

% constants
num_nodes = 8;
degree = num_nodes;
n = degree / 2;

i = 0 : num_nodes - 1;
x = 2 * pi * i / num_nodes;
% x = -pi/2 : pi / num_nodes : pi/2;
% x = x(1 : num_nodes);

% start working for tan(X)
disp('*** tan(X) ***');
f1 = tan(x);
[plotPoints, triPoly_values, min_value] = minLsqTrigonometricPolynomial(x, f1, degree);
func_real_values = tan(plotPoints);

% log the solution of min least square problem
disp('The solution of the least square linear problem is: ');
disp(min_value);

% calculate functions value analytically
analytical_func_value = getAnalyticalTrigonometricPolynomial(x, f1, degree, plotPoints);

% draw trigonometric polynomial interpolator and points of real function
figure;
plot(plotPoints, func_real_values, 'DisplayName', 'tan(X)');
hold on;
plot(x, f1, 'o', 'DisplayName', strcat('Points (', int2str(num_nodes), ')'));
hold on;
plot(plotPoints, analytical_func_value, '.-', 'DisplayName', 'Analytic approximation');
hold on;
plot(plotPoints, triPoly_values, '--', 'DisplayName', 'Closeness trigonometric polynomial');

title('Minimum Least Square Trigonometric Polynomial Interpolation for tan(X)');
legend('-DynamicLegend');
xlabel('');
ylabel(strcat('f^{~}_{', int2str(n), '}(x)'));

% start working for e^(X)
disp('*** e^{X} ***');
f2 = exp(x);
[plotPoints, triPoly_values, min_value] = minLsqTrigonometricPolynomial(x, f2, degree);
func_real_values = exp(plotPoints);

% log the solution of min least square problem
disp('The solution of the least square linear problem is: ');
disp(min_value);

% calculate functions value analytically
analytical_func_value = getAnalyticalTrigonometricPolynomial(x, f2, degree, plotPoints);

% draw trigonometric polynomial interpolator and points of real function
figure;
plot(plotPoints, func_real_values, 'DisplayName', 'e^{X}');
hold on;
plot(x, f2, 'o', 'DisplayName', strcat('Points (', int2str(num_nodes), ')'));
hold on;
plot(plotPoints, analytical_func_value, '.-', 'DisplayName', 'Analytic approximation');
hold on;
plot(plotPoints, triPoly_values, '--', 'DisplayName', 'Closeness trigonometric polynomial');

title('Minimum Least Square Trigonometric Polynomial Interpolation for e^{X}.');
legend('-DynamicLegend');
xlabel('X');
ylabel(strcat('f^{~}_{', int2str(n), '}(x)'));

hold off;