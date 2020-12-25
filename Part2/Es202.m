% Scrivere un programma Matlab di tipo function che data in ingresso
% una matrice triangolare non singolare R ed un vettore b determini la
% soluzione del sistema Rx = b.

% PRECISAZIONE: "matrice singolare" ha determinante nullo, non è invertibile.
%               Viceversa, se i suoi elementi appartengono a un campo, si ha
%               che una matrice non singolare è sempre invertibile.

R = [1, 0, 4, 2;
     0, 3, 2, 1;
     0, 0, 1, 0;
     0, 0, 0, 1];

b = [2
    -2;
     1;
     0];

x = getLinearSystemSolution(R, b);

disp('With R: ');
disp(R);
disp('and b: ');
disp(b');
disp('the solution x of linear system Rx=b is: ');
disp(x);