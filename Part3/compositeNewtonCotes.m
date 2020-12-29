function [integralValue, degree, plotPoints, interpolationValues] = compositeNewtonCotes(n, m, nodes, funcSamples, a, b)
    % check inputs' validity
    if length(n) ~= 1 || length(m) ~= 1
        error('At least one of your scalar inputs is not a scalar value.');
    end
    if n ~= floor(n) || n < 1
        error('Input n must be a integer value greater than 1.');
    end
    if m ~= floor(m) || m < 1
        error('Input m must be a integer value greater than 1.');
    end

    plotPoints = getPlotPoints(a, b, length(nodes));
    plotPoints = unique([plotPoints, nodes]);

    % call close Newton-Cotes formula and compose values as sum
    integralValue = 0;
    interpolationValues = zeros(1, length(plotPoints));
    v = zeros(1, m);
    for i = 1 : m
        minIndex = (i - 1) * n + 1;
        maxIndex = i * n + 1;

        integralValue = integralValue + NewtonCotes(nodes(minIndex), nodes(maxIndex), ...
                                        nodes(minIndex : maxIndex), funcSamples(minIndex : maxIndex));

        % call lagrangeBasis for interpolation
        indexes = find(plotPoints >= nodes(minIndex) & plotPoints < nodes(maxIndex));
        if i == m
           indexes = [indexes, find(plotPoints == nodes(maxIndex))];
        end
        for j = 1 : n + 1
            baseValues = lagrangeBasis(nodes(minIndex : maxIndex), j, plotPoints(indexes));
            interpolationValues(indexes) = interpolationValues(indexes) + baseValues * funcSamples(minIndex - 1 + j);
        end

        % study of degree of preciseness
        v(i) = getDegreeOfPreciseness(nodes(minIndex), nodes(maxIndex), nodes(minIndex : maxIndex));
    end
    degree = min(v);
end

