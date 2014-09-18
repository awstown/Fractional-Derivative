%% diff_implpcit.m - Dwight Townsend - 7/11/2011
% This script discretize the heat equation using the implicit
% differentiation methods.
%
% INPUTS: n - is the number of division in the graph
%         k - is the time step
%         M - is how many time steps to make.
clear all;
close all;

% Input parameters
n = 9;
k = 0.005125;
M = 200;

% Initilize
h = 1/(n+1);
s = k/h^2;

% Define IC function
g_func = @(x) sin(pi*x);
a_func = @(t) 0;
b_func = @(t) 0;

% Get v_i s (which is also the b's for the initial distribution from the 
% function g(ih).
v = zeros(1,n);
for i = 1:n
    v(i) = g_func(i*h);
end

t = 0;
soln = v;

c = zeros(n-1,1);
a = zeros(n-1,1);
% Next get c and a

for i = 1:n-1
    c(i) = -s;
    a(i) = -s;
end

% Now we get d....

for j = 1:M
    d = zeros(n,1);
    for i = 1:n
        d(i) = 1 + 2*s;
    end
    v = tri(n,a,d,c,v); % Call tri to diagonalize the matrix
    t = [t j*k];
    soln = [soln; v]; 
end

% Get the end points
for j = 1:M+1
    solnBegin(j) = a_func((j*k)); % Row Vectors
    solnEnd(j)   = b_func((j*k)); %  --------
end

% Now we need to put it all together

soln = [solnBegin' soln solnEnd']; % Turn the ends into columns

% Plot it!!!!!

[X,T] = meshgrid(linspace(0,1,n+2),t);

subplot(1,2,1)
surf(X,T,soln)
title('Numeric Solution');
xlabel('x'); ylabel('t'); zlabel('u(x,t)'); 
        
%% Exact Solution

subplot(1,2,2);
u = exp(-pi^2 .* T) .* sin(pi.*X);
surf(X,T,u);
title('Exact Solution');
xlabel('x'); ylabel('t'); zlabel('u(x,t)');       
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        