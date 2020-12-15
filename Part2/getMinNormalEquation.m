function [x_min, min_value] = getMinNormalEquation(A,b)

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

rankA = rank(A);
if rankA ~= min(size(A))
    %TODO something for non singularity of A
end
x_min = getLinearSystemSolution(A' * A, A' * b);
min_value = norm(A * x_min - b, 2);