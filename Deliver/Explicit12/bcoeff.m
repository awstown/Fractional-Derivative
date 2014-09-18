function [c] = bcoeff(k,fdorder)
% This function is a used in the main script (explicit02)
% It is a weighting function that that is used to calculates 
% weights for each value in the difference sum.
    if k < 2
        c = (k+1).^(1-fdorder) - k.^(1-fdorder);
    else
        c = (k+1).^(2-fdorder) - k.^(2-fdorder);
    end
end

