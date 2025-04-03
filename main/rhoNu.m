function [rho, u] = rhoNu(f, E)
    % This function is self explainitory

    rho = sum (f, 1);

    u = pagemtimes(E, f)./rho;
end

