function [rho, u] = rhoNu_worse(f, E)
    
    rho = zeros(1, 3, 3);

    for i = 1:3
        rho(:, :, i) = sum(f(:, :, i));
    end

    u = 2;
end

