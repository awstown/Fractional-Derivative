function [ U_next ] = stencil(U,m,fdorder)
%% mkay let do this shit!!

% lets vectorize some operations bitches!!!!!

% This is what we have.... the initial profile
% 1 - [ b i i i i i i i i i i i i b ]
%
% What we want is a the next row vector to be something like this.
% 2 - [ b (i(1)_left - 2i(1) + i(1)_right) b ] 




%b x x x x x x x x x x x x b
%   b x x x x x x x x x x x x b
%   b x x x x x x x x x x x x b
%   b x x x x x x x x x x x x b
%   b x x x x x x x x x x x x b
%   b x x x x x x x x x x x x b ]


U_left  = U(1,1:end-2);
U_right = U(1,3:end);
U_nextStep = U_left - 2.*U(1,2:end-1) + U_right;

%U(2,2:end-1) = U_temp;

% Now lets do the time shit.

% say m = 5

b_k*(U(m-5) - U(m-4)) + b_k(U(m-4) - b_k(U-3)

U(3,:) - U(2,:)
sum = 0;
for k = m:-1:2
    sum = sum + bcoeff(k,fdorder) * (U(m,;) - U(m-1,;));
end


