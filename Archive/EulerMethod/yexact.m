function r = yexact(t,y0,K,s) 
r = y0*exp(K*t) + s*(1 - exp(K*t)); 
