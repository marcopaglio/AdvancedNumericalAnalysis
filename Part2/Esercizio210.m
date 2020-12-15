% Scrivere un programma Matlab di tipo function che dati in ingresso
% i vettori x = (x1; ... ; xm) e f = (f1; ... ; fm) costruisce e disegna il
% polinomio trigonometrico interpolante di grado m nel caso m pari. Si
% testi il programma con dati estratti uniformemente da tan(x); e^x.

%constants
num_nodes = 8;
degree = num_nodes;

x = -pi/2 : pi / (num_nodes + 2) : pi/2;
x = x(2 : num_nodes+1);

% tan(X)
disp('--- tan(X) ---');
f1 = tan(x);
[plotPoints, triPoly_values] = minLsqTrigonometricPolynomial(x, f1, degree);
func_real_values = tan(plotPoints);

% draw trigonometric polynomial interpolator and points of real function
figure;
plot(plotPoints, func_real_values, 'DisplayName', 'tan(X)');
hold on;
plot(x, f1, 'o', 'DisplayName', strcat('Function points (', int2str(num_nodes), ')'));
hold on;
plot(plotPoints, triPoly_values, '--', 'DisplayName', 'Closeness trigonometric polynomial');
legend('-DynamicLegend');
title('Minimum Least Square Trigonometric Polynomial Interpolator for tan(X)');
xlabel('');
ylabel('function value');

% e^(X)
disp('--- e^{X} ---');
f2 = exp(x);
[plotPoints, triPoly_values] = minLsqTrigonometricPolynomial(x, f2, degree);
func_real_values = exp(plotPoints);

% draw trigonometric polynomial interpolator and points of real function
figure;
plot(plotPoints, func_real_values, 'DisplayName', 'e^{X}');
hold on;
plot(x, f2, 'o', 'DisplayName', strcat('Function points (', int2str(num_nodes), ')'));
hold on;
plot(plotPoints, triPoly_values, '--', 'DisplayName', 'Closeness trigonometric polynomial');
legend('-DynamicLegend');
title('Minimum Least Square Trigonometric Polynomial Interpolator for e^{X}.');
xlabel('X');
ylabel('function value');

hold off;