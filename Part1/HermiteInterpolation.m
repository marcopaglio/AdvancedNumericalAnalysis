function [plotPoints, interpolation_values] = HermiteInterpolation(a, b, nodes, f, g)
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
        error('Function values do not correspont to the number of nodes declareted.');
    end
    if length(g) ~= num_nodes
        error('Derived function values do not correspont to the number of nodes declareted.');
    end
    
    % calculate plot's points
    plotPoints = getPlotPoints(a, b, num_nodes);
    plotPoints = unique([plotPoints, nodes]);

    % call hermiteBasis
    interpolation_values = zeros(1, length(plotPoints));
    for j = 1 : num_nodes
        [u_base_values, v_base_values] = hermiteBasis(nodes, j, plotPoints);
        interpolation_values = interpolation_values + u_base_values * f(j) + v_base_values * g(j);
    end
end

