function [integralValue] = NewtonCotes(a, b, nodes, f)
    % constants
    epsilon = 0.000000001;

    % check inputs' validity
    num_nodes = length(nodes);
    if num_nodes < 1
        error('There must be at least 1 node.');
    end
    if (size(nodes, 1) == num_nodes && size(nodes, 2) ~= 1) || ...
       (size(nodes, 1) ~= 1 && size(nodes, 2) == num_nodes)
        error('Nodes input is not a vector.');
    end
    if length(nodes) ~= length(unique(nodes))
        error('There are at least two equal nodes');
    end
    if num_nodes ~= length(f)
        error('Your function values are not in the same number of your nodes.');
    end
    if (size(f, 1) == num_nodes && size(f, 2) ~= 1) || ...
       (size(f, 1) ~= 1 && size(f, 2) == num_nodes)
        error('Function values input is not a vector.');
    end
    if length(a) ~= 1 || length(b) ~= 1
        error('Same inputs are not scalar values.');
    end
    if abs(a - b) < epsilon
        error('Your extremes cannot be equals.');
    end
    if a > b
        % swap extremes
        a = a + b;
        b = a - b;
        a = a - b;
    end
    if nodes > b
        error(strcat('Nodes must be lower than ', num2str(b), '.'));
    end
    if nodes < a
        error(strcat('Nodes must be greater than ', num2str(a), '.'));
    end

    % check nodes are equidistants
    if num_nodes > 1
        [nodes, newIndexes] = sort(nodes);
        distance = nodes(2) - nodes(1);
        for j = 3 : num_nodes
            if abs(nodes(j) - nodes(j - 1) - distance) > epsilon
                error('Your nodes are not equidistants. Cannot use this method.');
            end
        end
        f = f(newIndexes);
    end

    weights = getWeights(a, b, nodes, 2);
    integralValue = 0;
    for j = 1 : num_nodes
        integralValue = integralValue + weights(j) * f(j);
    end
end