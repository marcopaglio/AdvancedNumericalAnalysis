function [plotPoints] = getPlotPoints(a, b, num_nodes) %change name in getEvaluetionPoints
    %constants
    granularity = 100;

    step = (b - a) / (num_nodes * granularity);
    plotPoints = a : step : b;
end

