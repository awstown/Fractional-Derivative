% diff_explicit.m
% AUTHOR: Dwight Townsend, 7/6/2011
%
% This is a script to solve a partial differential equation using the
% explicit method.
%
% INPUTS: n - the number of meshpoints to compute
%         k - the step size of the t variable
%         M - the number of steps in t to be computed is M

clear all;
close all;

n = 9;
k = 0.005125;
M = 200;

% Initialize
h = 1/(n+1);
s = k/h^2;
i = 0:n+1;
t = 0;

g = @(x) sin(pi*x);
a = @(t) 0;
b = @(t) 0;

% Get our mesh



% Algorithm Start

for j=1:n+2             % Obtain the initial distribution
    w(j) = g(h*i(j));
end

soln = [];
for j = 1:M
    v(1) = a(j*k);
    v(n+2) = b(j*k);
    for k = 1:n
        v(k+1) = s*w(k) + (1-2*s)*w(k+1) + s*w(k+2);
    end
    t(j) = j*k;
    soln = [soln; v];
    w = v;
end

% Now how the Eff... do I plot this SOB!!!!
[I,J] = meshgrid(0:h:n+1,0:k:M);



figure()
%surf(I,J,soln)

% Exact Solution
x = 0:0.1:1;
t_e = 0:0.1:1;

figure()
[X,T] = meshgrid(x,t_e);
u = exp(-pi^2 .* T) .* sin(pi.*X);
surf(X,T,u);
xlabel('x'); ylabel('t'); zlabel('u');


