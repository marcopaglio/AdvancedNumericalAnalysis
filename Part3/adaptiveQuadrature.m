function [S_2n1, S_n1, R_2n1, splitPoints] = adaptiveQuadrature(a, b, n, groupBy, f, tau)
% check inputs 
% a, b externals of function f
% n is number of nodes - 1 in each sub-interval
% groupBy is number of nodes used in Newton-Cotes formulas
% tau is the tolerance

% check inputs
if length(a) ~= 1 || length(b) ~= 1 || length(n) ~= 1 || length(groupBy) ~= 1 || length(tau) ~= 1
    error('At least one of your scalar inputs is not a scalar value.');
end
if class(f) ~= 'function_handle'
    error('');
end

if n ~= floor(n) 
    error('Input n must be a integer value.');
end
if mod(n, 2) ~= 0
    error('Input n must be even.');
end

if groupBy ~= floor(groupBy) 
    error('Input groupBy must be a integer value.');
end
if groupBy < 2
    error('Input groupBy cannot be lower than 2.');
end

m_n1 = n / (2 * (groupBy - 1));
if m_n1 ~= floor(m_n1)
    error('This method only creates uniform sub-interval. Please choose (group-1) as divisor of n/2.');
end

[R_2n1, S_2n1, S_n1] = getRungeError(a, b, n, groupBy, f);

if abs(R_2n1) >= tau
    [S_2n1_firstPart, S_n1_firstPart, R_2n1_firstPart, splitPoints_firstPart] = adaptiveQuadrature(a, (a + b) / 2, n, groupBy, f, tau);
    [S_2n1_secondPart, S_n1_secondPart, R_2n1_secondPart, splitPoints_secondPart] = adaptiveQuadrature((a + b) / 2, b, n, groupBy, f, tau);
    
    S_2n1 = S_2n1_firstPart + S_2n1_secondPart;
    S_n1 = S_n1_firstPart + S_n1_secondPart;
    if abs(R_2n1_firstPart) >= abs(R_2n1_secondPart)
        R_2n1 = R_2n1_firstPart;
    else
        R_2n1 = R_2n1_secondPart;
    end
    
    splitPoints = [(a + b) / 2, splitPoints_firstPart, splitPoints_secondPart];
else
    splitPoints = [];
end

end

