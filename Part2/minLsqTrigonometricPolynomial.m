function [plotPoints, func_values] = minLsqTrigonometricPolynomial(nodes, f, dim)
% dim is the dimension of vector space

% check inputs
if length(dim) > 1
    error('Degree value must be a scalar.');
end
if floor(dim) ~= dim
    error('Degree must be an integer.');
end

m = length(nodes);
if m < 1
    error('Number of nodes cannot be lower than 1.');
end
if dim > m
    error('Dimension of vector space must be lower than number of nodes');
end

if m ~= length(f)
    error('Values of function are not in the same number of nodes.');
end
if m ~= length(unique(nodes))
    error('There are at least two equal nodes.');
end

% memorize n even or odd with a boolean var
isOdd = true(1);                            % true == 1
if mod(dim, 2) == 0
    isOdd = false(1);                       % false == 0
end

% find the least square solution
A = ones(m, dim);
n = floor(dim / 2);

for k = 1 : n - 1
    A(:, 2 * k) = cos(k * nodes);
    A(:, 2 * k + 1) = sin(k * nodes);
end
if n > 0
    if isOdd == 1
        A(:, 2 * n) = cos(n * nodes);
        A(:, 2 * n + 1) = sin(n * nodes);
    else
        A(:, dim) = cos(n * nodes);
    end
end

[a_min, min_value] = getLeastSquaresLinearSolution(A, f);

% log the solution of min least square problem
disp('The solution of the least square linear problem is: ');
disp(min_value);

% calculate polynomial values
plotPoints = getPlotPoints(min(nodes), max(nodes), m);
plotPoints = unique([plotPoints, nodes]);

func_values = ones(size(plotPoints)) * a_min(1);
for k = 1 : n - 1
    func_values = func_values + a_min(2 * k) * cos(k * plotPoints) + ...
                                a_min(2 * k + 1) * sin(k * plotPoints);
end
if n > 0
    if isOdd == 1
        func_values = func_values + a_min(2 * n) * cos(n * plotPoints) + ...
                                    a_min(2 * n + 1) * sin(n * plotPoints);
    else
        func_values = func_values + a_min(dim) * cos(dim / 2 * plotPoints);
    end
end


end


