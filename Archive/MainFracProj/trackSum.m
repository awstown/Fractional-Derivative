function [ sum ] = trackSum( U, m, fdorder, prevSum )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if m == 1
    sum = zeros(1,length(U(m,2:end-1)));
    return;
end
    
sum = prevSum + bcoeff(m-1,fdorder) * (U(m,2:end-1) - U(m-1,2:end-1));


end

