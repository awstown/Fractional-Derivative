%% Playing with phase


close all
clear

%% Initialization of Parameters

% set of frequencies to use
minFreq  = 1;
freqStep = 1;
maxFreq  = 120;
% interval to plot on
left      = -0.5;
right     =  0.5;
numPoints =  1001;
% offset between plots
verInc = 3;

%% Derived Quantities From Parameters

timeAxis = linspace(left,right,numPoints);
freqList = [minFreq:freqStep:maxFreq];
numFreq  = length(freqList);                % Note the "length" command

cosineData = zeros(numFreq,numPoints);      % space to store all cosine
                                            % data
                                                                                       
cosineSum = zeros(1,numPoints);             % space to store the sum of
                                            % all cosine data

%% CREATE A RANDOM SET OF PHASE SHIFTS??
disp('Do you want to create a set of random phase shifts?')
rps = input('type yes or no, lowercase in single quotes:     ');

if strcmp(rps,'yes')
    disp('random phase shifts from -0.5 to -.5 radians will be generated')
    randomPS = 1*rand(1,numFreq)-0.5; % random phase shifts -0.5 to 0.5
    disp('random phase shifts will be generated')
    
elseif strcmp(rps,'no')
    disp('no phase shifts selected')
    randomPS = zeros(1,numFreq);
else
    disp('choice must be "yes" or "no"')
    disp('defaulting to no phase shifts')
    randomPS = zeros(1,numFreq);
end                                            
                                            
%% Create the cosine data over the frequency set

currentRow = 0;                     
for cf = freqList
    currentRow = currentRow + 1;
    cosineData(currentRow,:) = cos(2*pi*cf*(timeAxis-randomPS(cf)));
end

cosineSum = sum(cosineData,1);          % the dimension of "1" is the 
                                        % default, so we could have written
                                        % sum(cosineData)

%% Plot the cosine data on one figure

figure(1)
hold on
for i = 1:numFreq
    verShift = verInc*(i-1);
    plot(timeAxis,cosineData(i,:) + verShift)
end

plot(timeAxis,cosineSum + verInc*(i+3));

% Pretty up the graph
grid on
xlabel('time')
ylabel('data - inc. frequency bottom to top')
title('An Interesting Sum')
hold off

%% Movie!!!! Fuck yeah!!!!!
figure()

% First lets get the first two waves and add them
sumForMovie = cosineData(1,:) + cosineData(2,:);
plot(sumForMovie)
pause(0.2)
for i = 3:1:numFreq
    sumForMovie = sumForMovie + cosineData(i,:);
    plot(sumForMovie)
    pause(0.2)
end








