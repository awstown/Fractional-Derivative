function [c] = bcoeff(k,fdorder)
    c = (k+1).^(1-fdorder) - k.^(1-fdorder);
end