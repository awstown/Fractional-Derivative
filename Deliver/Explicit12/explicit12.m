%% Script for solving the Diffusion-Wave equations
% with fractional derivatives in the caputo form. To be used with 
% \gamma(fdorder) 0 to 1. This script uses the explicit method.
%
% AUTHOR       : Dwight Townsend
% VERSION      : 1.0
% DEPENDENCIES : isStable.m, bcoeff.m, nextStep.m,
%                mlf.m (only used in the exact solution used to verify correct
%                function of the script)

clear all;
close all;

%% Constant Definitions

K = 1;           % The diffusion constant
fdorder = 1.9;     % The fractional order (must be 1 < fdorder < 2)
dx = pi()/20;    % Spatial step size
dt = 0.01;       % Time step size
n = 10;          % Stop time
xStart = 0;
xEnd = pi();

% Setting up time and spatial indexes as well as other various constants
% You should NOT need to change these lines

x = 0:dx:xEnd;                   % Spatial Array
t = 0:dt:n;                      % Time array
S = K * ((dt^fdorder)/(dx^2));   % Stability Factor
S_bar = gamma(3 - fdorder) * S;  % Modified Stability Factor

%% Check for Stability
if ~isStable(S, fdorder)
    error('The system is not stable. Please, for the love of god, choose a different dx or dt');
end
    

%% Set up the Solution Matrix
U = zeros(n/dt + 1, (xEnd - xStart)/dx + 1);

%% Boundary Conditions and Initial Conditions
% You might need to change theses based on what you are attempting to model.

% u(x=0, t) = u(x=pi, t) = 0

U(:,1) = 0;
U(:,end) = 0;

% u(x,0) = f(x) = sin(x)
U(1,:) = sin(x);


%% Exact Solution
% This is to test the error our numerical method. This should be commented
% if this script is being used for real.
%[X, T] = meshgrid(0:dx:xEnd, 0:dt:n);
%exact = mlf(fdorder,1,-T.^fdorder,3) .* sin(X);

%% Numerical Solution

% Set up the b^fdorder_k array and difference matrix
k = 1:length(t)-2;
bOfK = bcoeff(k,fdorder);
diff = [];

% Compute values for each time step

for m = 1:length(t) - 1
    % It is from 2 to end - 1 because of the B.C.
    [U(m+1,2:end-1) diff] = nextStep(U, m, S_bar, diff, bOfK);
end


%% Display the Solution

figure(1); surf(x,t,U,'LineStyle','none'); title('approx');
xlabel('displacement (x)'); ylabel('time (sec) (t)'); zlabel('U(x,t)');

% figure(2); surf(x,t,exact,'LineStyle','none'); title('exact');
%xlabel('displacement (x)'); ylabel('time (sec) (t)'); zlabel('u(x,t)');
%figure(3); surf(x,t,U - exact,'LineStyle','none'); title('diff');

