function [plotPoints, interpolation_values] = BernsteinInterpolation(a, b, degree, f)
    % constants
    num_nodes = degree + 1;
    epsilon = 0.00000001;
    
    % check inputs' validity
    if length(a) > 1 || length(b) > 1
        error('Your extrems are not scalar values.');
    end
    if abs(a - b) < epsilon
        error('Your extrems cannot be equals.');
    end
    if degree < 0
        error('Degree of polynomial cannot be lower than 0.');
    end 
    if length(f) ~= num_nodes
        error('Your values do not correspont to the number of nodes declareted.');
    end
    
    % calculate plot's points
    plotPoints = getPlotPoints(a, b, num_nodes);

    % call bernsteinBasis
    interpolation_values = zeros(1, length(plotPoints));
    for i = 0 : degree
        base_values = bernsteinBasis(degree, a, b, i, plotPoints);
        interpolation_values = interpolation_values + base_values * f(i + 1);
    end
end

