function [y] = getHouseholderTransformation(u, X)
% X can be a matrix
% y returned is a column vector or a matrix

% check input dimentions
p = length(u);

if (size(u, 1) ~= 1 || size(u, 2) ~= p) && (size(u, 1) ~= p || size(u, 2) ~= 1)
    error('Your first argument is not a vector.');
end

if p ~= size(X, 1) && p ~= size(X, 2)
    error('Dimentions do not correspond.');
end

% convert into column vectors
if p ~= size(u, 1)
    u = u';
end

if p ~= size(X, 1)
    X = X';
end

alfa = 2 / (u' * u);
H_u = eye(p) - alfa * (u * u');
y = H_u * X;
