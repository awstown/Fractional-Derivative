function [l] = isStable(S, fdorder)
%stabilityCheck Determines whether or not the dx and dt satisfy stabilty req


Sx_bar = (1 - 2^(2 - fdorder)) * zeta(fdorder - 1);
Sx = Sx_bar/gamma(2-fdorder);

if (S <= Sx)
    l = 1;
    return
else
    l = 0;
end

