function [feq] = feq_d2q9(rho, u, E, cs, w)
    % Calculations for FEQ
    b = pagemtimes(pagetranspose(E), u);

    guh = (1 + (b)./(cs^2) + ((b).^2)./(2*(cs^4)) - sum(u.^2, 1)./(2*(cs^2)));

    feq = w.*guh.*rho;
end

