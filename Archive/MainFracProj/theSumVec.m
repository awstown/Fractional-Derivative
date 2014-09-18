function [ sum ] = theSumVec(U, m, fdorder )
%THESUM This calculates the sum in the last bit of the approximation
%   You still need to add and conditional to account for the first step abd
%  how it accounts for 0 time. fuck!!!!!
sum = zeros(1,length(U(m,2:end-1)));
if m == 1
    return
end

% blah blah 
for k = m:-1:2
    sum = sum + bcoeff((m-k) + 1,fdorder) .* (U(k,2:end-1) - U(k-1,2:end-1));
end

end

