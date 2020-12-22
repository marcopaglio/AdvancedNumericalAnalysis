% Utilizzando la function dell'esercizio 8 verificare (in modo grafico) le
% proprieta' delle basi di Hermite {Uj ; Vj} per j da 1 a n + 1
% (si rappresentino graficamente le "direzioni" interpolate).

% constants
num_nodes = 3;
nodes = 1 : num_nodes;
epsilon0 = (b - a) / 100;
epsilon1 = epsilon0 / sqrt(2);

%calculate interpolation's points
a = min(nodes);
b = max(nodes);
plotPoints = getPlotPoints(a, b, num_nodes);
plotPoints = unique([plotPoints, nodes]);

u_base_values_sum = zeros(1, length(plotPoints));
v_base_values_sum = zeros(1, length(plotPoints));
u_bases = zeros(length(num_nodes), length(plotPoints));
v_bases = zeros(length(num_nodes), length(plotPoints));

figure;
for j = 1 : num_nodes
    % call hermiteBasis
    [u_bases(j, :), v_bases(j, :)] = hermiteBasis(nodes, j, plotPoints);
    u_base_values_sum = u_base_values_sum + u_bases(j, :);
    v_base_values_sum = v_base_values_sum + v_bases(j, :);
    
    % draw U basis
    plot(plotPoints, u_bases(j, :), '-.', 'DisplayName', strcat('U_{', int2str(j), '}(x)'));
    hold on;
end
plot(plotPoints, u_base_values_sum, 'DisplayName', 'u bases sum');
hold on;
plot(nodes, zeros(1, num_nodes), ' +', 'LineWidth', 1.5, 'color', 'y', 'DisplayName', 'nodes');

legend('-DynamicLegend');
title(strcat('U Hermite Bases for ', int2str(num_nodes), ' nodes'));
xlabel('x');
ylim([-1 2]);

% draw V basis
for j = 1 : num_nodes
    figure;
    th = 'th';
    if j == 1
        th = 'st';
    end
    if j == 2
        th = 'nd';
    end
    if j == 3
        th = 'rd';
    end
    
    plot(plotPoints, v_bases(j, :));
    hold on;
    % draw tangents
    for index_node = 1 : num_nodes
        node = nodes(index_node);
        abscissas_tangent = [node - epsilon0, node, node + epsilon0];
        % tangent = 0 default
        ordinates_tangent = zeros(1, length(abscissas_tangent));
        if j == index_node
            %tangent = 1
            abscissas_tangent = [node - epsilon1, node, node + epsilon1];
            ordinates_tangent = [-epsilon1, 0, epsilon1];
        end
        plot(abscissas_tangent, ordinates_tangent, 'color', 'black', 'LineWidth', 1.3, 'HandleVisibility', 'off');
        hold on;
    end
    
    title(strcat(int2str(j),'^{', th, '} Hermite Basis for ', int2str(num_nodes), ' nodes'));
    ylabel(strcat('V_{', int2str(j),'}(x)'));
    xlabel('x');
    axis equal;
end

hold off;