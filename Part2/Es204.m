% Scrivere un programma Matlab di tipo function che dato in ingresso due
% vettori u, x (di dim p) calcola il trasformato di x secondo la matrice di
% Householder Hu associata ad u.

% PRECISAZIONE: Se u == x +- ||x||e_i il vettore risultante y = Hu * x =
%               = [-+||x||_2, 0, ..., 0].
%               Se x == a*u + b*w, con {u, w} base di R^2 il vettore
%               risultante y = -a*u + b*w. Analoghe considerazioni per R^n.

x = [-5, 2, 6, 5];
u = x + (norm(x, 2) * eye(size(x)));

y = getHouseholderTransformation(u, x);

disp('Your x (to transform) is: ');
disp(x);
disp('Your u (the transformer) is: ');
disp(u);
disp('The transformation y is: ');
disp(y);