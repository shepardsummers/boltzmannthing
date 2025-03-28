function [feq] = feq_d2q9(rho, u, E, row, col)
    
    w = [
        4/9;
        1/9;
        1/9;
        1/9;
        1/9;
        1/36;
        1/36;
        1/36;
        1/36;
        ];

    w2 = zeros(9, row, col);
    
    for r = 1:row
        for c = 1:col
            w2(:, r, c) = w;
        end
    end

    cs = 1/sqrt(3);
    
    b = pagemtimes(pagetranspose(E), u);

    guh = (1 + (b)./(cs^2) + ((b).^2)./(2*(cs^4)) - sum(u.^2, 1)./(2*(cs^2)));

    feq = w.*guh.*rho;
end

