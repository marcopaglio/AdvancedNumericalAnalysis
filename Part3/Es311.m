% Scrivere un programma di tipo function che assegnata una funzione f in un
% intervallo [a; b] costruisce la formula di quadratura adattativa basata 
% sulla regola dei trapezi per approssimare integral{a, b}( f(x) dx ).

% n = #nodi - 1 iniziali
% groupBy = #nodi presi nella formula Newton Cotes

% constants
a = -pi/2;
b = pi/2;
groupBy = 2;
n = 2 * (groupBy - 1);
f = @(x) x .* sin(x);
nameFunction = strrep(char(f), '@(x)', ' ');
nameFunction = erase(nameFunction, '.');
tau = 0.001;

% calculate real integral
realIntegralValue = integral(f, a, b);
disp(strcat('For ', nameFunction, ' in [', num2str(a), ',', num2str(b), ']'));
disp(strcat('The real integral value is: ', int2str(realIntegralValue), '.'));

% call adaptive quadrature formula
[S_2n1, S_n1, maxError, ~] = adaptiveQuadrature(a, b, n, groupBy, f, tau);
I = ((2 * (groupBy - 1)) ^ 2 * S_2n1 - S_n1) / ((2 * (groupBy - 1)) ^ 2 - 1);

% show integral value
disp(strcat('For n=', int2str(n), ' and tau=', num2str(tau),','));
disp(strcat('Sum of S_{', int2str(n+1), '} is: ', num2str(S_2n1), '.'));
disp(strcat('Sum of S_{', int2str(n/2+1), '} is: ', num2str(S_n1), '.'));
disp(strcat("I(f) is: ", num2str(I), "."));
disp(strcat('Error max in sub-intervals is: ', num2str(maxError), '.'));
