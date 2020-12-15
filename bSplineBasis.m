function [bSpline_values] = bSplineBasis(p, nodes_used, B_i0, B_i1, plotPoints)
%check input's validity
    if length(p) > 1
        error('One or more scalar input values are not scalar.');
    end
    if floor(p) ~= p
        error('Degree of basis is not integer.');
    end
    if isempty(plotPoints)
        error('There are not points for plotting.');
    end
    if length(nodes_used) <= 1
        error('Number of nodes cannot be lower than 2.');
    end
    if p ~= length(nodes_used) - 2
        error('Your nodes are insufficient for building a %s degree basis.', p);
    end
    if length(nodes_used) ~= length(unique(nodes_used))
        error('There are at least two equal nodes.');
    end
    if p > 0 && (length(B_i0) ~= length(plotPoints) || length(B_i1) ~= length(plotPoints))
        error('Previous bases have not the same points of plot than current base.');
    end
    
    %calculate basis' values
    bSpline_values = zeros(1, length(plotPoints));
    if p == 0
        %step 0 of recursion
        indexesBetweenNodes = find(plotPoints >= nodes_used(1) & plotPoints < nodes_used(2));
        if isempty(indexesBetweenNodes)
            error('There are not any points for plotting 0-degree B-spline between yours nodes.');
        else
            bSpline_values(indexesBetweenNodes) = 1;
        end
    else
        bSpline_values = (plotPoints - nodes_used(1)) / (nodes_used(p + 1) - nodes_used(1)) .* B_i0 ...
            + (nodes_used(p + 2) - plotPoints) / (nodes_used(p + 2) - nodes_used(2)) .* B_i1;
    end

end

