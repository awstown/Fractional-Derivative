function [ Unext diff] = nextStepA( U, m, S_bar, diff, bOfK )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% Spatial Stencil Stuff
row_left   = U(m,1:end-2);
row_right  = U(m,3:end);
row_center = U(m,2:end-1);

Uspatial = row_center + S_bar.*(row_left - 2*row_center + row_right);
%Utemporal = trackSum(U, m, fdorder, prevSum);


if m > 1
    diff = [(U(m,2:end-1) - U(m-1,2:end-1)); diff];
    % Now this is where the magic happens.... 
    Utemporal = bOfK(1:length(diff(:,1))) * diff;
    Unext = Uspatial - Utemporal;
else
    Unext = Uspatial;
end



% prevSum = Utemporal;

end

