% Scrivere un programma Matlab di tipo function che data in ingresso
% una matrice a rango massimo A (di dim m x n) ed un vettore b (di dim
% m) controlli il rango di A e se massimo risolva il problema lineare ai
% minimi quadrati min || Ax - b ||_2 utilizzando il metodo basato sulla
% fattorizzazione QR della matrice A (si veda l'esercizio precedente). Si
% restituisca il minimo ed il valore minimo;

% A = [1, 3, 2, 6, 9, 0;
%     -3, 0, 0, 1, -2, 5;
%     -1, 1, 0, 1, 2, 0;
%      3, 5, 7, 9, 1, 0];
% 
% A = A';
%  
% b = [1, 4, 0, 0, 12, 0];

A = [1, 0;
    0, 1;
    1, 1;
    2, 0;
    0, 2];

b = [5, 6, 11, 10, 12];

[x_min, min_value] = getLeastSquaresLinearSolution(A, b);

disp('x_min calculated is: ');
disp(x_min);
disp('The solution of the least square linear problem is: ');
disp(min_value);