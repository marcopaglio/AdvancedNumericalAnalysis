% Si utilizzi la function dell'esercizio 11 per f definita a tratti e cioe'
% f(x) = 10^5*sinx per x in [0; 2pi] ed f(x) = exp(x)-exp(2pi) per x in [2pi; 4pi]
% e si graficizzi l'applicazione della formula in una modalita' a piacere.

% PRECISAZIONE: "graficizzi" implica mostrare le suddivisioni eseguite dalla
%               formula di quadratura adattativa.

% constants
a = 0;
b = 4*pi;
groupBy = 2;
n = 2 * (groupBy - 1);
f = @(x) 10^5 * sin(x).*(x >= 0 & x < 2 * pi) + (exp(x) - exp(2*pi)).*(x >= 2*pi & x <= 4*pi);
nameFunction = strrep(char(f), '@(x)', ' ');
nameFunction = erase(nameFunction, '.');
tau = 1;

% call adaptive quadrature formula
[S_2n1, S_n1, maxError, splitPoints] = adaptiveQuadrature(a, b, n, groupBy, f, tau);
I = ((2 * (groupBy - 1)) ^ 2 * S_2n1 - S_n1) / ((2 * (groupBy - 1)) ^ 2 - 1);
disp(strcat("I(f) is: ", num2str(I), "."));

% draw function and splits
t = linspace(0, 4*pi);
figure(1)
plot(t, f(t), 'black')
y = ylim; % current y-axis limits
for i = 1 : length(splitPoints)
    line([splitPoints(i) splitPoints(i)], [y(1) y(2)]);
end
grid
title(strcat('Sub-intervals of adaptive trapezoidal composite formula for',...
        nameFunction, ' in [', num2str(a), ',', num2str(b), ']'));
xlabel('x');

hold off;