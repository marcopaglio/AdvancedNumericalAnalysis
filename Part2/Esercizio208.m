% Scrivere un programma Matlab di tipo function che dati in ingresso i
% vettori x = (x1; ... ; xm) e f = (f1; ... ; fm) costruisce e disegna il 
% polinomio trigonometrico di migliore approssimazione ai minimi quadrati
% di grado 2n+1 <= m. Si testi il programma con dati estratti uniforme-
% mente da x^2 + x - 10; cos(2x);

%constants
degree = 10;
num_nodes = 20;
n = floor(degree / 2);

x = 0 : 2 * pi / num_nodes : 2*pi;
x = x(1 : num_nodes);

% X^2 + X - 10
disp('--- X^{2}+X-10 ---');
f1 = x .^ 2 + x - 10;
[plotPoints, triPoly_values] = minLsqTrigonometricPolynomial(x, f1, degree);
func_real_values = plotPoints .^ 2 + plotPoints - 10;

% calculate functions value analytically
analytical_func_value = analyticalTrigPolyApproximation(x, f1, plotPoints, degree);

% draw trigonometric polynomial approximation and the real function
figure;

plot(plotPoints, func_real_values, 'DisplayName', 'X^{2}+ X-10');
hold on;
plot(x, f1, 'o', 'DisplayName', strcat('Function points (', int2str(num_nodes), ')'));
hold on;
plot(plotPoints, analytical_func_value, '.-', 'DisplayName', 'Analytic approximation');
hold on;
plot(plotPoints, triPoly_values, '--', 'DisplayName', 'Closeness trigonometric polynomial');
legend('-DynamicLegend');
title(strcat('Minimum Least Square Trigonometric Polynomial in vector space of dim-', int2str(degree), ' for X^{2}+ X-10.'));
xlabel('X');
ylabel('function value');

% cos(2X)
disp('--- cos(2X) ---');
f2 = cos(2 * x);
[plotPoints, triPoly_values] = minLsqTrigonometricPolynomial(x, f2, degree);
func_real_values = cos(2 * plotPoints);


% calculate functions value analytically
analytical_func_value = analyticalTrigPolyApproximation(x, f2, plotPoints, degree);

% draw trigonometric polynomial approximation and the real function
figure;

plot(plotPoints, func_real_values, 'DisplayName', 'cos(2X)');
hold on;
plot(x, f2, 'o', 'DisplayName', strcat('Function points (', int2str(num_nodes), ')'));
hold on;
plot(plotPoints, analytical_func_value, '.-', 'DisplayName', 'Analytic approximation');
hold on;
plot(plotPoints, triPoly_values, '--', 'DisplayName', 'Closeness trigonometric polynomial');
legend('-DynamicLegend');
title(strcat('Minimum Least Square Trigonometric Polynomial in vector space of dim-', int2str(degree), ' for cos(2X).'));
xlabel('X');
ylabel('function value');

hold off;