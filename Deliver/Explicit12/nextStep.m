function [ Unext diff] = nextStep( U, m, S_bar, diff, bOfK )
%NEXTSTEP Calculates the next row in the solution matrix.
%
%	Input(s):   
%				U   - The solution matrix
%   		    m   - The step number (i.e. the steps away from the I.C.)
%			  S_bar - The Constant defined at the begining 
%			  diff  - The difference matrix, which stores the difference method
%					  values for each step.
%			  bOfk  - The array of b_k values calculated before this is called.
%
%   Output(s):  
%			  Unext - The next row in the solution matrix
%  			   diff - The difference array, which records the difference 
%				      between each successive solution values.


%$ Spatial Stencil Stuff
row_left   = U(m,1:end-2);
row_right  = U(m,3:end);
row_center = U(m,2:end-1);

if m < 2
Uspatial = row_center + S_bar.*(row_left - 2*row_center + row_right);
else
row_below  = U(m-1,2:end-1);

Uspatial = 2*row_center - row_below ...
    + S_bar.*(row_left - 2*row_center + row_right);

end



%% Temporal Stencil Stuff
if m > 2
    diff = [(U(m,2:end-1) - 2.*U(m-1,2:end-1) + U(m-2,2:end-1)); diff];
    % Now this is where the magic happens.... 
    Utemporal = bOfK(1:length(diff(:,1))) * diff;
   
    %% This puts it all together
    Unext = Uspatial - Utemporal;
elseif m > 1
    diff = [(U(m,2:end-1) - U(m-1,2:end-1)); diff];
    % Now this is where the magic happens.... 
    Utemporal = bOfK(1:length(diff(:,1))) * diff;
    
%% This puts it all together
    Unext = Uspatial - Utemporal;
else
    Unext = Uspatial;
end


end

