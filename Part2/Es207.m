% Scrivere un programma Matlab di tipo function che dati in ingresso
% i vettori x = (x1; ... ; xm) e f = (f1; ... ; fm) costruisce e disegna il
% polinomio di migliore approssimazione ai minimi quadrati di grado n+1 <= m.
% (Si utilizzi, se utile, la function predefinita del Matlab "vander").

% constants
degree = 3;

x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
f = [1, 3, 7, 4, 1, 11, 13, 15, 19, 21, 29, 31, 36];

% build min least square polynomial
[plotPoints, func_values, min_value] = minLeastSquarePolynomial(x, f, degree);

% log the solution of min least square problem
disp('The solution of the least square linear problem is: ');
disp(min_value);

% draw polynomial approximation and points of function
plot(plotPoints, func_values);
hold on;
plot(x, f, 'o');
legend('Closeness polynomial', strcat('Points (', int2str(length(x)), ')'));
title(strcat('Minimum Least Square Polynomial with degree-', int2str(degree)));
xlabel('x');
ylabel(strcat('f^{-}_{', int2str(degree), '}(x)'));

hold off;