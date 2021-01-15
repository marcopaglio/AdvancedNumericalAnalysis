addpath(./Parte1);

function [plotPoints, func_values, min_value] = minLeastSquarePolynomial(nodes, f, n)
    % n is the degree of polynomial

    % check inputs' validity
    if length(n) > 1
        error('Degree input must be a scalar value.');
    end
    if floor(n) ~= n
        error('Degree input must be an integer value.');
    end
    m = length(nodes);
    if m < 1
        error('Number of nodes cannot be lower than 1.');
    end
    if n >= m
        error('Degree of polynomial must be lower than number of nodes');
    end
    if m ~= length(unique(nodes))
        error('There are at least two equal nodes.');
    end
    if m ~= length(f)
        error('Values of function are not in the same number of nodes.');
    end

    % create matrix A
    B = vander(nodes);
    A = B(: , m : -1 : m - n); % A is a Vandermond matrix m x (n+1)
    
    % find the least square solution
    [a_min, min_value] = getLeastSquaresLinearSolution(A, f, 1);

    % calculate polynomial values
    plotPoints = getPlotPoints(min(nodes), max(nodes), m);
    plotPoints = unique([plotPoints, nodes]);

    func_values = ones(size(plotPoints)) * a_min(1);
    for k = 1 : n
        func_values = func_values + a_min(k + 1) * (plotPoints .^ k);
    end
end

