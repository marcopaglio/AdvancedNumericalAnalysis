function [base_values] = bernsteinBasis(degree, a, b, i, plotPoints)
    %check input's validity
    if length(degree) > 1 || length(i) > 1 || length(a) > 1 || length(b) > 1
        error('One or more scalar input values are not scalar.');
    end
    if isempty(plotPoints)
        error('There are not points for plotting.');
    end
    if floor(degree) ~= degree || floor(i) ~= i
        error('Degree or index used are not integer.');
    end
    if degree < 0
        error('Degree of polynomial cannot be lower than 0.');
    end
    if i < 0 || i > degree
        error('Your index %s is out of range. Max value is %s.', i, degree);
    end
    if a >= b
        error('Right extreme must be bigger than left extreme.');
    end

    %calculate base's values
    binomialCoefficient = nchoosek(degree, i);
    denumerator = (a - b)^degree;
    numerators = (a - plotPoints).^i .* (plotPoints - b).^(degree - i);
    base_values = numerators * binomialCoefficient / denumerator;
end

