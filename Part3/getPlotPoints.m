function [plotPoints] = getPlotPoints(a, b, num_nodes)
    % constants
    granularity = 20;
    epsilon = 0.00000001;
    
    % check inputs' validity
    if length(a) > 1 || length(b) > 1 || length(num_nodes) > 1
        error('At least one of scalar input values is not scalar.');
    end
    if abs(a - b) < epsilon
        error('Your extrems cannot be equals.');
    end
    if num_nodes < 1
        error('Number of nodes cannot be lower than 1.');
    end
    
    if num_nodes == 1
        step = (b - a) / granularity;
    else
        step = (b - a) / ((num_nodes - 1) * granularity);
    end
    
    plotPoints = a : step : b;
end