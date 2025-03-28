function [rho, u] = rhoNu(f, E)

    rho = sum (f, 1);

    u = pagemtimes(E, f)./rho;
end

