% Scrivere un programma Matlab di tipo function che data in ingresso
% una matrice a rango massimo A (di dim nxm) ed un vettore b (di
% dim n) controlli il rango di A e quindi risolva il problema lineare ai
% minimi quadrati min x£Rn ||Ax-b||_2 utilizzando il metodo delle equazioni
% normali (A^T Ax = A^T b, si veda l'esercizio 1). Si restituisca il minimo
% ed il valore minimo;

R = [1, 2, 3, 4;
     0, 1, 2, 3;
     0, 0, 1, 1;
     0, 0, 0, 1];

b = [2;
    -2;
     1;
     0];

[x, min] = getMinNormalEquation(R, b);

disp('With R: ');
disp(R);
disp('and b: ');
disp(b);
disp('the solution x of linear system Rx=b is: ');
disp(b);
disp('and ||Rx - b||_2 is: ');
disp(min);
