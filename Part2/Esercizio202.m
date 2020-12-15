% Scrivere un programma Matlab di tipo function che data in ingresso
% una matrice triangolare non singolare R ed un vettore b determini la
% soluzione del sistema Rx = b;

R = [1, 0, 4, 2;
     0, 3, 2, 1;
     0, 0, 1, 0;
     0, 0, 0, 1];

b = [2;
    -2;
     1;
     0];
 
%  R = [1, 0;
%     0, 1;
%     1, 1;
%     2, 0;
%     0, 2];
% 
% b = [5; 6; 11; 10; 12];

x = getLinearSystemSolution(R, b);

disp('With R: ');
disp(R);
disp('and b: ');
disp(b);
disp('the solution x of linear system Rx=b is: ');
disp(x);