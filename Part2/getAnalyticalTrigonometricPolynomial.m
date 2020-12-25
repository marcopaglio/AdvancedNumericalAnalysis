function [analytical_func_values] = getAnalyticalTrigonometricPolynomial(x, f, degree, plotPoints)
    % calculate the trigonometric polynomial approximation analytically
    % when nodes are equidistants in [0,2pi]
    
    % PRECISAZIONE: I nodi devono essere equidistanti in un qualsiasi
    %               intervallo lungo 2pi, ovvero [0+c, 2pi+c] con c in R.
    % OBIETTIVO: Il calcolo analitico della soluzione è preciso rispetto al
    %            calcolo matriciale. 
    
    % constants
    epsilon = 0.000000001;

    % check inputs' validity
    if length(degree) > 1
        error('Degree input must be a scalar value.');
    end
    if floor(degree) ~= degree
        error('Degree input must be an integer value.');
    end
    num_nodes = length(x);
    if num_nodes < 1
        error('Number of nodes cannot be lower than 1.');
    end
    if degree > num_nodes
        error('Dimension of vector space must be lower than number of nodes');
    end
    if num_nodes ~= length(unique(x))
        error('There are at least two equal nodes.');
    end
    if num_nodes ~= length(f)
        error('Values of function are not in the same number of nodes.');
    end
    if isempty(plotPoints)
        error('There are not points for plotting.');
    end

    % check if nodes are equidistants
    if num_nodes > 1
        x = sort(x);
        distance = x(2) - x(1);
        for j = 3 : num_nodes
            if abs(x(j) - x(j - 1) - distance) > epsilon
                error('Your nodes are not equidistants. Cannot use this method.');
            end
        end
        if abs((x(num_nodes) - x(1)) + distance - 2 * pi) > epsilon
            error('Your nodes are not positioned in a [0,2pi] range. Cannot use this method.');
        end
    end

    % memorize n even or odd with a boolean var
    isOdd = true(1);                            % true == 1
    if mod(degree, 2) == 0
        isOdd = false(1);                       % false == 0
    end

    n = floor(degree / 2);
    num_iter = n;
    if isOdd == 0
        num_iter = n - 1;
    end
    
    % memorize if degree is equal to num_nodes (matrix A is square)
    isSquare = false(1);                        % false == 0
    if num_nodes == degree
        isSquare = true(1);                     % true == 1
    end

    % calculate parameters analytically
    ab_k = zeros(degree, 1);

    ab_k(1) = sum(f) / num_nodes;
    for k = 1 : num_iter
        ab_k(2 * k) = sum(f .* cos(k * x)) * 2 / num_nodes;
        ab_k(2 * k + 1) = sum(f .* sin(k * x)) * 2 / num_nodes;
    end
    if isOdd == 0
        ab_k(degree) = sum(f .* cos(n * x)) / num_nodes;
        if isSquare == 0
            ab_k(degree) = ab_k(degree) * 2; 
        end
    end

    % calculate function values analytically
    analytical_func_values = ones(size(plotPoints)) * ab_k(1);

    for k = 1 : num_iter
        analytical_func_values = analytical_func_values + ...
                                ab_k(2 * k) * cos(k * plotPoints) + ...
                                ab_k(2 * k + 1) * sin(k * plotPoints);
    end

    if isOdd == 0
        analytical_func_values = analytical_func_values + ...
                                 ab_k(degree) * cos(n * plotPoints);
    end
end

