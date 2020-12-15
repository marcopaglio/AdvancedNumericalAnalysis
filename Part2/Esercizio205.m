% Scrivere un programma Matlab di tipo function che data in ingresso una
% matrice A (di dim m x p) restituisce le due matrici Q ed R della sua 
% fattorizzazione QR (si confronti i risultati con quelli della function
% predefinita di Matlab qr);

% FIXME R non viene triangolare superiore con my function

A = [1, 3, 2, 6, 9, 0;
    -3, 0, 0, 1, -2, 5;
    -1, 1, 0, 1, 2, 0;
     3, 5, 7, 9, 1, 0];

% calculate QR factorization by native function
[Q1, R1] = getQrFactorization(A, true(1));

disp('Q calculated by native function is: ');
disp(Q1);
disp('R calculated by native function is: ');
disp(R1);

diff1 = norm(A - Q1 * R1, 2);
disp('|| A - QR||_2 calculated by native function is: ');
disp(diff1);

% calculate QR factorization by my function
[Q2, R2] = getQrFactorization(A, false(1));

disp('Q calculated by my function is: ');
disp(Q2);
disp('R calculated by my function is: ');
disp(R2);

diff2 = norm(A - Q2 * R2, 2);
disp('|| A - QR||_2 calculated by my function is: ');
disp(diff2);

% different between two versions in norm
disp('Different between versions is: ');
disp(abs(diff2 - diff1));