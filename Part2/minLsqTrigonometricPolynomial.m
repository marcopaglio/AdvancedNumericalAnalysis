function [plotPoints, func_values, min_value] = minLsqTrigonometricPolynomial(nodes, f, dim)
    % dim is the dimension of vector space

    % check inputs' validity
    if length(dim) > 1
        error('Degree input must be a scalar value.');
    end
    if floor(dim) ~= dim
        error('Degree input must be an integer value.');
    end
    m = length(nodes);
    if m < 1
        error('Number of nodes cannot be lower than 1.');
    end
    if dim > m
        error('Dimension of vector space must be lower than number of nodes');
    end
    if m ~= length(unique(nodes))
        error('There are at least two equal nodes.');
    end
    if m ~= length(f)
        error('Values of function are not in the same number of nodes.');
    end

    % memorize n even or odd with a boolean var
    isOdd = true(1);                            % true == 1
    if mod(dim, 2) == 0
        isOdd = false(1);                       % false == 0
    end

    % create matrix A 
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

    % find the least square solution
    [a_min, min_value] = getLeastSquaresLinearSolution(A, f, 1);

    % calculate trigonometric polynomial values
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


