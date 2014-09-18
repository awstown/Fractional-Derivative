%%AdamsMoultonMethod
%This integration technique uses the three previous points to predict the
%next one.

clear all; close all;
%tidy up

hStep = .1;
y0 = 1;
t0 = 0;
deltaT = .01;
NumPoints = 9;

y1 = zeros(NumPoints,1); % this initializes the vector y to being all zeros
t1 = zeros(NumPoints,1); % ...for speediness of FOR loop
y1(1) = y0; % the initial conditions
t1(1) = t0;


%Runga Katta 4th Order the first few points
for i = 1:4-1
    k1 = fPrime(t1(i), y1(i));
    k2 = fPrime(t1(i) + (hStep/2), y1(i) + (hStep/2)*k1);
    k3 = fPrime(t1(i) + (hStep/2), y1(i) + (hStep/2)*k2);
    k4 = fPrime(t1(i) + hStep, y1(i) + hStep*k3);
    y1(i+1) = y1(i) + (hStep/6)*(k1 + 2*k2 + 2*k3 + k4);
    t1(i+1) = t1(i) + hStep;
end
% Calculate real solution
y1Exact = yExact(t1,y0);
plot(t1,y1Exact,t1,y1,'*');



for i=4:NumPoints
    %Adams-Bashforth
    y1(i+1) = y1(i) + (hStep / 24) * (55 * fPrime(t1(i),y1(i)) - 59 * fPrime(t1(i-1),y1(i-1)) + 37 * fPrime(t1(i-2),y1(i-2)) - 9 * fPrime(t1(i-3),y1(i-3)));
    t1(i+1) = t1(i) + hStep;
    %Adams-Moulton
    y1(i+1) = y1(i) + (hStep / 24) * (9*fPrime(t1(i+1),y1(i+1)) + 19 * fPrime(t1(i),y1(i)) - 5 * fPrime(t1(i-1),y1(i-1)) + fPrime(t1(i-2),y1(i-2)) );
end

figure(2);
y1Exact = yExact(t1,y0);
plot(t1,y1Exact,t1,y1,'*');


    



% y'(t) = 1 - t + 4y,   y1(0) = 1
% ANALYTICAL SOLN:   y1(t) = 1/16(4t + 19e^4t - 3) from WolframAlpha

