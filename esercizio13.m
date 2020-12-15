% Scrivere un programma di tipo function che assegnato un vettore di 5
% nodi costruisce e disegna la B-spline di grado 3 di nodi corrispondenti.

%constants
num_nodes = 5;
nodes = [0, 0.001, 0.4, 0.5, 1];
p_max = 3;

%calculate points of plot
plotPoints = getPlotPoints(min(nodes), max(nodes), num_nodes);

%calculate number of basis
num_basis = 0;
for p = 0: p_max
    num_basis = num_basis + (num_nodes - p - 1 > 0) * (num_nodes - p - 1);
    %add num_nodes - p - 1 only if it is greater than 0
end
B_splines = zeros(num_basis, length(plotPoints));

base_index = 0;
prev_base_index = 0;
for p = 0 : p_max
    max_i_used = num_nodes - p - 1;
    %build new basis only if max_i_used > 0
    if max_i_used > 0
        figure;
        
        step_i = p + 1;
        for i = 1 : max_i_used
            nodes_used = nodes(i: i + step_i);
            B_i0 = B_splines(prev_base_index + i, :);                                              %B_{p-1,i}
            B_i1 = B_splines(prev_base_index + i + 1, :);                                          %B_{p-1,i-1}
            B_splines(base_index + i, :) = bSplineBasis(p, nodes_used, B_i0, B_i1, plotPoints);    %B_{p,i}
            
            %draw p-degree-bases
            basis_name = strcat('B_{', int2str(p), ', ', int2str(i-1), '}(x)');
            plot(plotPoints, B_splines(base_index + i, :), 'DisplayName', basis_name);
            hold on;
        end
        
        %draw on nodes
        plot(nodes, zeros(1, num_nodes), '+', 'color', 'y', 'LineWidth', 1.5, 'HandleVisibility', 'off');
        legend('-DynamicLegend');
        title(strcat(int2str(p), '-degree B-spline basis'));
        xlabel('x');
        xlim([min(plotPoints)- 0.1 max(plotPoints) + 0.1])
        ylim([-1 2])
                
        %update base indexes
        prev_base_index = base_index;
        base_index = base_index + max_i_used;
    else
        error_message = strcat('Nodes are insufficient to build a ', int2str(p), '-degree B-spline!');
        error(error_message);
    end
end