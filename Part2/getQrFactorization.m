function [Q, R] = getQrFactorization(A, truly)
% truly as boolean. If true (1) is used native function for qr factorization
%                   If false (0) is used step-by-step qr factorization.
if truly == true(1)
    [Q, R] = qr(A);
    
else
    [m, p] = size(A);
    max_iter = p; % only if m > p
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
end

end

