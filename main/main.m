%=========================================
%  O   O  O O O  O  O     O     O   O
%  O O O  O   O  O  O O   O     O O O
%  O   O  O O O  O  O   O O     O   O
%  O   O  O   O  O  O     O  O  O   O
%=========================================

clear; clc;

% Values

pdf = [
    1.63 1.67 1.66; 
    0.61 0.42 0.5; 
    0.41 0.42 0.42;
    0.27 0.42 0.35; 
    0.41, 0.42, 0.42;
    0.15 0.1 0.12; 
    0.07 0.11 0.09;
    0.07 0.1 0.08; 
    0.16 0.11 0.13;
];

E = [
        0 0;
        1 0;
        0 1;
        -1 0;
        0 -1;
        1 1;
        -1 1;
        -1 -1;
        1 -1;
    ];

% Typed it in wrong so I transpose it here
E = transpose(E);

row = 3;
col = 4;

% Assigning values to E2 (there is likely a better way to do this)
E2 = zeros(2, 9, row, col);
for r = 1:col
    for c = 1:row
        E2(:, :, r, c) = E;
    end
end

% Assigning values to f (there is likely a better way to do this)
f = zeros(9, row, col);
for i = 1:col
    f(:, :, i) = pdf;
end

% How many iterations
num = 50;

% List creation
rho_list = zeros(1, row, col, num);
u_list = zeros(2, 3, col, row, num);
f_list = zeros(9, row, col, num);

% Le time constante
t = 0.6;

tic

for i = 1:num
    
    % Calculate density and particle velocity
    [rho, u] = rhoNu(f, E2);

    % Feq calculations
    feq = feq_d2q9(rho, u, E2, row, col);

    % Keeping track of rho and f values
    rho_list(:, :, :, i) = rho(:, 1:row, 1:col);
    f_list(:, :, :, i) = f(:, 1:row, 1:col);

    % F calculation
    fs = f - (1/t)*(f - feq);    
    f = fs;

end

toc

% Displaying 1st value of f list
guh = squeeze(f_list(1, 1, 1, :));
plot(1:num, guh)
