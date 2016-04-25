function [ val ] = GaussQuad( f, a, b, n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
val = 0;
if n < 1 || n > 5
    return 
end

abss2 = [-0.577 0.577];
abss3 = [-0.77 0 0.77];
abss4 = [-0.86 -0.339 0.339 0.86];
abss5 = [-0.906 -0.538 0 0.538 0.906];
abss6 = [-0.9324 -0.661 -0.238 0.238 0.661 0.9324];

abss = {abss2, abss3, abss4, abss5, abss6};

ws2 = [1 1];
ws3 = [0.5555 0.8888 0.5555];
ws4 = [0.34785 0.6521 0.6521 0.34785];
ws5 = [0.2369 0.4786 0.5688 0.4786 0.2369];
ws6 = [0.17132 0.36 0.4679 0.4679 0.36 0.17132];

ws = {ws2, ws3, ws4, ws5, ws6};


xs = abss{n};
ys = ws{n};

xr = xs.*(b-a)/2;
xr = xr + (a+b)/2;

yr = ys.* (b-a)/2;

for i = 1 : length(xr)
    val = val + yr(i) * f(xr(i));
end


end

