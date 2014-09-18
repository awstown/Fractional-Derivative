%% ReadMe.txt
% This is a document of instructions on how to use the script:
%
% implicit02.m (This is the main script you should be working in)
% 
% This script is used to numerically solve the 1D subdiffusion equation:
% (d^gamma U / dt^gamma) = K * (d^2 U / dx^2), which allows for 
% 0 < gamma < 1. This method will only work for these values.
%
% 1. Constant Definitions
%       In this section there are several values that can be changed based
%       on your needs. 
%           + K       - is the diffusion constant
%           + fdorder - is the gamma or the order of the fractional 
%                       derivative you desire betwenn 0 and 1
%           + dx      - is the spatial step size
%           + dt      - is the time step size
%           + n       - is the end time (stop time)
%           + xStart  - should be self explanatory
%           + xEnd    - should also be self explanatory
% 
% 2. Boundary Conditions and Initial Conditions -
%       This is where you will input your initial conditions and boundary 
%       conditions. 
%
% 3. Exact Solution - 
%       If you're concerned your script has been altered, so much so it is 
%       not working correctly you can input an analytical solution here to 
%       test it functionality. For the most part it is good to verify this 
%       to ensure the script is in good working order. When you are 
%       satisfied, I suggest you comment out this calculation.
%
% 4. Numerical Solution - 
%       Here is the guts of our script, this sets up the bofk array, or 
%       weight coefficients. As well as initializes the difference array.
%       I do not suggest changing this section of the script unless you 
%       know exactly what you are doing.
%
% 5. Display the Solution - 
%       This section is used to display the results of the script. Please 
%       feel free to modify based on your needs.
