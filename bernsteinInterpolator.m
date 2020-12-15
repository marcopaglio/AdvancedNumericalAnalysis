function [plotPoints,interpolation_values] = bernsteinInterpolator(f, n, a, b)
    %symbolic function
    x = sym('x');
    
    nodes = (0: n) * (b - a) / n  + a;
    ordinates = subs(f(x), x, nodes);

    %call bernsteinBasis
    plotPoints = getPlotPoints(a, b, n);
    plotPoints = unique([plotPoints, nodes]);
    interpolation_values = zeros(1, length(plotPoints));
    for i = 0 : n
        base_values = bernsteinBasis(n, a, b, i, plotPoints);
        interpolation_values = interpolation_values + base_values * ordinates(i + 1);
    end
    
    %draw bernstein interpolation's function        
    plot(plotPoints, interpolation_values, 'DisplayName', strcat('n = ', int2str(n)));
    hold on;
    plot(nodes, ordinates, 'o', 'DisplayName', strcat(int2str(n+1), ' nodes'));
    legend('-DynamicLegend');
    hold on;
end

