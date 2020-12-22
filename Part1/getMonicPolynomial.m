function [plotPoints, plotValues] = getMonicPolynomial(nodes, a, b)
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
    
    % calculate plot's points
    plotPoints = getPlotPoints(a, b, num_nodes);

    %construct values' interpolation
    plotValues = zeros(1, length(plotPoints));
    for point = 1 : length(plotPoints)
        numerator = 1;
        for i = 1 : num_nodes
            numerator = numerator * (plotPoints(point) - nodes(i));
        end
        plotValues(point) = numerator; 
    end

end

