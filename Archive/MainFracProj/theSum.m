function [ sum ] = theSum(U, m, j, fdorder )
%THESUM This calculates the sum in the last bit of the approximation
%   You still need to add and conditional to account for the first step abd
%  how it accounts for 0 time. fuck!!!!!
if m == 0
    sum = 0;
    return
end

sum = 0;
for k = m:-1:2
    sum = sum + bcoeff(k,fdorder) * (U(m,j) - U(m-1,j));
end

end


function c = bcoeff(k,fdorder)
    c = (k+1)^(1-fdorder) - k^(1-fdorder);
end