function [l] = isStable(S, fdorder)
%ISSTABLE Determines whether or not the dx and dt satisfy stabilty req
% This is the stability eqn for 1 < fdorder <= 2

Sx_top = 2^(1 - fdorder) * (2^fdorder - 2^3) * zeta(fdorder - 2);
Sx = Sx_top/gamma(3-fdorder);

if (S <= Sx)
    l = 1;
    return
else
    l = 0;
end

