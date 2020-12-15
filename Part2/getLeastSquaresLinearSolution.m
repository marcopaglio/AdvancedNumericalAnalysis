function [x_min, min_value] = getLeastSquaresLinearSolution(A, b)
% This function return the solution vector (x_min) and the value 
% (min_value) of min ||Ax-b||^2 (least squares linear problem).

% check input dimentions
m = length(b);
if (size(b, 1) ~= 1 || size(b, 2) ~= m) && (size(b, 1) ~= m || size(b, 2) ~= 1)
    error('Your second argument is not a vector.');
end
if m ~= size(A, 1)
    error('Dimentions of rows of matrix A and vector b do not correspond.');
end

% convert into column vector
if m ~= size(b, 1)
    b = b';
end

n = size(A, 2);

%TODO versione in cui non fa U e c1 e c2 ma risolve Rx - c
if m < n
    error('This function cannot solve problems where num of rows < num of columns');
end

% check rank (SE VUOI fai la versione completa)
if rank(A) ~= n
    error('This function cannot solve problems where rank of A is not max');
else
    % max rank
    [Q, R] = getQrFactorization(A, false(1));
    c = Q' * b;
    c1 = c(1 : n, 1);
    c2 = c(n + 1 : m, 1);
    U = R(1 : n, :);
    x_min = getLinearSystemSolution(U, c1);
    min_value = norm(c2, 2)^2;
end


