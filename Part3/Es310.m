% Assegnato il vettore uniforme x = [x0;...; xn] e le funzioni sin(x); con x
% in [0,2pi], e^x; con x in [-4; 4], 1/1+x^2 ; con x in [-5; 5] si utilizzi
% la function dell'esercizio 9 al variare n = 2:2:10 e si confronti i 
% risultati ottenuti con gli errori esatti.

% constants
groupBy = 2;
maxN = 10;
step = 2;

a1 = 0;
b1 = 2* pi;
f1 = @(x) sin(x);

a2 = -4;
b2 = 4;
f2 = @(x) exp(x);

a3 = -5;
b3 = 5;
f3 = @(x) 1 ./ (1 + x .^ 2);

A = [a1, a2, a3];
B = [b1, b2, b3];
F = {f1, f2, f3};

for i = 1 : length(F)
    a = A(i);
    b = B(i);
    f = F{i};
    
    % calculate real integral
    realIntegralValue = integral(f, a, b);
    
    % informations
    n_values = 2 : step : maxN;
    realIntegralValues = ones(1, length(n_values)) * realIntegralValue;
    S_n1_values = zeros(1, length(n_values));
    S_2n1_values = zeros(1, length(n_values));
    R_2n1_values = zeros(1, length(n_values));
    realErrorValues = zeros(1, length(n_values));
    
    for n = 2 : step : maxN
        % call getRungeError and calculate real error
        [R_2n1, S_2n1, S_n1] = getRungeError(a, b, n, groupBy, f);
        error = realIntegralValue - S_2n1;
        
        % memorize informations
        S_n1_values(n / step) = S_n1;
        S_2n1_values(n / step) = S_2n1;
        R_2n1_values(n / step) = R_2n1;
        realErrorValues(n / step) = error;
    end
    
    % draw integrals and errors     
    figure;
    plot(n_values, realIntegralValues, 'green', 'lineWidth', 1.5);
    hold on;
    plot(n_values, S_n1_values, '--');
    hold on;
    plot(n_values, S_2n1_values);
    hold on;
    plot(n_values, R_2n1_values, 'o', 'lineWidth', 1.5);
    hold on;
    plot(n_values, realErrorValues, 'x', 'lineWidth', 1.5);
    title(strcat('Integral approximation of ', func2str(f), ' in [', num2str(a), ',', num2str(b),...
                 '] with trapezoidal composite formula and errors.'));
    legend(strcat('Real integral= ', num2str(realIntegralValue)), ...
                  'S_{n+1}', 'S_{2n+1}', 'R_{2n+1}', 'Real errors');
    xlabel('n');
    
end

hold off;