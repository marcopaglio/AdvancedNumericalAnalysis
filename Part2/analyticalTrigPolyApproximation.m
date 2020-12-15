function [analytical_func_values] = analyticalTrigPolyApproximation(x, f, plotPoints, degree)
% calculate the trigonometric polynomial approximation analytically
% when nodes are equidistants

% check inputs
if length(degree) > 1
    error('Degree value must be a scalar.');
end
if floor(degree) ~= degree
    error('Degree must be an integer.');
end

num_nodes = length(x);
if num_nodes < 1
    error('Number of nodes cannot be lower than 1.');
end
if degree > num_nodes
    error('Dimension of vector space must be lower than number of nodes');
end

if num_nodes ~= length(f)
    error('Values of function are not in the same number of nodes.');
end
if num_nodes ~= length(unique(x))
    error('There are at least two equal nodes.');
end

if isempty(plotPoints)
    error('There are not points for plotting.');
end

% check nodes are equidistants
if num_nodes > 1
    x = sort(x);
    epsilon = 0.000000001;
    distance = x(2) - x(1);
    for j = 3 : num_nodes
        if abs(x(j) - x(j - 1) - distance) > epsilon
            error('Your nodes are not equidistants. Cannot use this method.');
        end
    end
end

% memorize n even or odd with a boolean var
isOdd = true(1);                            % true == 1
if mod(degree, 2) == 0
    isOdd = false(1);                       % false == 0
end

n = floor(degree / 2);
num_iter = n;
if isOdd == 0
    num_iter = n - 1;
end

% calculate parameters analytically
ab_k = zeros(degree, 1);

ab_k(1) = sum(f) / num_nodes;

for k = 1 : num_iter
    ab_k(2 * k) = sum(f .* cos(k * x)) * 2 / num_nodes;
    ab_k(2 * k + 1) = sum(f .* sin(k * x)) * 2 / num_nodes;
end

if isOdd == 0
    ab_k(degree) = sum(f .* cos(n * x)) / num_nodes;
end


% calculate function values analytically
analytical_func_values = ones(size(plotPoints)) * ab_k(1);

for k = 1 : num_iter
    analytical_func_values = analytical_func_values + ...
                            ab_k(2 * k) * cos(k * plotPoints) + ...
                            ab_k(2 * k + 1) * sin(k * plotPoints);
end

if isOdd == 0
    analytical_func_values = analytical_func_values + ...
                             ab_k(degree) * cos(n * plotPoints);
end







% RESOLUTION WITH NORMAL EQUATION A'A x = A'b
% % degree is the dimension of vector space
% 
% % check inputs
% if length(degree) > 1
%     error('Degree value must be a scalar.');
% end
% if floor(degree) ~= degree
%     error('Degree must be an integer.');
% end
% 
% m = length(x);
% if m < 1
%     error('Number of nodes cannot be lower than 1.');
% end
% if degree > m
%     error('Dimension of vector space must be lower than number of nodes');
% end
% 
% if m ~= length(f)
%     error('Values of function are not in the same number of nodes.');
% end
% if m ~= length(unique(x))
%     error('There are at least two equal nodes.');
% end
% 
% % memorize n even or odd with a boolean var
% isOdd = true(1);                            % true == 1
% if mod(degree, 2) == 0
%     isOdd = false(1);                       % false == 0
% end
% 
% % find the least square solution
% A = ones(m, degree);
% n = floor(degree / 2);
% 
% for k = 1 : n - 1
%     A(:, 2 * k) = cos(k * x);
%     A(:, 2 * k + 1) = sin(k * x);
% end
% if isOdd == 1
%     A(:, 2 * n) = cos(n * x);
%     A(:, 2 * n + 1) = sin(n * x);
% else
%     A(:, degree) = cos(n * x);
% end
% 
% [a_min, min_value] = getMinNormalEquation(A, f);
% 
% % log the solution of min least square problem
% disp('The value ||Ax - f||_2 is of normal equation is: ');
% disp(min_value);
% 
% % USE ONLY IF plotPoints is not an input
% % % calculate polynomial values
% % plotPoints = getPlotPoints(min(nodes), max(nodes), m);
% % plotPoints = unique([plotPoints, nodes]);
% 
% analytical_func_values = ones(size(plotPoints)) * a_min(1);
% for k = 1 : n - 1
%     analytical_func_values = analytical_func_values + a_min(2 * k) * cos(k * plotPoints) + ...
%                                 a_min(2 * k + 1) * sin(k * plotPoints);
% end
% if isOdd == 1
%     analytical_func_values = analytical_func_values + a_min(2 * n) * cos(n * plotPoints) + ...
%                                 a_min(2 * n + 1) * sin(n * plotPoints);
% else
%     analytical_func_values = analytical_func_values + a_min(degree) * cos(degree / 2 * plotPoints);
% end




% ANALYTICALLY DIRECT FORM, SOMETHING WRONG
% % calculate the trigonometric polynomial approximation analytically
% % when nodes are equidistants
% 
% %FIXME something wrong 
% 
% % check inputs
% if length(degree) > 1
%     error('Degree value must be a scalar.');
% end
% if floor(degree) ~= degree
%     error('Degree must be an integer.');
% end
% 
% num_nodes = length(x);
% if num_nodes < 1
%     error('Number of nodes cannot be lower than 1.');
% end
% if degree > num_nodes
%     error('Dimension of vector space must be lower than number of nodes');
% end
% 
% if num_nodes ~= length(f)
%     error('Values of function are not in the same number of nodes.');
% end
% if num_nodes ~= length(unique(x))
%     error('There are at least two equal nodes.');
% end
% 
% if isempty(plotPoints)
%     error('There are not points for plotting.');
% end
% 
% % check nodes are equidistants
% x = sort(x);
% epsilon = 0.000000001;
% distance = x(2) - x(1);
% for j = 3 : num_nodes
%     if abs(x(j) - x(j - 1) - distance) > epsilon
%         error('Your nodes are not equidistants. Cannot use this method.');
%     end
% end
% 
% n = floor(degree / 2);
% 
% analytical_func_value = zeros(size(plotPoints));
% for i = 1 : num_nodes
%     analytical_func_value = analytical_func_value + f(i);
% end
% analytical_func_value = analytical_func_value / (num_nodes + 1);
% 
% second_part_value = zeros(size(plotPoints));
% third_part_value = zeros(size(plotPoints));
% for k = 1 : n - 1
%     for i = 1 : num_nodes
%         second_part_value = second_part_value + (f(i) * cos(k * x(i)));
%         third_part_value = third_part_value + (f(i) * sin(k * x(i))); 
%     end
%     second_part_value = second_part_value .* cos(k * plotPoints);
%     third_part_value = third_part_value .* sin(k * plotPoints);
% end
% analytical_func_value = analytical_func_value + ((second_part_value + third_part_value) * 2 / (num_nodes + 1));
% 
% fourth_part_value = zeros(size(plotPoints));
% if mod(degree, 2) == 0
%     for i = 1 : num_nodes
%         fourth_part_value = fourth_part_value + (f(i) * cos(n * x(i)));
%     end
%     fourth_part_value = fourth_part_value .* cos(n * plotPoints);
%     analytical_func_value = analytical_func_value + (fourth_part_value / (num_nodes + 1));
% else
%     fifth_part_value = zeros(size(plotPoints));
%     for i = 1 : num_nodes
%         fourth_part_value = fourth_part_value + (f(i) * cos(n * x(i)));
%         fifth_part_value = fifth_part_value + (f(i) * sin(n * x(i)));
%     end
%     fourth_part_value = fourth_part_value .* cos(n * plotPoints);
%     fifth_part_value = fifth_part_value .* sin(n * plotPoints);
%     analytical_func_value = analytical_func_value + ((fourth_part_value + fifth_part_value) * 2 / (num_nodes + 1));
% end

end

