function [ nextRow ] = nextStep( V, U_0, k, b_j, c_j )
%NEXTSTEP Calculates the next row in the solution matrix.
%
%		Input(s):
%					V  - The solution matrix without I.C. or B.C.
%				   U_0 - Initial conditions
% 	  			    k  - This is the step number in the solution loop
%   			   b_j - Array that weights the out the I.C. values
% 				   c_j - Array that weights the out the sums
%
%		Output(s):
%			   nextRow - The next row in the solution matrix

nextRow = c_j(1:k) * flipud(V(1:k,:)) + b_j(k+1).*U_0;

end

