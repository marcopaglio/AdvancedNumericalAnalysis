function [x] = getLinearSystemSolution(R, b)
    % check inputs' validity
    if size(b, 1) ~= 1 && size(b, 2) ~= 1
        error('Input b is not a vector.');
    end
    m = size(R, 1);
    n = size(R, 2);
    if n ~= length(b)
        error('Dimentions of matrix R and vector b do not corrispond.');
    end
    
    % convert into column vector
    if n ~= size(b, 1)
        b = b';
    end
    
    if rank(R) == min(m, n) && m == n
        x = inv(R) * b;
    else
        x = R \ b;
    end
end

