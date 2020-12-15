% Scrivere un programma Matlab di tipo function che dato in ingresso due
% vettori u; x (di dim p) calcola il trasformato di x secondo la matrice di
% Householder Hu associata ad u;

x = [-5, 2, 6, 5];
%u = [2, 5, 0, 3];
u = x + (norm(x, 2) * eye(size(x)));
%u = x - (norm(x, 2) * eye(size(x)));

disp('Your x (to transform) is: ');
disp(x);
disp('Your u (the transformer) is: ');
disp(u);

y = getHouseholderTransformation(u, x);

disp('The transformation y is: ');
disp(y);