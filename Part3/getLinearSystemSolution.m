function [x] = getLinearSystemSolution(R, b)
if rank(R) == min(size(R)) && size(R, 1) == size(R, 2)
    x = inv(R) * b;
else
    x = R \ b;
end
end

