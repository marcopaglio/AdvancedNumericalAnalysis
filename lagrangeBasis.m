function [base_values] = lagrangeBasis(num_nodes, nodes, j, plotPoints)
    %check input's validity
    if length(num_nodes) > 1 || length(j) > 1
        error('One or more scalar input values are not scalar.');
    end
    if isempty(plotPoints)
        error('There are not points for plotting.');
    end
    if floor(num_nodes) ~= num_nodes || floor(j) ~= j
        error('Number of nodes or index used are not integer.');
    end
    if num_nodes < 1
        error('Number of nodes cannot be lower than 1.');
    end
    if num_nodes ~= length(nodes)
        error('Your vector does not contain %s nodes', num_nodes);
    end
    if j < 1 || j > num_nodes
        error('Your index %s is out of range. Max value is %s.', j, num_nodes);
    end
    if length(nodes) ~= length(unique(nodes))
        error('There are at least two equal nodes.');
    end

    %calculate base's values
    base_values = zeros(1, length(plotPoints));                         %space preallocation
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