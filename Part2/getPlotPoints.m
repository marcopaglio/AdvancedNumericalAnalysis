function [plotPoints] = getPlotPoints(a, b, num_nodes)
    %constants
    granularity = 20;

    step = (b - a) / ((num_nodes - 1) * granularity);
    plotPoints = a : step : b;
end