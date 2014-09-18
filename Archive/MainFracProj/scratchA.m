%% More Scratch
%
%
%
%
t = 0:0.002:1;
x = linspace(0,pi(),20);
fdorder = [1 .75 .5];

[X, T] = meshgrid(x, t);

for i = 1:3
exact = mlf(fdorder(i),1,-T.^fdorder(i),3) .* sin(X);
figure;
surf(exact,'LineStyle','none');title(fdorder(i));
end

