% Scrivere un programma di tipo function che assegnata una funzione f e un vettore
% uniforme di nodi x0;...; xn in [a; b] con n pari, stima l'errore commesso
% con la regola dei trapezi utilizzandola anche con i nodi x0; x2;...; xn-2; xn.

% n = #nodi - 1 iniziali
% group = #nodi presi nella formula Newton Cotes

% constants
a = -pi/2;
b = pi/2;
n = 8;
groupBy = 2;
f = @(x) x .* sin(x);

[R_2n1, S_2n1, S_n1] = getRungeError(a, b, n, groupBy, f);

% show integral value
disp(strcat('For n=', int2str(n), ','));
disp(strcat("S_{", int2str(n/2+1), "} is: ", num2str(S_n1), "."));
disp(strcat('S_{', int2str(n+1), '} is: ', num2str(S_2n1), '.'));
disp(strcat('R_{', int2str(n+1), '} is: ', num2str(R_2n1), '.'));
