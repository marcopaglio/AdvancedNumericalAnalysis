function [Q, R] = getQrFactorization(A, type)
    % type == 0 => used native function for qr factorization
    %      == 1 => used step-by-step qr factorization.
    
    switch type
        case 0
            [Q, R] = qr(A);
            
        case 1
            [m, p] = size(A);
            
            % calculate number of iterations
            max_iter = p;
            if m <= p
                max_iter = m - 1;
            end
            
            Q = eye(m);
            for k = 1 : max_iter
                v = A(k : m, k);
                u = v + (eye(size(v)) * sign(v(1)) * norm(v, 2));
                H_k = eye(m);
                H_k(k : m, k : m) = eye(m - k + 1) - (u * u') * (2 / (u' * u));
                Q = Q * H_k;
                A = H_k * A;
            end
            R = A;
            
        otherwise
            errorText = compose("Type inserted is not valid. \nPlease, choose between " + ...
                            "native function (0) " + ...
                            "or step-by-step (1) " + ...
                            "qr factorization.");
            error(errorText);
    end
end

