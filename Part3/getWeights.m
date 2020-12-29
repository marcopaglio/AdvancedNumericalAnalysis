function [weights] = getWeights(a, b, nodes, type)
    % type == 0 => use trapz to approsimate integral of Lagrange basis
    %      == 1 => use Method  of  undetermined  coefficients 
    %      == 2 => use 1 until maxDimVander, then use 0

    % constants
    maxDimVander = 10;

    % check inputs' validity
    n = length(nodes);
    if n < 1
        error('Your vector is empty. There must be at least 1 node.');
    end
    if n ~= length(unique(nodes))
        error('There are at least two equal nodes.');
    end
    if length(a) ~= 1 || length(b) ~= 1
        error('Same inputs are not scalar values.');
    end
    if a == b
        error('Your extremes could not be equals.');
    end
    if a > b
        % swap extremes
        a = a + b;
        b = a - b;
        a = a - b;
    end
    if nodes > b
        error(strcat('Nodes must be lower than ', num2str(b), '.'));
    end
    if nodes < a
        error(strcat('Nodes must be greater than ', num2str(a), '.'));
    end
    if length(type) ~= 1
        error('Second parameter must be a single number.');
    end
    
    if type == 2
        if n <= maxDimVander
            type = 1;
        else
            type = 0;
        end
    end

    switch type
        case 0
            % WARNING %
            % Values resulting from this method 
            % is not really correct with n small
            plotPoints = getPlotPoints(a, b, n);
            plotPoints = unique([plotPoints, nodes, a, b]);
            weights = zeros(1, n);
            for j = 1 : n
                baseValues = lagrangeBasis(nodes, j, plotPoints);
                weights(j) = trapz(plotPoints, baseValues);
            end

        case 1
            % WARNING %
            % Values resulting from this method 
            % is not really correct with n big
            % resolve Aw=c
            vanderNodes = vander(nodes);

            A = zeros(n);
            c = zeros(n, 1);
            for k = 1 : n
                A(k, 1: n) = vanderNodes(1: n, n + 1 - k);
                c(k) = (b ^ k - a ^ k) / k;
            end

            weights = getLinearSystemSolution(A, c);

        case 2
            error('Something wrong in convertion from type 2 to another.');

        otherwise
            errorText = compose("Type inserted is not valid. \nPlease, choose between " + ...
                                "native (0) " + ...
                                "or undetermined  coefficients (1) " + ...
                                "or best choice (2) " + ...
                                "methods.");
            error(errorText);
    end
end

