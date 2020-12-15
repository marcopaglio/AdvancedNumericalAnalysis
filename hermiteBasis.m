function [u_base_values, v_base_values] = hermiteBasis(num_nodes, nodes, j, plotPoints)
    %get lagrange interpolation's values
    lagrange_base_values = lagrangeBasis(num_nodes, nodes, j, plotPoints);

    %calculate v bases
    diff_vector = plotPoints - nodes(j);
    v_base_values = diff_vector .* (lagrange_base_values.^2); % (x - x_j) * l_j^2

    %calculate u bases
    derive_denominator = 1;
    derive_numerator = 0;

    %              n                    n
    % D(Lj)(Xj) = SUM       [        PRODUCT        (Xj - Xk)  ]
    %         i = 1; i =! j   k = 1; k != i; k != i

    for i = 1 : num_nodes
        if i ~= j
            derive_term_value = 1;
            for k = 1 : num_nodes
                if k ~= i && k ~= j
                    derive_term_value = derive_term_value * (nodes(j) - nodes(k));
                end
            end
            derive_numerator = derive_numerator + derive_term_value;

            %calculate denominator once
            derive_denominator = derive_denominator * (nodes(j) - nodes(i));
        end
    end
    u_base_values = (1 - 2 * (derive_numerator / derive_denominator) * diff_vector) .* (lagrange_base_values.^2);
end

