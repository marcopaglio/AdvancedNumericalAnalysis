% Scrivere un programma di tipo function che assegnato un vettore di nodi
% x0;...; xn calcola i pesi della corrispondente formula interpolatoria
% sum{i=0,...n}(w_i f(x_i)) utilizzando il metodo dei coefficienti indeterminati.

x = [-19, -16, -14, -11, -10, -8, -7, -3, -1, 0, 2, 3, 6, 8, 9, 12, 14, 15, 17, 20, 23];

weights = getWeights(-19, 23, x, 1);

disp('For x: ');
disp(x);
disp('Weights are: ');
disp(weights);
