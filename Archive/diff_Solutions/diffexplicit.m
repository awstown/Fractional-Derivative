function [soln, t] = diffexplicit(n,k,M,fg,varG,fa,fb,varAB)
%
%
%
%
%

% Get the inline functions for initial distribution and BC.
g = inline(fg, varG);
a = inline(fa, varAB);
b = inline(fb, varAB);

%% Initialize
h = 1/(n+1);
s = k/h^2;
t = 0;

% We still need to get our first w vector
i = 0:n+1;
for j=1:n+2             % Obtain the initial distribution
    w(j) = g(h*i(j));
end

soln = [w];

%% Solution


for j = 1:M
    v(1) = a(j*k);      % First get the end points.
    v(n+2) = b(j*k);
    for i = 1:n         % Then the rest of the stuff.
        v(i+1) = s*w(i) + (1-2*s)*w(i+1) + s*w(i+2);
    end
    t = [t j*k];
    soln = [soln; v];
    w = v;
end
