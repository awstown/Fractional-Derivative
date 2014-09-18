function [ nextRow ] = nextStep( V, U_0, k, b_j, c_j )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

nextRow = c_j(1:k) * flipud(V(1:k,:)) + b_j(k+1).*U_0;

end

