function [x_min, min_value] = getLeastSquaresLinearSolution(A, b, type)
    % This function return the solution vector (x_min) and the value 
    % (min_value) of min||Ax-b||^2 (least squares linear problem).
    % type == 0 => resolved with normal equations;
    %      == 1 => resolved with QR factorization. 

    % check inputs' validity
    m = length(b);
    if size(b, 1) ~= 1 && size(b, 2) ~= 1
        error('Input b is not a vector.');
    end
    if m ~= size(A, 1)
        error('Dimentions of rows of matrix A and vector b do not correspond.');
    end

    % convert into column vector
    if m ~= size(b, 1)
        b = b';
    end

    switch type
        case 0
            % WARNING %
            % Values resulting from this method 
            % is not really correct with n big
            rankA = rank(A);
            if rankA ~= min(size(A))
                %TODO something for non singularity of A
                error('Matrix A is not singular. This function cannot resolve this problem.');
            end
            x_min = getLinearSystemSolution(A' * A, A' * b);
            min_value = norm(A * x_min - b, 2);
            
        case 1
            n = size(A, 2);
            if m < n
                % TODO versione in cui non fa U e c1 e c2 ma risolve Rx - c
                error('This function cannot solve problems where num of rows < num of columns');
            end
            
            % check rank A
            if rank(A) ~= n
                % TODO caso A non abbia rango massimo
                error('This function cannot solve problems where rank of A is not max');
            else
                % max rank
                [Q, R] = getQrFactorization(A, 1);
                c = Q' * b;
                c1 = c(1 : n, 1);
                c2 = c(n + 1 : m, 1);
                U = R(1 : n, :);
                x_min = getLinearSystemSolution(U, c1);
                min_value = norm(c2, 2);
            end
            
        otherwise
            errorText = compose("Type inserted is not valid. \nPlease, choose between " + ...
                            "normal equations (0) " + ...
                            "or QR factorization (1) " + ...
                            "methods.");
            error(errorText);
    end
end


