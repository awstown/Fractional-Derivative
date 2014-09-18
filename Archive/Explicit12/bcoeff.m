function [c] = bcoeff(k,fdorder)
    if k < 2
        c = (k+1).^(1-fdorder) - k.^(1-fdorder);
    else
        c = (k+1).^(2-fdorder) - k.^(2-fdorder);
    end
end

