%% Random Walk Script - Dwight Townsend - 7/3/2011 start: 11:30
% This is a script to explore the random walk example.
%
%

clear all; close all;
n = 10; % How many times do we want to walk?
figure(); title('1-D Random Walk'); xlabel('Index'); 
ylabel('x-displacement');
hold on;

for j = 1:n
    % t is going to be a simple counter in this 
    t = 0:1000;
    x0 = 0;

    x = zeros(1, t(end)); % x-values
    x(1) = x0;

    % These are the "random steps" for each index
    steps = (rand(1,t(end)) > 0.5).*2 - 1;

    for i = 1:t(end)
        x(i+1) = x(i) + steps(i);
    end
    plot(t,x)
end

%% 2-D Random Walk
% help pdf **Fuck Off Wade!!!**
% help normal

t = 1000; % Number of steps to take.
l = randn(t,1); % This is the length of each step.
x = zeros(t,1); x(1) = 0; % Initial conditions.
y = zeros(t,1); y(1) = 0;

for i = 2:t;
    % Randomize the direction
    theta = rand*2*pi();

    % x-comp & y-comp
    x(i) = x(i-1) + l(i-1)*cos(theta);
    y(i) = y(i-1) + l(i-1)*sin(theta);
end

figure()
plot(x,y)
title('2D-Randomwalk with varible length');
xlabel('x'); ylabel('y');


