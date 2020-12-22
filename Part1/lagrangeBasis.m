function [base_values] = lagrangeBasis(nodes, j, plotPoints)
    % constants
    num_nodes = length(nodes);
    
    % check inputs' validity
    if length(j) > 1
        error('Input j must be a scalar value.');
    end
    if floor(j) ~= j
        error('Number of nodes or index used is not integer.');
    end
    if num_nodes < 1
        error('Number of nodes cannot be lower than 1.');
    end
    if j < 1 || j > num_nodes
        error('Your index %s is out of range. Max value is %s.', j, num_nodes);
    end
    if length(nodes) ~= length(unique(nodes))
        error('There are at least two equal nodes.');
    end
    if isempty(plotPoints)
        error('There are not points for plotting.');
    end

    % calculate base's values
    base_values = zeros(1, length(plotPoints));
    denominator = 1;
    for i = 1 : num_nodes
        if i ~= j
            denominator = denominator * (nodes(j) - nodes(i));
        end
    end
    for point = 1 : length(plotPoints)
        numerator = 1;
        for i = 1 : num_nodes
            if i ~= j
                numerator = numerator * (plotPoints(point) - nodes(i));
            end
        end
        base_values(point) = numerator / denominator;
    end
end