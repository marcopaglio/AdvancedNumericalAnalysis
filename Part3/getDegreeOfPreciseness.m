function [degree] = getDegreeOfPreciseness(a, b, nodes)
% check inputs
num_nodes = length(nodes);
if num_nodes < 1
    error('There must be at least 1 nodes.');
end
if (size(nodes, 1) == num_nodes && size(nodes, 2) ~= 1) || ...
   (size(nodes, 1) ~= 1 && size(nodes, 2) == num_nodes)
    error('Nodes input is not a vector.');
end
if length(nodes) ~= length(unique(nodes))
    error('There are at least two equal nodes');
end

if length(a) ~= 1 || length(b) ~= 1
    error('Same inputs are not scalar values.');
end
if a == b
    error('Your extremes could not be equals.');
end

if a > b
    % swap extremes
    a = a + b;
    b = a - b;
    a = a - b;
end

n = num_nodes - 1;

epsilon = 0.000000001;
isEqual = true(1);
degree = 0;
while isEqual
    f = nodes .^ degree;
    integralValue = NewtonCotes(a, b, nodes, f);
    realIntegralValue = (b ^ (degree + 1) - a ^ (degree + 1)) / (degree + 1);
    distance = abs(realIntegralValue - integralValue);
    if distance >= epsilon
        isEqual = ~isEqual;
        degree = degree - 1;
    else
        if degree == 2 * n + 1
            isEqual = ~isEqual;
        else
            degree = degree + 1;
        end
    end
end

end

