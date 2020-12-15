function [R_2n1, S_2n1, S_n1] = getRungeError(a, b, n, groupBy, f)
% a, b externals of function f
% n is number of nodes - 1
% groupBy is number of nodes used in Newton-Cotes formulas

% check inputs
if length(a) ~= 1 || length(b) ~= 1 || length(n) ~= 1 || length(groupBy) ~= 1
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

k = 0 : n;
nodes = a + k * (b - a) / n;
funcSamples = f(nodes);

% call close Newton-Cotes formula and compose values as sum
S_2n1 = 0;
S_n1 = 0;
for i = 1 : m_n1
    minIndex = (i - 1) * 2 * (groupBy - 1) + 1;
    maxIndex = i * 2 * (groupBy - 1) + 1;
    middleIndex = (minIndex + maxIndex) / 2;
    
    S_2n1 = S_2n1 + NewtonCotes(nodes(minIndex), nodes(middleIndex), ...
                                    nodes(minIndex : middleIndex), funcSamples(minIndex : middleIndex))...
                  + NewtonCotes(nodes(middleIndex), nodes(maxIndex), ...
                                    nodes(middleIndex : maxIndex), funcSamples(middleIndex : maxIndex));
                                
    S_n1 = S_n1 + NewtonCotes(nodes(minIndex), nodes(maxIndex), ...
                                    nodes(minIndex : 2 : maxIndex), funcSamples(minIndex : 2 : maxIndex));
                                
end

% calcuate Runge error
R_2n1 = (S_2n1 - S_n1) / ((2 * (groupBy - 1)) ^ 2 - 1);

end

