function [plotPoints, interpolation_values] = LagrangeInterpolation(a, b, nodes, f)
    % constants
    num_nodes = length(nodes);
    epsilon = 0.00000001;
    
    % check inputs' validity
    if length(a) > 1 || length(b) > 1
        error('Your extrems are not scalar values.');
    end
    if abs(a - b) < epsilon
        error('Your extrems cannot be equals.');
    end
    if num_nodes < 1
        error('Number of nodes cannot be lower than 1.');
    end
    if length(f) ~= num_nodes
        error('Your values do not correspont to the number of nodes declareted.');
    end
    
    % calculate plot's points
    plotPoints = getPlotPoints(a, b, num_nodes);
    plotPoints = unique([plotPoints, nodes]);

    % call lagrangeBasis
    interpolation_values = zeros(1, length(plotPoints));
    for j = 1 : num_nodes
        base_values = lagrangeBasis(nodes, j, plotPoints);
        interpolation_values = interpolation_values + base_values * f(j);
    end
end

