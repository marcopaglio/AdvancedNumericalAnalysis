function [plotPoints, plotValues] = monicPolynomial(num_nodes, nodes, leftExtreme, rightExtreme)
%constants
granularity = 100;

%construct points' interpolation
step = (rightExtreme - leftExtreme) / (num_nodes * granularity);
plotPoints = leftExtreme : step : rightExtreme;

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

