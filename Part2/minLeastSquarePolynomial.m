function [plotPoints, func_values] = minLeastSquarePolynomial(nodes, f, n)
% n is the degree of polynomial

% check inputs
if length(n) > 1
    error('Degree value must be a scalar.');
end
if floor(n) ~= n
    error('Degree must be an integer.');
end

m = length(nodes);
if m < 1
    error('Number of nodes cannot be lower than 1.');
end
if n >= m
    error('Degree of polynomial must be lower than number of nodes');
end

if m ~= length(f)
    error('Values of function are not in the same number of nodes.');
end
if m ~= length(unique(nodes))
    error('There are at least two equal nodes.');
end

% find the least square solution
B = vander(nodes);
A = B(: , m : -1 : m - n); % A is a Vandermond matrix m x (n+1)
[a_min, min_value] = getLeastSquaresLinearSolution(A, f);

% log the solution of min least square problem
disp('The solution of the least square linear problem is: ');
disp(min_value);

% calculate polynomial values
plotPoints = getPlotPoints(min(nodes), max(nodes), m);
plotPoints = unique([plotPoints, nodes]);

func_values = ones(size(plotPoints)) * a_min(1);
for k = 1 : n
    func_values = func_values + a_min(k + 1) * (plotPoints .^ k);
end
end

