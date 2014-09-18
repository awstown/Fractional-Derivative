function [c] = bcoeff(k,fdorder)
% This function is a used in the main script (explicit01)
% It is a weighting function that that is used to calculates 
% weights for each value in the difference sum.
    c = (k+1).^(1-fdorder) - k.^(1-fdorder);
end