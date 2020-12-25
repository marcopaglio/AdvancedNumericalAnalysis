% Scrivere un programma Matlab di tipo function che data in ingresso una
% matrice A (di dim m x p) restituisce le due matrici Q ed R della sua 
% fattorizzazione QR (si confronti i risultati con quelli della function
% predefinita di Matlab qr).

% PRECISAZIONE: {Q,R} potrebbero tornare  diverse rispetto alla funzione qr
%               del Matlab, in base al segno di alfa (+ o -). L'importante 
%               è che il loro prodotto sia A.

A = [1, 3, 2, 6, 9, 0;
    -3, 0, 0, 1, -2, 5;
    -1, 1, 0, 1, 2, 0;
     3, 5, 7, 9, 1, 0];

% calculate QR factorization by native function
[Q1, R1] = getQrFactorization(A, 0);
diff1 = norm(A - Q1 * R1, 2);

% calculate QR factorization by my function
[Q2, R2] = getQrFactorization(A, false(1));
diff2 = norm(A - Q2 * R2, 2);

% display results
disp('*** USING NATIVE FUNCTION ***');
disp('Q is: ');
disp(Q1);
disp('R is: ');
disp(R1);
disp('||A - QR||_2 is: ');
disp(diff1);

disp('*** USING STEP-BY-STEP FUNCTION ***');
disp('Q is: ');
disp(Q2);
disp('R is: ');
disp(R2);
disp('||A - QR||_2 is: ');
disp(diff2);

disp('*** DIFFERENTS ***');
disp('Between versions there is a different value of: ');
disp(abs(diff2 - diff1));